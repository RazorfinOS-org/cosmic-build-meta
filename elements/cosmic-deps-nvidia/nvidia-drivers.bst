# NVIDIA proprietary driver -- userspace + open kernel modules.
#
# Single element, single source: NVIDIA's self-extracting .run installer.
# It bundles BOTH the closed-source userspace runtime AND the (MIT/GPLv2)
# open-source kernel modules under kernel-open/. Building from the .run's
# kernel-open is what GNOME does and what NVIDIA's release engineering
# actually validates -- the upstream github.com/NVIDIA/open-gpu-kernel-modules
# tag at the same version is the raw source tree, not bit-for-bit identical
# with what ships in the .run, and trips on more kernel-API breakage.
#
# Hardware support (kernel-modules side): Turing+ only (GTX 16xx,
# RTX 20xx/30xx/40xx/50xx, datacenter A/H/L/B). Pascal and earlier
# need the closed-source kernel module which we don't package.
#
# License: NVIDIA's SLA permits redistribution of the userspace
# libraries provided the EULA travels with them. Installed to
# /usr/share/doc/nvidia/LICENSE.
#
# Version pinned to NVIDIA's "Production Branch" channel.
#
# To bump:
#   1. Latest at https://www.nvidia.com/en-us/drivers/unix/
#   2. Update url + ref + filename + nvidia-version below.
#      Compute sha256:
#        curl -sSL https://download.nvidia.com/XFree86/Linux-x86_64/<VER>/NVIDIA-Linux-x86_64-<VER>.run | sha256sum
kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap/coreutils.bst
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/sed.bst
# Kernel module compile.
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/make.bst
- freedesktop-sdk.bst:components/gawk.bst
- freedesktop-sdk.bst:components/findutils.bst
- freedesktop-sdk.bst:components/linux.bst
# Kernel's objtool (run by `LD [M]`) is dynamically linked against
# libxxhash.so.0; without this the module link fails with
# "error while loading shared libraries: libxxhash.so.0".
- freedesktop-sdk.bst:components/xxhash.bst
# Tools the .run installer's makeself wrapper shells out to during
# self-extraction. List is generous; missing tools fail mid-extract
# with cryptic errors.
- freedesktop-sdk.bst:components/grep.bst
- freedesktop-sdk.bst:components/tar.bst
- freedesktop-sdk.bst:components/gzip.bst
- freedesktop-sdk.bst:components/xz.bst
- freedesktop-sdk.bst:components/zstd.bst
- freedesktop-sdk.bst:components/cpio.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
# Kernel modules go in /usr/lib/modules/<kver>/extra/. Co-versioning
# is enforced; depmod runs at OCI image integration time.
- freedesktop-sdk.bst:components/linux.bst

sources:
- kind: remote
  url: https://download.nvidia.com/XFree86/Linux-x86_64/595.71.05/NVIDIA-Linux-x86_64-595.71.05.run
  # SHA256 of the 422 MB .run. NVIDIA does not publish a sidecar; computed
  # locally and committed. Cross-checked against gnome-build-meta MR 4648.
  ref: 36203b8960b7e49c8a42f6ba1f5863cde34a05e93d2b24b798af06dd846f6b82
  filename: NVIDIA-Linux-x86_64-595.71.05.run

variables:
  nvidia-version: '595.71.05'
  strip-binaries: ''

