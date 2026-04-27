# accountsservice - D-Bus service for user account info.
# cosmic-greeter shows a generic UI without it (no avatars, no per-user
# settings).
#
# Recipe mirrors gnome-build-meta's elements/core-deps/accountsservice.bst;
# sdk/* deps swapped for FDSDK equivalents.
kind: meson

sources:
- kind: git_repo
  url: freedesktop:accountsservice/accountsservice.git
  track: refs/tags/*
  ref: 26.13.3-0-g97a902fe8a550d8447cf60648e7b5f00c770a4fc

build-depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/vala.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/polkit.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
