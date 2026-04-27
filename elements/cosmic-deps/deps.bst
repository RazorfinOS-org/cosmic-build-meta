# System dependency aggregation for the COSMIC bootc/OCI image.
#
# Mirrors gnome-build-meta's elements/gnomeos-deps/deps.bst pattern: a
# thin top-level stack pulling in themed sub-stacks under
# elements/cosmic-deps/. Each themed stack groups one logical concern
# (fonts, audio, networking, ...) so reviewers can diff a single area
# at a time.
#
# Most of what's beneath the COSMIC binaries (kernel, init, audio,
# bootc tooling) is sourced verbatim from the freedesktop-sdk junction
# so we inherit upstream's security updates and reproducibility
# guarantees. The locally-vendored daemons (upower, dconf,
# accountsservice, udisks2, ...) live next to the themed stacks here
# in cosmic-deps/ and are pulled in by whichever stack matches their
# concern -- following gnomeos-deps's "flat directory, themed stacks"
# discipline.
kind: stack

depends:
  # COSMIC binaries we build ourselves (compositor, shell, apps, greeter, ...)
  - core/deps.bst

  # Themed system sub-stacks
  - cosmic-deps/base.bst              # kernel, init, dbus, pam, polkit, core userland
  - cosmic-deps/fonts.bst             # fontconfig + font packs
  - cosmic-deps/multimedia.bst        # pipewire, alsa, rtkit, gstreamer
  - cosmic-deps/desktop-services.bst  # xwayland, portals, GIO TLS, GSettings, BT, printing, dconf, accountsservice, gvfs, ...
  - cosmic-deps/networking.bst        # NetworkManager, wpa-supplicant, firewalld, nftables
  - cosmic-deps/firmware.bst          # sof-firmware, fwupd, plymouth, wireless-regdb
  - cosmic-deps/diagnostics.bst       # man-db, usbutils
  - cosmic-deps/storage.bst           # bootc, composefs, ostree, podman, mkfs.*, udisks2
  - cosmic-deps/power.bst             # upower, power-profiles-daemon
