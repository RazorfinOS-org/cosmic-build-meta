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
  track: "0.*"

  ref: 0.4.0-0-gc67a3e9bedb05ab61c7443704a1a107e76254595
variables:
  meson-local: ""
