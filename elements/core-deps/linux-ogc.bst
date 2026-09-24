# Open Gaming Collective (OGC) kernel for the gaming variant.
#
# Drop-in replacement for freedesktop-sdk's components/linux.bst,
# activated via the junction override in elements/freedesktop-sdk.bst
# when the project is built with `-o gaming true`. It must reproduce
# FDSDK's artifact contract exactly:
#   - vmlinuz/vmlinux/config/System.map and modules all under
#     /usr/lib/modules/<kver>/ (the 26.08 layout -- nothing in /boot)
#   - a `build` symlink into /usr/src/linux-<kver> (nvidia-drivers.bst
#     compiles against it)
#
# The recipe is FDSDK 26.08 components/linux.bst with three deltas:
#   1. Source: OGC's stable-tree fork (github:OpenGamingCollective/linux)
#      instead of kernel.org stable. FDSDK's patches/linux patch_queue is
#      dropped -- the OGC tree carries its own gaming patchset (sched_ext
#      schedulers, ntsync, Valve VRAM work, handheld enablement); our
#      own fixups to that patchset live in patches/linux-ogc.
#   2. Config: FDSDK's fdsdk-config.sh pass (vendored at files/linux-ogc/,
#      keep in sync when bumping the junction) followed by OGC's
#      ogc.config.set/unset fragments from OpenGamingCollective/
#      kernel-packages. The fragments are what deliver the gaming
#      behavior (CONFIG_SCHED_CLASS_EXT, CONFIG_NTSYNC, BTF); OGC
#      sources with a stock config would be a no-op.
#   3. Modules are installed with INSTALL_MOD_STRIP=1 and /boot/vmlinux
#      goes to the devel split domain -- OGC's fragments force
#      DEBUG_INFO=y for BTF, and without both the image grows by
#      gigabytes of DWARF nobody boots with.
#
# Version bumps: `just bst source track core-deps/linux-ogc.bst` follows
# v7.2.*-ogc* tags; update the ogc-localversion variable to match the
# new tag. Watch the NVIDIA side when OGC jumps a stable series
# (e.g. 7.2.x -> 7.3.x): nvidia-drivers.bst must compile against the new
# tree before the gaming+nvidia variant can ship it.
kind: make
description: OGC Linux kernel (gaming variant)

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
  # OGC patchset revision of the pinned tag; keep in sync with the
  # `ref:` under sources (v<kver>-ogcN-...). Not derivable at build
  # time: the tree ships no EXTRAVERSION or localversion files.
  ogc-localversion: '-ogc3'
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
  # compile.h has hardcoded timestamp, let's seed it
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'
  KBUILD_BUILD_USER: 'tomjon'
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  configure-commands:
  - |
    # Generate the default kernel config for the target architecture
    make defconfig

  - |
    . ./config-utils.sh
    rm -f expected-configs
    . ./fdsdk-config.sh "%{arch}"

  - |
    # Layer the OGC gaming fragments over the FDSDK config. Format:
    # ogc.config.set holds CONFIG_X=y|m|"str"|<int> lines, unset holds
    # bare CONFIG names. Options whose dependencies aren't met on this
    # config are dropped by olddefconfig below, same as OGC's own
    # cross-distro packaging.
    while IFS= read -r line; do
      case "$line" in ''|'#'*) continue ;; esac
      name=${line%%=*}
      val=${line#*=}
      case "$val" in
        y) scripts/config --keep-case -e "$name" ;;
        m) scripts/config --keep-case -m "$name" ;;
        \"*\")
          val=${val#\"}; val=${val%\"}
          scripts/config --keep-case --set-str "$name" "$val"
          ;;
        *) scripts/config --keep-case --set-val "$name" "$val" ;;
      esac
    done < ogc.config.set
    while IFS= read -r name; do
      case "$name" in ''|'#'*) continue ;; esac
      scripts/config --keep-case -d "$name"
      # The fragment wins over FDSDK's pass: if fdsdk-config.sh marked
      # this option expected (module/enable), stop requiring it. FDSDK
      # records names without the CONFIG_ prefix; match both forms.
      sed -i "/^\(CONFIG_\)\{0,1\}${name#CONFIG_}\$/d" expected-configs
    done < ogc.config.unset
    # OGC's fragment enables the C binder (+ binderfs, which needs it);
    # the Rust binder FDSDK expects is mutually exclusive with it
    # (depends on !ANDROID_BINDER_IPC), so olddefconfig drops it.
    # Waydroid only needs *a* binder providing binder/hwbinder/vndbinder
    # -- swap the expectation to the C driver OGC configures.
    sed -i '/^\(CONFIG_\)\{0,1\}ANDROID_BINDER_IPC_RUST$/d' expected-configs
    echo CONFIG_ANDROID_BINDER_IPC >> expected-configs
    echo CONFIG_ANDROID_BINDERFS >> expected-configs
    # The gaming point of this kernel; fail the build if these regress.
    echo CONFIG_SCHED_CLASS_EXT >> expected-configs
    echo CONFIG_NTSYNC >> expected-configs

  - |
    # Stamp `uname -r` with the OGC revision (e.g. 7.2.1-ogc4).
    # kernelrelease drives the modules dir, build tree and NVIDIA
    # module build alike, so co-versioning holds.
    scripts/config --keep-case --set-str LOCALVERSION "%{ogc-localversion}"
    scripts/config --keep-case -d LOCALVERSION_AUTO

  - |
    # Cosmic deltas go through config-utils.sh enable/module so they land
    # in expected-configs and the post-olddefconfig gate verifies they
    # survived; raw scripts/config calls would be silently droppable.
    . ./config-utils.sh

    # Linux 7.1 dropped the RNG_DEFAULT select that used to switch this
    # menu on; 26.08 no longer expects the DRBGs, so set it without
    # adding it to expected-configs.
    scripts/config --keep-case -e CRYPTO_DRBG_MENU

    # The zswap.compressor=zstd karg needs the compressor built in, not =m.
    enable CRYPTO_ZSTD

    # Warnings are errors; OGC out-of-tree fixups live in patches/linux-ogc.
    enable WERROR

    # Hardware-enablement deltas from the Fedora config audit (VM guests,
    # homelab HBAs, laptop camera/audio/input completion).
    . ./cosmic-config.sh

  - |
    # Drop expectations for options this tree no longer offers (the
    # vendored fdsdk config pass targets an older kernel era). Gaming-
    # critical symbols are exempt: losing them must fail the build.
    find . -name 'Kconfig*' -exec grep -h '^\(menu\)\{0,1\}config ' {} + \
      | awk '{print $2}' | sort -u > .kconfig-symbols
    cp expected-configs expected-configs.orig
    while IFS= read -r cfg; do
      sym=${cfg#CONFIG_}
      case "$sym" in
        SCHED_CLASS_EXT|NTSYNC|ANDROID_BINDER_IPC|ANDROID_BINDERFS) continue ;;
      esac
      if ! grep -qx "$sym" .kconfig-symbols; then
        echo "note: pruning expectation for ${cfg} (absent from this tree)" 1>&2
        sed -i "/^\(CONFIG_\)\{0,1\}${sym}\$/d" expected-configs
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
    # Only fail for...
    case "%{arch}" in
      x86_64|aarch64)
        [ "${missing_configs}" = 0 ]
      ;;
    esac

    # has() accepts =m; the zswap karg requires =y.
    grep -q '^CONFIG_CRYPTO_ZSTD=y$' .config

  install-commands:
  - |
    release=$(make -s kernelrelease)
    install -Dm644 "%{image-name}" "%{install-root}%{indep-libdir}/modules/${release}/vmlinuz"
    install -Dm644 vmlinux "%{install-root}%{indep-libdir}/modules/${release}/vmlinux"
    install -Dm644 System.map "%{install-root}%{indep-libdir}/modules/${release}/System.map"
    install -Dm644 .config "%{install-root}%{indep-libdir}/modules/${release}/config"
    ZSTD_CLEVEL=19 make -j1 INSTALL_MOD_PATH="%{install-root}%{prefix}" INSTALL_MOD_STRIP=1 modules_install

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
    for file in "${to_copy[@]}"
    do
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
          release=$(make -s kernelrelease)
          make -j1 INSTALL_DTBS_PATH="%{install-root}%{indep-libdir}/modules/${release}/dtbs" dtbs_install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/modules/*/System.map'
        # DEBUG_INFO=y (forced by OGC for BTF) makes vmlinux ~0.5 GB;
        # runtime consumers (scx schedulers) read /sys/kernel/btf/vmlinux,
        # not this file, so keep it out of the composed images.
        - '%{indep-libdir}/modules/*/vmlinux'

sources:
- kind: git_repo
  url: github:OpenGamingCollective/linux.git
  track: v7.2.*-ogc*
  ref: v7.2.6-ogc3-0-g9df4120fc237930f09d8ce89bb731fcd091603b8
# Fixups for the OGC patchset itself; review at every tag bump and
# drop each patch once the fix lands upstream.
- kind: patch_queue
  path: patches/linux-ogc
- kind: local
  path: files/linux-ogc/config-utils.sh
- kind: local
  path: files/linux-ogc/fdsdk-config.sh
- kind: local
  path: files/linux-ogc/cosmic-config.sh
- kind: local
  path: files/linux-ogc/ogc.config.set
- kind: local
  path: files/linux-ogc/ogc.config.unset
