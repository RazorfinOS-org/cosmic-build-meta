# Top-level stack for the COSMIC + NVIDIA bootc image.
#
# Composition: the full default cosmic image stack, plus the NVIDIA
# driver bits. The base stack is depended on as a unit so any future
# additions to oci/cosmic/stack.bst (new integration files, new
# default deps, etc.) flow into the NVIDIA variant automatically.
kind: stack

depends:
  # Everything from the default image (cosmic-deps, integration drop-ins,
  # initramfs, kernel firmware, branding, presets, etc.)
  - oci/cosmic/stack.bst

  # NVIDIA driver: kernel modules + userspace + EGL-Wayland bridge +
  # modprobe glue (modeset=1, nouveau blacklist, module load order).
  - cosmic-deps-nvidia/deps.bst

public:
  bst:
    integration-commands:
    # nvidia-drivers.bst lays down nvidia.ko etc. under
    # /usr/lib/modules/<kver>/{updates,extra,kernel}/. depmod must
    # run against the composed root so modprobe can resolve the
    # module dependency graph (nvidia-modeset depends on nvidia,
    # nvidia-drm depends on nvidia-modeset). FDSDK's linux.bst ships
    # modules.dep covering the in-tree modules; we re-run depmod to
    # incorporate the NVIDIA additions.
    - |
      KVER=$(ls /usr/lib/modules | head -n1)
      if [ -z "$KVER" ]; then
          echo "FATAL: no kernel under /usr/lib/modules at integration time" >&2
          exit 1
      fi
      depmod -a "$KVER"
