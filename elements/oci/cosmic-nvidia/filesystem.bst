# Squash the COSMIC + NVIDIA stack into a single sysroot for build-oci,
# stripping the split-rule domains we don't ship in the runtime image.
kind: compose

build-depends:
- oci/cosmic-nvidia/stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
