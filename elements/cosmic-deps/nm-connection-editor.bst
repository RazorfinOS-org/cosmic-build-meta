# nm-connection-editor - GTK3 editor for VPN/802.1x/bridge profiles
# cosmic-settings doesn't cover. Meson can't build the editor alone,
# so the redundant nm-applet is deleted post-install.
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/network-manager-applet.git
  track: '1.*'
  exclude:
  - '*-dev*'
  - '*-rc*'

  ref: 1.36.0-0-g8accd508caa0400304a01da718eeab587ee8fb04
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/libnma.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/networkmanager.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dappindicator=no
    -Dwwan=false
    -Dteam=false
    -Dselinux=false

config:
  install-commands:
    (>):
    - |
      # Ship the editor only. The org.gnome.nm-applet GSettings schema
      # stays -- removing a compiled-in schema is what crashes, an
      # unused one is inert.
      rm -f "%{install-root}%{bindir}/nm-applet"
      rm -f "%{install-root}%{sysconfdir}/xdg/autostart/nm-applet.desktop"
      rm -f "%{install-root}%{datadir}/applications/nm-applet.desktop"
      rm -f "%{install-root}%{mandir}/man1/nm-applet.1"
