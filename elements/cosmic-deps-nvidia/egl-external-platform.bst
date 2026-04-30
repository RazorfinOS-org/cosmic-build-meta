# EGL External Platform interface (NVIDIA, MIT licensed).
#
# Header-only library that defines the API NVIDIA's libGLX_nvidia uses
# to plug in alternate EGL platforms (Wayland, GBM, etc.). Required as
# a build-dep for nvidia-egl-wayland.bst -- pkg-config consumers look
# for `eglexternalplatform.pc`.
#
# Packaged here (not in cosmic-deps/) because in practice the only
# user is NVIDIA's egl-wayland and we don't want a dangling element
# in the base stack.
#
# Upstream uses meson; build is trivial (no compilation, just install
# headers + pc file).
kind: meson

build-depends:
- freedesktop-sdk.bst:components/meson.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:NVIDIA/eglexternalplatform.git
  track: '*'
  ref: 1.2.1-0-gcf9f10589775c1b4d90f1df6f417f8cf1bed7ec6

variables:
  strip-binaries: ''
