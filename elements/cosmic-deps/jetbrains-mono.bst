# JetBrains Mono - selectable coding monospace; the terminal default
# stays Noto Sans Mono (libcosmic hardcodes it, see fonts.bst).
kind: manual

sources:
- kind: git_repo
  url: github:JetBrains/JetBrainsMono.git
  track: v*

  ref: v2.304-0-gcd5227bd1f61dff3bbd6c814ceaf7ffd95e947d9
build-depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/usr/share/fonts/jetbrains-mono" fonts/otf/*.otf
