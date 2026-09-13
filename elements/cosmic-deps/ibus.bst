# ibus - full IM framework (daemon, wayland IM against cosmic-comp,
# XIM, GTK immodule, emoji/unicode dicts, ibus-setup). Replaces fdsdk's
# client-lib-only libibus via junction override; engines are follow-ups.
kind: autotools

sources:
- kind: git_repo
  url: github:ibus/ibus.git
  # '1.5.3?' deliberately misses -alpha/-beta tags (extra chars) and
  # will need widening at 1.5.40.
  track: '1.5.3?'
  ref: 1.5.34-0-g1f7af28437afd62a6d145bfc81035e698a37411d
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/vala.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

depends:
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/iso-codes.bst
- freedesktop-sdk.bst:components/libnotify.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/pygobject.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- cosmic-deps/dconf.bst
- cosmic-deps/cldr-emoji-annotation.bst
- cosmic-deps/unicode-emoji.bst
- cosmic-deps/unicode-ucd.bst

environment:
  GSETTINGS_BACKEND: memory

variables:
  conf-local: >-
    --enable-dconf
    --enable-memconf
    --enable-xim
    --enable-wayland
    --enable-gtk3
    --disable-gtk2
    --disable-gtk4
    --enable-ui
    --enable-setup
    --enable-engine
    --enable-emoji-dict
    --enable-unicode-dict
    --enable-libnotify
    --enable-introspection
    --enable-vala
    --enable-systemd-services
    --with-python=python3
    --disable-python2
    --disable-appindicator
    --disable-gtk-doc
    --disable-glibtest
    --disable-tests
    --disable-schemas-compile

config:
  configure-commands:
    (<):
    # The dconf override db is generated with gsettings; upstream wraps
    # it in dbus-launch, which needs /etc/passwd the sandbox lacks.
    - sed -i -e '/dbus-launch/d' -e '/DBUS_SESSION_BUS_PID/d' data/dconf/make-dconf-override-db.sh
  install-commands:
    (>):
    # XDG autostart for the wayland IM host (cosmic-session runs
    # xdg-desktop-autostart.target); ibus-ui-gtk3 spawns the daemon.
    - |
      install -d "%{install-root}/etc/xdg/autostart"
      cat > "%{install-root}/etc/xdg/autostart/org.freedesktop.IBus.Wayland.desktop" <<EOF
      [Desktop Entry]
      Type=Application
      Name=IBus Wayland
      Exec=%{libexecdir}/ibus-ui-gtk3 --enable-wayland-im --exec-daemon --daemon-args "--xim --panel disable"
      Icon=ibus
      NoDisplay=true
      NotShowIn=GNOME;
      EOF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libibus-1.0.so'
