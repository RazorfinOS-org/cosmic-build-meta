# bootc install-config drop-in for the COSMIC bootc image.
#
# Lands at /usr/lib/bootc/install/cosmic-kargs.toml. `bootc install
# to-{disk,filesystem}` reads every *.toml under that directory at
# install time, merges them in lexical order, and applies the result
# to the deployment it writes (kargs end up in the BLS boot entries).
#
# Currently sets one karg (video=Virtual-1:1680x1050) so QEMU
# installs land at a resolution where cosmic-initial-setup's
# create-account page renders without clipping. See the toml file's
# header for the full rationale.
#
# Schema source: bootc/docs/src/man/bootc-install-config.5.md
#   https://bootc.dev/bootc/man/bootc-install-config.5.html
kind: manual

sources:
- kind: local
  path: files/oci/install-config
  directory: install-config

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 install-config/cosmic-kargs.toml "%{install-root}/usr/lib/bootc/install/cosmic-kargs.toml"
