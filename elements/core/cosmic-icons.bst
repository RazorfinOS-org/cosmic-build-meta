kind: manual

build-depends:
- core-deps/just.bst
- freedesktop-sdk.bst:components/findutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-icons.git
  track: master

  ref: epoch-1.7.0-2-g343c007f37cd71716e68f01c43ecf2764b7f7c47
config:
  configure-commands: []
  build-commands: []
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands: []
