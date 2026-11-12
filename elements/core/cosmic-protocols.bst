kind: make

build-depends:
- core-deps/sandbox-tools.bst
- freedesktop-sdk.bst:components/make.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-protocols.git
  track: main

  ref: 815b2c5df84a4a82eb8fb505343f8ebde6aefc38
variables:
  make-args: >-
    PREFIX="%{prefix}"
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
