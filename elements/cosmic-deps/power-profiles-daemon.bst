# power-profiles-daemon - Performance / Balanced / Power Saver toggle.
# cosmic-settings power panel exposes this.
#
# Recipe mirrors gnome-build-meta's elements/core-deps/power-profiles-daemon.bst;
# test-suite deps (python-dbusmock, umockdev) dropped and tests disabled.
kind: meson

sources:
- kind: git_repo
  url: freedesktop:upower/power-profiles-daemon.git
  track: '*.*'
  ref: 0.30-0-g5b4994c8a91290481bef87a5bae95391d0ec677f

build-depends:
- cosmic-deps/upower.bst
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/upower.bst
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/polkit.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  # gtk_doc=false avoids gtk-doc-scangobj dlopen()ing libupower-glib.so.3
  # at install time -- our upower's .so lives at /usr/lib (not the
  # multiarch /usr/lib/x86_64-linux-gnu/ that FDSDK's ld.so searches).
  # bashcomp/manpage disabled (need shtab/argparse-manpage).
  # tests=false drops the python-dbusmock/umockdev requirement.
  meson-local: >-
    -Dbashcomp=disabled
    -Dgtk_doc=false
    -Dmanpage=disabled
    -Dpylint=disabled
    -Dtests=false
