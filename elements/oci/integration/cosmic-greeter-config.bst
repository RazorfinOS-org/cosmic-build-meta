# Image-time configuration that wires cosmic-greeter and
# cosmic-initial-setup into greetd.
#
# Ships:
#   /etc/greetd/config.toml          -- replaces the default agreety/sh
#                                        config; default_session runs
#                                        cosmic-greeter, initial_session
#                                        runs cosmic-initial-setup once.
#   /etc/pam.d/greetd                -- minimal PAM stack delegating to
#                                        system-auth.
#   /usr/lib/sysusers.d/             -- creates the `cosmic-greeter`
#     cosmic-greeter.conf              system user with seat/video/input
#                                        group memberships. Materialised
#                                        by `systemd-sysusers --root` in
#                                        oci/cosmic/image.bst.
kind: manual

sources:
- kind: local
  path: files/oci/greetd
  directory: greetd
- kind: local
  path: files/oci/pam
  directory: pam
- kind: local
  path: files/oci/tmpfiles
  directory: tmpfiles
- kind: local
  path: files/oci/sysusers
  directory: sysusers
- kind: local
  path: files/oci/environment.d
  directory: environment.d
- kind: local
  path: files/oci/default-cursor
  directory: default-cursor
- kind: local
  path: files/oci/cosmic-defaults
  directory: cosmic-defaults
