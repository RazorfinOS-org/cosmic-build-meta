# Intel early-load microcode; fdsdk's linux-firmware is AMD-only.
# GenuineIntel.bin = sorted concatenation of the per-CPUID blobs
# (Debian's approach); oci/initramfs.bst probes exactly this path.
kind: manual

sources:
- kind: git_repo
  url: github:intel/Intel-Linux-Processor-Microcode-Data-Files.git
  track: 'microcode-*'

  ref: microcode-20260812-0-g927e65c8d5a6e4ec05cc74b1778283ab2284d0c1
build-depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  # intel-ucode/ only; intel-ucode-with-caveats/ needs explicit opt-in
  # (OS-visible caveats) and is deliberately excluded.
  - cat intel-ucode/* > GenuineIntel.bin
  - install -Dm644 GenuineIntel.bin "%{install-root}/usr/lib/firmware/intel-ucode/GenuineIntel.bin"
