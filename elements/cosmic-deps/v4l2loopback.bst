# Out-of-tree v4l2loopback (OBS virtual camera), built against
# components/linux.bst's tree so the junction override co-versions it
# with each variant's kernel. Not autoloaded; OBS modprobes on demand.
kind: manual
description: v4l2loopback kernel module for the OBS virtual camera

build-depends:
- freedesktop-sdk.bst:bootstrap/coreutils.bst
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/sed.bst
- freedesktop-sdk.bst:components/grep.bst
# Kernel module compile.
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/make.bst
- freedesktop-sdk.bst:components/gawk.bst
- freedesktop-sdk.bst:components/findutils.bst
- freedesktop-sdk.bst:components/linux.bst
# Kernel objtool dependency.
- freedesktop-sdk.bst:components/xxhash.bst

depends:
# Module goes in /usr/lib/modules/<kver>/extra/. Co-versioning is
# enforced; depmod runs at OCI image integration time.
- freedesktop-sdk.bst:components/linux.bst

variables:
  # kbuild strips/handles the module itself; keep BTF/signature intact.
  strip-binaries: ''

config:
  build-commands:
  - |
    set -euo pipefail
    KVER=$(ls /usr/lib/modules | head -n1)
    if [ -z "$KVER" ] || [ ! -d "/usr/lib/modules/$KVER/build" ]; then
        echo "FATAL: no kernel build tree found under /usr/lib/modules" >&2
        exit 1
    fi
    echo "Building v4l2loopback against $KVER"
    make -C "/usr/lib/modules/$KVER/build" M="$PWD" modules

  install-commands:
  - |
    set -euo pipefail
    KVER=$(ls /usr/lib/modules | head -n1)
    make -C "/usr/lib/modules/$KVER/build" M="$PWD" \
        INSTALL_MOD_PATH="%{install-root}/usr" modules_install

  - |
    install -d "%{install-root}/usr/lib/modprobe.d"
    cat > "%{install-root}/usr/lib/modprobe.d/v4l2loopback.conf" <<'EOF'
    # Only announce CAPTURE once a producer attaches, so Chrome/WebRTC
    # enumerate the device. Same option OBS passes when it loads the module.
    options v4l2loopback exclusive_caps=1
    EOF

sources:
- kind: git_repo
  url: github:umlaeute/v4l2loopback.git
  track: v0.*
  ref: v0.15.4-0-g0f9ee86760b7f2bea174b7e3e7a1d38845da0ab4
