# brlaser - CUPS driver for mono Brother lasers, the big driverless-IPP
# holdout family. Owl-Maintain is the maintained fork (Arch/Fedora use it).
kind: cmake

sources:
- kind: git_repo
  url: github:Owl-Maintain/brlaser.git
  track: 'v*'

  ref: v6.2.8-0-g9bfea996dcffb694b608d4f00224344af9091083
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
# components/cups.bst (filter over cups-base) carries the cups-libs
# split: cups-config, cups/*.h (incl. cups/raster.h), libcups +
# libcupsimage -- everything CMake's cups-config probing needs.
- freedesktop-sdk.bst:components/cups.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/cups.bst
