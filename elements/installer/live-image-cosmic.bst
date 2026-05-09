# Live ISO assembly for the COSMIC variant. Consumes the squashed Live
# sysroot (oci/cosmic-live/filesystem.bst) and produces live.iso.
#
# Architecture (path 3 — minimal GNOME-OS-style):
#
#   1. Stage systemd-bootx64.efi at /efi/EFI/BOOT/BOOTX64.EFI plus a
#      systemd-boot Type-1 entry (kernel + initramfs as separate files
#      + /loader/entries/<name>.conf). FDSDK doesn't ship `ukify` so
#      proper UKI packaging is a v2 concern (Secure Boot signing).
#      Boot kargs include systemd.volatile=overlay so /usr from the
#      EROFS root is overlaid by tmpfs at /etc and /var.
#
#   2. systemd-repart assembles a GPT disk image from the staged ESP
#      tree + the squashed /sysroot EROFS partition. UEFI-bootable
#      from USB via `dd`. CD-ROM compatibility (xorriso wrap) is a
#      v1.1 concern; FDSDK 25.08's repart predates --el-torito.
#
# Output: live.iso under %{install-root}. Extract with
# `bst artifact checkout --hardlinks installer/live-image-cosmic.bst`.
#
# Shared scaffolding (toolchain build-deps + sysroot-prep commands)
# lives in include/live-image-common.yml. The cosmic-nvidia counterpart
# pulls the same include; they diverge only in source filesystem,
# iso-seed, ESP layout vars, and extra-kargs.
kind: script

(@): include/live-image-common.yml

build-depends:
  (>):
  - filename: oci/cosmic-live/filesystem.bst
    config:
      location: /sysroot
  # Bake the bootc OCI image (the install target) into the live root.
  # install-source.bst already places its artifact under
  # /usr/lib/bootc/install-source/main and gzips the layer blobs (image.bst's
  # published OCI uses `gzip: disabled`, which would bloat the EROFS by ~5G).
  # cosmonaut-installer reads its `imgref` from
  # /etc/cosmonaut-installer/images.json (oci:/usr/lib/bootc/install-source/main)
  # and skopeo-copies from the local layout -- the install path is fully offline.
  # The path is variant-agnostic so one images.json works for both Mesa and NVIDIA.
  - filename: oci/cosmic/install-source.bst
    config:
      location: /sysroot

variables:
  # Stable seed -> deterministic partition UUIDs across rebuilds.
  iso-seed: 4e8a91c2-7d5f-4ae3-b69a-2fa3c5d8e7b1
  # ESP layout: per-variant subdir under /efi so kernels don't collide
  # if both ISOs ever shared an ESP.
  efi-subdir: cosmic
  entry-name: cosmic-live
  entry-title: COSMIC Live
  entry-version: cosmic-stable
  # Variant-specific kargs appended to the boot entry. Cosmic uses Mesa
  # and needs no extra blacklist; nvidia variant overrides with nouveau
  # blacklist + nvidia-drm.modeset=1 + simpledrm blacklist.
  extra-kargs: ''

config:
  commands:
    (>):
    # Build the ESP tree from scratch. systemd-boot Type-1 entries instead
    # of UKIs (FDSDK doesn't ship ukify); same boot outcome.
    - mkdir -p /efi/EFI/BOOT /efi/%{efi-subdir} /efi/loader/entries

    # Bootloader: systemd-boot's BOOTX64.EFI from the live sysroot.
    # FDSDK ships it at /usr/lib/systemd/boot/efi/. Copy as BOOTX64.EFI
    # so UEFI firmware finds it via the spec-mandated removable path.
    - |
      cp /sysroot/usr/lib/systemd/boot/efi/systemd-bootx64.efi \
         /efi/EFI/BOOT/BOOTX64.EFI

    # Stage kernel + initramfs as plain files. systemd-boot Type-1 entries
    # reference them via /-rooted paths inside the ESP.
    - |
      KVER=$(ls /sysroot/usr/lib/modules | head -n1)
      echo "Staging kernel + initramfs for ${KVER}"
      cp "/sysroot/usr/lib/modules/${KVER}/vmlinuz" /efi/%{efi-subdir}/vmlinuz
      cp "/sysroot/usr/lib/modules/${KVER}/initramfs.img" /efi/%{efi-subdir}/initramfs.img
      ls -lh /efi/%{efi-subdir}/

    # systemd-boot loader.conf -- timeout, default to live entry.
    - |
      cat > /efi/loader/loader.conf <<EOF
      timeout 3
      default %{entry-name}
      console-mode auto
      editor yes
      EOF

    # systemd-boot Type-1 entry. Kargs:
    #   - systemd.volatile=overlay -- /usr from EROFS, /etc + /var as
    #     tmpfs overlays. Live env is writable over an immutable root.
    #   - rw -- mount root read-write at the volatile-root layer
    #     (underlying EROFS stays ro; tmpfs above is rw).
    #   - root=PARTLABEL=root-x86-64 -- repart names our root partition
    #     "root-x86-64" (canonical name for the GPT type code).
    #   - console=ttyS0,115200n8 console=tty0 -- serial + display so
    #     headless QEMU / VM testing captures kernel + systemd output.
    #   - systemd.show_status=true -- boot progress visibility for v1.
    #   - video=Virtual-1:1680x1050 -- pin the virtio-gpu connector to a
    #     fixed mode at boot. Same workaround as `generate-bootable-image`:
    #     cosmic-comp doesn't react to dynamic mode changes on an
    #     already-connected connector (smithay PR #1923, not yet picked
    #     up by cosmic-comp's pinned rev), and the kernel's default
    #     preferred mode is 640x480.
    #   - systemd.debug_shell=ttyS1 -- always-on emergency root shell on
    #     serial1 (UNIX socket via boot-iso-headless). Reachable even
    #     when greetd is failing -- run `journalctl -u greetd` etc.
    #   - %{extra-kargs} -- variant-specific (NVIDIA blacklists nouveau
    #     + simpledrm and sets nvidia-drm.modeset=1; cosmic empty).
    - |
      cat > /efi/loader/entries/%{entry-name}.conf <<EOF
      title    %{entry-title}
      version  %{entry-version}
      linux    /%{efi-subdir}/vmlinuz
      initrd   /%{efi-subdir}/initramfs.img
      options  systemd.volatile=overlay rw root=PARTLABEL=root-x86-64 console=ttyS0,115200n8 console=tty0 systemd.show_status=true video=Virtual-1:1680x1050 systemd.debug_shell=ttyS1 %{extra-kargs}
      EOF

    # systemd-repart 256+ has --el-torito for hybrid GPT+ISO9660 output;
    # FDSDK 25.08 ships an older version without it. v1 produces a
    # straight GPT disk image which is UEFI-bootable from USB via `dd`.
    # CD-ROM compatibility (xorriso wrap) is a v1.1 concern.
    - |
      systemd-repart \
        --offline=yes \
        --empty=create \
        --size=auto \
        --dry-run=no \
        --seed=%{iso-seed} \
        --definitions=definitions \
        "%{install-root}/live.iso"

    - |
      test -s "%{install-root}/live.iso" || {
        echo "FATAL: live.iso is empty after systemd-repart" >&2
        exit 1
      }
      ls -lh "%{install-root}/live.iso"
