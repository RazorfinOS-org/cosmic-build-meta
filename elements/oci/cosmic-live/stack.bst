# Live env stack for the COSMIC ISO.
#
# Composition: the full default cosmic image stack, plus the Live env
# extras (cosmic-live user, autologin, autostart, Flatpak bundle install
# service) and the tuna-installer Flatpak file + COSMIC images.json.
#
# This stack feeds into oci/cosmic-live/filesystem.bst -> the Live env
# squashfs that goes into the ISO. It does NOT publish to GHCR -- the
# Live env is an installer-build dependency, not a redistributable
# bootc target.
kind: stack

depends:
  # Everything from the default image (cosmic-deps, integration, kernel
  # firmware, branding, presets).
  - oci/cosmic/stack.bst

  # Live env behaviour: cosmic-live user, sudoers, autologin override,
  # autostart, Flatpak bundle install systemd unit.
  - installer/live-extras.bst

  # The bootc-installer Flatpak bundle staged at /usr/share/cosmic-installer/.
  # The bundle-install systemd unit (in live-extras) reads this exact path.
  # NOTE: with installer-prebake.bst below the bundle is no longer needed
  # at runtime (the deployed tree is already in /var/lib/flatpak), but we
  # keep it as a fallback artifact for diagnostic / re-install scenarios.
  - installer/tuna-installer.bst

  # Pre-deployed Flatpak tree -- bootc-installer + GNOME 50 runtime
  # already at /var/lib/flatpak so first live boot needs zero network
  # and zero tmpfs space to launch the installer. Requires the host
  # to have run `just prefetch-installer-flatpak` first.
  - installer/installer-prebake.bst

  # tuna-installer's image picker override (COSMIC entry pointing at
  # ngcr.io/razorfinos/cosmic:nightly -- pulled at install time over
  # the network).
  #
  # Why not pre-baked? The bootc install flow chokes on local oci:/
  # imgrefs because bootc's internal storage references the image by
  # docker.io/library/<image-id> after the initial pull, and that
  # mapping never lands when the source is a path-based oci: ref.
  # Going through a real registry sidesteps the issue entirely and
  # halves the ISO size (no 6.6 GB local OCI dir baked in).
  # Trade-off: install needs network at install time. bootc upgrade
  # post-install needs network anyway, so this matches the eventual
  # operational pattern.
  - installer/cosmic-images-json.bst
