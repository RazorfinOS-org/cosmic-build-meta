# Minimal COSMIC desktop session
# Includes the compositor, session manager, shell, greeter, and core
# system services needed for a functional COSMIC desktop.
kind: stack

depends:
  # Core protocols and infrastructure
  - core/cosmic-protocols.bst
  - core-deps/libdisplay-info.bst
  - core/libcosmic.bst

  # Compositor and session
  - core/cosmic-comp.bst
  - core/cosmic-session.bst
  - core/cosmic-settings-daemon.bst
  - core/xdg-desktop-portal-cosmic.bst

  # Login
  - core-deps/greetd.bst
  - core/cosmic-greeter.bst

  # Shell components
  - core/cosmic-panel.bst
  - core/cosmic-applets.bst
  - core/cosmic-applibrary.bst
  - core/cosmic-bg.bst
  - core/cosmic-idle.bst
  - core/cosmic-launcher.bst
  - core/cosmic-notifications.bst
  - core/cosmic-osd.bst
  - core/cosmic-randr.bst
  - core/cosmic-screenshot.bst
  - core/cosmic-workspaces-epoch.bst
  - core/pop-launcher.bst

  # Runtime services
  - cosmic-deps/upower.bst

  # Data/themes
  - core/cosmic-icons.bst
  - core/cosmic-wallpapers.bst
