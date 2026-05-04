# Live ISO assembly for the COSMIC variant. Consumes the squashed Live
# sysroot (oci/cosmic-live/filesystem.bst); the nvidia counterpart lives
# in installer/live-image-cosmic-nvidia.bst with an identical shape
# pointed at oci/cosmic-nvidia-live/filesystem.bst.
#
# Architecture (path 3 — minimal GNOME-OS-style; see plan file):
#
#   1. Build a Unified Kernel Image (UKI) with `ukify` from the live
#      sysroot's vmlinuz + initramfs + os-release + a hand-written
#      kernel cmdline. The cmdline includes systemd.volatile=overlay
#      so systemd at PID 1 lays a tmpfs over /etc and /var, mounting
#      /usr from the underlying read-only EROFS root.
#
#   2. Stage systemd-bootx64.efi at /efi/EFI/BOOT/BOOTX64.EFI and the
#      UKI at /efi/EFI/Linux/cosmic-live.efi. systemd-boot
#      automatically discovers UKIs in /EFI/Linux at boot time; no
#      hand-written loader entries needed (we drop a minimal
#      loader.conf for timeout settings).
#
#   3. systemd-repart --el-torito=yes assembles a hybrid GPT + ISO9660
#      image so the same artifact boots both via `dd` to USB and via
#      CD/DVD. The ESP CopyFiles= pulls our staged /efi tree.
#
# Output artifact contains one file: live.iso. Extracted from CAS via
# `bst artifact checkout --hardlinks installer/live-image-cosmic.bst`.
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
- filename: oci/cosmic-live/filesystem.bst
  config:
    location: /sysroot

variables:
  # Stable seed -> deterministic partition UUIDs across rebuilds.
  iso-seed: 4e8a91c2-7d5f-4ae3-b69a-2fa3c5d8e7b1
  # Volume label for the El Torito ISO9660 wrapper. systemd-repart
  # uses this as the user-facing volume name when the ISO is mounted.
  iso-volume: COSMIC

environment:
  # FDSDK build sandboxes don't ship /tmp; systemd-repart fails with
  # "Could not determine temporary directory" without one.
  TMPDIR: /var/tmp

