# tuna-installer image-picker override for the COSMIC ISO.
#
# tuna-installer (the Flatpak'd bootc-installer GUI) reads its image
# catalog from a system-wide override at /etc/bootc-installer/images.json
# (verified by reading bootc_installer/defaults/image.py inside the
# deployed flatpak; the path was previously documented as
# /etc/cosmic-installer which the app does NOT actually read). When the
# override exists, it replaces the bundled GResource catalog of tuna-os
# images (Aurora, Bluefin, etc.) entirely.
#
# Schema follows the bundled images.json shape:
#   {
#     "fallback_flatpaks": [],
#     "default_image": "<imgref>",
#     "images": [{"name": ..., "desc": ..., "imgref": ...}, ...]
#   }
#
# A single-image manifest causes the wizard's image-picker step to
# self-skip (image.py:VanillaDefaultImage.skip_screen returns True when
# _LEAF_COUNT == 1), so the user goes straight from welcome -> disk
# picker without seeing a one-row picker. That's the desired UX for an
# offline installer ISO that bakes exactly one image.
#
# Downstream consumers junctioning cosmic-build-meta override this
# element to ship their own picker without touching any other
# installer/* element.
kind: import

config:
  target: /etc/bootc-installer

sources:
- kind: local
  path: files/installer/images.json
  directory: ''
