# cosmic-build-meta Justfile
# Wraps BuildStream commands via a containerized bst2 environment

# List available commands
[group('info')]
default:
    @just --list

# Architecture - default to host arch
arch := env_var_or_default("BST_ARCH", `uname -m`)

# Same bst2 container image CI uses -- pinned by SHA for reproducibility
bst2_image := env_var_or_default("BST2_IMAGE", "registry.gitlab.com/freedesktop-sdk/infrastructure/freedesktop-sdk-docker-images/bst2:8fe67f04619da91755dc2bd923009e723678e24d")

# Common BST options
bst_opts := "--option arch " + arch

# Identity of the local podman image produced by `just load-image`.
# Defaults match the `org.opencontainers.image.ref.name` annotation in
# elements/oci/cosmic/image.bst so the installed system's upgrade origin
# (`bootc upgrade`) points at the same tag we'd push to GHCR.
image_name := env_var_or_default("COSMIC_IMAGE_NAME", "ghcr.io/razorfinos-org/cosmic-build-meta")
image_tag := env_var_or_default("COSMIC_IMAGE_TAG", "nightly")

# Filesystem for `bootc install to-disk` (btrfs|xfs|ext4).
filesystem := env_var_or_default("COSMIC_FILESYSTEM", "btrfs")

# Sparse loopback file `generate-bootable-image` writes the install into.
bootable_image := env_var_or_default("COSMIC_BOOTABLE_IMAGE", "build/bootable.raw")
bootable_size := env_var_or_default("COSMIC_BOOTABLE_SIZE", "30G")

# Sparse target disk attached as a SECOND virtio drive to `boot-iso` /
# `boot-iso-headless` so cosmonaut-installer has somewhere to install
# onto. 60G default; sparse allocation means the file only consumes
# blocks actually written by `bootc install to-filesystem` (~5-10G in
# practice).
install_target := env_var_or_default("COSMIC_INSTALL_TARGET", "build/install-target.raw")
install_target_size := env_var_or_default("COSMIC_INSTALL_TARGET_SIZE", "60G")

# QEMU knobs for `just boot-vm`. The bootc-installed image is UEFI-only
# (systemd-boot lives on the EFI System Partition), so OVMF is mandatory.
# Default firmware path is Fedora's; override on other distros.
vm_memory := env_var_or_default("COSMIC_VM_MEMORY", "4G")
vm_cpus := env_var_or_default("COSMIC_VM_CPUS", "4")
# Static guest resolution. Dynamic resize on host window resize is broken
# upstream -- smithay's ConnectorScanner drops mode-change events on a
# still-Connected connector, so cosmic-comp never sees virtio-gpu's hotplug
# updates. Fix landed in smithay PR #1923 (2026-02-15) but cosmic-comp
# still pins an older rev. Until that propagates, pin a sane initial mode
# big enough for cosmic-initial-setup's 900x650 widget plus chrome.
# Tracker: https://github.com/pop-os/cosmic-epoch/issues/1351
vm_xres := env_var_or_default("COSMIC_VM_XRES", "1680")
vm_yres := env_var_or_default("COSMIC_VM_YRES", "1050")
ovmf_code := env_var_or_default("COSMIC_OVMF_CODE", "/usr/share/edk2/ovmf/OVMF_CODE.fd")
ovmf_vars := env_var_or_default("COSMIC_OVMF_VARS", "/usr/share/edk2/ovmf/OVMF_VARS.fd")

