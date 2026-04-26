# Walk the COSMIC stack and collect any per-element first-deploy
# scripts (sticky bits on /tmp, /root permissions, etc.) so
# prepare-image.sh can run them against /layer at image-assembly time.
kind: collect_initial_scripts

build-depends:
- oci/cosmic/stack.bst

config:
  path: /initial_scripts
