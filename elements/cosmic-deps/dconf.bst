# dconf - GSettings backend.
# Without dconf GSettings is read-only / in-memory; many app preferences
# silently can't persist.
#
# Recipe mirrors gnome-build-meta's elements/core-deps/dconf.bst:
#   - tracks `main` (0.49.0 tag missed the bash_completion meson option;
#     `main` has the fix in 0.49.0+5)
#   - gvdb pulled in via kind:git_module (proper buildstream way) at
#     subprojects/gvdb where dconf's wrap mechanism expects it
#   - vala + docbook-xsl + libxslt build-deps for vapi + man pages
kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/vala.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/libxslt.bst

depends:
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gnome:GNOME/dconf.git
  track: main
  ref: 0.49.0-5-g9e9c5bc8177048a2ee18531d6f68c2f06e0fc630
- kind: git_module
  url: gnome:GNOME/gvdb.git
  path: subprojects/gvdb
  ref: 4758f6fb7f889e074e13df3f914328f3eecb1fd3

variables:
  meson-local: >-
    -Dbash_completion=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdconf.so'
