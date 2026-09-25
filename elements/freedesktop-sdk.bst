kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-26.08*

  ref: freedesktop-sdk-26.08.1-0-gb02b59ffe19a49a402f357fd5fcb1d552ebc50d7
config:
  options:
    target_arch: '%{arch}'
    (?):
    - arch == 'x86_64':
        bootstrap_build_arch: 'x86_64'
    - arch == 'aarch64':
        bootstrap_build_arch: 'aarch64'
  overrides:
    # fdsdk's libibus is client-lib-only; our full ibus installs the
    # same lib, so collapse every reference to one source of truth.
    components/libibus.bst: cosmic-deps/ibus.bst
    # 26.08's podman pulls fdsdk's nftables; ours is a superset
    # (--with-xtables), so collapse both onto it.
    components/nftables.bst: cosmic-deps/nftables.bst
    # Keep kernel selection at the junction boundary so every consumer of
    # components/linux.bst -- cosmic-deps/base.bst, oci/initramfs.bst,
    # and critically cosmic-deps-nvidia/nvidia-drivers.bst which compiles
    # the NVIDIA modules against the kernel build tree -- resolves the
    # same kernel and module/kernel co-versioning holds by construction.
    # Both kernels are self-built with one shared config formula
    # (fdsdk-config.sh + cosmic-config.sh); gaming swaps the tree for
    # the Open Gaming Collective build.
    components/linux.bst: core-deps/linux-fdsdk.bst
    (?):
    - gaming == true:
        components/linux.bst: core-deps/linux-ogc.bst
