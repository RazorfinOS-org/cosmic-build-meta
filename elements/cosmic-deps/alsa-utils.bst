# alsa-utils, mixer-state machinery only (alsactl, restore units, init
# DB): fdsdk ships alsa-lib alone, so mixer state never survives reboot
# ("boots with broken sound", dakota#1027).
kind: autotools

sources:
- kind: tar
  # Lockstep pin: must match the junction's alsa-lib version; bump
  # only together with an fdsdk alsa-lib bump.
  url: alsa-project:utils/alsa-utils-1.2.14.tar.bz2

  ref: 0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/alsa-lib.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/alsa-lib.bst

variables:
  conf-local: >-
    --with-systemdsystemunitdir=%{prefix}/lib/systemd/system
    --with-udev-rules-dir=%{prefix}/lib/udev/rules.d
    --disable-alsamixer
    --disable-bat
    --disable-alsaloop
    --disable-alsaconf
    --disable-nhlt
    --disable-xmlto
    --disable-rst2man

config:
  install-commands:
  - '%{make-install}'
  # Keep only alsactl; the units are enabled by make install's static
  # sound.target.wants symlinks (no [Install] section, presets can't).
  - find "%{install-root}%{bindir}" -mindepth 1 ! -name alsactl -delete
  - rm -rf "%{install-root}%{mandir}"
  - rm -rf "%{install-root}%{datadir}/locale"
  - rm -rf "%{install-root}%{datadir}/sounds/alsa"
  - rm -rf "%{install-root}%{libdir}/alsa-topology"
