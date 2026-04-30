# Final OCI image assembly for COSMIC + NVIDIA.
#
# Same shape as oci/cosmic/image.bst -- build-oci layers our
# oci/cosmic-nvidia/filesystem.bst (squashed sysroot, mounted at
# /layer) on top of the freedesktop-sdk platform OCI image (mounted
# at /parent). Differences from the base variant: pulls a different
# /layer (the NVIDIA stack), tagged with a different ref name and
# label.
kind: script

build-depends:
- freedesktop-sdk.bst:components/fakecap.bst
- freedesktop-sdk.bst:oci/oci-builder.bst
- freedesktop-sdk.bst:vm/prepare-image.bst
- oci/cosmic-nvidia/init-scripts.bst
- filename: freedesktop-sdk.bst:oci/platform-oci.bst
  config:
    location: /parent
- filename: oci/cosmic-nvidia/filesystem.bst
  config:
    location: /layer

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  # Stable seed -> reproducible UUIDs across rebuilds.
  # Different from the default image so the two variants don't share
  # machine IDs / partition UUIDs when both are deployed.
  sysroot-seed: 7f9c5d11-3a26-4b9e-8e21-1d4f3f9e2c57

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

  - |
    systemctl --root=/layer preset-all

  # bootc images must not have both /etc and /usr/etc populated.
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
      comment: "COSMIC + NVIDIA bootc image (cosmic-build-meta)"
      config:
        Labels:
          'org.opencontainers.image.title': 'COSMIC NVIDIA'
          'org.opencontainers.image.description': 'COSMIC desktop bootc/OCI image with NVIDIA proprietary driver'
          'org.opencontainers.image.vendor': 'razorfinos-org'
          'org.opencontainers.image.licenses': 'GPL-3.0-or-later AND LicenseRef-NVIDIA-SLA'
          'org.opencontainers.image.source': 'https://github.com/razorfinos-org/cosmic-build-meta'
          'org.opencontainers.image.url': 'https://github.com/razorfinos-org/cosmic-build-meta'
          'containers.bootc': '1'
      index-annotations:
        'org.opencontainers.image.ref.name': 'ghcr.io/razorfinos-org/cosmic-build-meta:cosmic-nvidia-nightly'
    EOF
