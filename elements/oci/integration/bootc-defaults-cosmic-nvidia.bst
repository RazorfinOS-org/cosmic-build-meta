# NVIDIA-variant bootc install defaults. See bootc-defaults-cosmic.bst
# for rationale; only the target-imgref differs.
kind: manual

sources:
- kind: local
  path: files/oci/bootc-defaults

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 00-defaults-cosmic-nvidia.toml "%{install-root}/etc/bootc/install/00-defaults.toml"
