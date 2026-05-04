# Squashed Live env sysroot. Same compose-and-strip pattern as
# oci/cosmic/filesystem.bst -- consumed by installer/live-image.bst as
# the input to systemd-repart's root-partition CopyFiles=.
kind: compose

build-depends:
- oci/cosmic-live/stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
