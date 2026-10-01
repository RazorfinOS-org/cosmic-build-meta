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

  ref: epoch-1.9.0-1-gf1a282a0822aed1f0083dd2ab2e6c65bd5b401eb
config:
  configure-commands: []
  build-commands: []
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands: []