config:
  commands:
  - mkdir -p /var/tmp /tmp
  - chmod 1777 /var/tmp /tmp

  # Apply image-time integration that oci/cosmic/image.bst runs for
  # the regular OCI variant. The live filesystem (oci/cosmic-live/
  # filesystem.bst) is a `kind: compose` and doesn't run these itself,
  # so without this block:
  #   - systemd presets are inert: greetd.service is not symlinked
  #     into graphical.target.wants/, the live env hangs at
  #     multi-user.target, no autologin happens.
  #   - sysusers is inert: cosmic-live user from
  #     files/installer/sysusers.d/cosmic-live.conf is never created,
  #     greetd's [initial_session] would fail to find the user anyway.
  #
  # Mirrors the equivalent block in oci/cosmic/image.bst (lines around
  # systemd-sysusers and systemctl preset-all).
  # FDSDK follows the OSTree convention of shipping vendor-default
  # /etc files under /usr/etc; the runtime layer is expected to merge
  # them into /etc on first boot (or at image-assembly time). The
  # bootc image does this merge in oci/cosmic/image.bst; the live env
  # never did, so /etc/shadow (FDSDK's vendor copy) only ever existed
  # at /usr/etc/shadow and was invisible to PAM at boot. Mirror the
  # bootc image's merge before running sysusers so subsequent steps
  # (and the boot itself) see a populated /etc.
  - |
    if [ -d /sysroot/usr/etc ]; then
      mkdir -p /sysroot/etc
      cp -a /sysroot/usr/etc/. /sysroot/etc/
      rm -rf /sysroot/usr/etc
    fi

  # /etc/shells: required by pkexec for the SHELL-env-var safety check
  # (polkit rejects pkexec invocations whose $SHELL isn't in this file
  # with "The value for the SHELL variable was not found in the
  # /etc/shells file"). FDSDK doesn't ship one, and tuna-installer's
  # fisherman backend launches via pkexec from cosmic-live's bash
  # shell -- without this file the install fails before fisherman ever
  # touches the disk. Mirrors the standard Debian/Arch contents.
  - |
    printf '%s\n' /bin/sh /bin/bash /usr/bin/sh /usr/bin/bash /sbin/nologin /usr/sbin/nologin \
        > /sysroot/etc/shells
    chmod 0644 /sysroot/etc/shells

  - systemd-sysusers --root /sysroot

  # systemd-sysusers writes /etc/passwd and /etc/group but does NOT
  # populate /etc/shadow when a user already exists in passwd (FDSDK's
  # platform-oci ships passwd entries for system users without matching
  # shadow rows -- sysusers's idempotency check looks at passwd only and
  # silently skips shadow). With no shadow file, PAM's pam_unix `account`
  # stack returns AUTHINFO_UNAVAIL for every user, greetd's session start
  # fails, and after StartLimitBurst systemd logs "Failed to start
  # Greeter daemon" -- the live env then sits at multi-user with no GUI.
  #
  # Fix: synthesize locked shadow/gshadow entries for every passwd/group
  # entry that doesn't already have one. `!*` is the canonical "no
  # password set / login disabled" placeholder; greetd's [initial_session]
  # uses pam_succeed_if-style autologin via login -f and doesn't need a
  # real password hash.
  - |
    # FDSDK's platform-oci ships /etc/shadow + /etc/gshadow with mode
    # 0000 (the canonical secure perm). The BST sandbox runs without
    # CAP_DAC_OVERRIDE, so root cannot open() a 0000 file for write
    # even though it owns the file -- chmod 0600 first to make it
    # appendable. (chmod itself only needs ownership, not DAC_OVERRIDE.)
    # If the file doesn't exist yet, touch creates it with default
    # mode and the chmod is a no-op refinement.
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
    # Leave at 0600 (not the canonical 0000): the systemd-repart step
    # below runs mkfs.erofs in this same BST sandbox without
    # CAP_DAC_OVERRIDE -- a 0000 file is unreadable to the build's own
    # root and gets silently dropped from the EROFS image. PAM treats
    # 0600 root:root as fine; unix_chkpwd is setuid root and reads it
    # via owner perms.
    chmod 0600 /sysroot/etc/shadow /sysroot/etc/gshadow
    chown 0:0 /sysroot/etc/shadow /sysroot/etc/gshadow

  - systemctl --root=/sysroot preset-all

  # Generate modules.dep + modules.alias for the staged kernel.
  # FDSDK ships /usr/lib/modules/<kver>/{kernel/,modules.builtin,...}
  # but skips the depmod step that produces modules.dep, modules.alias,
  # modules.symbols, modules.devname. Without those, kmod's
  # request_module()/modprobe by alias fails -- which means:
  #   - btrfs can't auto-load crc32c (mount fails with open_ctree -2)
  #   - fuse can't auto-load (xdg-document-portal hangs)
  #   - any modules-load.d entry by short name silently no-ops
  # Running depmod against the staged sysroot reads the modules' own
  # MODULE_ALIAS() / dependency strings and writes the canonical
  # mapping files. depmod is in kmod.bst which is part of FDSDK's
  # runtime-minimal stack (already a build-dep above), so no extra
  # element is needed.
  - |
    KVER=$(ls /sysroot/usr/lib/modules | head -n1)
    depmod -a -b /sysroot "$KVER"
    echo "depmod wrote $(wc -l < /sysroot/usr/lib/modules/$KVER/modules.dep) module deps"

  # Restore setuid bits on privileged binaries. BST's compose runs
  # unprivileged so chmod u+s during dependency builds is a no-op,
  # and the staged sysroot ends up with mode 0755 instead of 4755 on
  # everything that should be setuid root. The bootc image build
  # (oci/cosmic/image.bst) sidesteps this via fakecap LD_PRELOAD +
  # build-oci's tar-with-explicit-mode emission, but the live env
  # packs straight to EROFS without that round-trip -- we have to
  # restore the bits by hand.
  #
  # Symptom we hit: tuna-installer's fisherman backend invokes
  # `flatpak-spawn --host pkexec ...` and pkexec exits with
  # `pkexec must be setuid root` -- install fails before fisherman
  # ever calls bootc. Same applies to sudo, su, mount, umount, etc.
  # via different code paths (sudo without setuid means cosmic-live's
  # passwordless rule never fires either).
  #
  # The list is the canonical FDSDK setuid set; entries that don't
  # exist in /sysroot (variant differences) silently no-op via
  # `2>/dev/null || true`.
  - |
    for f in \
      /sysroot/usr/bin/pkexec \
      /sysroot/usr/bin/sudo \
      /sysroot/usr/bin/su \
      /sysroot/usr/bin/mount \
      /sysroot/usr/bin/umount \
      /sysroot/usr/bin/passwd \
      /sysroot/usr/bin/chage \
      /sysroot/usr/bin/chsh \
      /sysroot/usr/bin/chfn \
      /sysroot/usr/bin/expiry \
      /sysroot/usr/bin/gpasswd \
      /sysroot/usr/bin/newgrp \
      /sysroot/usr/bin/newuidmap \
      /sysroot/usr/bin/newgidmap \
      /sysroot/usr/libexec/dbus-daemon-launch-helper \
      /sysroot/usr/lib/polkit-1/polkit-agent-helper-1 \
      /sysroot/usr/lib/x86_64-linux-gnu/polkit-1/polkit-agent-helper-1 \
    ; do
      [ -f "$f" ] && chmod 4755 "$f" 2>/dev/null || true
    done

  # FDSDK's greetd.service [Install] section only declares
  # `Alias=display-manager.service`, no `WantedBy=graphical.target`.
  # systemctl preset-all therefore enables the alias but never wires
  # greetd into graphical.target.wants/, so on boot the system
  # progresses to graphical.target without a display manager and
  # falls through to a serial getty. Pin the wants symlink manually.
  - mkdir -p /sysroot/etc/systemd/system/graphical.target.wants
  - ln -sf ../display-manager.service /sysroot/etc/systemd/system/graphical.target.wants/display-manager.service

  # Stage the repart definitions into a writable dir (repart can't
  # write back to its --definitions= when it's read-only in /usr/lib).
  - mkdir -p definitions
  - cp /usr/lib/repart.iso.d/*.conf definitions/

  # Build the ESP tree from scratch. FDSDK doesn't ship `ukify`, so
  # we use systemd-boot Type-1 boot entries (kernel + initramfs as
  # separate files + a /loader/entries/<name>.conf) instead of UKIs.
  # Same boot outcome; UKI packaging is a v2 concern when we want
  # Secure Boot signing.
  - mkdir -p /efi/EFI/BOOT /efi/cosmic /efi/loader/entries

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
    cp "/sysroot/usr/lib/modules/${KVER}/vmlinuz" /efi/cosmic/vmlinuz
    cp "/sysroot/usr/lib/modules/${KVER}/initramfs.img" /efi/cosmic/initramfs.img
    ls -lh /efi/cosmic/

  # systemd-boot loader.conf -- timeout, default to live entry.
  - |
    cat > /efi/loader/loader.conf <<EOF
    timeout 3
    default cosmic-live
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
  - |
    cat > /efi/loader/entries/cosmic-live.conf <<EOF
    title    COSMIC Live
    version  cosmic-stable
    linux    /cosmic/vmlinuz
    initrd   /cosmic/initramfs.img
    options  systemd.volatile=overlay rw root=PARTLABEL=root-x86-64 console=ttyS0,115200n8 console=tty0 systemd.show_status=true video=Virtual-1:1680x1050 systemd.debug_shell=ttyS1
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
