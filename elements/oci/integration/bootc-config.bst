# Drop bootc-specific integration files in /usr/lib.
#
# - prepare-root.conf  -> /usr/lib/ostree/prepare-root.conf
#   Enables composefs and a read-only sysroot, required for bootc.
# - 10-bootc.conf      -> /usr/lib/tmpfiles.d/10-bootc.conf
#   Recreates /var/{home,roothome,opt,mnt} on first boot.
kind: manual

sources:
- kind: local
  path: files/oci

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/usr/lib/ostree/" prepare-root.conf
  - install -Dm644 -t "%{install-root}/usr/lib/tmpfiles.d" 10-bootc.conf
