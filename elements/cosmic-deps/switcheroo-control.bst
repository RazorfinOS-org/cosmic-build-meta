# switcheroo-control - hybrid GPU switching daemon (D-Bus).
# Lets apps request the discrete GPU on hybrid laptops.
#
# Recipe mirrors gnome-build-meta's elements/gnomeos-deps/switcheroo-control.bst;
# test-suite deps (python-dbusmock, umockdev) dropped and tests disabled.
kind: meson

sources:
- kind: git_repo
  url: freedesktop:hadess/switcheroo-control.git
  track: master
  ref: 3.0-0-g2adfa2dff85b9886ce0fddca6863fe9f2eaf54a0

build-depends:
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dgtk_doc=true
    -Dtests=false
