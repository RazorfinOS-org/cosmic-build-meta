# orca - screen reader; cosmic-session spawns it when ScreenReaderEnabled
# flips on the a11y bus. Keep on 49.x: orca 50 needs at-spi2-core
# >= 2.58.6 with python overrides, fdsdk 25.08 ships 2.54.
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/orca.git
  track: '49.*'
  ref: 49.7-0-g81e6c3339657ec543180658caaa3e5bbaa362ade

build-depends:
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/dasbus.bst
- cosmic-deps/liblouis.bst
- cosmic-deps/speech-dispatcher.bst
- freedesktop-sdk.bst:components/at-spi2-core.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/pygobject.bst
- freedesktop-sdk.bst:components/python3-psutil.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
