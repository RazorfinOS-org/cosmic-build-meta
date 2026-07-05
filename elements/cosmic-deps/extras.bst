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
  # Only tools that benefit from being system-level (available pre-Homebrew,
  # tied to desktop/host integration) are baked in. Pure leaf CLI tools
  # (glow, gum, fzf, fastfetch, bpftop) are preinstalled from Homebrew
  # instead -- see files/oci/homebrew/Brewfile -- to keep the image lean
  # and let brew keep them updated.
  #
  # distrobox    -- run any distro's tooling in a container; host/podman
  #                 integration, wanted before brew/network on first boot
  # wl-clipboard -- wl-copy / wl-paste; Wayland desktop util other apps
  #                 and scripts expect at the system level
  - cosmic-deps/distrobox.bst
  - cosmic-deps/wl-clipboard.bst

  # --- Homebrew ----------------------------------------------------------
  # The prebuilt Homebrew payload (/usr/share/homebrew.tar.zst) plus the
  # ublue-os/brew first-boot glue (brew-setup.service extracts it to the
  # writable /var/home/linuxbrew on first boot; update/upgrade timers,
  # profile.d shellenv). brew-tarball runtime-depends brew, so this one
  # line pulls both. Needs tar/findutils/git at runtime -- provided by the
  # core GNU userland block in cosmic-deps/base.bst.
  - cosmic-deps/brew-tarball.bst
  # Opt-in first-boot `brew bundle install` of the system Brewfile
  # (/usr/share/cosmic/homebrew/Brewfile) via brew-preinstall.service.
  - cosmic-deps/homebrew-preinstall.bst

  # --- Rust coreutils / sudo (opinionated system-wide replacements) ------
  # uutils-coreutils installs unprefixed /usr/bin/{ls,cp,mv,...} and
  # sudo-rs installs setuid /usr/bin/sudo, both OVERLAPPING and replacing
  # the GNU tools shipped by cosmic-deps/base.bst. Each element carries a
  # public.bst.overlap-whitelist declaring the overlap so the compose in
  # oci/cosmic/filesystem.bst resolves cleanly with the Rust tools winning.
  # Remove these two lines to fall back to GNU coreutils/sudo.
  - cosmic-deps/uutils-coreutils.bst
  - cosmic-deps/sudo-rs.bst