# ── BuildStream wrapper ──────────────────────────────────────────────
# Runs any bst command inside the bst2 container via podman.
# Set BST_FLAGS env var to prepend flags (e.g. --no-interactive --config ...).
# Element paths are relative to element-path (elements/) set in project.conf,
# so use e.g. "just bst build core/deps.bst" not "elements/core/deps.bst".
# Usage: just bst build core/deps.bst
#        just bst show core-deps/just.bst
#        BST_FLAGS="--no-interactive" just bst build core/deps.bst
[group('dev')]
bst *args:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p "${HOME}/.cache/buildstream" "${HOME}/.config/buildstream"
    # Placeholder dirs for `kind: local` sources that are normally
    # populated by host-side prep recipes (build-iso → prep-install-source).
    # BST refuses to load an element whose `kind: local` path doesn't
    # exist, so we keep the dirs around as empty stubs for `bst show` /
    # `bst build` of unrelated elements. The real squashed OCI overwrites
    # them when build-iso runs.
    mkdir -p \
        "{{justfile_directory()}}/build/install-source-cosmic" \
        "{{justfile_directory()}}/build/install-source-cosmic-nvidia"
    # Bump BST's CAS quota to 200G. Default is too small for our
    # workload -- the live ISO artifact is ~25G (OCI image baked in,
    # plus pre-deployed flatpak runtime, plus the COSMIC sysroot) and
    # buildbox-casd's `merklize` step fails with "Insufficient storage
    # quota" when ingesting it. The CAS lives at
    # ~/.cache/buildstream/cas/ on the host (bind-mounted into the
    # container below); the host has ~200G free, so 200G is safe.
    # Adjust if you start hitting host disk pressure -- BST will LRU
    # evict to stay under quota.
    cat > "${HOME}/.config/buildstream/buildstream.conf" <<'CFG'
    cache:
      quota: 200G
    CFG
    # BST_FLAGS env var allows CI to inject --no-interactive, --config, etc.
    # Word-splitting is intentional here (flags are space-separated).
    # shellcheck disable=SC2086
    # EXTRA_MOUNTS env var lets dev workflows bind-mount additional host
    # paths into the sandbox (e.g. an unpublished sibling repo consumed
    # via `kind: local` or a `file:///src/dev/...` URL). Format is one
    # or more space-separated `-v src:dst[:opts]` flags. Unset in CI.
    # Word-splitting is intentional. shellcheck disable=SC2086
    podman run --rm \
        --privileged \
        --device /dev/fuse \
        --network=host \
        -v "{{justfile_directory()}}:/src:rw" \
        -v "${HOME}/.cache/buildstream:/root/.cache/buildstream:rw" \
        -v "${HOME}/.config/buildstream:/root/.config/buildstream:ro" \
        ${EXTRA_MOUNTS:-} \
        -w /src \
        "{{bst2_image}}" \
        bash -c '\
            # Disable Git LFS inside the container: the bst2 image ships git-lfs \
            # but cargo2 vendoring of crate trees breaks if the LFS smudge filter \
            # runs (HangupException -- there is no LFS server for synthetic crate \
            # repos). Cosmic-initial-setup needs an LFS blob (cities.bitcode-v0-6) \
            # but we fetch it as a sidecar `kind: remote` source rather than via \
            # LFS smudge -- see elements/core/cosmic-initial-setup.bst. \
            git config --global filter.lfs.process "git-lfs filter-process --skip" 2>/dev/null; \
            git config --global filter.lfs.smudge "git-lfs smudge --skip -- %f" 2>/dev/null; \
            git config --global filter.lfs.required false 2>/dev/null; \
            ulimit -n 1048576 || true; \
            bst --colors {{bst_opts}} "$@"' -- ${BST_FLAGS:-} {{args}}

# ── Build ────────────────────────────────────────────────────────────

# Build the final COSMIC bootc/OCI image and load it into rootful
# podman storage as ${COSMIC_IMAGE_NAME}:${COSMIC_IMAGE_TAG} so it's
# immediately usable by `just bootc` and `just generate-bootable-image`.
# (Multi-hour cold build the first time.)
# To build a specific element, use `just bst build <element>` directly.
[group('build')]
build:
    just bst build oci/cosmic/image.bst
    just load-image

# Build a specific image variant (cosmic or cosmic-nvidia) and load it
# into rootful podman storage. Used by CI's matrix; locally use this if
# you want to iterate on the nvidia variant without retypng paths.
#
# Tagging follows load-image-variant below: the base variant preserves
# COSMIC_IMAGE_TAG, while non-base variants prefix unqualified tags
# (default cosmic-nvidia -> nvidia-nightly). CI passes already-prefixed
# tags (cosmic-nightly / cosmic-nvidia-nightly), which are preserved.
[group('build')]
build-variant variant="cosmic":
    just bst build oci/{{variant}}/image.bst
    just load-image-variant {{variant}}

# Build the full COSMIC stack only (no system, no image)
[group('build')]
build-all:
    just bst build core/deps.bst

# Build the system dependency aggregate (FDSDK base + COSMIC binaries)
[group('build')]
build-system:
    just bst build cosmic-deps/deps.bst

# Build the squashed COSMIC bootc/OCI sysroot (no image yet)
[group('build')]
build-filesystem:
    just bst build oci/cosmic/filesystem.bst

# Resolve the full dep graph for the OCI image without building.
# Use this to validate elements/* without paying for a build.
[group('info')]
show-image:
    just bst show oci/cosmic/image.bst

