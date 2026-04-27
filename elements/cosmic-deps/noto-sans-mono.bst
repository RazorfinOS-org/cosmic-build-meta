# Noto Sans Mono -- libcosmic 1.0.x's hardcoded default monospace font
# (`MONO_FAMILY_DEFAULT` in libcosmic-1.0.0/src/config/mod.rs:16).
#
# Same rationale as open-sans.bst: iced's fontdb requires the exact
# family. Without this, cosmic-term and any iced widget rendering
# monospace glyphs falls back to nothing.
#
# Source: notofonts/notofonts.github.io is the canonical monorepo for
# all Noto fonts. We install only the Noto Sans Mono hinted TTFs and
# discard the rest of the bundle (~hundreds of MB).
kind: manual

sources:
- kind: git_repo
  url: github:notofonts/notofonts.github.io.git
  track: "noto-monthly-release-*"
  ref: noto-monthly-release-2026.04.01-0-g132db3be0104de9ca0aac3c7b1dd33a8fd29ff39

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

build-depends:
- freedesktop-sdk.bst:components/fontconfig.bst

variables:
  license-files-extra: fonts/LICENSE
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/fonts/noto-sans-mono" fonts/NotoSansMono/hinted/ttf/*.ttf
