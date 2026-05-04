# Squashed NVIDIA Live env sysroot. Mirror of oci/cosmic-live/filesystem.bst.
kind: compose

build-depends:
- oci/cosmic-nvidia-live/stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
