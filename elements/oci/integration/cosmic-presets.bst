# systemd presets enabling cosmic-greeter as the default DM and
# masking text-mode getty on tty1. Also enables NetworkManager,
# pipewire and friends. Installed under /usr/lib/systemd/system-preset
# so `systemctl preset-all` (or systemd-firstboot) applies them.
kind: manual

sources:
- kind: local
  path: files/oci/systemd-presets

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/usr/lib/systemd/system-preset" 90-cosmic.preset
