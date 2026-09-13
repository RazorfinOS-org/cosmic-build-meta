# zswap kargs + first-boot swapfile (min(RAM/2, 8 GiB)), ported from
# dakota. Static swap.target.wants symlink instead of a preset so
# existing installs pick the unit up on upgrade.
kind: manual

sources:
- kind: local
  path: files/oci/swap
  directory: swap

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d "%{install-root}/usr/lib/bootc/kargs.d"
    cat > "%{install-root}/usr/lib/bootc/kargs.d/20-zswap.toml" <<'EOF'
    kargs = [
        "zswap.enabled=1",
        "zswap.compressor=zstd",
        "zswap.max_pool_percent=20",
        "zswap.shrinker_enabled=1",
    ]
    EOF

  - |
    install -d "%{install-root}/usr/lib/sysctl.d"
    cat > "%{install-root}/usr/lib/sysctl.d/60-swappiness.conf" <<'EOF'
    vm.swappiness = 100
    EOF

  - install -Dm755 swap/cosmic-swapfile-init "%{install-root}/usr/libexec/cosmic/cosmic-swapfile-init"
  - install -Dm644 swap/cosmic-swapfile-init.service "%{install-root}/usr/lib/systemd/system/cosmic-swapfile-init.service"
  - install -Dm644 swap/var-swap-swapfile.swap "%{install-root}/usr/lib/systemd/system/var-swap-swapfile.swap"
  - |
    install -d "%{install-root}/usr/lib/systemd/system/swap.target.wants"
    ln -sf ../var-swap-swapfile.swap "%{install-root}/usr/lib/systemd/system/swap.target.wants/var-swap-swapfile.swap"
