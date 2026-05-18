# NVIDIA proprietary driver: userspace + open kernel modules from the
# self-extracting .run installer. Hardware support is Turing+ only.
#
# The EULA is installed to /usr/share/doc/nvidia/LICENSE. To bump, update
# nvidia-version, URL, filename, and SHA256 from NVIDIA's Unix driver page.
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
# Kernel objtool dependency.
- freedesktop-sdk.bst:components/xxhash.bst
# Tools used while extracting the .run payload.
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
    # Avoid pipefail here: the makeself/tar pipeline can SIGPIPE normally.
    set -u
    chmod +x NVIDIA-Linux-x86_64-%{nvidia-version}.run
    # Bypass the interactive makeself wrapper; extract its tar payload directly.
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
    # Build the .run-bundled open modules; this matches NVIDIA/GNOME packaging.
    set -euo pipefail
    KVER=$(ls /usr/lib/modules | head -n1)
    if [ -z "$KVER" ] || [ ! -d "/usr/lib/modules/$KVER/build" ]; then
        echo "FATAL: no kernel build tree found under /usr/lib/modules" >&2
        exit 1
    fi
    cd extracted/kernel-open
    # NVIDIA 595 has benign pointer-type warnings that GCC 14 treats as errors.
    echo 'EXTRA_CFLAGS += -Wno-error=incompatible-pointer-types' >> Kbuild
    echo "Building NVIDIA kernel modules against $KVER"
    make -j${BST_BUILD_THREADS:-1} KERNEL_UNAME="$KVER"

  install-commands:
  - |
    # Kernel modules; depmod runs later against the composed root.
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
    BINDIR="%{install-root}/usr/bin"
    install -d "$LIBDIR" "$LIBDIR/vdpau" "$BINDIR"

    # Install userspace libraries by glob so .run layout changes do not
    # silently drop the EGL/GLVND stack. Keep 64-bit runtime libs only;
    # include bundled egl-wayland v1 and exclude the unused v2 bridge.
    find . -maxdepth 4 -type f \
        \( -name 'libcuda.so.*' \
        -o -name 'libnvcuvid.so.*' \
        -o -name 'libnvidia-*.so.*' \
        -o -name 'libnvoptix.so.*' \
        -o -name 'libEGL_nvidia.so.*' \
        -o -name 'libGLESv1_CM_nvidia.so.*' \
        -o -name 'libGLESv2_nvidia.so.*' \
        -o -name 'libGLX_nvidia.so.*' \) \
        ! -path '*/32/*' \
        ! -name 'libnvidia-egl-wayland2.so*' \
        -exec install -Dm755 -t "$LIBDIR" {} +

    # Recreate SONAME links that NVIDIA's installer would normally add,
    # including non-driver-versioned EGL/GBM platform libraries.
    for lib in "$LIBDIR"/lib*.so*; do
        [ -f "$lib" ] || continue
        base=$(basename "$lib")
        soname=$(objdump -p "$lib" 2>/dev/null | sed '/ *SONAME */{s///;q};d')
        if [ -n "$soname" ] && [ ! -e "$LIBDIR/$soname" ]; then
            ln -sf "$base" "$LIBDIR/$soname"
        fi

        # Best-effort devel-style link for driver-versioned blobs.
        case "$base" in
            *.so.%{nvidia-version})
                stem=${base%.%{nvidia-version}}
                [ -e "$LIBDIR/$stem" ] || ln -sf "$base" "$LIBDIR/$stem"
                ;;
        esac
    done
    # libcuda's SONAME is libcuda.so.1.
    [ -e "$LIBDIR/libcuda.so.1" ] || ln -sf "libcuda.so.%{nvidia-version}" "$LIBDIR/libcuda.so.1"

    # GBM backend entry point used by libgbm/egl consumers.
    install -d "$LIBDIR/gbm"
    ln -sf ../libnvidia-allocator.so.1 "$LIBDIR/gbm/nvidia-drm_gbm.so"

    # Keep the binary set narrow. nvidia-modprobe is installed separately
    # with setuid so non-root NVIDIA userspace can create auxiliary nodes.
    # The OCI image replays this via fakecap; the Live ISO restores setuid
    # in include/live-image-common.yml.
    for bin in nvidia-smi nvidia-debugdump \
               nvidia-persistenced nvidia-cuda-mps-control \
               nvidia-cuda-mps-server nvidia-bug-report.sh; do
        path=$(find . -maxdepth 4 -type f -name "$bin" | head -1)
        if [ -n "$path" ]; then
            install -Dm755 "$path" "$BINDIR/$bin"
        fi
    done
    # nvidia-modprobe gets the setuid bit.
    path=$(find . -maxdepth 4 -type f -name nvidia-modprobe | head -1)
    if [ -n "$path" ]; then
        install -Dm4755 "$path" "$BINDIR/nvidia-modprobe"
    fi

    # Persistence daemon, matching common Fedora/RPM Fusion style packaging.
    install -d "%{install-root}/usr/lib/systemd/system" \
               "%{install-root}/usr/lib/sysusers.d" \
               "%{install-root}/usr/lib/systemd/system-preset"
    cat > "%{install-root}/usr/lib/sysusers.d/nvidia-persistenced.conf" <<'EOF'
    u nvidia-persistenced - "NVIDIA Persistence Daemon" /var/lib/nvidia-persistenced /usr/sbin/nologin
    EOF
    cat > "%{install-root}/usr/lib/systemd/system/nvidia-persistenced.service" <<'EOF'
    [Unit]
    Description=NVIDIA Persistence Daemon

    [Service]
    Type=forking
    PIDFile=/run/nvidia-persistenced/nvidia-persistenced.pid
    Restart=always
    ExecStart=/usr/bin/nvidia-persistenced
    User=nvidia-persistenced
    Group=nvidia-persistenced
    RuntimeDirectory=nvidia-persistenced
    TimeoutSec=300

    [Install]
    WantedBy=multi-user.target
    EOF
    cat > "%{install-root}/usr/lib/systemd/system-preset/90-nvidia.preset" <<'EOF'
    enable nvidia-persistenced.service
    EOF

    # ICD / GLVND / EGL platform JSONs. Match by basename so we don't
    # care whether the .run keeps these at top level or nests them.
    for f in nvidia_icd.json; do
        path=$(find . -maxdepth 3 -type f -name "$f" | head -1)
        [ -n "$path" ] && install -Dm644 "$path" \
            "%{install-root}/usr/share/vulkan/icd.d/$f" || true
    done
    for f in nvidia_layers.json; do
        path=$(find . -maxdepth 3 -type f -name "$f" | head -1)
        [ -n "$path" ] && install -Dm644 "$path" \
            "%{install-root}/usr/share/vulkan/implicit_layer.d/$f" || true
    done
    for f in 10_nvidia.json; do
        path=$(find . -maxdepth 3 -type f -name "$f" | head -1)
        [ -n "$path" ] && install -Dm644 "$path" \
            "%{install-root}/usr/share/glvnd/egl_vendor.d/$f" || true
    done
    for f in 10_nvidia_wayland.json 15_nvidia_gbm.json; do
        path=$(find . -maxdepth 3 -type f -name "$f" | head -1)
        [ -n "$path" ] && install -Dm644 "$path" \
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

    # Paranoia: ensure the NVIDIA libdir is on the dynamic linker path.
    install -d "%{install-root}/etc/ld.so.conf.d"
    printf '/usr/lib/%s\n' "%{abi}" > "%{install-root}/etc/ld.so.conf.d/00-nvidia.conf"

    # Build-time sanity checks for the load-bearing userspace pieces.
    if [ ! -f "$LIBDIR/libGLX_nvidia.so.%{nvidia-version}" ]; then
        echo "FATAL: libGLX_nvidia.so.%{nvidia-version} missing from $LIBDIR after install" >&2
        echo "  -> .run layout likely changed; userspace find pattern needs an update" >&2
        echo "Top-level entries in extracted/:" >&2
        ls . | head -40 >&2
        echo "All libGLX*/libEGL* found:" >&2
        find . -maxdepth 4 -type f \( -name 'libGLX*' -o -name 'libEGL*' \) >&2
        exit 1
    fi
    if [ ! -x "$BINDIR/nvidia-smi" ]; then
        echo "FATAL: nvidia-smi missing from $BINDIR after install" >&2
        find . -maxdepth 4 -type f -name 'nvidia-smi' >&2 || true
        exit 1
    fi
    if [ ! -e "$LIBDIR/libnvidia-egl-gbm.so.1" ]; then
        echo "FATAL: libnvidia-egl-gbm.so.1 SONAME symlink missing from $LIBDIR" >&2
        find "$LIBDIR" -maxdepth 1 -name 'libnvidia-egl-gbm.so*' -ls >&2 || true
        exit 1
    fi
    if [ ! -e "$LIBDIR/gbm/nvidia-drm_gbm.so" ]; then
        echo "FATAL: GBM backend symlink missing from $LIBDIR/gbm" >&2
        find "$LIBDIR" -maxdepth 2 -name '*gbm*' -ls >&2 || true
        exit 1
    fi