- kind: local
  path: files/oci/sudoers
  directory: sudoers

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 greetd/config.toml             "%{install-root}/etc/greetd/config.toml"
  - install -Dm644 pam/greetd                     "%{install-root}/etc/pam.d/greetd"
  # Wrappers around cosmic-comp invocation for greetd's default and
  # initial sessions. Tee output to the journal via systemd-cat so
  # failures inside the kiosk child are debuggable.
  - install -Dm755 greetd/cosmic-greeter-wrapper       "%{install-root}/usr/local/bin/cosmic-greeter-wrapper"
  - install -Dm755 greetd/cosmic-initial-setup-wrapper "%{install-root}/usr/local/bin/cosmic-initial-setup-wrapper"
  # Inner kiosk scripts run BY cosmic-comp as its sole child. They
  # fork cosmic-bg in the background (so the wallpaper daemon connects
  # to the wayland socket cosmic-comp just opened) and exec the
  # focused app. Without this, no cosmic-bg ever starts in our greetd
  # kiosk launches and the compositor renders solid color instead of
  # the configured /usr/share/backgrounds/cosmic/orion_nebula_*.jpg.
  - install -Dm755 greetd/cosmic-greeter-kiosk         "%{install-root}/usr/local/bin/cosmic-greeter-kiosk"
  - install -Dm755 greetd/cosmic-initial-setup-kiosk   "%{install-root}/usr/local/bin/cosmic-initial-setup-kiosk"
  # Override /usr/lib/pam.d/systemd-user (upstream systemd ships one
  # that marks pam_selinux.so as required, but FDSDK 25.08 builds
  # linux-pam without SELinux). /etc/pam.d/ takes precedence over
  # /usr/lib/pam.d/, so this fixes user@<UID>.service spawning.
  - install -Dm644 pam/systemd-user               "%{install-root}/etc/pam.d/systemd-user"
  # Don't ship sysusers/cosmic-greeter.conf here -- upstream
  # cosmic-greeter element already provides one and BST silently
  # picked theirs over ours, which only added group memberships we
  # didn't actually need. Stick with upstream's.
  # tmpfiles.d entry creates /var/lib/cosmic-greeter at boot so
  # systemd's user@<UID>.service can initialise XDG dirs against a
  # real home directory (otherwise greetd hits its restart limit).
  - install -Dm644 tmpfiles/cosmic-greeter.conf   "%{install-root}/usr/lib/tmpfiles.d/cosmic-greeter.conf"
  # sysusers.d + tmpfiles.d for cosmic-initial-setup (upstream
  # cosmic-initial-setup doesn't ship these -- it relies on Debian's
  # postinst). Without this user account the wizard skips its
  # create-user page entirely; see files/oci/sysusers/cosmic-initial-setup.conf
  # for the rationale.
  - install -Dm644 sysusers/cosmic-initial-setup.conf "%{install-root}/usr/lib/sysusers.d/cosmic-initial-setup.conf"
  - install -Dm644 tmpfiles/cosmic-initial-setup.conf "%{install-root}/usr/lib/tmpfiles.d/cosmic-initial-setup.conf"
  # systemd user-manager env -- sets XDG_CURRENT_DESKTOP=COSMIC before
  # xdg-desktop-portal.service activates so the portal frontend loads
  # /usr/share/xdg-desktop-portal/portals/cosmic.portal as its backend.
  # The wrapper-level `export XDG_CURRENT_DESKTOP` only reaches
  # cosmic-comp's child processes and not the already-running portal.
  - install -Dm644 environment.d/90-cosmic.conf "%{install-root}/usr/lib/environment.d/90-cosmic.conf"
  # Default xcursor theme. cosmic-comp logs `NoDefaultCursor` and falls
  # back to a placeholder cursor sprite if /usr/share/icons/default/
  # is missing. The file just declares "inherit from Cosmic" so the
  # actual cursor PNGs come from pop-icon-theme (which ships
  # /usr/share/icons/Pop/cursors/* that Cosmic inherits from).
  - install -Dm644 default-cursor/index.theme "%{install-root}/usr/share/icons/default/index.theme"
  # Default cosmic-comp output config (1680x1050 on QEMU's virtio-vga-gl
  # connector). tmpfiles.d entries in cosmic-{initial-setup,greeter}.conf
  # copy this into each user's ~/.local/state/cosmic-comp/outputs.ron on
  # first boot. Workaround for smithay PR #1923 not yet picked up by
  # cosmic-comp -- without this, the compositor renders at QEMU's
  # 640x480 EDID default and resize events from the host are dropped.
  - install -Dm644 cosmic-defaults/outputs.ron "%{install-root}/usr/share/cosmic-vm-defaults/outputs.ron"
  # Grant `wheel` group sudo. accountsservice puts admin accounts in
  # wheel (FDSDK 25.08 sudo's compile-time admin group), but ships
  # /etc/sudoers without the `%wheel ALL=(ALL:ALL) ALL` line. Without
  # this drop-in, the user created by cosmic-initial-setup is in wheel
  # but `sudo` rejects them. Mode MUST be 0440 -- sudo refuses to read
  # any file in /etc/sudoers.d that is group- or world-writable.
  # Filename has no extension on purpose: sudo skips files with `.` in
  # the name (matches Fedora/Arch conventions; `man sudoers.d`).
  - install -Dm440 sudoers/wheel "%{install-root}/etc/sudoers.d/wheel"
  # Pre-populate the new user's home with cosmic-initial-setup's "done"
  # marker so its XDG autostart entry exits immediately after first
  # login. Background:
  #   - greetd's initial_session runs cosmic-initial-setup as the
  #     cosmic-initial-setup system user (OEM mode) to collect settings
  #     + create the real user account via accountsservice.CreateUser
  #     -> useradd -m -k /etc/skel.
  #   - /etc/xdg/autostart/com.system76.CosmicInitialSetup.Autostart.desktop
  #     then re-fires the wizard on first login as the real user, with
  #     the same pages but no Create-Account step. Without this marker
  #     the user is forced to redo Language/Keyboard/Layout/Theme.
  #   - cosmic-initial-setup's main.rs early-exits if
  #     ~/.config/cosmic-initial-setup-done exists. Putting the marker
  #     in /etc/skel makes useradd copy it into the new home so the
  #     check fires.
  # Tradeoff: the per-user run is *intended* to capture per-account
  # preferences distinct from OEM-mode picks, but upstream never wired
  # the OEM->user settings migration that the Greeter.initial_setup_end
  # D-Bus call hints at -- the cosmic-greeter daemon doesn't even
  # implement the method. So skipping the per-user run loses nothing;
  # the user can change theme/language in Settings if they want.
  - install -Dm644 /dev/null "%{install-root}/etc/skel/.config/cosmic-initial-setup-done"
