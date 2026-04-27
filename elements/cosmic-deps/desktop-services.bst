# Desktop services: X11 compat, portals, GIO TLS, GSettings schemas,
# secret service, Bluetooth, printing, color, mDNS, location, sensors,
# GPG. Plus the locale datasets cosmic-initial-setup reads.
kind: stack

depends:
  # X11 compatibility (Steam, Electron-on-X, JetBrains, GIMP, OBS, ...)
  - freedesktop-sdk.bst:components/xwayland.bst

  # Portal frontend (pairs with core/xdg-desktop-portal-cosmic.bst)
  - freedesktop-sdk.bst:components/xdg-desktop-portal.bst

  # GIO TLS backend; without this any libsoup/GIO HTTPS request fails
  - freedesktop-sdk.bst:components/glib-networking.bst

  # GSettings consumers abort on missing schemas at startup
  - freedesktop-sdk.bst:components/gsettings-desktop-schemas.bst

  # Base icon-theme fallback every GTK/iced app expects
  - freedesktop-sdk.bst:components/hicolor-icon-theme.bst

  # Pop icon theme -- the COSMIC icon theme inherits from this
  # (`Inherits=Pop,hicolor` in /usr/share/icons/Cosmic/index.theme).
  # Without it, every standard freedesktop icon name resolves to
  # nothing (search/edit/network/audio/folder/...). Also ships
  # /usr/share/pixmaps/faces/pop-robot.png used by cosmic-initial-setup
  # as the default avatar.
  - cosmic-deps/pop-icon-theme.bst

  # Secret Service API (browsers, NetworkManager-applet, SMB credentials)
  - freedesktop-sdk.bst:components/libsecret.bst

  # Bluetooth daemon (cosmic-settings BT panel)
  - freedesktop-sdk.bst:components/bluez.bst

  # Printing
  - freedesktop-sdk.bst:components/cups-daemon.bst
  - freedesktop-sdk.bst:components/cups-filters.bst

  # Color management for printers/displays
  - freedesktop-sdk.bst:components/colord.bst

  # mDNS for printer / SMB / Chromecast discovery
  - freedesktop-sdk.bst:components/avahi.bst

  # Location service (timezone, weather, night light)
  - freedesktop-sdk.bst:components/geoclue.bst

  # Ambient light / accelerometer for auto-rotate, auto-brightness
  - freedesktop-sdk.bst:components/iio-sensor-proxy.bst

  # GnuPG bindings (portals, password managers)
  - freedesktop-sdk.bst:components/gpgme.bst

  # Notification API used by virtually every non-COSMIC desktop app
  # (Firefox, Thunderbird, GIMP, Inkscape, Telegram, ...). cosmic-
  # notifications listens on the org.freedesktop.Notifications bus;
  # libnotify is the client-side library apps link against to emit them.
  - freedesktop-sdk.bst:components/libnotify.bst

  # GLib HTTP / WebSocket library. Used by Epiphany, Geary, Polari,
  # gnome-online-accounts, GJS apps, and a long tail of GTK utilities.
  # Missing it = those apps fail to make any network request.
  - freedesktop-sdk.bst:components/libsoup.bst

  # Tablet / pen / stylus database. cosmic-settings has a tablet panel
  # that needs this to display device info and per-device config.
  - freedesktop-sdk.bst:components/libwacom.bst

  # Populates the new user's ~/Documents, ~/Downloads, ~/Music etc. on
  # first login (per ~/.config/user-dirs.dirs). Without it, cosmic-files
  # opens to bare $HOME and the standard XDG categories don't exist.
  - freedesktop-sdk.bst:components/xdg-user-dirs.bst

  # Accessibility bus (D-Bus + at-spi). Foundation for any future a11y
  # work: screen readers, magnifiers, accessibility-aware widgets all
  # publish/consume on this bus. GTK apps silently disable their a11y
  # paths if the bus isn't running.
  - freedesktop-sdk.bst:components/at-spi2-core.bst

  # Wayland-ecosystem runtime libs cosmic-comp dlopen()s. Without
  # libdisplay-info the dynamic linker fails before main() and the
  # compositor crashes immediately, taking down greetd's whole session.
  - freedesktop-sdk.bst:components/libdisplay-info.bst

  # Localization datasets cosmic-initial-setup reads at runtime.
  # Without these the language picker only shows English, the
  # keyboard picker only shows English (US), and the timezone
  # picker can't find any cities. None of these add user-facing
  # binaries -- they're pure data trees under /usr/share.
  - freedesktop-sdk.bst:components/iso-codes.bst                  # language/country names
  - freedesktop-sdk.bst:components/xorg-data-xkeyboard-config.bst # keyboard layouts (/usr/share/X11/xkb)
  - freedesktop-sdk.bst:components/tzdata.bst                     # timezone DB / city list

  # Locally-vendored desktop daemons (not in FDSDK 25.08)
  - cosmic-deps/dconf.bst              # GSettings backend; without it preferences are read-only / in-memory
  - cosmic-deps/accountsservice.bst    # user-account D-Bus service; cosmic-greeter avatars/per-user settings
  - cosmic-deps/switcheroo-control.bst # hybrid-GPU switching daemon
  # gvfs and sane-backends would need additional vendored deps
  # (libgphoto2, etc. that FDSDK 25.08 doesn't ship) -- deferred.