# Removed: prefetch-installer-flatpak (and its build/installer-prebake/
# output) was the host-side host-side stage that pre-deployed the
# org.bootcinstaller.Installer Flatpak + GNOME 50 runtime into the live
# ISO. With cosmonaut-installer (libcosmic, no Flatpak), no host-side
# Flatpak prereq exists. Old recipe history available in git for
# reference if anyone needs to bring tuna-installer back temporarily.
# Squash the bootc OCI image (built by `just build` / `just build-variant`)
# into a single layer and stage it at build/install-source-{{variant}}/
# for `oci/{{variant}}/install-source.bst` to import into the live ISO.
#
# Why this exists outside BST: bootc 1.x's composefs backend reads layer
# tarballs via splitstream, which chokes on multi-layer images with
# "Unexpected EOF in splitstream" (same root cause `load-image` already
# squashes around for the registry workflow). build-oci's output is 3
# layers; `podman build --squash-all` collapses them. There is no
# in-BST-sandbox equivalent today (podman/buildah don't run cleanly
# inside an FDSDK build sandbox without significant cap juggling), so
# this is a host-side prep step.
#
# `build-iso` always re-runs this so the staged dir tracks image.bst's
# current artifact -- BST can't see this dir as an upstream of
# install-source.bst, so don't skip it manually.
[group('image')]
prep-install-source variant="cosmic":
    #!/usr/bin/env bash
    set -euo pipefail
    stagedir="build/install-source-{{variant}}-staging"
    outdir="build/install-source-{{variant}}"
    rm -rf "$stagedir" "$outdir"
    mkdir -p "$(dirname "$stagedir")"
    # Build the bootc image first so the checkout always finds an artifact
    # (no-op if already cached). build-iso is the entry point most callers
    # reach this through, so a missing OCI cache should be self-healing.
    just bst build oci/{{variant}}/image.bst
    just bst artifact checkout --directory "$stagedir" oci/{{variant}}/image.bst
    image_id=$(sudo podman pull -q "oci:$stagedir")
    squash_tag="cosmic-build-meta/install-source-{{variant}}:latest"
    printf 'FROM %s\n' "$image_id" | sudo podman build \
        --pull=never \
        --squash-all \
        --security-opt label=type:unconfined_t \
        -t "$squash_tag" \
        -f - .
    sudo podman save --format oci-dir -o "$outdir" "$squash_tag"
    sudo chown -R "$(id -u):$(id -g)" "$outdir"
    sudo podman rmi "$squash_tag" >/dev/null 2>&1 || true
    sudo podman rmi "$image_id" >/dev/null 2>&1 || true
    rm -rf "$stagedir"
    echo "==> install-source staged at $outdir ($(du -sh "$outdir" | cut -f1))"

# Build the Live ISO via BST (kind: script element wrapping
# systemd-repart --offline) and checkout the .iso artifact into
# build/iso/ via reflink. Variant defaults to "cosmic"; pass
# "cosmic-nvidia" for the NVIDIA flavour.
#
# Output: build/iso/cosmic-<variant>-stable-amd64.iso
#
# Runs `prep-install-source` first to refresh the squashed bootc OCI
# baked into the live root for offline install (see that recipe for
# rationale).
#
# `bst artifact checkout --hardlinks` hardlinks files out of CAS into
# the staging directory, so a 4+ GB ISO appears in milliseconds without
# a copy. Reflink-on-btrfs is BST's internal optimisation; the user-
# facing flag is --hardlinks regardless of underlying filesystem.
[group('image')]
build-iso variant="cosmic":
    just prep-install-source {{variant}}
    just bst build installer/live-image-{{variant}}.bst
    mkdir -p build/iso
    rm -rf "build/iso/{{variant}}.staging"
    just bst artifact checkout --hardlinks \
        --directory "build/iso/{{variant}}.staging" \
        installer/live-image-{{variant}}.bst
    mv "build/iso/{{variant}}.staging/live.iso" \
       "build/iso/{{variant}}-stable-amd64.iso"
    rmdir "build/iso/{{variant}}.staging"
    ls -lh "build/iso/{{variant}}-stable-amd64.iso"

