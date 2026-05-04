# Walk the NVIDIA Live stack and collect first-deploy scripts.
# Mirror of oci/cosmic-live/init-scripts.bst.
kind: collect_initial_scripts

build-depends:
- oci/cosmic-nvidia-live/stack.bst

config:
  path: /initial_scripts
