kind: make

build-depends:
- freedesktop-sdk.bst:components/make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-wallpapers.git
  track: master

  ref: epoch-1.0.9-0-g3c59953e7ee5792efecdb232cb4c7211e7785f52
variables:
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
