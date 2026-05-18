# NVIDIA module, udev, and bootc karg defaults for Wayland/COSMIC.
# Mirrors the common Fedora/Pop baseline: nvidia-drm KMS+fbdev enabled,
# nouveau blocked, NVIDIA devices tagged for logind/libseat, and auxiliary
# /dev/nvidia* nodes created early.
kind: manual

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d "%{install-root}/etc/modprobe.d"
    cat > "%{install-root}/etc/modprobe.d/nvidia.conf" <<'EOF'
    # KMS/fbdev must be enabled when nvidia-drm loads.
    options nvidia-drm modeset=1 fbdev=1

    # Open kernel-module defaults for supported Turing+ GPUs.
    options nvidia NVreg_OpenRmEnableUnsupportedGpus=0
    options nvidia NVreg_EnableGpuFirmware=1

    # Preserve video memory across suspend/resume, matching Pop packaging.
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
    # Must not point at tmpfs.
    options nvidia NVreg_TemporaryFilePath=/var/NVreg_TemporaryFilePath
    EOF

    # Seat tags mirror Pop's 71-nvidia.rules so logind/libseat see the
    # NVIDIA PCI/DRM devices as display hardware.
    install -d "%{install-root}/usr/lib/udev/rules.d"
    cat > "%{install-root}/usr/lib/udev/rules.d/71-nvidia.rules" <<'EOF'
    # Seat tags for VGA and Optimus-style 3D controller classes.
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TAG+="seat", TAG+="master-of-seat"
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TAG+="seat", TAG+="master-of-seat"
    ACTION=="add|change", SUBSYSTEM=="drm", KERNEL=="card*", DRIVERS=="nvidia", TAG+="seat", TAG+="master-of-seat"

    # Create auxiliary /dev/nvidia* nodes on both module and PCI bind events.
    ACTION=="add|bind", KERNEL=="nvidia", RUN+="/usr/bin/nvidia-modprobe"
    ACTION=="add|bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", RUN+="/usr/bin/nvidia-modprobe -c 0"
    ACTION=="add|bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", RUN+="/usr/bin/nvidia-modprobe -m"
    ACTION=="add|bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", RUN+="/usr/bin/nvidia-modprobe -u"

    # Best-effort late-bind fallback (eGPU, unusual hotplug paths).
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", RUN+="/usr/sbin/modprobe nvidia"
    EOF

    # Rootfs module-load fallback.
    install -d "%{install-root}/etc/modules-load.d"
    cat > "%{install-root}/etc/modules-load.d/nvidia.conf" <<'EOF'
    # Dependency order matters.
    nvidia
    nvidia-modeset
    nvidia-drm
    nvidia-uvm
    EOF

    # Root-run fallback for auxiliary device nodes.
    install -d "%{install-root}/usr/lib/systemd/system" \
               "%{install-root}/usr/lib/systemd/system-preset"
    cat > "%{install-root}/usr/lib/systemd/system/nvidia-device-nodes.service" <<'EOF'
    [Unit]
    Description=Create NVIDIA device nodes
    DefaultDependencies=no
    After=systemd-modules-load.service systemd-udev-trigger.service
    Before=sysinit.target display-manager.service nvidia-persistenced.service

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/sh -c 'modprobe nvidia || true; modprobe nvidia-modeset || true; modprobe nvidia-drm || true; modprobe nvidia-uvm || true; /usr/bin/nvidia-modprobe -c 0 || true; /usr/bin/nvidia-modprobe -m || true; /usr/bin/nvidia-modprobe -u || true; ls -l /dev/nvidia* /dev/nvidia-caps/* 2>/dev/null || true'

    [Install]
    WantedBy=sysinit.target
    EOF
    cat > "%{install-root}/usr/lib/systemd/system-preset/89-nvidia-device-nodes.preset" <<'EOF'
    enable nvidia-device-nodes.service
    EOF

    # Block nouveau anywhere the rootfs modprobe config is visible.
    cat > "%{install-root}/etc/modprobe.d/blacklist-nouveau.conf" <<'EOF'
    blacklist nouveau
    options nouveau modeset=0
    EOF

    # Installed-system kargs. bootc copies these into generated boot entries;
    # they cover initramfs-time nouveau blocking, nvidia-drm KMS, and simpledrm
    # handoff issues seen on some NVIDIA systems.
    install -d "%{install-root}/usr/lib/bootc/kargs.d"
    cat > "%{install-root}/usr/lib/bootc/kargs.d/00-nvidia.toml" <<'EOF'
    kargs = [
        "rd.driver.blacklist=nouveau",
        "modprobe.blacklist=nouveau",
        "nvidia-drm.modeset=1",
        "nvidia-drm.fbdev=1",
        "initcall_blacklist=simpledrm_platform_driver_init",
    ]
    EOF
