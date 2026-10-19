kind: meson

build-depends:
- core-deps/sandbox-tools.bst
- freedesktop-sdk.bst:components/meson.bst
- freedesktop-sdk.bst:components/ninja.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-sound-theme.git
  track: master
  ref: epoch-1.10.0-0-gbf5335fe1af0cb3bee83e1ad2371410ee434658d
