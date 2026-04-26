# Components needed inside the initramfs sandbox: storage, crypto,
# audio (for early plymouth chimes is not needed -- skipped), TPM,
# composefs/bootc tooling so the initrd can pivot into a bootc root.
kind: stack

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/cpio.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/fuse3.bst
- freedesktop-sdk.bst:components/linux-firmware.bst
- freedesktop-sdk.bst:components/shadow.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/tpm2-tss.bst
- freedesktop-sdk.bst:components/tpm2-tools.bst
- freedesktop-sdk.bst:components/tzdata.bst
- freedesktop-sdk.bst:components/util-linux.bst
- freedesktop-sdk.bst:components/lvm2.bst
# Decompressor libs that libsystemd-shared / libarchive dlopen() at
# runtime. Staging them here means systemd-journald, udev, etc. can
# transparently read .bz2 / .xz / .gz / .zst payloads from the
# initramfs without falling back.
- freedesktop-sdk.bst:components/bzip2.bst
- freedesktop-sdk.bst:components/xz.bst
- freedesktop-sdk.bst:components/zlib.bst
- freedesktop-sdk.bst:components/zstd.bst
- freedesktop-sdk.bst:components/composefs.bst
- freedesktop-sdk.bst:components/ostree.bst
- cosmic/bootc.bst
- oci/integration/os-release.bst
