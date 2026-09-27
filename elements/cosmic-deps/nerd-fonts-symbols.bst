# Nerd Fonts symbols-only fallback + fontconfig rule: glyph icons
# (starship, eza, ...) render in cosmic-term without a font change.
kind: manual

sources:
- kind: tar
  url: github-releases:ryanoasis/nerd-fonts/releases/download/v3.5.1/NerdFontsSymbolsOnly.tar.xz
  base-dir: ''
  ref: 01172f37db8543edb102e5cb5c64101c9f4686630804d49b419aa07b23a69996
- kind: remote
  url: github-raw:ryanoasis/nerd-fonts/v3.5.1/10-nerd-font-symbols.conf

  ref: 883f3ea0ca0874c567d9414be319de7a54d64f4a30aaa87f2ad4066da1687c07
build-depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

# Supplies the integration command that refreshes the composed font cache.
runtime-depends:
- freedesktop-sdk.bst:components/fontconfig.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/usr/share/fonts/nerd-fonts" SymbolsNerdFont-Regular.ttf SymbolsNerdFontMono-Regular.ttf
  - install -Dm644 10-nerd-font-symbols.conf "%{install-root}/usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf"
  - mkdir -p "%{install-root}/etc/fonts/conf.d"
  - ln -s ../../../usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf "%{install-root}/etc/fonts/conf.d/10-nerd-font-symbols.conf"
