# Diagnostics + man pages: tools users expect for hardware debugging.
kind: stack

depends:
  - freedesktop-sdk.bst:components/man-db.bst
  - freedesktop-sdk.bst:components/usbutils.bst

  # Hardware enumeration: lspci / setpci / pci.ids database. Every
  # "what GPU does this machine have" answer starts here.
  - freedesktop-sdk.bst:components/pciutils.bst

  # Kernel performance counter tooling: `perf top`, `perf record`,
  # `perf stat`. Modest size; the alternative is asking users to layer
  # it themselves the first time they hit a perf question.
  - freedesktop-sdk.bst:components/perf.bst

  # ACPI table dump + decompile (acpidump, iasl). Niche but the only
  # tool for diagnosing firmware/ACPI suspend-wake bugs and laptop
  # quirks; standard ask from hardware-enablement triage.
  - freedesktop-sdk.bst:components/acpica-tools.bst

  # v4l2-ctl + media-ctl + qvidcap. Webcam diagnostics ("which device
  # nodes does my camera expose, what formats?"); also pulled in by
  # OBS, ffmpeg's v4l2 input, and pipewire's libcamera path. Tiny.
  - freedesktop-sdk.bst:components/v4l-utils.bst
