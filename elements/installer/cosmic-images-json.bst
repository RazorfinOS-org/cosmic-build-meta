# cosmonaut-installer image-picker catalog.
#
# cosmonaut-installer reads its image catalog from
# /etc/cosmonaut-installer/images.json (the path lives in
# crates/cosmonaut-installer/src/images_json.rs in the cosmonaut repo;
# also falls back to /etc/bootc-installer/images.json for compat with
# pre-cosmonaut ISOs in dev). When this file exists it replaces the
# (currently nonexistent) bundled default catalog.
#
# Schema (nested tree consumed by the GUI; preserved from the
# tuna-installer era so downstream junctions keep working without
# editing both files):
#
#   {
#     "fallback_flatpaks": [],
#     "default_image": "<imgref>",
#     "images": [{
#       "name": ...,
#       "desc": ...,
#       "children": [...] | "imgref": "<imgref>"
#     }, ...]
#   }
#
# A single-leaf manifest causes the wizard's image-picker step to
# self-skip (App's next_page() routes welcome -> disk directly when
# images.len() <= 1), so the user goes straight from welcome to disk
# picker without seeing a one-row picker. That's the desired UX for
# an offline installer ISO that bakes exactly one image.
#
# Downstream consumers junctioning cosmic-build-meta override this
# element to ship their own picker without touching any other
# installer/* element.
kind: import

config:
  target: /etc/cosmonaut-installer

sources:
- kind: local
  path: files/installer/images.json
  directory: ''
