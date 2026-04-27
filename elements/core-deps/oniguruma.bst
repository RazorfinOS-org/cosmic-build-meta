kind: cmake

build-depends:
- freedesktop-sdk.bst:components/cmake.bst
- freedesktop-sdk.bst:components/ninja.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:kkos/oniguruma.git
  track: "v6.9.*"
  ref: v6.9.10-0-g4ef89209a239c1aea328cf13c05a2807e5c146d1
