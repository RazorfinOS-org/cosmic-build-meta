# System dependency aggregation for the COSMIC bootc/OCI image.
#
# Mirrors gnome-build-meta's elements/gnomeos-deps/deps.bst but pulls in
# only the components needed for a minimal COSMIC desktop on top of
# freedesktop-sdk-25.08.
#
# Everything beneath the COSMIC binaries themselves (kernel, init system,
# session services, networking, audio, container tooling, bootc tooling)
# is sourced verbatim from the freedesktop-sdk junction so we inherit
# upstream's security updates and reproducibility guarantees.
kind: stack

depends:
  # COSMIC binaries we build ourselves (compositor, shell, apps, greeter, ...)
  - cosmic/deps.bst

  # Kernel + firmware (we do NOT build our own kernel; gnome-build-meta
  # follows the same pattern -- take FDSDK's components/linux.bst directly)
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
  # NOTE: dbus-broker is not in FDSDK 25.08; we use the reference dbus
  # daemon for now. Swap to dbus-broker once FDSDK gains it (or build
  # locally).

  # Audio (paired with the existing pipewire stack on the COSMIC side)
  - freedesktop-sdk.bst:components/pipewire-daemon.bst
  - freedesktop-sdk.bst:components/wireplumber.bst

  # Networking
  - freedesktop-sdk.bst:components/networkmanager.bst

  # Portal frontend (pairs with cosmic/xdg-desktop-portal-cosmic.bst)
  - freedesktop-sdk.bst:components/xdg-desktop-portal.bst

  # Wayland-ecosystem runtime libs cosmic-comp dlopen()s. Without
  # libdisplay-info the dynamic linker fails before main() and the
  # compositor crashes immediately, taking down greetd's whole session.
  - freedesktop-sdk.bst:components/libdisplay-info.bst

  # Localization datasets cosmic-initial-setup reads at runtime.
  # Without these the language picker only shows English, the
  # keyboard picker only shows English (US), and the timezone
  # picker can't find any cities. None of these add user-facing
  # binaries -- they're pure data trees under /usr/share.
  - freedesktop-sdk.bst:components/iso-codes.bst                  # language/country names
  - freedesktop-sdk.bst:components/xorg-data-xkeyboard-config.bst # keyboard layouts (/usr/share/X11/xkb)
  - freedesktop-sdk.bst:components/tzdata.bst                     # timezone DB / city list

  # NOTE: accountsservice is not in FDSDK 25.08. cosmic-greeter can
  # operate without it (greetd reads /etc/passwd directly), but we'll
  # want to add a local accountsservice element later for richer DM
  # integration. Tracked under "missing runtime bits" in the feasibility doc.

  # composefs + ostree + container tooling.
  # bootc is vendored locally (cosmic/bootc.bst) since FDSDK 25.08
  # doesn't ship it; mirrors gnome-build-meta's gnomeos-deps/bootc.bst.
  - cosmic/bootc.bst
  - freedesktop-sdk.bst:components/composefs.bst
  - freedesktop-sdk.bst:components/ostree.bst
  - freedesktop-sdk.bst:components/podman.bst
  - freedesktop-sdk.bst:components/skopeo.bst

  # Filesystem tooling.
  # `bootc install to-disk` shells out to mkfs.<fs> for whichever
  # --filesystem the operator picks; ship the common ones plus
  # dosfstools for the FAT32 EFI System Partition. lvm2 is included
  # because composefs + LVM is a supported install layout. Without
  # these, bootc install dies with "No such file or directory" for
  # mkfs.btrfs / mkfs.vfat / etc.
  - freedesktop-sdk.bst:components/btrfs-progs.bst
  - freedesktop-sdk.bst:components/e2fsprogs.bst
  - freedesktop-sdk.bst:components/xfsprogs.bst
  - freedesktop-sdk.bst:components/dosfstools.bst
  - freedesktop-sdk.bst:components/lvm2.bst

  # Convenience userland for an interactive system (mirrors gnomeos-deps).
  # bash and coreutils live under bootstrap/ in FDSDK 25.08.
  - freedesktop-sdk.bst:bootstrap/bash.bst
  - freedesktop-sdk.bst:components/bash-completion.bst
  - freedesktop-sdk.bst:bootstrap/coreutils.bst
  - freedesktop-sdk.bst:components/less.bst
  - freedesktop-sdk.bst:components/nano.bst
  - freedesktop-sdk.bst:components/vim.bst
  - freedesktop-sdk.bst:components/openssh-systemd.bst

  # Runtime baseline
  - freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
  - freedesktop-sdk.bst:vm/mesa-default.bst
