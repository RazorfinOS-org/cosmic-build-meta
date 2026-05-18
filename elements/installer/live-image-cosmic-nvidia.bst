# NVIDIA-variant Live ISO. Same shape as live-image-cosmic.bst -- both
# pull include/live-image-common.yml for the toolchain build-deps and
# sysroot-prep commands; this file just sets variant-specific variables
# and appends the ESP/loader/repart commands tailored to NVIDIA kargs.
#
# Differences vs cosmic variant:
#   - Source filesystem: oci/cosmic-nvidia-live (NVIDIA modules + userspace)
#   - Source install-source: oci/cosmic-nvidia (NVIDIA bootc install target)
#   - Distinct iso-seed (no UUID overlap if both are deployed)
#   - efi-subdir / entry-name / entry-title / entry-version branded
#   - extra-kargs: nouveau blacklist + nvidia-drm.modeset=1 +
#     nvidia-drm.fbdev=1 + simpledrm blacklist
kind: script

(@): include/live-image-common.yml

build-depends:
  (>):
  - filename: oci/cosmic-nvidia-live/filesystem.bst
    config:
      location: /sysroot
  - filename: oci/cosmic-nvidia/install-source.bst
    config:
      location: /sysroot

variables:
  iso-seed: 6b3e8a51-9c2d-4e7f-a0b8-d4f5c3e9a1b2
  efi-subdir: cosmic-nvidia
  entry-name: cosmic-nvidia-live
  entry-title: COSMIC NVIDIA Live
  entry-version: cosmic-nvidia-stable
  extra-kargs: 'rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1 initcall_blacklist=simpledrm_platform_driver_init'

config:
  commands:
    (>):
    - mkdir -p /efi/EFI/BOOT /efi/%{efi-subdir} /efi/loader/entries

    - |
      cp /sysroot/usr/lib/systemd/boot/efi/systemd-bootx64.efi \
         /efi/EFI/BOOT/BOOTX64.EFI

    - |
      KVER=$(ls /sysroot/usr/lib/modules | head -n1)
      echo "Staging kernel + initramfs for ${KVER}"
      cp "/sysroot/usr/lib/modules/${KVER}/vmlinuz" /efi/%{efi-subdir}/vmlinuz
      cp "/sysroot/usr/lib/modules/${KVER}/initramfs.img" /efi/%{efi-subdir}/initramfs.img
      ls -lh /efi/%{efi-subdir}/

    - |
      cat > /efi/loader/loader.conf <<EOF
      timeout 3
      default %{entry-name}
      console-mode auto
      editor yes
      EOF

    - |
      cat > /efi/loader/entries/%{entry-name}.conf <<EOF
      title    %{entry-title}
      version  %{entry-version}
      linux    /%{efi-subdir}/vmlinuz
      initrd   /%{efi-subdir}/initramfs.img
      options  systemd.volatile=overlay rw root=PARTLABEL=root-x86-64 console=ttyS0,115200n8 console=tty0 systemd.show_status=true video=Virtual-1:1680x1050 systemd.debug_shell=ttyS1 %{extra-kargs}
      EOF

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
