# uaccess udev rules for the controller long tail beyond Valve's rules
# and InputPlumber (8BitDo, Hori, Mayflash, flight sticks, ...).
kind: meson

sources:
- kind: git_repo
  url: codeberg:fabiscafe/game-devices-udev.git
  track: '*'

  ref: 1.0-0-gaaaf684043b33a330630335a3782b02ecf87a52e
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
