# Live env stack for the COSMIC ISO.
#
# Composition: the full default cosmic image stack, plus the Live env
# extras (cosmic-live user, autologin, polkit allow rule for the
# cosmonaut-installer DBus actions, etc.) and cosmonaut-installer
# itself (libcosmic GUI + DBus daemon + headless CLI driver).
#
# This stack feeds into oci/cosmic-live/filesystem.bst -> the Live env
# squashfs that goes into the ISO. It does NOT publish to GHCR -- the
# Live env is an installer-build dependency, not a redistributable
# bootc target.
kind: stack

depends:
  # Everything from the default image (cosmic-deps, integration, kernel
  # firmware, branding, presets).
  - oci/cosmic/stack.bst

  # Live env behaviour: cosmic-live user, autologin override, autostart
  # of the cosmonaut-installer GUI, polkit allow rule for the
  # cosmonaut-installer DBus actions.
  - installer/live-extras.bst

  # Native libcosmic install GUI + privileged DBus daemon + CLI driver.
  # Ships only on the live ISO via this dependency edge; the deployed
  # installed system doesn't pull it in.
  - installer/cosmonaut-installer.bst

  # cosmonaut-installer's image picker reads /etc/cosmonaut-installer/
  # images.json (single-image catalog -> picker auto-skips so the user
  # goes welcome -> disk picker without seeing a one-row picker).
  - installer/cosmic-images-json.bst
