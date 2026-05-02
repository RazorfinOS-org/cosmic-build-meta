kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-25.08*

  ref: freedesktop-sdk-25.08.10-0-g02537fca9b7abe024f9413cb4a8bc2a4f988949c
config:
  options:
    target_arch: '%{arch}'
    (?):
    - x86_64_v3:
        x86_64_v3: true
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
