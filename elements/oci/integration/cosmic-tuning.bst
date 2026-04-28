# System tuning drop-ins for the COSMIC bootc image.
#
# Pure config-file element -- no daemons, no binaries. Each drop-in
# lands under /usr/lib/<area>.d/ where the corresponding daemon picks
# it up at boot, with /etc/<area>.d/ taking precedence so a downstream
# distro or a sysadmin can override any value with a higher-numbered
# file (10-cosmic.conf <- override at 20-<distro>.conf or 90-local).
#
# Source files live under files/oci/tuning/<area>.d/, mirroring the
# eventual /usr/lib/<area>.d/ layout to keep the install-commands
# below trivially auditable.
kind: manual

sources:
- kind: local
  path: files/oci/tuning
  directory: tuning

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  # Kernel tunables: file watchers, mmap regions, TCP congestion,
  # IPv6 privacy. See 10-cosmic.conf for per-line rationale.
  - install -Dm644 tuning/sysctl.d/10-cosmic.conf "%{install-root}/usr/lib/sysctl.d/10-cosmic.conf"

  # Cap persistent journal storage so /var/log doesn't grow to tens
  # of GB on long-lived installs.
  - install -Dm644 tuning/journald.conf.d/10-cosmic.conf "%{install-root}/usr/lib/systemd/journald.conf.d/10-cosmic.conf"

  # Faster shutdown: 15s service-stop timeout vs 90s default.
  - install -Dm644 tuning/system.conf.d/10-cosmic-timeouts.conf "%{install-root}/usr/lib/systemd/system.conf.d/10-cosmic-timeouts.conf"

  # Raise the system D-Bus daemon's RLIMIT_NOFILE -- COSMIC's
  # compositor + applets + apps collectively swamp the systemd default
  # of 1024. fdsdk packages the reference dbus-daemon (dbus.service);
  # downstream distros that swap in dbus-broker can drop a duplicate
  # symlink at dbus-broker.service.d/.
  - install -Dm644 tuning/dbus.service.d/10-cosmic-nofile.conf "%{install-root}/usr/lib/systemd/system/dbus.service.d/10-cosmic-nofile.conf"

  # fstrim systemd units. fdsdk's util-linux ships /usr/sbin/fstrim
  # but not the upstream service+timer pair -- their build doesn't
  # enable --with-systemdsystemunitdir. Vendor minimal copies of the
  # canonical units (matching util-linux upstream) so 90-cosmic.preset
  # can `enable fstrim.timer`. Trims unused blocks weekly on SSDs/NVMe
  # to keep firmware GC ahead of the host.
  - install -Dm644 tuning/system/fstrim.service "%{install-root}/usr/lib/systemd/system/fstrim.service"
  - install -Dm644 tuning/system/fstrim.timer   "%{install-root}/usr/lib/systemd/system/fstrim.timer"
