# speech-dispatcher - TTS server between orca (python bindings) and
# espeak-ng; audio via libpulse -> pipewire-pulse. Mirrors gnome-build-meta.
kind: autotools

sources:
- kind: git_repo
  url: github:brailcom/speechd.git
  track: '*.*.*'
  ref: 0.12.1-0-g6781ff1709eca1c3d7f748e5361a6aa157dd5f18

build-depends:
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/texinfo.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- cosmic-deps/dotconf.bst
- cosmic-deps/espeak-ng.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libpulse.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/sndfile.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --with-espeak-ng
    --with-pulse
    --with-oss=no
    --enable-python
