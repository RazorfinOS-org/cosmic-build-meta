# Install the `generate-initramfs` script tree under
# /usr/{bin,libexec,share}/generate-initramfs.
#
# Vendored verbatim (MIT) from gnome-build-meta's
# elements/gnomeos/generate-initramfs.bst -- the script reads kernel
# modules + systemd units from a staged sysroot and produces an
# initramfs cpio. We use it from elements/oci/initramfs.bst.
kind: manual

sources:
- kind: local
  path: files/initramfs

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

runtime-depends:
- core-deps/python3-zstd.bst
- freedesktop-sdk.bst:components/python3-pyelftools.bst
- freedesktop-sdk.bst:components/gcc.bst
- freedesktop-sdk.bst:components/lvm2.bst

variables:
  strip-binaries: ''

config:
  install-commands:
    - install -Dm755 generate-initramfs.sh "%{install-root}/usr/bin/generate-initramfs"
    - install -Dm755 -t "%{install-root}/usr/libexec/generate-initramfs" copy-initramfs.py
    - install -Dm755 -t "%{install-root}/usr/libexec/generate-initramfs" run-module.sh

    - |
      install -Dm755 -d "%{install-root}/usr/share/generate-initramfs/modules"
      cp -rT modules "%{install-root}/usr/share/generate-initramfs/modules"
