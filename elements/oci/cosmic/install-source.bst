# Offline-install OCI bake — single-layer, gzip-compressed.
#
# Why kind: import + a host-prepared dir instead of an in-sandbox bake:
#
# image.bst's `build-oci` produces a 3-layer OCI image. bootc 1.x's
# composefs backend reads layers via splitstream and chokes on multi-layer
# input with "Unexpected EOF in splitstream" -- same issue the Justfile
# `load-image` recipe sidesteps via `podman build --squash-all`.
#
# The squash happens host-side in the `prep-install-source-cosmic` Justfile
# target (mirrors the load-image flow), which writes the squashed OCI to
# `build/install-source-cosmic/`. This element imports it into the BST
# graph at `/usr/lib/bootc/install-source/main` so live-image-cosmic.bst
# can stage it at /sysroot/... inside the EROFS.
#
# Trade-off: BST doesn't track image.bst as an upstream of this element
# (the source is opaque to the cache layer). The `build-iso` Justfile
# always runs `prep-install-source-cosmic` so the staged dir is fresh
# at every ISO build -- don't bypass that.
#
# Variant-agnostic target path so one images.json works for both Mesa +
# NVIDIA ISOs (each ISO bakes its own variant at /usr/lib/bootc/install-source/main).
kind: import

config:
  target: /usr/lib/bootc/install-source/main

sources:
- kind: local
  path: build/install-source-cosmic
  directory: ''
