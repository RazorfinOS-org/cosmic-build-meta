# Complete COSMIC desktop environment stack
# This is the internal build target -- use public-stacks/ for junction consumers.
# Build with: just build-all
kind: stack

depends:
  - core/public-stacks/cosmic-full.bst
