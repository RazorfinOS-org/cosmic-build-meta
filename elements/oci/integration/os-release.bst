# Install /usr/lib/os-release for the COSMIC bootc image.
# Kept as a simple `manual` element rather than the meson-based
# template gnome-build-meta uses; we don't yet need branch/commit
# template substitution.
kind: manual

sources:
- kind: local
  path: files/oci/os-release

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 os-release "%{install-root}/usr/lib/os-release"
  - mkdir -p "%{install-root}/etc"
  - ln -sf "../usr/lib/os-release" "%{install-root}/etc/os-release"

(?):
- gaming == true:
    config:
      install-commands:
        (>):
        # Rebrand VARIANT/VARIANT_ID for the gaming image. Done in pure
        # POSIX shell (no sed) -- this element only depends on
        # runtime-minimal, which ships coreutils but not sed, and adding
        # sed.bst would change the non-gaming cache key and force a
        # recompose. Reads the staged source and overwrites the installed
        # copy; `printf` is a shell built-in so no extra tools are needed.
        - |
          while IFS= read -r line; do
            case "$line" in
              VARIANT=*)    printf '%s\n' 'VARIANT="COSMIC gaming"' ;;
              VARIANT_ID=*) printf '%s\n' 'VARIANT_ID=cosmic-gaming' ;;
              *)            printf '%s\n' "$line" ;;
            esac
          done < os-release > "%{install-root}/usr/lib/os-release"
