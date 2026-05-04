# Ship /etc/bootc/install/00-defaults.toml pinning bootc upgrade /
# install target to the variant-specific :cosmic-stable tag.
#
# Consumed only by oci/cosmic/stack.bst -- the nvidia variant uses
# bootc-defaults-cosmic-nvidia.bst with a different target ref.
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
  # Both bootc and ostree look in /etc/bootc/install/. The 00- prefix
  # ensures we sort first if downstream stacks add other defaults.
  - install -Dm644 00-defaults-cosmic.toml "%{install-root}/etc/bootc/install/00-defaults.toml"
