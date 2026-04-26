# Final OCI image assembly for COSMIC.
#
# build-oci layers our `oci/cosmic/filesystem.bst` (squashed sysroot,
# mounted at /layer) on top of the freedesktop-sdk platform OCI image
# (mounted at /parent). The resulting image carries the
# `containers.bootc=1` label so bootc tools recognise it as a bootable
# container.
#
# Downstream consumers (Pattern A: source junction) `build-depends` on
# this element with `config.location: /parent` and stack their own
# /layer on top.
# Downstream consumers (Pattern B: Containerfile FROM) just pull the
# published image once we publish it to GHCR.
kind: script

build-depends:
- freedesktop-sdk.bst:components/fakecap.bst
- freedesktop-sdk.bst:oci/oci-builder.bst
- freedesktop-sdk.bst:vm/prepare-image.bst
- oci/cosmic/init-scripts.bst
- filename: freedesktop-sdk.bst:oci/platform-oci.bst
  config:
    location: /parent
- filename: oci/cosmic/filesystem.bst
  config:
    location: /layer

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  # Stable seed -> reproducible UUIDs across rebuilds (matches gnome-build-meta).
  sysroot-seed: 96f41f54-8854-401d-851f-ca5bec6e613f

config:
  commands:
  - mkdir /fakecap

  - |
    prepare-image.sh \
       --sysroot /layer \
       --initscripts /initial_scripts \
       --seed "%{sysroot-seed}" \
       --noroot --noboot >/dev/null

  - |
    systemd-sysusers --root /layer

  # Apply systemd presets against the staged rootfs. Without this,
  # /usr/lib/systemd/system-preset/*.preset files are dead weight --
  # `systemctl preset-all` is what turns them into the actual
  # /etc/systemd/system/*.wants/ symlinks systemd consults at boot.
  # In particular, this is what enables greetd.service and masks
  # getty@tty1 (per files/oci/systemd-presets/90-cosmic.preset).
  - |
    systemctl --root=/layer preset-all

  # bootc images must not have both /etc and /usr/etc populated.
  # /usr/etc is an ostree implementation detail generated client-side.
  - |
    if [ -d /layer/usr/etc ]; then
      mkdir -p /layer/etc
      cp -a /layer/usr/etc/. /layer/etc/
      rm -rf /layer/usr/etc
    fi

  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: oci
    gzip: disabled
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "COSMIC bootc image (cosmic-build-meta)"
      config:
        Labels:
          'org.opencontainers.image.title': 'COSMIC'
          'org.opencontainers.image.description': 'Upstream COSMIC desktop bootc/OCI image'
          'org.opencontainers.image.vendor': 'razorfinos-org'
          'org.opencontainers.image.licenses': 'GPL-3.0-or-later'
          'org.opencontainers.image.source': 'https://github.com/razorfinos-org/cosmic-build-meta'
          'org.opencontainers.image.url': 'https://github.com/razorfinos-org/cosmic-build-meta'
          'containers.bootc': '1'
      index-annotations:
        'org.opencontainers.image.ref.name': 'ghcr.io/razorfinos-org/cosmic-build-meta:cosmic-nightly'
    EOF
