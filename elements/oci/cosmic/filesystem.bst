# Squash the stack into a single sysroot for build-oci, stripping the
# split-rule domains we don't ship in the runtime image.
kind: compose

build-depends:
# Skipped: oci/cosmic/manifest.bst (kind: collect_manifest comes from
# buildstream-plugins-community; we can re-add it once we wire the
# plugin in for our own elements).
- oci/cosmic/stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - static-blocklist
