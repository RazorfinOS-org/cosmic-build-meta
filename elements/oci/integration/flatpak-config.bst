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
#   2. Ship a second oneshot (flatpak-preinstall.service) ordered
#      After= the remote-add unit. It runs `flatpak preinstall -y`,
#      which materialises every app declared by .preinstall drop-ins
#      under /usr/share/flatpak/preinstall.d/ (e.g. Firefox below).
#      `flatpak preinstall` is idempotent and respects user uninstalls.
#      Note: this subcommand is 1.17+; we vendor flatpak 1.17.6 in
#      cosmic-deps/flatpak.bst because fdsdk still pins 1.16.3.
#   3. Ship 91-flatpak.preset to enable all of the above so
#      systemd-preset-all (run by oci/integration/cosmic-presets.bst's
#      preset machinery via systemd-firstboot/preset-all at image build)
#      flips them on.
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
  - install -Dm644 flatpak/flathub-remote-add.service     "%{install-root}/usr/lib/systemd/system/flathub-remote-add.service"
  - install -Dm644 flatpak/flatpak-preinstall.service     "%{install-root}/usr/lib/systemd/system/flatpak-preinstall.service"
  # Daily flatpak update timer (with metered-connection guard).
  # Mirrors ublue-os-update-services. Catches up via Persistent= on
  # next boot if the machine was off / asleep at 04:00.
  - install -Dm644 flatpak/flatpak-system-update.service  "%{install-root}/usr/lib/systemd/system/flatpak-system-update.service"
  - install -Dm644 flatpak/flatpak-system-update.timer    "%{install-root}/usr/lib/systemd/system/flatpak-system-update.timer"
  # Vendor-shipped preinstall drop-ins live under /usr/share (OS image
  # state); /etc/flatpak/preinstall.d is reserved for site-local
  # additions made after deployment.
  - install -Dm644 flatpak/preinstall.d/org.mozilla.firefox.preinstall "%{install-root}/usr/share/flatpak/preinstall.d/org.mozilla.firefox.preinstall"
  - install -Dm644 systemd-presets/91-flatpak.preset      "%{install-root}/usr/lib/systemd/system-preset/91-flatpak.preset"
