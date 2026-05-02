# wireless-regdb - wireless regulatory domain database.
# Pure data: regulatory.db + signature loaded by cfg80211 to enforce
# country-specific 2.4/5 GHz channel rules. Without it, wifi often gets
# stuck on lower-power defaults.
#
# Not in FDSDK 25.08 -- vendored locally. Just a Makefile that copies
# the pre-built DB into /usr/lib/firmware.
kind: manual

build-depends:
- freedesktop-sdk.bst:components/make.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: kernel:pub/scm/linux/kernel/git/sforshee/wireless-regdb.git
  track: "master-*"

  ref: master-2023-09-01-0-g991b1ef696b7a034a5bf001cf31ab7735888c6e1
config:
  build-commands: []
  install-commands:
  - |
    install -Dm644 regulatory.db        "%{install-root}/usr/lib/firmware/regulatory.db"
    install -Dm644 regulatory.db.p7s    "%{install-root}/usr/lib/firmware/regulatory.db.p7s"