# Boot a built ISO in QEMU/UEFI for smoke-testing the live env +
# cosmonaut-installer flow. Requires KVM, edk2-ovmf, qemu-system-x86_64
# on the host. Use `just build-iso <variant>` first.
#
# Attaches the .iso as a virtio block device, not -cdrom. The image is
# a GPT disk image with an ESP (FDSDK 25.08's systemd-repart predates
# --el-torito, so there's no ISO9660 boot catalog), so UEFI has to see
# it as a hard disk to find the ESP and chainload BOOTX64.EFI. Same trick as
# `boot-iso-headless`; same as `dd`-ing the image to a USB stick.
#
# Exposes systemd's debug shell (ttyS1, gated by systemd.debug_shell
# karg in the live UKI cmdline) on a UNIX socket so you can grab a
# root shell without the GUI:
#     socat - UNIX-CONNECT:build/iso-debug-shell-{{variant}}.sock
[group('image')]
boot-iso variant="cosmic":
    #!/usr/bin/env bash
    set -euo pipefail
    LOG="build/iso-console-{{variant}}.log"
    DBGSHELL="build/iso-debug-shell-{{variant}}.sock"
    MONITOR="build/iso-qemu-{{variant}}.sock"
    : > "$LOG"
    rm -f "$DBGSHELL" "$MONITOR"
    if [ ! -f "{{install_target}}" ]; then
        mkdir -p "$(dirname {{install_target}})"
        fallocate -l "{{install_target_size}}" "{{install_target}}"
        echo "==> Allocated {{install_target_size}} sparse target: {{install_target}}"
    fi
    echo "==> Console log:    tail -F ${LOG}"
    echo "==> Debug shell:    socat - UNIX-CONNECT:${DBGSHELL}"
    echo "==> QEMU monitor:   socat - UNIX-CONNECT:${MONITOR}"
    echo "==> Install target: {{install_target}} ({{install_target_size}} sparse) -> /dev/vdb"
    # COSMIC_TPM=1 attaches an emulated TPM2 via swtpm, so the live env
    # sees /dev/tpm0 and cosmonaut-installer's daemon's TPM2 probe
    # returns true. Required for testing TPM2-LUKS install variants.
    # Requires `swtpm` on the host. State persists in build/swtpm-state/
    # so a re-boot of the same install target sees the same TPM history.
    TPM_FLAGS=""
    if [ "${COSMIC_TPM:-}" = "1" ]; then
        TPM_DIR="build/swtpm-state-{{variant}}"
        TPM_SOCK="build/swtpm-{{variant}}.sock"
        mkdir -p "$TPM_DIR"
        pkill -f "swtpm.*${TPM_SOCK}" 2>/dev/null || true
        sleep 0.2
        rm -f "$TPM_SOCK"
        swtpm socket --tpm2 --tpmstate "dir=$TPM_DIR" \
            --ctrl "type=unixio,path=$TPM_SOCK" --daemon
        TPM_FLAGS="-chardev socket,id=chrtpm,path=${TPM_SOCK} -tpmdev emulator,id=tpm0,chardev=chrtpm -device tpm-crb,tpmdev=tpm0"
        echo "==> swtpm: TPM2 emulator at $TPM_SOCK (state: $TPM_DIR)"
    fi
    # Both -serial flags are mandatory: QEMU maps them in order to
    # ttyS0, ttyS1. Without an explicit ttyS0 sink the dbgshell socket
    # becomes ttyS0, which agetty (serial-getty@ttyS0, autoenabled by
    # the `console=ttyS0` karg via systemd-getty-generator) already
    # owns -- and systemd.debug_shell=ttyS1 has no device. Result:
    # connecting the socket lands you at a `cosmic login:` prompt with
    # no usable credentials. Sending ttyS0 to a file routes agetty's
    # garbage there and frees ttyS1 for systemd-debug-shell.
    # shellcheck disable=SC2086
    qemu-system-x86_64 \
        -m 32768 -accel kvm -cpu host -smp 4 \
        -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
        -drive "file=build/iso/{{variant}}-stable-amd64.iso,if=virtio,format=raw,readonly=on" \
        -drive "file={{install_target}},if=virtio,format=raw" \
        -device virtio-net-pci,netdev=net0 \
        -netdev user,id=net0 \
        $TPM_FLAGS \
        -serial "file:${LOG}" \
        -chardev "socket,id=dbgshell,path=${DBGSHELL},server=on,wait=off" \
        -serial chardev:dbgshell \
        -monitor "unix:${MONITOR},server,nowait"

