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

  ref: c0cff4db14c37ed954983158e4055aa94c7741d9
variables:
  make-args: >-
    PREFIX="%{prefix}"
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
