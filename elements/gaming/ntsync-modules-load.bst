# Load ntsync at boot: the OGC kernel builds CONFIG_NTSYNC=m and
# Wine/Proton probe /dev/ntsync directly; without this nothing loads it.
kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm644 /dev/null "%{install-root}/usr/lib/modules-load.d/ntsync.conf"
    cat > "%{install-root}/usr/lib/modules-load.d/ntsync.conf" <<'EOF'
    ntsync
    EOF
