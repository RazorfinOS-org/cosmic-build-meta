# systemd-repart partition definitions for the Live ISO.
#
# Mirrors gnome-build-meta/elements/gnomeos/repart-config-iso.bst:
# stage repart.d/*.conf into /usr/lib/repart.iso.d/ where the
# live-image build-script copies them out for systemd-repart --offline.
#
# Layout (see files/installer/repart.iso.d/*.conf):
#   10-esp.conf   FAT32 EFI System Partition (systemd-boot, kernel, initramfs)
#   20-root.conf  EROFS root holding the Live env squashfs
kind: import

config:
  target: /usr/lib/repart.iso.d

sources:
- kind: local
  path: files/installer/repart.iso.d
