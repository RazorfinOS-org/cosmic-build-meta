# /usr/local/bin/cosmic-debug-dump -- single-command diagnostic for the
# "cosmic-comp 1 fps / DRM master EACCES" failure class. Ships in both
# Mesa and NVIDIA bootc images (and therefore both live ISOs), so any
# failing host can be triaged via `cosmic-debug-dump` from a debug shell
# without needing to remember (or curl in) a script.
#
# Pulled in by elements/oci/cosmic/stack.bst; cosmic-nvidia inherits via
# that stack so no separate dep edge is needed for the NVIDIA variant.
kind: manual

sources:
- kind: local
  path: files/oci/debug
  directory: debug

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm755 debug/cosmic-debug-dump "%{install-root}/usr/local/bin/cosmic-debug-dump"
