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

  ref: epoch-1.0.11-3-g2c697e8e97cfd619107a872b28c31317281184ff
config:
  configure-commands: []
  build-commands: []
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands: []
