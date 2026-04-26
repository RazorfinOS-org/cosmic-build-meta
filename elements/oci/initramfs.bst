# Build a unified initramfs and stage it next to the kernel at
# /usr/lib/modules/$kver/initramfs.img -- exactly where bootc expects it.
#
# Mirrors elements/oci/initramfs.bst from gnome-build-meta. Uses the
# `generate-initramfs` script we ship in cosmic/generate-initramfs.bst.
# The kernel must be staged in the build sandbox so /lib/modules/$kver
# exists, hence the build-depend on components/linux.bst.
#
# x86_64: prepends concatenated AMD + Intel microcode so the result is
# a single combined initrd image.
kind: script

build-depends:
- oci/initramfs/deps.bst
- oci/initramfs/initial-scripts.bst
- cosmic/generate-initramfs.bst
- cosmic/bootc.bst
- freedesktop-sdk.bst:components/linux.bst
- freedesktop-sdk.bst:components/fakecap.bst
- freedesktop-sdk.bst:vm/prepare-image.bst

variables:
  sysroot-seed: 3c60aadb-1985-4d3d-8834-be11dced0050

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap
  ZSTDFLAGS: -T%{max-jobs}
  # Same set gnome-build-meta passes; our vendored copy-initramfs.py
  # also warns-instead-of-fails on any other unavailable optional
  # dlopen() feature, so this list does not need to be exhaustive.
  DLOPEN_NOTE_IGNORE: archive:fido2:qrencode:ip4tc
  INITRD_MODE: oci

environment-nocache:
- ZSTDFLAGS

config:
  commands:
  - mkdir -p /fakecap
  - |
    prepare-image.sh \
       --seed "%{sysroot-seed}" \
       --noroot --noboot >/dev/null

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    # FDSDK uses a multiarch libdir (/usr/lib/$abi). We tell
    # generate-initramfs about both that and its /systemd subdir so
    # libsystemd-shared's dlopen() targets resolve.
    generate-initramfs /initramfs-root "${version}" /usr/lib/%{abi} /usr/lib/%{abi}/systemd /usr/lib /usr/lib/systemd

  - |
    (
      cd /initramfs-root
      find . -print0 | sort -z | cpio --reproducible --null -H newc -o --quiet | zstd ${ZSTDFLAGS} >/initramfs.img
    )

  - |
    # FDSDK's linux-firmware ships AMD microcode but not the
    # pre-concatenated /usr/lib/firmware/intel-ucode/GenuineIntel.bin
    # (that's a Debian/Fedora-packaged artefact). Skip whichever
    # vendor blob isn't present rather than failing the build.
    case '%{arch}' in
      x86_64)
        mkdir -p /microcode/kernel/x86/microcode
        if compgen -G '/usr/lib/firmware/amd-ucode/microcode_amd*.bin' >/dev/null; then
          cat /usr/lib/firmware/amd-ucode/microcode_amd*.bin >/microcode/kernel/x86/microcode/AuthenticAMD.bin
        fi
        if [ -e /usr/lib/firmware/intel-ucode/GenuineIntel.bin ]; then
          cp /usr/lib/firmware/intel-ucode/GenuineIntel.bin /microcode/kernel/x86/microcode/GenuineIntel.bin
        fi
        if compgen -G '/microcode/kernel/x86/microcode/*.bin' >/dev/null; then
          (
            cd /microcode
            find . -print0 | sort -z | cpio --reproducible --null -H newc -o --quiet >/microcode.img
          )
        fi
      ;;
    esac

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    mkdir -p "%{install-root}/usr/lib/modules/${version}"
    initrds=()
    case '%{arch}' in
      x86_64)
        # Only prepend the microcode bundle if we actually built one
        # (depends on whether AMD/Intel ucode is present in linux-firmware).
        if [ -e /microcode.img ]; then
          initrds+=(/microcode.img)
        fi
        ;;
    esac
    initrds+=(/initramfs.img)
    cat "${initrds[@]}" >"%{install-root}/usr/lib/modules/${version}/initramfs.img"

    # FDSDK 25.08's components/linux.bst installs vmlinuz to /boot/vmlinuz
    # (not under /usr/lib/modules/<kver>/), and that path matches no
    # split-rule domain, so it's filtered out of every runtime artifact
    # downstream. bootc install needs it side-by-side with initramfs.img
    # at /usr/lib/modules/<kver>/vmlinuz. Build-deps stage the full
    # sandbox without split filtering, so /boot/vmlinuz is accessible
    # here -- copy it into our install-root and let it ride downstream
    # as part of *our* runtime artifact. Mirrors gnome-build-meta's
    # gnomeos/initramfs/signed-modules.bst, minus the signing.
    cp /boot/vmlinuz "%{install-root}/usr/lib/modules/${version}/vmlinuz"
