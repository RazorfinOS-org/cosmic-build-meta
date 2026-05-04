# tuna-installer Flatpak bundle (the GTK4 frontend driving fisherman).
#
# Universal bootc installer GUI from tuna-os, distributed as a
# self-contained Flatpak with the generic ID `org.bootcinstaller.Installer`.
# We stage just the .flatpak file; first-boot of the Live env runs
# `flatpak install --bundle` to materialise it (see
# files/installer/systemd/bootc-installer-flatpak-install.service).
#
# fisherman -- the Go install backend -- is bundled INSIDE this Flatpak
# (it's one of the modules in tuna-os/fisherman's Flatpak manifest), so
# we don't need a separate fisherman BST element. fisherman runs inside
# the Flatpak sandbox, escaping to host privileged commands via
# `flatpak-spawn --host`.
#
# Runtime: the bundle declares `org.gnome.Platform//49` as its runtime.
# v1 ships the bundle alone and relies on Flathub to fetch the runtime
# at first live-boot (needs network). For fully-offline ISOs (post-v1),
# add a sibling element that pre-stages the runtime.
#
# Pinned to the latest STABLE release tag (v2.4.0). Upstream's `continuous`
# tag is rolling-prerelease; do not pin to it.
#
# To bump:
#   1. Find the latest stable tag at
#      https://github.com/tuna-os/tuna-installer/releases (filter out
#      `continuous` and `continuous-dev` rolling-prerelease tags).
#   2. Update url + ref below.
#      Compute sha256 with:
#        curl -sSL <url> | sha256sum
kind: import

config:
  # Land at /usr/share/cosmic-installer/. The systemd bundle-install
  # service references this exact path -- if you move it, update the
  # ConditionPathExists= and ExecStart= in
  # files/installer/systemd/bootc-installer-flatpak-install.service.
  target: /usr/share/cosmic-installer

sources:
- kind: remote
  url: https://github.com/tuna-os/tuna-installer/releases/download/v2.4.0/org.bootcinstaller.Installer.flatpak
  ref: 9747530232987a517a5a7e464f72aba80d420edfe9559d6b3bc741ba0ace5b36
  filename: org.bootcinstaller.Installer.flatpak
