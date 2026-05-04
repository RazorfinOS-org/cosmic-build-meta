# Live env stack for the COSMIC NVIDIA ISO. See oci/cosmic-live/stack.bst
# for rationale; this variant just swaps the base stack from cosmic to
# cosmic-nvidia so the Live env displays correctly on NVIDIA hardware
# (modules + userspace baked in via cosmic-deps-nvidia).
kind: stack

depends:
  - oci/cosmic-nvidia/stack.bst
  - installer/live-extras.bst
  - installer/tuna-installer.bst
  - installer/installer-prebake.bst
  - installer/cosmic-images-json.bst
