# Image-time Flatpak setup.
#
# We ship the flatpak runtime via cosmic-deps/sandboxing.bst (the binary,
# bubblewrap, xdg-dbus-proxy) but no remote pre-configured -- without
# this element, `flatpak install firefox` on a fresh boot fails because
# there are no remotes to search.
#
# Approach:
#   1. Ship a oneshot systemd service that runs
#      `flatpak remote-add --if-not-exists --system flathub <url>` after
#      network is up on first boot. Idempotent on subsequent boots.
#   2. Ship 91-flatpak.preset to enable that service so
#      systemd-preset-all (run by oci/integration/cosmic-presets.bst's
#      preset machinery via systemd-firstboot/preset-all at image build)
#      flips it on.
#
# Downstream distros that want a different remote (Fedora's, a private
# mirror, etc.) can drop a 92-<thing>.preset that disables
# flathub-remote-add.service and enables their own equivalent. Stays
# composable.
kind: manual

sources:
- kind: local
  path: files/oci/flatpak
  directory: flatpak
- kind: local
  path: files/oci/systemd-presets
  directory: systemd-presets

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 flatpak/flathub-remote-add.service "%{install-root}/usr/lib/systemd/system/flathub-remote-add.service"
  - install -Dm644 systemd-presets/91-flatpak.preset "%{install-root}/usr/lib/systemd/system-preset/91-flatpak.preset"
