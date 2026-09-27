# Carrier APN database; libnma needs it at build and run time.
# Mirrors gnome-build-meta.
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/mobile-broadband-provider-info.git
  track: '2*'

  ref: 20251101-0-g18cb97517d9c831e1d2ec057e62d04fd3665e10f
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/grep.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
