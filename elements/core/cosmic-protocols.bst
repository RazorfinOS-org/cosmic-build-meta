kind: make

build-depends:
- freedesktop-sdk.bst:components/make.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-protocols.git
  track: main

  ref: 0d0b0b573fe4836ede4c237dadd365033cd28296
variables:
  make-args: >-
    PREFIX="%{prefix}"
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
