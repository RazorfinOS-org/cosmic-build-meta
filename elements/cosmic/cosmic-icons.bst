kind: manual

build-depends:
- cosmic/just.bst
- freedesktop-sdk.bst:components/findutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-icons.git
  track: master

  ref: epoch-1.0.9-2-geb1c1da0f5889277eb93d941689cb2c1c0c3fe98
config:
  configure-commands: []
  build-commands: []
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands: []
