# Full-file /etc/pam.d/system-auth override (PAM has no drop-in for the
# aggregate stack): adds `auth sufficient pam_fprintd.so` above pam_unix,
# so sudo/polkit/greetd offer fingerprint with password as fallback.
# Re-sync against fdsdk's linux-pam-config/system-auth at every bump.
kind: manual

sources:
- kind: local
  path: files/oci/fprintd
  directory: fprintd

# linux-pam dep: stage after the stock system-auth so this override
# wins the compose overlap.
depends:
- freedesktop-sdk.bst:components/linux-pam.bst
- cosmic-deps/fprintd.bst

variables:
  strip-binaries: ''

public:
  bst:
    # Expected overlap with fdsdk linux-pam's stock file; ours wins.
    overlap-whitelist:
    - /etc/pam.d/system-auth

config:
  install-commands:
  - install -Dm644 fprintd/system-auth "%{install-root}/etc/pam.d/system-auth"