# Boot the ISO with no display, ttyS0 serial tee'd to THIS terminal +
# build/iso-console-<variant>.log, systemd debug shell on ttyS1 mapped
# to a UNIX socket. For CI smoke-tests, automated "did the boot reach
# a known marker" checks, and live diagnosis from a remote/headless
# host.
#
# How to use the debug shell from another terminal:
#     socat - UNIX-CONNECT:build/iso-debug-shell-<variant>.sock
# (Then `journalctl -u greetd`, `systemctl status`, etc.)
#
# Default 300-second timeout; override with TIMEOUT_SECS=N. QEMU runs
# in the background under a pidfile; on timeout we send SIGTERM, then
# SIGKILL after a 5s grace period -- belt and braces against the prior
# behaviour where `timeout` alone occasionally left an orphaned KVM
# process behind.
[group('image')]
boot-iso-headless variant="cosmic":
    #!/usr/bin/env bash
    set -euo pipefail
    LOG="build/iso-console-{{variant}}.log"
    PIDFILE="build/iso-qemu-{{variant}}.pid"
    DBGSHELL="build/iso-debug-shell-{{variant}}.sock"
    MONITOR="build/iso-qemu-{{variant}}.sock"
    : > "$LOG"
    rm -f "$DBGSHELL" "$MONITOR" "$PIDFILE"
    if [ ! -f "{{install_target}}" ]; then
        mkdir -p "$(dirname {{install_target}})"
        fallocate -l "{{install_target_size}}" "{{install_target}}"
        echo "==> Allocated {{install_target_size}} sparse target: {{install_target}}"
    fi
    echo "==> Console log:    tail -F ${LOG}"
    echo "==> Debug shell:    socat - UNIX-CONNECT:${DBGSHELL}"
    echo "==> QEMU monitor:   socat - UNIX-CONNECT:${MONITOR}"
    echo "==> Install target: {{install_target}} -> /dev/vdb"
    # COSMIC_TPM=1 attaches an emulated TPM2 via swtpm. See boot-iso for
    # the same hook + rationale.
    TPM_FLAGS=""
    if [ "${COSMIC_TPM:-}" = "1" ]; then
        TPM_DIR="build/swtpm-state-{{variant}}"
        TPM_SOCK="build/swtpm-{{variant}}.sock"
        mkdir -p "$TPM_DIR"
        pkill -f "swtpm.*${TPM_SOCK}" 2>/dev/null || true
        sleep 0.2
        rm -f "$TPM_SOCK"
        swtpm socket --tpm2 --tpmstate "dir=$TPM_DIR" \
            --ctrl "type=unixio,path=$TPM_SOCK" --daemon
        TPM_FLAGS="-chardev socket,id=chrtpm,path=${TPM_SOCK} -tpmdev emulator,id=tpm0,chardev=chrtpm -device tpm-crb,tpmdev=tpm0"
        echo "==> swtpm: TPM2 emulator at $TPM_SOCK (state: $TPM_DIR)"
    fi
    # Attach the .iso as a virtio block device, not -cdrom -- hybrid
    # GPT disk (no ISO9660 boot catalog yet; systemd-repart in FDSDK
    # 25.08 predates --el-torito), so UEFI needs to see it as a hard
    # disk to find the ESP and chainload BOOTX64.EFI.
    # shellcheck disable=SC2086
    qemu-system-x86_64 \
        -m 32768 -accel kvm -cpu host -smp 4 \
        -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
        -drive "file=build/iso/{{variant}}-stable-amd64.iso,if=virtio,format=raw,readonly=on" \
        -drive "file={{install_target}},if=virtio,format=raw" \
        -device virtio-net-pci,netdev=net0 \
        -netdev user,id=net0 \
        $TPM_FLAGS \
        -display none \
        -serial "file:${LOG}" \
        -chardev "socket,id=dbgshell,path=${DBGSHELL},server=on,wait=off" \
        -serial chardev:dbgshell \
        -monitor "unix:${MONITOR},server,nowait" \
        -pidfile "$PIDFILE" \
        -daemonize
    QEMU_PID=$(cat "$PIDFILE")
    echo "==> QEMU PID $QEMU_PID, waiting up to ${TIMEOUT_SECS:-300}s for boot to settle"
    # Tail the serial log to this terminal so the user sees progress
    # in real time. Kill the tail when QEMU exits or timeout hits.
    tail -F "$LOG" 2>/dev/null &
    TAIL_PID=$!
    trap 'kill "$TAIL_PID" 2>/dev/null || true; kill -TERM "$QEMU_PID" 2>/dev/null || true; sleep 5; kill -KILL "$QEMU_PID" 2>/dev/null || true' EXIT
    DEADLINE=$(( $(date +%s) + ${TIMEOUT_SECS:-300} ))
    while kill -0 "$QEMU_PID" 2>/dev/null; do
        if [ "$(date +%s)" -ge "$DEADLINE" ]; then
            echo "==> Timeout reached, terminating QEMU"
            break
        fi
        sleep 2
    done
    kill "$TAIL_PID" 2>/dev/null || true
    echo
    echo "==== boot markers (kernel/systemd) ===="
    grep -aE 'Linux version|systemd\[1\]|Started|Reached target|FAIL|emergency|panic' "$LOG" | head -40 || true

