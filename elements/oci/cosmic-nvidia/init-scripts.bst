# Walk the COSMIC + NVIDIA stack and collect any per-element
# first-deploy scripts so prepare-image.sh can run them against
# /layer at image-assembly time.
kind: collect_initial_scripts

build-depends:
- oci/cosmic-nvidia/stack.bst

config:
  path: /initial_scripts
