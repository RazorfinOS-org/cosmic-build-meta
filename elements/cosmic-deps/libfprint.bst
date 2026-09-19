# libfprint - fingerprint reader drivers; fprintd is the only consumer.
# Mirrors gnome-build-meta's gnomeos-deps/libfprint.bst; docs/tests off,
# nss swapped for openssl (uru4000 uses openssl 3 since 1.94.6).
kind: meson

variables:
  meson-local: >-
    -Ddoc=false
    -Dinstalled-tests=false

sources:
- kind: git_repo
  url: freedesktop:libfprint/libfprint.git
  track: 'v*'

  ref: v1.94.100-0-g80a4b5ec612892c5c056c48dddaa561452cf37ec
build-depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/libgusb.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:components/pixman.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
