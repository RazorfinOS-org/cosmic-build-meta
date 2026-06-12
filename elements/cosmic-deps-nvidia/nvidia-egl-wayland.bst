# NVIDIA's EGL-Wayland external platform library.
#
# Open-source (MIT). Plugs into NVIDIA's EGL implementation via the
# "external platform" API to provide Wayland support. Without this,
# cosmic-comp can talk to NVIDIA's GL stack via XWayland but not
# directly via EGL/GBM -- meaning poor performance, no HW cursor, no
# explicit-sync, etc.
#
# Lives separately from the proprietary userspace because it has its
# own release cadence on github.com/NVIDIA/egl-wayland and isn't
# coupled to the driver version.
kind: meson

build-depends:
- freedesktop-sdk.bst:components/meson.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:components/libdrm.bst
# mesa-headers ships EGL/egl.h, GL/gl.h, KHR/khrplatform.h plus the
# matching .pc files. FDSDK's libglvnd is built with `-Dheaders=false`
# (and even rm's egl.pc post-install), so libglvnd alone isn't enough.
# mesa-headers has libglvnd as a runtime-dep, so the libEGL.so we need
# at link time still ends up in the build sandbox.
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/sed.bst
- cosmic-deps-nvidia/egl-external-platform.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/libdrm.bst

sources:
- kind: git_repo
  url: github:NVIDIA/egl-wayland.git
  track: '*'
  ref: 1.1.21-0-gf81fcd016bb232c12ba59dddb240648203caaf4c

config:
  configure-commands:
    (<):
    # Upstream pins egl '>=1.5, <2' against libglvnd's egl.pc, which
    # reports the EGL API version (1.5). Our sandbox's egl.pc comes from
    # mesa-headers instead (FDSDK's libglvnd deletes its egl.pc) and
    # reports Mesa's release version (e.g. 26.1.0), so the '<2' bound can
    # never hold here even though the API is still EGL 1.5. Drop the
    # version constraint.
    - |
      sed -i "s/dependency('egl', version : \['>=1.5', '<2'\])/dependency('egl')/" meson.build

variables:
  strip-binaries: ''
