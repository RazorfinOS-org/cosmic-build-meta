# Pre-deployed Flatpak tree for the bootc-installer + its GNOME 50
# runtime, baked into the Live env's /var/lib/flatpak at build time.
#
# Why this exists
# ---------------
# tuna-installer's bundle (org.bootcinstaller.Installer.flatpak) declares
# org.gnome.Platform//50 + GL.default + locale as runtime deps. Resolving
# them at first live boot via `flatpak install --bundle` requires:
#   1. Network reachability to flathub.org (often fine on a fresh USB
#      boot, but not guaranteed).
#   2. ~1 GB free in /var/lib/flatpak to download + unpack the deltas.
#      The live env's volatile-overlay tmpfs only carries ~1 GB free at
#      boot (capped by RAM/2 by default), so the install fails with
#      "Not enough disk space to complete this operation".
#
# Approach
# --------
# `just prefetch-installer-flatpak` runs on the host (outside the BST
# sandbox) and `flatpak --user install`s the bundle into
# build/installer-prebake/var/lib/flatpak. flatpak's on-disk layout for
# user vs system installations is structurally identical (bare-user-only
# OSTree repo + app/runtime trees + exports/), so when we BST-import
# that tree to /var/lib/flatpak in the EROFS root, system-wide flatpak
# discovers the app via its default search path and `flatpak run
# org.bootcinstaller.Installer` (called from the autostart .desktop)
# resolves it without any first-boot network or disk activity.
#
# Trade-offs vs in-sandbox install: BST sandboxes have no network
# access during command execution and `flatpak install --system` needs
# flatpak-system-helper (D-Bus + polkit, neither present). Doing the
# install on the host sidesteps both. See the gnome-build-meta
# precedent: they emit OSTree refs via the `flatpak_repo` BST plugin,
# never call `flatpak install` at build time.
#
# Trade-offs of pre-baking vs sideload: a sideload OSTree repo (the
# `flatpak create-usb` route) would still need the same ~1 GB free at
# first boot to deploy the trees -- it only saves the network pull,
# not the tmpfs cost. The full deployed-tree import below is the only
# option that requires zero work at first boot.
#
# Reproducibility
# ---------------
# `kind: local` hashes the contents of build/installer-prebake/, so any
# change in upstream Flathub state (runtime version, app commit) yields
# a new artifact key and BST rebuilds the live image. Run
# `just prefetch-installer-flatpak` to refresh after a tuna-installer
# bump or to repair a stale local cache.
kind: import

sources:
- kind: local
  path: build/installer-prebake

config:
  # Preserve the staged tree's structure verbatim. The prefetch recipe
  # writes /var/lib/flatpak/ underneath build/installer-prebake/, so
  # source: / maps straight into target: / with the same layout the
  # booted system expects.
  source: /
  target: /
