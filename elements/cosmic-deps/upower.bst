# upower - power management daemon.
# Required at runtime by cosmic-applets for battery/power status.
# The upower_dbus crate talks to upower over D-Bus, so this is a
# runtime dependency only (not needed at build time for COSMIC elements).
#
# Recipe mirrors gnome-build-meta's elements/core-deps/upower.bst;
# libimobiledevice (iOS device support) dropped -- not relevant for COSMIC.
kind: meson

sources:
- kind: git_repo
  url: freedesktop:upower/upower.git
  track: 'v*'
  ref: v1.91.2-0-g17f9e8dc5a967fde13be688634a465c71fb79dd0

build-depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:components/polkit-gobject.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
