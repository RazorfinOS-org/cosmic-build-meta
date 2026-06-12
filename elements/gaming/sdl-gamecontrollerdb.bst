# Community SDL controller mapping database.
#
# Bazzite and the OpenGamingCollective handheld/session work both treat
# controller coverage as table-stakes: Steam Input, SDL2/SDL3 games, and
# emulators all behave better when obscure pads have a known GUID mapping.
# This installs the upstream database in SDL's conventional data path so
# native host apps can opt into it; Flatpak apps usually carry their own
# runtime copy but also benefit from the host file when they talk to Steam
# Input or helper tools outside the sandbox.
kind: manual

sources:
- kind: remote
  url: github-raw:mdqinc/SDL_GameControllerDB/master/gamecontrollerdb.txt
  ref: 3d7a1a6d3733dec4bb808d660d885d95213d3298a4ce82e534fae7e81adec784
  filename: gamecontrollerdb.txt

build-depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 gamecontrollerdb.txt "%{install-root}/usr/share/sdl/gamecontrollerdb.txt"
