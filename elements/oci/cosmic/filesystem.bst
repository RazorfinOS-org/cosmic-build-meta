# Squash the stack into a single sysroot for build-oci, stripping the
# split-rule domains we don't ship in the runtime image.
kind: compose

build-depends:
# Skipped: oci/cosmic/manifest.bst (kind: collect_manifest comes from
# buildstream-plugins-community; we can re-add it once we wire the
# plugin in for our own elements).
- oci/cosmic/stack.bst
# Per-variant bootc install defaults pinning `bootc upgrade` to the
# variant-specific stable tag. Lives at the filesystem layer (not the
# stack layer) so the cosmic-nvidia variant -- which inherits the cosmic
# stack -- can independently ship its own /etc/bootc/install/00-defaults.toml
# without colliding via stack overlap.
- oci/integration/bootc-defaults-cosmic.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
