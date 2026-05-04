# Flatpak 1.17.6 -- vendored override of freedesktop-sdk.bst:components/flatpak.bst.
#
# Why this exists
# ---------------
# We want `flatpak preinstall` plus the /usr/share/flatpak/preinstall.d/
# *.preinstall declarative drop-ins for OS-vendor app preinstall (see
# oci/integration/flatpak-config.bst). That subcommand was added in
# upstream commit d10e1148 ("Add initial support for preinstalling
# flatpaks") and first shipped in 1.17.0. fdsdk pins 1.16.3 with
# `track: 1.1[02468]*` (even minors only, i.e. stable), so it won't
# pick up 1.17.x. Until 1.18 ships in fdsdk we override here.
#
# This is otherwise a verbatim copy of freedesktop-sdk's component
# (build-/runtime-deps, meson options) -- just with the source pinned
# at 1.17.6 instead of including elements/include/flatpak.yml. When
# fdsdk advances to 1.18+, delete this file and revert
# cosmic-deps/sandboxing.bst + core/cosmic-store.bst back to
# freedesktop-sdk.bst:components/flatpak.bst.
kind: meson

sources:
- kind: git_repo
  url: github:flatpak/flatpak.git
  track: 1.17.*
  ref: 1.17.6-0-g9b21874f1a175a9b7c79175a221fa043e202ca73

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/gettext.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/python3-pyparsing.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:components/xmlto.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/bubblewrap.bst
- freedesktop-sdk.bst:components/gpgme.bst
- freedesktop-sdk.bst:components/libarchive.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/xorg-lib-xau.bst
- freedesktop-sdk.bst:components/ostree.bst
- freedesktop-sdk.bst:components/fuse3.bst
- freedesktop-sdk.bst:components/json-glib.bst
# appstream-minimal (not appstream) so /usr/bin/appstreamcli stays in
# the runtime split-rule domain. fdsdk's full appstream.bst pushes
# %{bindir}/** into `devel`, which flatpak-minimal-image.bst excludes
# at compose time -- breaking os-release.bst's build sandbox once this
# element is the junction-level override for components/flatpak-minimal.bst.
- freedesktop-sdk.bst:components/appstream-minimal.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/polkit.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xdg-dbus-proxy.bst

variables:
  # NB: -Dhttp_backend=curl was dropped in 1.17 (libcurl is now the
  # only HTTP backend), so we don't pass it here. Otherwise verbatim
  # from freedesktop-sdk.bst:components/flatpak.bst.
  meson-local: >-
    -Dgtkdoc=disabled
    -Dsystem_bubblewrap=bwrap
    -Ddconf=disabled
    -Dmalcontent=disabled
    -Dselinux_module=disabled
    -Dtests=false
    -Dsystem_dbus_proxy=xdg-dbus-proxy
