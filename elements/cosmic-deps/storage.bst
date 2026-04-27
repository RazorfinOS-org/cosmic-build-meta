# Storage + container tooling for bootc/composefs deployments.
# bootc is vendored locally (cosmic-deps/bootc.bst) since FDSDK 25.08
# doesn't ship it; mirrors gnome-build-meta's gnomeos-deps/bootc.bst.
#
# `bootc install to-disk` shells out to mkfs.<fs> for whichever
# --filesystem the operator picks; ship the common ones plus
# dosfstools for the FAT32 EFI System Partition. lvm2 is included
# because composefs + LVM is a supported install layout.
kind: stack

depends:
  # composefs + ostree + container tooling
  - cosmic-deps/bootc.bst
  - freedesktop-sdk.bst:components/composefs.bst
  - freedesktop-sdk.bst:components/ostree.bst
  - freedesktop-sdk.bst:components/podman.bst
  - freedesktop-sdk.bst:components/skopeo.bst

  # Filesystem tooling
  - freedesktop-sdk.bst:components/btrfs-progs.bst
  - freedesktop-sdk.bst:components/e2fsprogs.bst
  - freedesktop-sdk.bst:components/xfsprogs.bst
  - freedesktop-sdk.bst:components/dosfstools.bst
  - freedesktop-sdk.bst:components/lvm2.bst

  # LUKS disk encryption. Required for `bootc install` with luks-backed
  # root-fs layouts and for unlocking encrypted partitions at boot. We
  # don't enable encryption by default in `just generate-bootable-image`
  # (the VM target uses plain btrfs), but downstream installers building
  # on this base image will reach for cryptsetup the moment they offer
  # disk-encryption at install time.
  - freedesktop-sdk.bst:components/cryptsetup.bst

  # Removable-media auto-mount (cosmic-files); vendored locally
  - cosmic-deps/udisks2.bst
