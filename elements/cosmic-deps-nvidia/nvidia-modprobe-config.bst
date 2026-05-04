# Kernel-module configuration for NVIDIA on a Wayland-first desktop.
#
# Two settings matter:
#   - nvidia-drm.modeset=1     KMS support; mandatory for Wayland on NVIDIA.
#                              Without it, any Wayland compositor sees a
#                              DRM device with no working modesetting and
#                              fails to bring up the display.
#   - nvidia-drm.fbdev=1       Provides /dev/fb0 backed by nvidia-drm so
#                              early-boot framebuffer (plymouth, kernel
#                              messages) renders correctly. Was added in
#                              driver 545.x; safe on 595.x.
#
# Also disables the (deprecated, X11-only) nvidia-fbc legacy framebuffer
# plugin which spams dmesg warnings on modern kernels.
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
    # Required for Wayland (cosmic-comp). Modeset must be enabled at
    # module load time; setting it after the fact has no effect.
    options nvidia-drm modeset=1 fbdev=1

    # Enable the open kernel modules' GSP firmware path (Turing+).
    # 595.x defaults this to 1 already; explicit for clarity.
    options nvidia NVreg_OpenRmEnableUnsupportedGpus=0
    options nvidia NVreg_EnableGpuFirmware=1
    EOF

    # Make the modules load early enough that they grab the framebuffer
    # before any other DRM driver tries.
    install -d "%{install-root}/etc/modules-load.d"
    cat > "%{install-root}/etc/modules-load.d/nvidia.conf" <<'EOF'
    # Order matters: nvidia first, then nvidia-modeset (depends on nvidia),
    # then nvidia-drm (depends on nvidia-modeset).
    nvidia
    nvidia-modeset
    nvidia-drm
    nvidia-uvm
    EOF

    # Block nouveau -- it must not load if NVIDIA proprietary is present,
    # otherwise both drivers race for /dev/dri/card0 and the system
    # boots into VESA fallback or a black screen.
    cat > "%{install-root}/etc/modprobe.d/blacklist-nouveau.conf" <<'EOF'
    blacklist nouveau
    options nouveau modeset=0
    EOF

    # Kernel cmdline for the installed bootc system. bootc reads files
    # in /usr/lib/bootc/kargs.d/ at install/upgrade time and writes the
    # kargs into the systemd-boot entry it generates.
    #
    # Why each one (mirrors uBlue/Bazzite's NVIDIA + Wayland baseline):
    #   - rd.driver.blacklist=nouveau / modprobe.blacklist=nouveau
    #     /etc/modprobe.d/blacklist-nouveau.conf isn't visible in the
    #     initramfs, so without these the initramfs autoloads nouveau
    #     before the rootfs blacklist applies; nouveau then claims the
    #     DRM device and nvidia-drm fails to bind.
    #   - nvidia-drm.modeset=1
    #     Belt-and-braces with the modprobe.d option. If nvidia-drm gets
    #     pulled in by udev before /etc/modprobe.d/nvidia.conf is read,
    #     modeset stays off and any Wayland compositor (cosmic-comp)
    #     refuses to acquire DRM master.
    #   - initcall_blacklist=simpledrm_platform_driver_init
    #     simpledrm binds to the EFI framebuffer very early; on some
    #     hardware nvidia-drm refuses to take over, leaving cosmic-comp
    #     without a working /dev/dri/card0.
    install -d "%{install-root}/usr/lib/bootc/kargs.d"
    cat > "%{install-root}/usr/lib/bootc/kargs.d/00-nvidia.toml" <<'EOF'
    kargs = [
        "rd.driver.blacklist=nouveau",
        "modprobe.blacklist=nouveau",
        "nvidia-drm.modeset=1",
        "initcall_blacklist=simpledrm_platform_driver_init",
    ]
    EOF
