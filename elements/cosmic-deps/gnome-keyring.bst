# gnome-keyring - Secret Service provider (org.freedesktop.secrets);
# libsecret is only the client API. D-Bus activated, unlocked at login
# by pam_gnome_keyring (core-deps/greetd.bst). Mirrors gnome-build-meta's
# core-deps/gnome-keyring.bst; docs/ssh-agent/selinux off.
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/gnome-keyring.git
  track: '[0-9]*.[0-9]*'

  ref: 50.0-0-g2ff8b070763ae025b90916a7b98643865819b451
build-depends:
# systemd.bst for the systemduserunitdir pkg-config lookup
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/gcr.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libcap-ng.bst
- freedesktop-sdk.bst:components/libgcrypt.bst
- freedesktop-sdk.bst:components/linux-pam.bst
- freedesktop-sdk.bst:components/p11-kit.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Ddebug-mode=false
    -Dmanpage=false
    -Dselinux=disabled
    -Dssh-agent=false
