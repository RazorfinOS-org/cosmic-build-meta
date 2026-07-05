# First-boot Homebrew package preinstall.
#
# cosmic-deps/brew.bst + brew-tarball.bst ship Homebrew itself (the ublue-os
# first-boot extract + update/upgrade timers). This element adds an OPT-IN
# package preinstall on top, mirroring our Flatpak story
# (oci/integration/flatpak-config.bst):
#   - brew-preinstall.service: a oneshot ordered After=brew-setup.service that
#     runs `brew bundle install` against the system Brewfile as the primary
#     user once network is up. Idempotent (brew bundle skips installed).
#   - Brewfile: the vendor package list at /usr/share/cosmic/homebrew/ -- the
#     customization point. Ships a small lightweight default set.
#   - 92-homebrew.preset: enables the service so systemd preset-all (run at
#     image build by oci/integration/cosmic-presets.bst) flips it on.
#
# Pulled by cosmic-deps/extras.bst alongside the Homebrew payload, so it only
# ships where brew does. Upstream ublue-os/brew has no equivalent (Bluefin
# ships Brewfiles under /usr/share/ublue-os/homebrew/ but doesn't auto-run
# them); this is our addition.
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
  - install -Dm755 homebrew/brew-preinstall         "%{install-root}/usr/libexec/cosmic/brew-preinstall"
  - install -Dm644 homebrew/Brewfile                "%{install-root}/usr/share/cosmic/homebrew/Brewfile"
  - install -Dm644 systemd-presets/92-homebrew.preset "%{install-root}/usr/lib/systemd/system-preset/92-homebrew.preset"
