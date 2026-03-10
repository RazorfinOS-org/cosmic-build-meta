# Minimal COSMIC desktop session
# Includes the compositor, session manager, shell, greeter, and core
# system services needed for a functional COSMIC desktop.
kind: stack

depends:
  # Core protocols and infrastructure
  - cosmic/cosmic-protocols.bst
  - cosmic/libdisplay-info.bst
  - cosmic/libcosmic.bst

  # Compositor and session
  - cosmic/cosmic-comp.bst
  - cosmic/cosmic-session.bst
  - cosmic/cosmic-settings-daemon.bst
  - cosmic/xdg-desktop-portal-cosmic.bst

  # Login
  - cosmic/greetd.bst
  - cosmic/cosmic-greeter.bst

  # Shell components
  - cosmic/cosmic-panel.bst
  - cosmic/cosmic-applets.bst
  - cosmic/cosmic-applibrary.bst
  - cosmic/cosmic-bg.bst
  - cosmic/cosmic-idle.bst
  - cosmic/cosmic-launcher.bst
  - cosmic/cosmic-notifications.bst
  - cosmic/cosmic-osd.bst
  - cosmic/cosmic-randr.bst
  - cosmic/cosmic-screenshot.bst
  - cosmic/cosmic-workspaces-epoch.bst
  - cosmic/pop-launcher.bst

  # Runtime services
  - cosmic/upower.bst

  # Data/themes
  - cosmic/cosmic-icons.bst
  - cosmic/cosmic-wallpapers.bst
