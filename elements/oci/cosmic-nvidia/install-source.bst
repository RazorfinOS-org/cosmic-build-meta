# Offline-install OCI bake (NVIDIA variant) — single-layer, gzip-compressed.
#
# Same shape as oci/cosmic/install-source.bst -- see that file for full
# rationale. Differs only in the source dir (variant-specific squash).
kind: import

config:
  target: /usr/lib/bootc/install-source/main

sources:
- kind: local
  path: build/install-source-cosmic-nvidia
  directory: ''