# Checkout the produced OCI image to ./build/oci-image (skopeo-loadable)
[group('dev')]
checkout-image dir="build/oci-image":
    just bst artifact checkout --directory {{dir}} oci/cosmic/image.bst

# Load the OCI artifact into rootful podman storage as
# ${COSMIC_IMAGE_NAME}:${COSMIC_IMAGE_TAG} (default
# ghcr.io/razorfinos-org/cosmic-build-meta:cosmic-nightly).
#
# Mirrors projectbluefin/dakota's `export` recipe: `podman pull oci:`
# the BST checkout, then `podman build --squash-all` via an inline
# Containerfile to collapse the 3 build-oci layers into a single layer.
# The squash is mandatory -- bootc 1.15.0's splitstream parser chokes
# with "Unexpected EOF in splitstream" reading our raw multi-layer
# build-oci output, but works fine on the squashed result.
#
# Checkout dir lives under build/ because `just bst` only bind-mounts
# {{justfile_directory()}} into the bst2 container.
[group('image')]
load-image:
    #!/usr/bin/env bash
    set -euo pipefail
    stagedir="build/oci-image"
    rm -rf "${stagedir}"
    mkdir -p "$(dirname ${stagedir})"
    just bst artifact checkout --directory "${stagedir}" oci/cosmic/image.bst
    image_id=$(sudo podman pull -q "oci:${stagedir}")
    printf 'FROM %s\n' "${image_id}" | sudo podman build \
        --pull=never \
        --squash-all \
        --security-opt label=type:unconfined_t \
        -t "{{image_name}}:{{image_tag}}" \
        -f - .
    sudo podman rmi "${image_id}" >/dev/null 2>&1 || true

# Variant-aware load-image. Used by CI's matrix and by local-dev runs
# that want to iterate on the cosmic-nvidia image without overwriting
# the cosmic build's podman tag.
#
# Tag scheme: the base `cosmic` variant maps to COSMIC_IMAGE_TAG as-is
# (default :nightly, matching `just build`). Other `cosmic-*` variants
# prefix an unqualified tag with the stripped variant name, but preserve
# tags that are already variant-prefixed. Examples:
#   cosmic + nightly                 -> :nightly
#   cosmic-nvidia + nightly          -> :nvidia-nightly
#   cosmic-nvidia + nvidia-nightly   -> :nvidia-nightly
#   cosmic-nvidia + cosmic-nvidia-*  -> :cosmic-nvidia-*
[group('image')]
load-image-variant variant="cosmic":
    #!/usr/bin/env bash
    set -euo pipefail
    stagedir="build/oci-image-{{variant}}"
    rm -rf "${stagedir}"
    mkdir -p "$(dirname ${stagedir})"
    just bst artifact checkout --directory "${stagedir}" oci/{{variant}}/image.bst
    image_id=$(sudo podman pull -q "oci:${stagedir}")
    case "{{variant}}" in
        cosmic)
            tag="{{image_tag}}"
            ;;
        cosmic-*)
            suffix="$(echo '{{variant}}' | sed 's/^cosmic-//')"
            case "{{image_tag}}" in
                "{{variant}}"|"{{variant}}-"*|"${suffix}"|"${suffix}-"*) tag="{{image_tag}}" ;;
                *) tag="${suffix}-{{image_tag}}" ;;
            esac
            ;;
        *)
            case "{{image_tag}}" in
                "{{variant}}"|"{{variant}}-"*) tag="{{image_tag}}" ;;
                *) tag="{{variant}}-{{image_tag}}" ;;
            esac
            ;;
    esac
    printf 'FROM %s\n' "${image_id}" | sudo podman build \
        --pull=never \
        --squash-all \
        --security-opt label=type:unconfined_t \
        -t "{{image_name}}:${tag}" \
        -f - .
    sudo podman rmi "${image_id}" >/dev/null 2>&1 || true
    echo "Loaded {{image_name}}:${tag}"

