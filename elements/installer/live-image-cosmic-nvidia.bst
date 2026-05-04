# NVIDIA-variant Live ISO. Same shape and architecture as
# live-image-cosmic.bst -- see that file for full rationale on the
# UKI + systemd-volatile-root + el-torito approach.
#
# Differences vs cosmic variant:
#   - Source filesystem: oci/cosmic-nvidia-live (NVIDIA modules + userspace)
#   - Distinct iso-seed (no UUID overlap if both are deployed)
#   - iso-volume label different so dual-USB-stick scenarios are
#     distinguishable
kind: script

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/jq.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/dosfstools.bst
- freedesktop-sdk.bst:components/mtools.bst
- freedesktop-sdk.bst:components/util-linux.bst
- freedesktop-sdk.bst:components/erofs-utils.bst
- installer/repart-config-iso.bst
- filename: oci/cosmic-nvidia-live/filesystem.bst
  config:
    location: /sysroot

variables:
  iso-seed: 6b3e8a51-9c2d-4e7f-a0b8-d4f5c3e9a1b2
  iso-volume: COSMIC_NVIDIA

environment:
  TMPDIR: /var/tmp

config:
  commands:
  - mkdir -p /var/tmp /tmp
  - chmod 1777 /var/tmp /tmp

  # Image-time integration the cosmic-live composed filesystem doesn't
  # run on its own. See live-image-cosmic.bst for full rationale --
  # without these greetd doesn't autostart and cosmic-live user doesn't
  # exist.
  # Mirror the bootc image's /usr/etc -> /etc merge (OSTree convention).
  # See live-image-cosmic.bst for rationale.
  - |
    if [ -d /sysroot/usr/etc ]; then
      mkdir -p /sysroot/etc
      cp -a /sysroot/usr/etc/. /sysroot/etc/
      rm -rf /sysroot/usr/etc
    fi

  - systemd-sysusers --root /sysroot

  # See live-image-cosmic.bst for full rationale -- systemd-sysusers
  # leaves /etc/shadow empty when users already exist in passwd, and
  # PAM's pam_unix account stack then rejects every login with
  # AUTHINFO_UNAVAIL ("Failed to start Greeter daemon"). Synthesize
  # locked shadow rows from passwd + group.
  - |
    # See live-image-cosmic.bst for full rationale -- chmod 0600 first
    # so root in the BST sandbox (no CAP_DAC_OVERRIDE) can open the
    # mode-0000 file for write, then chmod 0 at the end.
    touch /sysroot/etc/shadow /sysroot/etc/gshadow
    chmod 0600 /sysroot/etc/shadow /sysroot/etc/gshadow
    while IFS=: read -r u _; do
      grep -q "^${u}:" /sysroot/etc/shadow || \
        printf '%s:!*:19000:0:99999:7:::\n' "$u" >> /sysroot/etc/shadow
    done < /sysroot/etc/passwd
    while IFS=: read -r g _ _ members; do
      grep -q "^${g}:" /sysroot/etc/gshadow || \
        printf '%s:!::%s\n' "$g" "$members" >> /sysroot/etc/gshadow
    done < /sysroot/etc/group
    # See live-image-cosmic.bst -- 0600 not 0000, otherwise mkfs.erofs
    # in the same DAC_OVERRIDE-less sandbox can't read the file.
    chmod 0600 /sysroot/etc/shadow /sysroot/etc/gshadow
    chown 0:0 /sysroot/etc/shadow /sysroot/etc/gshadow

  - systemctl --root=/sysroot preset-all
  - mkdir -p /sysroot/etc/systemd/system/graphical.target.wants
  - ln -sf ../display-manager.service /sysroot/etc/systemd/system/graphical.target.wants/display-manager.service

  - mkdir -p definitions
  - cp /usr/lib/repart.iso.d/*.conf definitions/

  - mkdir -p /efi/EFI/BOOT /efi/cosmic-nvidia /efi/loader/entries

  - |
    cp /sysroot/usr/lib/systemd/boot/efi/systemd-bootx64.efi \
       /efi/EFI/BOOT/BOOTX64.EFI

  - |
    KVER=$(ls /sysroot/usr/lib/modules | head -n1)
    echo "Staging kernel + initramfs for ${KVER}"
    cp "/sysroot/usr/lib/modules/${KVER}/vmlinuz" /efi/cosmic-nvidia/vmlinuz
    cp "/sysroot/usr/lib/modules/${KVER}/initramfs.img" /efi/cosmic-nvidia/initramfs.img

  - |
    cat > /efi/loader/loader.conf <<EOF
    timeout 3
    default cosmic-nvidia-live
    console-mode auto
    editor yes
    EOF

  - |
    cat > /efi/loader/entries/cosmic-nvidia-live.conf <<EOF
    title    COSMIC NVIDIA Live
    version  cosmic-nvidia-stable
    linux    /cosmic-nvidia/vmlinuz
    initrd   /cosmic-nvidia/initramfs.img
    options  systemd.volatile=overlay rw root=PARTLABEL=root-x86-64 console=ttyS0,115200n8 console=tty0 systemd.show_status=true video=Virtual-1:1680x1050 systemd.debug_shell=ttyS1 rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init
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
