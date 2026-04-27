# Complete COSMIC desktop environment
# Includes the full session and all applications.
# This is the top-level target for downstream projects that want
# the complete COSMIC experience.
kind: stack

depends:
  - core/public-stacks/cosmic-session.bst
  - core/public-stacks/cosmic-apps.bst
