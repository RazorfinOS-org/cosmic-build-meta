# Fonts: render text in any GTK/iced/Qt app. runtime-minimal does NOT
# pull fontconfig in, so this stack is mandatory for a usable desktop.
kind: stack

depends:
  - freedesktop-sdk.bst:components/fontconfig.bst
  - freedesktop-sdk.bst:components/dejavu-fonts.bst
  - freedesktop-sdk.bst:components/liberation-fonts.bst
  - freedesktop-sdk.bst:components/gnu-free-fonts.bst
  - freedesktop-sdk.bst:components/noto-emoji.bst
  # libcosmic 1.0.x hardcodes "Open Sans" / "Noto Sans Mono" as the
  # CosmicTk default font families. iced's fontdb requires exact name
  # matches (no fontconfig substitution), so missing these breaks
  # text_input/secure_input glyph rendering -- the form widgets
  # ship empty pills with invisible labels, and cosmic-initial-setup's
  # create-account page renders blank.
  - cosmic-deps/open-sans.bst
  - cosmic-deps/noto-sans-mono.bst
