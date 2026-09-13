# Unicode emoji data for ibus's --enable-emoji-dict (same file set as
# Fedora's unicode-emoji). Bump the version in the URLs, then source track.
kind: manual

sources:
- kind: remote
  url: unicode:emoji/16.0/emoji-test.txt
  filename: emoji-test.txt
  ref: 24f0c534e86cf142e2496953e8f0e46a3e702392911eddcd29c6cced85139697
- kind: remote
  url: unicode:emoji/16.0/emoji-sequences.txt
  filename: emoji-sequences.txt
  ref: 3fe3c77e72e8f26df302dc7d99b106c5d08fd808ef7246fb5d4502d659fe659c
- kind: remote
  url: unicode:emoji/16.0/emoji-zwj-sequences.txt
  filename: emoji-zwj-sequences.txt

  ref: 9423ec235474356f970a696506737e2d5d65453a67f45df66b8bbe920c3fab83
build-depends:
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands: []
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/unicode/emoji" emoji-test.txt emoji-sequences.txt emoji-zwj-sequences.txt
