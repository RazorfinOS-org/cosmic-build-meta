# libnma - NM GTK dialogs, only for nm-connection-editor. Mirrors
# gnome-build-meta; gcr chooser/gtk4/introspection/docs off.
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/libnma.git
  track: '1.*'
  exclude:
  - '*-dev*'

  ref: 1.10.6-0-g3e324b69d0d74c8693fb58b9ee66efe0bad6cb34
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/mobile-broadband-provider-info.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/iso-codes.bst
- freedesktop-sdk.bst:components/networkmanager.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dgcr=false
    -Dlibnma_gtk4=false
    -Dgtk_doc=false
    -Dintrospection=false
    -Dvapi=false
