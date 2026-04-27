# Firmware + boot UX: sof-firmware (modern audio HW), fwupd (LVFS
# firmware updates), plymouth (boot splash), wireless-regdb (regulatory
# domain data so cfg80211 doesn't pin wifi at lowest-power defaults).
# Note: kernel/linux-firmware live in cosmic-deps/base.bst.
kind: stack

depends:
  - freedesktop-sdk.bst:components/sof-firmware.bst
  - freedesktop-sdk.bst:components/fwupd.bst
  - freedesktop-sdk.bst:components/plymouth.bst

  # Locally-vendored (not in FDSDK 25.08)
  - cosmic-deps/wireless-regdb.bst
