# UCD subset ibus's --enable-unicode-dict needs at build time and
# ibus-emojier reads at runtime. Bump the version in both URLs, then
# source track.
kind: manual

sources:
- kind: remote
  url: unicode:16.0.0/ucd/NamesList.txt
  filename: NamesList.txt
  ref: 6a299e9259d07c2a941fdc967e2117e1246d56aa4e133caff86dfc0845715679
- kind: remote
  url: unicode:16.0.0/ucd/Blocks.txt
  filename: Blocks.txt

  ref: f3907b395d410f1b97342292ca6bc83dd12eb4b205f2a0c48efdef99e517d7b0
build-depends:
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands: []
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/unicode/ucd" NamesList.txt Blocks.txt
