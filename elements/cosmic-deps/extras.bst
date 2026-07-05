# Extra CLI tooling and Homebrew, ported from the downstream
# RazorfinOS/aegis image: general-purpose utilities, Homebrew as the
# user-space package manager, and Rust replacements for coreutils/sudo.
kind: stack

depends:
  # System-level CLI utilities. Leaf tools (glow, gum, fzf, fastfetch,
  # bpftop) are installed from Homebrew instead; see
  # files/oci/homebrew/Brewfile.
  #   distrobox    -- containerized userlands; pairs with podman
  #   wl-clipboard -- wl-copy / wl-paste for Wayland
  - cosmic-deps/distrobox.bst
  - cosmic-deps/wl-clipboard.bst

  # Homebrew: prebuilt payload (/usr/share/homebrew.tar.zst) plus the
  # ublue-os/brew first-boot glue (brew-setup.service extracts it to
  # /var/home/linuxbrew; update/upgrade timers; profile.d shellenv).
  # brew-tarball runtime-depends brew.bst, so one line pulls both.
  # Runtime tar/git come from cosmic-deps/base.bst.
  - cosmic-deps/brew-tarball.bst
  # First-boot `brew bundle install` of /usr/share/cosmic/homebrew/Brewfile.
  - cosmic-deps/homebrew-preinstall.bst

  # Rust reimplementations replacing the GNU defaults, except cp/mv/rm
  # (see uutils-coreutils.bst). Both declare overlap-whitelists so the
  # compose resolves with the Rust tools winning. Remove these two lines
  # to fall back to GNU coreutils/sudo.
  - cosmic-deps/uutils-coreutils.bst
  - cosmic-deps/sudo-rs.bst