# Run `bootc <args>` inside the loaded image, with host container
# storage and /dev exposed (privileged; required for `install to-disk`).
# Mounts the repo at /data so loopback paths under build/ are reachable.
[group('image')]
bootc *args:
    sudo podman run \
        --rm --privileged --pid=host \
        -it \
        -v /var/lib/containers:/var/lib/containers \
        -v /dev:/dev \
        -e RUST_LOG=debug \
        -v "{{justfile_directory()}}:/data" \
        --security-opt label=type:unconfined_t \
        "{{image_name}}:{{image_tag}}" bootc {{args}}

# Allocate a sparse raw disk and `bootc install to-disk` the loaded
# image into it via loopback. Result is a qemu-runnable image at
# ${COSMIC_BOOTABLE_IMAGE} (default build/bootable.raw, 30G sparse).
# Assumes `just load-image` has already populated podman storage.
#
# --source-imgref / --target-imgref are pinned to our localhost image
# so bootc never falls back to detecting the running container's image
# or pulling from a registry. Signature verification is disabled
# because the local image isn't signed.
[group('image')]
generate-bootable-image:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p "$(dirname {{bootable_image}})"
    # Always start from a fresh sparse file. Reusing a previous file
    # leaves on-disk signatures (e.g. btrfs label) that make mkfs.btrfs
    # refuse to overwrite, and `bootc install --wipe` doesn't propagate
    # `-f` to the mkfs invocation. Sparse fallocate is cheap.
    sudo rm -f "{{bootable_image}}"
    fallocate -l "{{bootable_size}}" "{{bootable_image}}"
    # Kargs added here are QEMU-DEBUG-SPECIFIC: stuff we don't want on
    # real-hardware installs of the COSMIC image. Universally-safe
    # kargs (video=Virtual-1:..., quiet, loglevel=3, systemd.show_status=false,
    # vt.global_cursor_default=0) live in
    # files/oci/install-config/cosmic-kargs.toml -- bootc reads that
    # automatically and merges the result into the BLS entries. So the
    # deployed system from `generate-bootable-image` ends up with both
    # the toml-baked kargs AND the ones added below.
    #
    #   console=ttyS0,115200n8 -- kernel + systemd output to serial0.
    #     boot-vm pipes serial0 through `tee build/console.log` so the
    #     full log is available on the host. Intentionally NO
    #     `console=tty0` -- without it the kernel doesn't write to the
    #     GTK display and cosmic-comp paints over a clean black VT.
    #     QEMU-only: serial console on real hw would be a misconfig.
    #   rd.udev.log_level=3   -- silence udev coldplug spam on the
    #     console. udev still logs to journalctl regardless.
    #   systemd.debug_shell=ttyS1 -- always-on emergency root shell on
    #     serial1 (UNIX socket from boot-vm). Reachable even when
    #     greetd is failing. Real hw would expose a passwordless root
    #     shell via the serial port -- definitely QEMU-only.
    #   systemd.log_target=kmsg systemd.log_color=0 -- systemd logs to
    #     the kernel ringbuffer (so they go out ttyS0), no ANSI escapes
    #     that confuse `less` on the serial capture.
    just bootc install to-disk --composefs-backend \
        --source-imgref "containers-storage:{{image_name}}:{{image_tag}}" \
        --target-imgref "{{image_name}}:{{image_tag}}" \
        --target-transport containers-storage \
        --target-no-signature-verification \
        --via-loopback "/data/{{bootable_image}}" \
        --filesystem "{{filesystem}}" \
        --wipe \
        --bootloader systemd \
        --karg console=ttyS0,115200n8 \
        --karg rd.udev.log_level=3 \
        --karg systemd.debug_shell=ttyS1 \
        --karg systemd.log_target=kmsg \
        --karg systemd.log_color=0

