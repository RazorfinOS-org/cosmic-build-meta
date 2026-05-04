# Squash the COSMIC + NVIDIA stack into a single sysroot for build-oci,
# stripping the split-rule domains we don't ship in the runtime image.
kind: compose

build-depends:
- oci/cosmic-nvidia/stack.bst
# NVIDIA variant: pin bootc upgrade to :cosmic-nvidia-stable. Different
# file than oci/cosmic/filesystem.bst's bootc-defaults-cosmic.bst, but
# both ship at /etc/bootc/install/00-defaults.toml -- last writer wins
# at compose time, and these are sibling filesystem builds (no overlap).
- oci/integration/bootc-defaults-cosmic-nvidia.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
