# Top-level stack for the COSMIC bootc image: every runtime bit that
# must end up in the squashed /layer.
#
# Mirrors elements/oci/gnomeos/stack.bst from gnome-build-meta.
kind: stack

depends:
  # System + COSMIC binary aggregate
  - cosmic-deps/deps.bst

  # Branding + bootc/composefs config
  - oci/integration/os-release.bst
  - oci/integration/bootc-config.bst
  - oci/integration/cosmic-presets.bst
  - oci/integration/cosmic-greeter-config.bst
  - oci/integration/flatpak-config.bst
  - oci/integration/mime-defaults.bst
  - oci/integration/extrafs.bst

  # Kernel firmware + initramfs (kernel itself comes via cosmic-deps/deps.bst)
  - oci/initramfs.bst

public:
  bst:
    integration-commands:
    # Layout mandated by bootc / ostree
    - mkdir -p /boot
    - mkdir -p /sysroot
    - mkdir -p /sysroot/ostree
    # Relative symlink, matches gnome-build-meta
    - ln -sf sysroot/ostree ostree

    - rm --verbose --recursive --force /root || true
    # Created by 10-bootc.conf tmpfiles at runtime, but also needed for
    # the OCI image to be usable as a plain container.
    - mkdir -p /var/home
    - mkdir -p /var/roothome
    - mkdir -p /var/opt
    - mkdir -p /var/mnt

    - ln -sf /var/home /home
    - ln -sf /var/roothome /root
    - ln -sf /var/opt /opt
    - ln -sf /var/mnt /mnt

    - touch /etc/machine-id

    # Hard-mask getty@tty1 so cosmic-greeter (via greetd.service) owns
    # tty1 unconditionally. systemd-preset has no `mask` verb, so we
    # do this with a /dev/null symlink in /etc -- the canonical way.
    - mkdir -p /etc/systemd/system
    - ln -sf /dev/null /etc/systemd/system/getty@tty1.service
