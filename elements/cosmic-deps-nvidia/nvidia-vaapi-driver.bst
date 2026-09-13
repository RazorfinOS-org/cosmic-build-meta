# NVDEC-backed VA-API shim so browsers hardware-decode on the nvidia
# variant. Decode-only; browsers still need LIBVA_DRIVER_NAME=nvidia.
kind: meson

sources:
- kind: git_repo
  url: github:elFarto/nvidia-vaapi-driver.git
  track: 'v*'

  ref: v0.0.18-0-g982ba1c2464b9cea5a4403df8f2c5a351ca21394
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
# EGL headers + egl.pc; fdsdk's libglvnd drops them (-Dheaders=false).
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/libva.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/nv-codec-headers.bst
# codecparsers: optional upstream, but without it VP9 is silently dropped.
- freedesktop-sdk.bst:components/gstreamer-plugins-bad.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libglvnd.bst
- freedesktop-sdk.bst:components/gstreamer-plugins-bad.bst
# libnvcuvid comes from nvidia-drivers.bst in the same stack; no dep
# here so this element survives driver .run bumps without rebuilding.

config:
  configure-commands:
    (<):
    # fdsdk libva's driverdir pc variable is a colon-separated search
    # list; install to its nvidia entry, not the literal string.
    - |
      sed -i "s|libva_deps.get_variable(pkgconfig: 'driverdir')|'%{libdir}/dri/nvidia-vaapi-driver'|" meson.build
