# Application sandboxing + delivery: Flatpak and its prereqs.
#
# Modern bootc/immutable-distro convention: ship the OS slim and let
# users install third-party apps via Flatpak. Without flatpak in the
# base, downstream consumers either layer it themselves or force users
# into distrobox for everything graphical.
#
# We ship the *runtime* only; remote configuration (Flathub, Fedora's
# remote, vendor-specific remotes) is deliberately deferred to
# downstream distros so this base stays policy-neutral. To enable
# Flathub for the cosmic-spin example or razorfin etc., drop a
# /etc/flatpak/remotes.d/flathub.flatpakrepo file in your downstream
# integration element.
kind: stack

depends:
  # Flatpak runtime + builder. The builder isn't strictly needed at
  # runtime, but it's small and lets users build their own Flatpaks
  # without distrobox.
  - freedesktop-sdk.bst:components/flatpak.bst

  # Sandboxing primitives Flatpak (and other tools like steam-runtime,
  # bwrap-oci, etc.) shell out to. Without bubblewrap, Flatpak fails
  # at the moment it tries to spawn an app.
  - freedesktop-sdk.bst:components/bubblewrap.bst

  # D-Bus filtering proxy that fronts the host bus for sandboxed apps.
  # Flatpak runs this per-sandbox so the contained app sees only the
  # bus services it has portal permission for.
  - freedesktop-sdk.bst:components/xdg-dbus-proxy.bst
