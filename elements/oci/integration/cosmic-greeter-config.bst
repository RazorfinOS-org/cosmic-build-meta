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

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 greetd/config.toml             "%{install-root}/etc/greetd/config.toml"
  - install -Dm644 pam/greetd                     "%{install-root}/etc/pam.d/greetd"
  # Wrappers around cosmic-comp invocation for greetd's default and
  # initial sessions. Pass --no-xwayland (we don't ship Xwayland) and
  # tee output to the journal via systemd-cat so failures inside the
  # kiosk child are debuggable.
  - install -Dm755 greetd/cosmic-greeter-wrapper       "%{install-root}/usr/local/bin/cosmic-greeter-wrapper"
  - install -Dm755 greetd/cosmic-initial-setup-wrapper "%{install-root}/usr/local/bin/cosmic-initial-setup-wrapper"
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
