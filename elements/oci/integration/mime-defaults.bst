# System-wide MIME default associations for the COSMIC bootc image.
#
# Drops /etc/xdg/mimeapps.list, which the XDG MIME spec consults when
# resolving "default app for type X". cosmic-settings' Default
# Applications panel (com.system76.CosmicSettings.DefaultApps) reads
# the same lookup, so this populates the Web browser / File manager /
# Text editor entries on first boot.
#
# Targets must resolve to a .desktop file at lookup time:
#   - org.mozilla.firefox.desktop is exported by the Flatpak preinstall
#     wired up in oci/integration/flatpak-config.bst (lands in
#     /var/lib/flatpak/exports/share/applications/, which is on
#     XDG_DATA_DIRS by default).
#   - com.system76.Cosmic{Files,Edit}.desktop are shipped in /usr/share
#     by the COSMIC core stack.
#
# Per-user ~/.config/mimeapps.list overrides this once the user changes
# defaults via Settings, so it's a soft default rather than a lockdown.
kind: manual

sources:
- kind: local
  path: files/oci/mime-defaults
  directory: mime-defaults

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 mime-defaults/mimeapps.list "%{install-root}/etc/xdg/mimeapps.list"
