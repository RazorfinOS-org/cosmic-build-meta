# Base platform: kernel, init, dbus, pam, polkit, core userland.
# Mirrors gnome-build-meta's gnomeos-deps base layer.
kind: stack

depends:
  # Kernel + firmware (we do NOT build our own kernel; FDSDK upstream)
  - freedesktop-sdk.bst:components/linux.bst
  - freedesktop-sdk.bst:components/linux-firmware.bst

  # Init system + core platform
  - freedesktop-sdk.bst:components/systemd.bst
  - freedesktop-sdk.bst:components/dbus.bst
  - freedesktop-sdk.bst:components/linux-pam.bst
  - freedesktop-sdk.bst:components/polkit.bst
  - freedesktop-sdk.bst:components/shadow.bst
  - freedesktop-sdk.bst:components/util-linux.bst
  - freedesktop-sdk.bst:components/iproute2.bst
  - freedesktop-sdk.bst:components/iputils.bst
  - freedesktop-sdk.bst:components/openssh-systemd.bst

  # Convenience userland (mirrors gnomeos-deps).
  # bash and coreutils live under bootstrap/ in FDSDK 25.08.
  - freedesktop-sdk.bst:bootstrap/bash.bst
  - freedesktop-sdk.bst:components/bash-completion.bst
  - freedesktop-sdk.bst:bootstrap/coreutils.bst
  - freedesktop-sdk.bst:components/less.bst
  - freedesktop-sdk.bst:components/nano.bst
  - freedesktop-sdk.bst:components/vim.bst

  # Runtime baseline + GPU stack
  - freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
  - freedesktop-sdk.bst:vm/mesa-default.bst

  # Generates /usr/lib/locale/* for ALL supported languages.
  # Without this, runtime-minimal only ships en_US.UTF-8 + C.UTF-8 (via
  # utf-locale.bst), and cosmic-initial-setup's language picker shows
  # only English even though iso-codes is installed.
  - freedesktop-sdk.bst:components/locales.bst
