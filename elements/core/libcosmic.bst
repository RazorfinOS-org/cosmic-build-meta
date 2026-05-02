# Native system dependencies for libcosmic
#
# libcosmic itself is a Rust library compiled inline by each COSMIC app
# via cargo2 git dependencies. This stack element aggregates the native
# C/system libraries that libcosmic's build.rs scripts link against.
# It does NOT build libcosmic -- there is no standalone .so to produce.
kind: stack

depends:
  - freedesktop-sdk.bst:components/mesa-headers.bst
  - freedesktop-sdk.bst:components/libxkbcommon.bst
  - freedesktop-sdk.bst:components/wayland.bst
  - freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
