# Install /usr/lib/os-release for the COSMIC bootc image.
# Kept as a simple `manual` element rather than the meson-based
# template gnome-build-meta uses; we don't yet need branch/commit
# template substitution.
kind: manual

sources:
- kind: local
  path: files/oci/os-release

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 os-release "%{install-root}/usr/lib/os-release"
  - mkdir -p "%{install-root}/etc"
  - ln -sf "../usr/lib/os-release" "%{install-root}/etc/os-release"
