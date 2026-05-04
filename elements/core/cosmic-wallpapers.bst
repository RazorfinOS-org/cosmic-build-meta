kind: make

build-depends:
- freedesktop-sdk.bst:components/make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-wallpapers.git
  track: master

  ref: epoch-1.0.9-0-g3c59953e7ee5792efecdb232cb4c7211e7785f52

# original/*.jpg are Git LFS objects in upstream; the git_repo plugin only
# fetches the LFS *pointer* (~130 bytes) because we disable LFS smudge
# globally in the Justfile (cargo2 vendoring breaks otherwise -- see
# Justfile comment). Without the real JPEGs the Makefile installs pointer
# files to /usr/share/backgrounds/cosmic/ and cosmic-bg renders a solid
# color. Overlay the actual blobs from GitHub's media endpoint; ref values
# are the LFS oid sha256 (which is the SHA256 of the file content, exactly
# what `kind: remote` expects). Same pattern as cosmic-initial-setup.bst.
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/A_stormy_stellar_nursery_esa_379309.jpg
  ref: a76cfb42a0b33e4dee7e977ea97ab892bc0d10e03bc5a7261a5570928cd014aa
  filename: A_stormy_stellar_nursery_esa_379309.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/orion_nebula_nasa_heic0601a.jpg
  ref: 7500f702f0488d4a8df2c5abeb7ca9107a7ca7998e0441727cbaf79465b02388
  filename: orion_nebula_nasa_heic0601a.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/otherworldly_earth_nasa_ISS064-E-29444.jpg
  ref: 6d6c3590b7365c8c5c754edd4a336ab38c8eedc3ba6cc9139572bb11aac059ae
  filename: otherworldly_earth_nasa_ISS064-E-29444.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/phytoplankton_bloom_nasa_oli2_20240121.jpg
  ref: d8cac87b51f60cbd95eaa8b2772f00cf14025c907eaf1ccb72d98902332b399c
  filename: phytoplankton_bloom_nasa_oli2_20240121.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/round_moons_nasa.jpg
  ref: d78bb03c77c04ae5aad0bc29c59e2a59a8df8f5efa1839d3063d465f1459c285
  filename: round_moons_nasa.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/tarantula_nebula_nasa_PIA23646.jpg
  ref: 4f8b878fc2b653e230cf0a45530433a9aaf5cf5e71d0ede02a566e808137a597
  filename: tarantula_nebula_nasa_PIA23646.jpg
  directory: original
- kind: remote
  url: github-media:pop-os/cosmic-wallpapers/3c59953e7ee5792efecdb232cb4c7211e7785f52/original/webb-inspired-wallpaper-system76.jpg
  ref: 5e47b83f67c285e9987355f339b139a98f4c1e8e80b064153e9c1b635f992daf
  filename: webb-inspired-wallpaper-system76.jpg
  directory: original

variables:
  make-install-args: >-
    PREFIX="%{prefix}"
    DESTDIR="%{install-root}"
    install
