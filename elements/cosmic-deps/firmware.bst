# Firmware + boot UX: sof-firmware (modern audio HW), fwupd (LVFS
# firmware updates), plymouth (boot splash), wireless-regdb (regulatory
# domain data so cfg80211 doesn't pin wifi at lowest-power defaults).
# Note: kernel/linux-firmware live in cosmic-deps/base.bst.
kind: stack

depends:
  - freedesktop-sdk.bst:components/sof-firmware.bst
  - freedesktop-sdk.bst:components/fwupd.bst
  - freedesktop-sdk.bst:components/plymouth.bst

  # TPM 2.0 userspace.
  #   tpm2-tools  -- tpm2_* CLI for measured-boot diagnostics, sealing
  #                  secrets to PCRs, and the building blocks systemd-
  #                  cryptsetup uses for unattended LUKS unlock.
  #   tpm2-pkcs11 -- PKCS#11 token backed by the TPM. Lets gpg-agent,
  #                  ssh-agent and browsers store private keys in the
  #                  chip instead of on disk -- "Yubikey-but-built-in".
  - freedesktop-sdk.bst:components/tpm2-tools.bst
  - freedesktop-sdk.bst:components/tpm2-pkcs11.bst

  # Locally-vendored (not in FDSDK 25.08)
  - cosmic-deps/wireless-regdb.bst