# Boot ${COSMIC_BOOTABLE_IMAGE} in QEMU with KVM + UEFI. The OVMF VARS
# file is copied per-boot to build/OVMF_VARS.fd so the host's read-only
# vendor copy isn't mutated and EFI boot entries persist across runs.
[group('image')]
boot-vm:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -e "{{bootable_image}}" ]; then
        echo "error: {{bootable_image}} does not exist; run \`just generate-bootable-image\` first" >&2
        exit 1
    fi
    if [ ! -e "{{ovmf_code}}" ]; then
        echo "error: OVMF firmware not found at {{ovmf_code}}" >&2
        echo "  Fedora:  sudo dnf install edk2-ovmf" >&2
        echo "  Debian:  sudo apt install ovmf  (then set COSMIC_OVMF_CODE=/usr/share/OVMF/OVMF_CODE.fd)" >&2
        echo "  Arch:    sudo pacman -S edk2-ovmf  (then set COSMIC_OVMF_CODE=/usr/share/edk2-ovmf/x64/OVMF_CODE.fd)" >&2
        exit 1
    fi
    mkdir -p build
    if [ ! -e build/OVMF_VARS.fd ]; then
        cp "{{ovmf_vars}}" build/OVMF_VARS.fd
    fi
    # Serial wiring (matches kargs in generate-bootable-image):
    #   serial0 (ttyS0): kernel console + systemd journal -> THIS terminal
    #                    via `-serial mon:stdio` (mux'd with QEMU monitor;
    #                    Ctrl-A C toggles between them). All kernel/systemd
    #                    output appears here at human-readable speed and
    #                    sits in your terminal scrollback after the VM
    #                    quits. Also tee'd to build/console.log for grep.
    #   serial1 (ttyS1): systemd.debug_shell=ttyS1 -- always-on root
    #                    shell bound to a UNIX socket. From another
    #                    terminal:
    #                       socat - UNIX-CONNECT:build/debug-shell.sock
    rm -f build/console.log build/debug-shell.sock
    echo "==> Serial console: this terminal (also tee'd to build/console.log)"
    echo "==> Debug shell:    socat - UNIX-CONNECT:build/debug-shell.sock"
    echo "==> QEMU monitor:   Ctrl-A then C in this terminal"
    echo
    qemu-system-x86_64 \
        -enable-kvm \
        -cpu host \
        -smp "{{vm_cpus}}" \
        -m "{{vm_memory}}" \
        -machine q35 \
        -drive if=pflash,format=raw,readonly=on,file="{{ovmf_code}}" \
        -drive if=pflash,format=raw,file=build/OVMF_VARS.fd \
        -drive file="{{bootable_image}}",format=raw,if=virtio \
        -device virtio-net-pci,netdev=net0 \
        -netdev user,id=net0 \
        -device virtio-vga-gl,xres="{{vm_xres}}",yres="{{vm_yres}}",edid=on \
        -display gtk,gl=on,zoom-to-fit=on,show-cursor=on \
        -device virtio-rng-pci \
        -serial mon:stdio \
        -chardev socket,id=dbgshell,path=build/debug-shell.sock,server=on,wait=off \
        -serial chardev:dbgshell \
        2>&1 | tee build/console.log

# Build just the session (no apps)
[group('build')]
build-session:
    just bst build core/public-stacks/cosmic-session.bst

# Build just the applications
[group('build')]
build-apps:
    just bst build core/public-stacks/cosmic-apps.bst

# Clean the build cache
[group('build')]
clean:
    just bst artifact delete --all

# ── Source tracking ──────────────────────────────────────────────────

# Track all junction sources to get latest refs
[group('track')]
track-junctions:
    just bst source track freedesktop-sdk.bst

# Track element sources
[group('track')]
track *elements:
    just bst source track {{elements}}

# Track all COSMIC element sources (recursive)
[group('track')]
track-all:
    just bst source track --deps all core/deps.bst

# ── Inspection ───────────────────────────────────────────────────────

# Validate all element definitions (YAML parsing, deps, variables)
[group('info')]
check:
    just bst show --deps all core/deps.bst

# Show element info
[group('info')]
show element:
    just bst show {{element}}

# List all elements in the dependency tree
[group('info')]
list:
    just bst show --format '%{name}' core/deps.bst

# Show the dependency tree for an element
[group('info')]
deps element:
    just bst show --deps all --format '%{name}' {{element}}

# ── Development ──────────────────────────────────────────────────────

# Shell into an element's build sandbox
[group('dev')]
shell element:
    just bst shell {{element}}

# Open a workspace for live editing
[group('dev')]
workspace-open element:
    just bst workspace open {{element}} workspaces/{{element}}

# Close a workspace
[group('dev')]
workspace-close element:
    just bst workspace close {{element}}

# Checkout built artifacts to a directory
[group('dev')]
checkout element dir:
    just bst artifact checkout --directory {{dir}} {{element}}
