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

  ref: c253ec1d6804afbcdf250f5cc37ae1194bba7bd2
variables:
  make-args: >-
    PREFIX="%{prefix}"
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
