kind: meson

build-depends:
- freedesktop-sdk.bst:components/hwdata.bst
- freedesktop-sdk.bst:components/meson.bst
- freedesktop-sdk.bst:components/ninja.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:emersion/libdisplay-info.git
  # Stay on the 0.3 series: the COSMIC crates vendor libdisplay-info-sys
  # 0.3.x, whose build script rejects the 0.4 system library.
  track: "0.3.*"

  ref: 0.3.0-0-g47a5590e9c4eb35d67651b8c05a55f1a48259329
variables:
  meson-local: ""
