# Provide the canonical first-deploy script that fixes up filesystem
# permissions BuildStream cannot encode in artifacts (sticky bits on
# /tmp and /var/tmp, mode 700 on /root) and ensures the standard
# top-level mount points exist.
#
# Mirrors elements/oci/integration/extrafs.bst from gnome-build-meta.
# Required because compose-stripped artifacts lose ownership/mode.
kind: script

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  commands:
  - |
    mkdir -p "%{install-root}/tmp"
    mkdir -p "%{install-root}/var/tmp"
    mkdir -p "%{install-root}/sys"
    mkdir -p "%{install-root}/dev"
    mkdir -p "%{install-root}/proc"
    mkdir -p "%{install-root}/etc"
    mkdir -p "%{install-root}/root"

public:
  initial-script:
    script: |
      #!/bin/sh
      sysroot="${1}"
      chmod 1777 ${sysroot}/tmp
      chmod 1777 ${sysroot}/var/tmp
      # On bootc/composefs images /root is typically a symlink to
      # /var/roothome, which doesn't exist at image-build time. Only
      # chmod when /root is a real directory; otherwise the symlink
      # target gets the right mode at first boot.
      if [ -d "${sysroot}/root" ] && [ ! -L "${sysroot}/root" ]; then
        chmod 700 "${sysroot}/root"
      fi
