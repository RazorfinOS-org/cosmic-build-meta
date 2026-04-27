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

  ref: epoch-1.0.11-0-g6fafded5edfff7693224f3ccf01b861896c35f3e
config:
  configure-commands: []
  build-commands: []
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands: []