config:
  build-commands:
  - |
    # NOT using `set -e -o pipefail` here: NVIDIA's makeself wrapper
    # uses `tail -c | xz -dc | tar xfp -`. If anything in the pipeline
    # exits before tail finishes flushing (normal), tail SIGPIPEs and
    # the whole shell terminates with exit 143, masking the real error.
    set -u
    chmod +x NVIDIA-Linux-x86_64-%{nvidia-version}.run
    # Bypass NVIDIA's makeself wrapper. The wrapper does curses-y
    # prompting / progress / sanity-check stuff that misbehaves under
    # BST's stripped sandbox (no tty, restricted /proc -- the wrapper
    # SIGTERMs itself or its parent on unexpected signals -> exit 143).
    # We don't need any of it: the .run is just a shell prologue +
    # compressed tarball, and makeself exposes the payload offset.
    SKIP=$(grep -a -m1 -n '^skip=' NVIDIA-Linux-x86_64-%{nvidia-version}.run | head -1 | cut -d: -f1)
    if [ -z "$SKIP" ]; then
        echo "FATAL: couldn't locate makeself skip marker in .run" >&2
        exit 1
    fi
    PAYLOAD_LINE=$(grep -a -m1 '^skip=' NVIDIA-Linux-x86_64-%{nvidia-version}.run | sed 's/skip=//')
    # Sniff the compression magic; makeself's COMPRESS variable name
    # varies across versions, easier to identify the payload directly.
    PAYLOAD_HEAD=$(tail -n +$PAYLOAD_LINE NVIDIA-Linux-x86_64-%{nvidia-version}.run | head -c 6 | od -A n -t x1 | tr -d ' \n')
    case "$PAYLOAD_HEAD" in
        28b52ffd*)         DECOMPRESS="zstd -dc" ;;        # zstd
        fd377a585a00*)     DECOMPRESS="xz -dc" ;;          # xz
        1f8b*)             DECOMPRESS="gzip -dc" ;;        # gzip
        425a68*)           DECOMPRESS="bzip2 -dc" ;;       # bzip2
        *)
            echo "FATAL: unknown payload magic 0x$PAYLOAD_HEAD" >&2
            exit 1
            ;;
    esac
    echo "Payload starts at line $PAYLOAD_LINE, decompressor=$DECOMPRESS"
    mkdir -p extracted
    # --no-same-owner / --no-same-permissions: BST sandbox runs as a
    # single non-root uid that can't chown / can't preserve setuid.
    tail -n +$PAYLOAD_LINE NVIDIA-Linux-x86_64-%{nvidia-version}.run \
        | $DECOMPRESS \
        | tar -xf - -C extracted --no-same-owner --no-same-permissions
    if [ ! -d extracted ] || [ -z "$(ls -A extracted 2>/dev/null)" ]; then
        echo "FATAL: extraction produced empty directory" >&2
        exit 1
    fi
    echo "Extracted $(ls extracted | wc -l) top-level entries"
  - |
    # Build the open kernel modules from the .run's bundled source.
    # This is the path NVIDIA's release engineering validates against
    # current kernels -- using the github tag instead trips on
    # del_timer_sync, hrtimer_init, swiotlb_map_sg_attrs etc. on
    # kernel 6.16+.
    set -euo pipefail
    KVER=$(ls /usr/lib/modules | head -n1)
    if [ -z "$KVER" ] || [ ! -d "/usr/lib/modules/$KVER/build" ]; then
        echo "FATAL: no kernel build tree found under /usr/lib/modules" >&2
        exit 1
    fi
    cd extracted/kernel-open
    # GCC 14+ (FDSDK 25.08) promotes -Wincompatible-pointer-types to
    # a hard error by default; NVIDIA's source still has a couple of
    # benign mismatches. Demote to warning so the build proceeds.
    echo 'EXTRA_CFLAGS += -Wno-error=incompatible-pointer-types' >> Kbuild
    echo "Building NVIDIA kernel modules against $KVER"
    make -j${BST_BUILD_THREADS:-1} KERNEL_UNAME="$KVER"

  install-commands:
  - |
    # Kernel modules. modules_install lays out
    # /usr/lib/modules/<kver>/kernel/drivers/video/nvidia*.ko etc.
    # depmod is intentionally NOT run here; it must run against the
    # composed root, which happens at OCI integration time.
    set -euo pipefail
    KVER=$(ls /usr/lib/modules | head -n1)
    cd extracted/kernel-open
    make -j1 KERNEL_UNAME="$KVER" modules_install \
        INSTALL_MOD_PATH="%{install-root}/usr"
    cd ../..
  - |
    set -euo pipefail
    cd extracted
    LIBDIR="%{install-root}/usr/lib/%{abi}"
    install -d "$LIBDIR" "$LIBDIR/vdpau"

    # Userspace runtime libraries -- the subset every NVIDIA-on-Linux
    # desktop actually loads. Excludes: 32-bit shims, X11-specific
    # plugins, optional tools we don't ship by default.
    for lib in \
        libcuda.so.%{nvidia-version} \
        libnvcuvid.so.%{nvidia-version} \
        libnvidia-allocator.so.%{nvidia-version} \
        libnvidia-cfg.so.%{nvidia-version} \
        libnvidia-eglcore.so.%{nvidia-version} \
        libnvidia-encode.so.%{nvidia-version} \
        libnvidia-fbc.so.%{nvidia-version} \
        libnvidia-glcore.so.%{nvidia-version} \
        libnvidia-glsi.so.%{nvidia-version} \
        libnvidia-glvkspirv.so.%{nvidia-version} \
        libnvidia-ml.so.%{nvidia-version} \
        libnvidia-opticalflow.so.%{nvidia-version} \
        libnvidia-ptxjitcompiler.so.%{nvidia-version} \
        libnvidia-rtcore.so.%{nvidia-version} \
        libnvidia-tls.so.%{nvidia-version} \
        libnvoptix.so.%{nvidia-version} \
        libEGL_nvidia.so.%{nvidia-version} \
        libGLESv1_CM_nvidia.so.%{nvidia-version} \
        libGLESv2_nvidia.so.%{nvidia-version} \
        libGLX_nvidia.so.%{nvidia-version} \
    ; do
        if [ -f "$lib" ]; then
            install -Dm755 "$lib" "$LIBDIR/$lib"
        fi
    done

    # libnvidia-egl-* and libnvidia-vulkan-* use NVIDIA-internal
    # versioning that doesn't track the driver version -- copy by glob.
    for pat in \
        'libnvidia-egl-wayland.so.*' \
        'libnvidia-egl-gbm.so.*' \
        'libnvidia-egl-xlib.so.*' \
        'libnvidia-egl-xcb.so.*' \
        'libnvidia-vulkan-producer.so.*' \
        'libnvidia-pkcs11*.so.*' \
        'libnvidia-nvvm.so.*' \
    ; do
        for f in $pat; do
            [ -f "$f" ] && install -Dm755 "$f" "$LIBDIR/$f" || true
        done
    done

    # SONAME symlinks. NVIDIA's installer creates these post-extract;
    # mimic by walking installed libs and stripping the version.
    for lib in "$LIBDIR"/lib*.so.%{nvidia-version}; do
        [ -f "$lib" ] || continue
        base=$(basename "$lib")
        soname=${base%.%{nvidia-version}}        # libfoo.so
        major_link=${soname}.1                    # libfoo.so.1
        ln -sf "$base" "$LIBDIR/$soname"
        ln -sf "$base" "$LIBDIR/$major_link"
    done
    # libcuda's SONAME is libcuda.so.1.
    [ -e "$LIBDIR/libcuda.so.1" ] || ln -sf "libcuda.so.%{nvidia-version}" "$LIBDIR/libcuda.so.1"

    # Vulkan ICD config.
    if [ -f nvidia_icd.json ]; then
        install -Dm644 nvidia_icd.json \
            "%{install-root}/usr/share/vulkan/icd.d/nvidia_icd.json"
    fi

    # GLVND configs. egl_external_platform.d makes the EGL loader pick
    # NVIDIA's wayland + gbm platforms.
    for f in nvidia_layers.json; do
        [ -f "$f" ] && install -Dm644 "$f" \
            "%{install-root}/usr/share/vulkan/implicit_layer.d/$f" || true
    done
    for f in 10_nvidia.json; do
        [ -f "$f" ] && install -Dm644 "$f" \
            "%{install-root}/usr/share/glvnd/egl_vendor.d/$f" || true
    done
    for f in 10_nvidia_wayland.json 15_nvidia_gbm.json; do
        [ -f "$f" ] && install -Dm644 "$f" \
            "%{install-root}/usr/share/egl/egl_external_platform.d/$f" || true
    done

    # GSP firmware. Turing+ drivers offload work to a chip-internal
    # RISC-V core; nvidia.ko loads the firmware at probe time.
    if [ -d firmware ]; then
        install -d "%{install-root}/usr/lib/firmware/nvidia/%{nvidia-version}"
        for fw in firmware/*.bin; do
            [ -f "$fw" ] && install -Dm644 "$fw" \
                "%{install-root}/usr/lib/firmware/nvidia/%{nvidia-version}/$(basename $fw)" || true
        done
    fi

    # EULA -- redistribution requires the license travels with the libs.
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE \
            "%{install-root}/usr/share/doc/nvidia/LICENSE"
    fi
