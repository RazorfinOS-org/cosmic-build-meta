# CLDR per-language emoji annotations for ibus's --enable-emoji-dict.
# unicode-org/cldr core.zip, not ibus's documented fujiwarat repo --
# that one is stale at CLDR 38; Fedora switched too.
kind: manual

sources:
- kind: remote
  url: github-releases:unicode-org/cldr/releases/download/release-47/core.zip
  filename: cldr-core.zip

  ref: d5ee2abac64158c04884a722f8ef4830ea22b6c74aac20185be2838db8eda788
build-depends:
# unzip is libarchive's bsdunzip since 26.08.
- freedesktop-sdk.bst:components/libarchive.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - unzip -q cldr-core.zip 'common/annotations/*' 'common/annotationsDerived/*' 'common/dtd/*'
  install-commands:
  - |
    mkdir -p "%{install-root}%{datadir}/unicode/cldr"
    cp -r common "%{install-root}%{datadir}/unicode/cldr/"
