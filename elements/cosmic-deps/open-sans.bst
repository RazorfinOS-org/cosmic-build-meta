# Open Sans -- libcosmic 1.0.x's hardcoded default sans-serif font
# (`SANS_FAMILY_DEFAULT` in libcosmic-1.0.0/src/config/mod.rs:17).
#
# Without it, iced's font db can't resolve `iced::Font::with_name("Open Sans")`
# and form-widget glyphs (text_input labels, captions, secure_input
# placeholders) render as nothing -- breaking cosmic-initial-setup's
# create-account form even when fontconfig substitution would otherwise
# pick up DejaVu. iced/cosmic-text uses fontdb directly, which does NOT
# perform fontconfig substitution -- so we must ship the actual family.
#
# Source: googlefonts/opensans -- the official Open Sans VF + static TTFs.
# Pop!_OS ships this same upstream as `fonts-open-sans` on Debian.
kind: manual

sources:
- kind: git_repo
  url: github:googlefonts/opensans.git
  track: main
  ref: bd7e37632246368c60fdcbd374dbf9bad11969b6

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

build-depends:
- freedesktop-sdk.bst:components/fontconfig.bst

variables:
  license-files-extra: OFL.txt
  strip-binaries: ''

config:
  install-commands:
  # Static TTFs (one per weight/style). The variable-font TTFs in fonts/variable/
  # also work for iced but the static set has wider compatibility.
  - install -Dm644 -t "%{install-root}%{datadir}/fonts/open-sans" fonts/ttf/*.ttf
