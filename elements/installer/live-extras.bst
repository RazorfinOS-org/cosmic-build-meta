# Live env behaviour bits: sysuser, autologin, polkit allow rule for
# cosmonaut-installer, presets to flip everything on.
#
# Consumed by oci/cosmic-live/stack.bst and oci/cosmic-nvidia-live/stack.bst.
# Not consumed by the regular oci/cosmic*/stack.bst -- the cosmic-live
# user, polkit live-only rule, and tmpfs mount unit exist only in the
# Live ISO's filesystem.
#
# Designed to be the only COSMIC-specific Live extras element so
# downstream consumers can replace just this single element to swap in
# their own brand (different live username, different installer
# configuration, etc.) without touching the toolkit (live-image.bst,
# repart-config-iso.bst, cosmonaut-installer.bst).
kind: manual

sources:
- kind: local
  path: files/installer/sysusers.d
  directory: sysusers.d
- kind: local
  path: files/installer/systemd-presets
  directory: systemd-presets
- kind: local
  path: files/installer/greetd
  directory: greetd
- kind: local
  path: files/installer/tmpfiles
  directory: tmpfiles
- kind: local
  path: files/installer/polkit
  directory: polkit
- kind: local
  path: files/installer/modules-load.d
  directory: modules-load.d
- kind: local
  path: files/installer/systemd-mounts
  directory: systemd-mounts
- kind: local
  path: files/installer/networkd
  directory: networkd

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  # Live user account.
  - install -Dm644 sysusers.d/cosmic-live.conf "%{install-root}/usr/lib/sysusers.d/cosmic-live.conf"
  # Greetd autologin override. Stage to a non-conflicting path: shipping
  # straight to /etc/greetd/config.toml collides with cosmic-greeter-config.bst
  # which writes the base (cosmic-greeter / cosmic-initial-setup) config to
  # the same path. BST 2.x's compose plugin does not give us last-writer-wins
  # against that overlap -- the base config wins, the Live env then runs the
  # base default_session (cosmic-greeter on the base-config VT) instead of
  # the live cosmic-live autologin, greetd hits StartLimitBurst, systemd logs
  # "Failed to start Greeter daemon" and the boot lands at a black screen.
  #
  # Fix: stash the live config under /usr/share/cosmic-live/ (no overlap),
  # then copy it over /etc/greetd/config.toml via public.bst.integration-commands
  # below. integration-commands run AFTER all dependency artifacts are staged
  # in the compose sandbox, so this guarantees the live config wins regardless
  # of staging order.
  - install -Dm644 greetd/config.toml "%{install-root}/usr/share/cosmic-live/greetd-config.toml"
  - install -Dm755 greetd/cosmic-live-session-wrapper "%{install-root}/usr/local/bin/cosmic-live-session-wrapper"
  # tmpfiles.d entry creates /home/cosmic-live at boot (otherwise
  # user@<UID>.service fails for the autologin user and greetd hits its
  # restart limit -- "Failed to start Greeter daemon" with no GUI). Also
  # pre-populates outputs.ron from /usr/share/cosmic-vm-defaults so
  # cosmic-comp boots at 1680x1050 in QEMU instead of 640x480.
  - install -Dm644 tmpfiles/cosmic-live.conf "%{install-root}/usr/lib/tmpfiles.d/cosmic-live.conf"
  # Polkit rule: passwordless dev.cosmonaut.installer.{install,network}
  # for cosmic-live so the cosmonaut-installer DBus daemon can run the
  # install pipeline without prompting for a password the live user
  # doesn't have.
  - install -Dm644 polkit/49-cosmonaut-installer-live.rules "%{install-root}/usr/share/polkit-1/rules.d/49-cosmonaut-installer-live.rules"
  # Force-load filesystem crypto modules (crc32c) at boot so btrfs can
  # mount the install target -- FDSDK kernel ships an empty modules.alias
  # so request_module()-style auto-load fails. See file header for
  # rationale + v1.1 cleanup path (depmod in build).
  - install -Dm644 modules-load.d/cosmic-live-fs.conf "%{install-root}/usr/lib/modules-load.d/cosmic-live-fs.conf"
  # Dedicated 16G tmpfs mount unit for /var/lib/containers (podman's
  # storage during install). See unit comments for full rationale --
  # symlink/bind would break bootc's --experimental-unified-storage
  # path comparison.
  - install -Dm644 systemd-mounts/var-lib-containers.mount "%{install-root}/usr/lib/systemd/system/var-lib-containers.mount"
  # Enable the mount unit so systemd activates it at boot.
  - mkdir -p "%{install-root}/usr/lib/systemd/system/local-fs.target.wants"
  - ln -sf ../var-lib-containers.mount "%{install-root}/usr/lib/systemd/system/local-fs.target.wants/var-lib-containers.mount"

  # systemd-networkd .network file for any wired interface. Without
  # this, ens3/ethN stays `unmanaged` because the FDSDK NetworkManager
  # service fails to load (D-Bus bus-name conflict with
  # NetworkManager-initrd.service) and networkd has no matcher for
  # wired links. See the file header for the full rationale.
  - install -Dm644 networkd/10-cosmic-live-wired.network "%{install-root}/usr/lib/systemd/network/10-cosmic-live-wired.network"
  # Live-env preset toggles. Only the flatpak-preinstall.service disable
  # remains here; the bundle-install service is gone with tuna-installer.
  - install -Dm644 systemd-presets/92-cosmic-live.preset "%{install-root}/usr/lib/systemd/system-preset/92-cosmic-live.preset"

public:
  bst:
    # Final overlay of the Live greetd config onto the base path. Runs
    # after every dep artifact (including cosmic-greeter-config.bst's
    # /etc/greetd/config.toml) has been staged into the compose sandbox,
    # so the Live variant wins by construction. See the install-command
    # comment above for the full rationale.
    integration-commands:
    - install -Dm644 /usr/share/cosmic-live/greetd-config.toml /etc/greetd/config.toml
