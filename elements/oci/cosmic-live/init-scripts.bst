# Walk the Live env stack and collect any per-element first-deploy
# scripts so prepare-image.sh can run them when the Live env's
# filesystem is composed. Mirrors oci/cosmic/init-scripts.bst.
kind: collect_initial_scripts

build-depends:
- oci/cosmic-live/stack.bst

config:
  path: /initial_scripts
