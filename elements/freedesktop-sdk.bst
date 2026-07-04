kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-25.08*

  ref: freedesktop-sdk-25.08.13-0-g8446990f0a549bb1f3ceb654af64fc176b274488
config:
  options:
    target_arch: '%{arch}'
    (?):
    - arch == 'x86_64':
        bootstrap_build_arch: 'x86_64'
    - arch == 'aarch64':
        bootstrap_build_arch: 'aarch64'
    - arch == "riscv64":
        bootstrap_build_arch: "x86_64"
  # Redirect every reference to fdsdk's flatpak elements (including
  # transitive ones from xdg-desktop-portal{,-base}) to our vendored
  # 1.17.6 build. Without this both flatpak.bst (full) and our
  # cosmic-deps/flatpak.bst install /usr/bin/flatpak in the runtime
  # layer; whichever wins the overlap defines the version actually
  # shipped, and on this image it was fdsdk's 1.16.x. The override
  # collapses them into a single source of truth so `flatpak preinstall`
  # is available (see oci/integration/flatpak-config.bst). Drop both
  # entries when fdsdk advances to flatpak >= 1.18.
  overrides:
    components/flatpak.bst: cosmic-deps/flatpak.bst
    components/flatpak-minimal.bst: cosmic-deps/flatpak.bst
    # Gaming variant swaps the kernel for the Open Gaming Collective
    # build. Routing it through the junction override (instead of a
    # parallel element tree) means every consumer of components/linux.bst
    # -- cosmic-deps/base.bst, oci/initramfs.bst, and critically
    # cosmic-deps-nvidia/nvidia-drivers.bst which compiles the NVIDIA
    # modules against the kernel build tree -- resolves to the OGC
    # kernel automatically, so module/kernel co-versioning holds by
    # construction in the nvidia+gaming combination.
    (?):
    - gaming == true:
        components/linux.bst: core-deps/linux-ogc.bst
