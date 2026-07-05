# First-boot Homebrew package preinstall, mirroring the Flatpak setup in
# oci/integration/flatpak-config.bst:
#   brew-preinstall.service -- oneshot ordered after brew-setup.service,
#     runs the /usr/libexec/cosmic/brew-preinstall helper
#   brew-preinstall.path -- re-triggers the service when /etc/passwd changes
#     (fresh installs: the boot-time run predates the user account)
#   Brewfile -- package list at /usr/share/cosmic/homebrew/Brewfile
#   92-homebrew.preset -- enables service + path at image build
# Pulled by cosmic-deps/extras.bst alongside the Homebrew payload.
kind: manual

sources:
- kind: local
  path: files/oci/homebrew
  directory: homebrew
- kind: local
  path: files/oci/systemd-presets
  directory: systemd-presets

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 homebrew/brew-preinstall.service "%{install-root}/usr/lib/systemd/system/brew-preinstall.service"
  - install -Dm644 homebrew/brew-preinstall.path    "%{install-root}/usr/lib/systemd/system/brew-preinstall.path"
  - install -Dm755 homebrew/brew-preinstall         "%{install-root}/usr/libexec/cosmic/brew-preinstall"
  - install -Dm644 homebrew/Brewfile                "%{install-root}/usr/share/cosmic/homebrew/Brewfile"
  - install -Dm644 systemd-presets/92-homebrew.preset "%{install-root}/usr/lib/systemd/system-preset/92-homebrew.preset"
