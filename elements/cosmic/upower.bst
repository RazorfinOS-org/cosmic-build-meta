# upower - power management daemon
# Required at runtime by cosmic-applets for battery/power status.
# The upower_dbus crate talks to upower over D-Bus, so this is a
# runtime dependency only (not needed at build time for COSMIC elements).
kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/systemd.bst

depends:
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:upower/upower.git
  track: "v1.*"
  ref: v1.91.1-0-g57f59b584e066dddafaa11cb8137b32e6e3d15c7

variables:
  meson-local: >-
    -Dgtk-doc=false
    -Dman=false
    -Dintrospection=disabled
    -Dsystemdsystemunitdir=%{prefix}/lib/systemd/system
    -Dudevrulesdir=%{prefix}/lib/udev/rules.d
