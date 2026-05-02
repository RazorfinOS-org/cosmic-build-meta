# Aggregation stack for the NVIDIA proprietary driver bits.
#
# Pulls together the NVIDIA driver (kernel modules + closed-source
# userspace, both built from the .run installer), the Wayland-EGL
# bridge, and the modprobe glue.
#
# This stack is NOT pulled by the default OCI image stack
# (oci/cosmic/image.bst) -- it's consumed only by the NVIDIA variant
# (oci/cosmic-nvidia/image.bst, phase 2). Downstream distros wanting
# to compose their own variant can junction in cosmic-build-meta and
# `depends:` on this stack from their own image element.
kind: stack

depends:
  - cosmic-deps-nvidia/nvidia-drivers.bst
  - cosmic-deps-nvidia/egl-external-platform.bst
  - cosmic-deps-nvidia/nvidia-egl-wayland.bst
  - cosmic-deps-nvidia/nvidia-modprobe-config.bst
  - cosmic-deps-nvidia/nvidia-container-toolkit.bst
  - cosmic-deps-nvidia/nvidia-container-toolkit-preset.bst
