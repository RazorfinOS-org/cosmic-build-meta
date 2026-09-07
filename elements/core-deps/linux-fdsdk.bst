# freedesktop-sdk stable kernel for the non-gaming variants, built by us
# so the gaming and non-gaming images share one config formula. Ported
# from projectbluefin/dakota's core/linux-fdsdk.bst; selected via the
# unconditional junction override in elements/freedesktop-sdk.bst
# (gaming swaps it for core-deps/linux-ogc.bst).
#
# This reproduces the recipe of components/linux.bst at our pinned
# freedesktop-sdk 25.08 ref. Deltas from the upstream recipe (all shared
# with linux-ogc.bst, see there):
#   1. CRYPTO_ZSTD forced =y (zswap.compressor=zstd needs it built in).
#   2. Hardware enablement from the Fedora config audit (cosmic-config.sh).
#   3. Modules stripped (INSTALL_MOD_STRIP=1) and vmlinux to the devel
#      split: the shared config pass enables DEBUG_INFO_BTF (forcing
#      DEBUG_INFO=y), and our runtime OCI layers only exclude the
#      devel/debug domains, so upstream's contract would ship ~0.5 GB
#      of debug payload in composed images.
#
# Bumps: `just bst source track core-deps/linux-fdsdk.bst` follows the
# pinned stable tag; keep files/linux-ogc/fdsdk-config.sh in sync when
# bumping the freedesktop-sdk junction.
kind: make
description: freedesktop-sdk stable Linux kernel, self-built

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/cpio.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/bc.bst
- freedesktop-sdk.bst:components/gzip.bst
- freedesktop-sdk.bst:components/pahole.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/rsync.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/rust-bindgen.bst
- freedesktop-sdk.bst:components/rust-src.bst
- freedesktop-sdk.bst:components/util-linux.bst
- freedesktop-sdk.bst:components/zstd.bst
# Provides /keys/linux-module-cert.crt; fdsdk-config.sh wires it into
# SYSTEM_TRUSTED_KEYS when present.
- filename: freedesktop-sdk.bst:components/linux-module-cert.bst
  strict: true

variables:
  bootdir: /boot
  indep-libdir: '%{prefix}/lib'
  # Modules are stripped by kbuild (INSTALL_MOD_STRIP=1) *before* the
  # module signature is appended; a post-build strip pass would tear
  # the signatures off again.
  strip-binaries: ''
  kernel_arch: '%{arch}'
  src-arch: '%{kernel_arch}'
  image-name: '$(make -s image_name)'
  (?):
  - arch == "x86_64":
      src-arch: x86
  - arch == "aarch64":
      kernel_arch: arm64

environment:
  ARCH: '%{kernel_arch}'
  # compile.h has a hardcoded timestamp; seed it for reproducibility.
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'
  KBUILD_BUILD_USER: 'tomjon'
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  configure-commands:
  - |
    make defconfig

  - |
    . ./config-utils.sh
    rm -f expected-configs
    . ./fdsdk-config.sh "%{arch}"

  - |
    # Cosmic deltas go through config-utils.sh enable/module so they land
    # in expected-configs and the post-olddefconfig gate verifies they
    # survived; raw scripts/config calls would be silently droppable.
    . ./config-utils.sh

    # Linux 7.1 dropped the RNG_DEFAULT select that enabled this menu;
    # keep FDSDK's expected SP800-90A DRBGs available.
    enable CRYPTO_DRBG_MENU

    # The zswap.compressor=zstd karg needs the compressor built in, not =m.
    enable CRYPTO_ZSTD

    # Hardware-enablement deltas from the Fedora config audit (VM guests,
    # homelab HBAs, laptop camera/audio/input completion).
    . ./cosmic-config.sh

  - |
    # Drop expectations only for options this newer stable tree no longer
    # offers. Existing symbols whose dependencies are unmet remain failures.
    find . -name 'Kconfig*' -exec grep -h '^\(menu\)\{0,1\}config ' {} + \
      | awk '{print $2}' | sort -u > .kconfig-symbols
    cp expected-configs expected-configs.orig
    while IFS= read -r cfg; do
      sym=${cfg#CONFIG_}
      if ! grep -qx "$sym" .kconfig-symbols; then
        echo "note: pruning expectation for ${cfg} (absent from this tree)" 1>&2
        sed -i "/^\(CONFIG_\)\{0,1\}${sym}$/d" expected-configs
      fi
    done < expected-configs.orig
    rm -f expected-configs.orig

  - |
    make -j1 olddefconfig

  - |
    . ./config-utils.sh

    missing_configs=0
    for config in $(cat expected-configs); do
      if ! has "${config}"; then
        echo "Missing ${config}" 1>&2
        missing_configs=1
      fi
    done
    case "%{arch}" in
      x86_64|aarch64)
        [ "${missing_configs}" = 0 ]
      ;;
    esac

    # has() accepts =m; the zswap karg requires =y.
    grep -q '^CONFIG_CRYPTO_ZSTD=y$' .config

  install-commands:
  - |
    install -Dm644 "%{image-name}" '%{install-root}%{bootdir}/vmlinuz'
    install -Dm644 vmlinux '%{install-root}%{bootdir}/vmlinux'
    install -Dm644 System.map '%{install-root}%{bootdir}/System.map'
    install -Dm644 .config '%{install-root}%{bootdir}/config'
    make -j1 INSTALL_MOD_PATH='%{install-root}%{prefix}' INSTALL_MOD_STRIP=1 modules_install

  - |
    release=$(make -s kernelrelease)
    targetdir="%{install-root}%{prefix}/src/linux-${release}"

    rm "%{install-root}%{indep-libdir}/modules/${release}"/build

    to_copy=(
      Makefile
      Module.symvers
      .config
      "arch/%{src-arch}/include"
      "arch/%{src-arch}/Makefile"
      scripts
      include
    )
    if [ "$(scripts/config -s OBJTOOL)" = y ]; then
      to_copy+=(tools/objtool/objtool)
    fi
    for file in "${to_copy[@]}"; do
      targetfile="${targetdir}/${file}"
      dir="$(dirname "${targetfile}")"
      [ -d "${dir}" ] || install -d "${dir}"
      cp -aT "${file}" "${targetfile}"
    done

    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/build"

  (?):
  - arch == "aarch64":
      install-commands:
        (>):
        - |
          make -j1 INSTALL_DTBS_PATH='%{install-root}%{bootdir}/dtbs' dtbs_install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bootdir}/System.map'
        # DEBUG_INFO=y (via the shared config's DEBUG_INFO_BTF) makes
        # vmlinux ~0.5 GB; runtime consumers read /sys/kernel/btf/vmlinux,
        # not this file, so keep it out of the composed images.
        - '%{bootdir}/vmlinux'

sources:
- kind: git_repo
  url: kernel:pub/scm/linux/kernel/git/stable/linux.git
  track: v7.2.2
  ref: v7.2.2-0-g52c36105f76e96b638152a42e735f2e7767ed946
- kind: local
  path: files/linux-ogc/config-utils.sh
- kind: local
  path: files/linux-ogc/fdsdk-config.sh
- kind: local
  path: files/linux-ogc/cosmic-config.sh
