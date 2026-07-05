kind: manual

sources:
- kind: tar
  base-dir: ""
  (?):
  - arch == "x86_64":
      url: github-releases:junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_amd64.tar.gz
      ref: 4be08018ca37b32518c608741933ea335a406de3558242b60619e98f25be2be1
  - arch == "aarch64":
      url: github-releases:junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_arm64.tar.gz
      ref: 7071f48c2ac0f2bc992d6d33cc36fd675a579a98cc976dda699eea07dd5e9c58

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" fzf
