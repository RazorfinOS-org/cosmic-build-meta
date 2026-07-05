# Extra CLI tooling + Homebrew: the "creature comforts" that make the
# image feel like a modern, day-to-day-usable desktop rather than a bare
# COSMIC session. Ported from the downstream RazorfinOS/aegis image so the
# base carries them for every consumer.
#
# Three groups:
#   1. General-purpose CLI utilities (prebuilt/vendored, no branding).
#   2. Homebrew (ublue-os flavour) as the user-space package manager.
#   3. Rust reimplementations that REPLACE the GNU coreutils/sudo defaults
#      system-wide (opinionated; see the overlap note below).
kind: stack

depends:
  # --- General-purpose CLI utilities -------------------------------------
  # glow    -- render Markdown in the terminal
  # gum     -- build glamorous shell scripts (charmbracelet)
  # fzf     -- fuzzy finder; ubiquitous interactive filter
  # fastfetch -- fast system-info / "screenshot" tool
  # distrobox -- run any distro's tooling in a container (pairs with podman)
  # wl-clipboard -- wl-copy / wl-paste for Wayland clipboard from the CLI
  # bpftop  -- eBPF program monitor TUI (diagnostics)
  - cosmic-deps/glow.bst
  - cosmic-deps/gum.bst
  - cosmic-deps/fzf.bst
  - cosmic-deps/fastfetch.bst
  - cosmic-deps/distrobox.bst
  - cosmic-deps/wl-clipboard.bst
  - cosmic-deps/bpftop.bst

  # --- Homebrew ----------------------------------------------------------
  # The prebuilt Homebrew payload (/usr/share/homebrew.tar.zst) plus the
  # ublue-os/brew first-boot glue (brew-setup.service extracts it to the
  # writable /var/home/linuxbrew on first boot; update/upgrade timers,
  # profile.d shellenv). brew-tarball runtime-depends brew, so this one
  # line pulls both. Needs tar/findutils/git at runtime -- provided by the
  # core GNU userland block in cosmic-deps/base.bst.
  - cosmic-deps/brew-tarball.bst

  # --- Rust coreutils / sudo (opinionated system-wide replacements) ------
  # uutils-coreutils installs unprefixed /usr/bin/{ls,cp,mv,...} and
  # sudo-rs installs setuid /usr/bin/sudo, both OVERLAPPING and replacing
  # the GNU tools shipped by cosmic-deps/base.bst. Each element carries a
  # public.bst.overlap-whitelist declaring the overlap so the compose in
  # oci/cosmic/filesystem.bst resolves cleanly with the Rust tools winning.
  # Remove these two lines to fall back to GNU coreutils/sudo.
  - cosmic-deps/uutils-coreutils.bst
  - cosmic-deps/sudo-rs.bst
