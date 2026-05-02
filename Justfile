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
    mkdir -p "${HOME}/.cache/buildstream"
    # BST_FLAGS env var allows CI to inject --no-interactive, --config, etc.
    # Word-splitting is intentional here (flags are space-separated).
    # shellcheck disable=SC2086
    podman run --rm \
        --privileged \
        --device /dev/fuse \
        --network=host \
        -v "{{justfile_directory()}}:/src:rw" \
        -v "${HOME}/.cache/buildstream:/root/.cache/buildstream:rw" \
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
    # Kargs:
    #   console=ttyS0         -- kernel + systemd output goes to serial0
    #                            only. boot-vm pipes this through `tee
    #                            build/console.log` so the full log is
    #                            available on the host. Intentionally NO
    #                            `console=tty0` -- without it, the kernel
    #                            doesn't write to the GTK display, so
    #                            cosmic-comp paints over a clean black
    #                            VT instead of competing with scrolling
    #                            boot text.
    #   quiet loglevel=3      -- silence kernel printk below WARN. The
    #                            ones we'd actually want to see in a hang
    #                            still go to ttyS0 because dmesg keeps
    #                            the full ringbuffer regardless.
    #   systemd.show_status=false rd.udev.log_level=3
    #                         -- silence systemd's per-unit start lines
    #                            and udev's coldplug spam (both go to
    #                            tty0 by default, even without
    #                            console=tty0).
    #   vt.global_cursor_default=0
    #                         -- hide the blinking text cursor on tty0
    #                            during the brief window before
    #                            cosmic-comp takes over the display.
    #   systemd.debug_shell=ttyS1
    #                         -- always-on emergency root shell on
    #                            serial1 (UNIX socket), reachable even
    #                            when graphical session is broken.
    #   systemd.log_target=kmsg systemd.log_color=0
    #                         -- systemd logs to the kernel ringbuffer
    #                            (so they go out ttyS0 alongside kernel
    #                            messages), no ANSI escapes that confuse
    #                            `less` on the serial capture.
    #   video=Virtual-1:{{vm_xres}}x{{vm_yres}}
    #                         -- pin the virtio-gpu connector to a fixed
    #                            mode at boot. Belt-and-suspenders with
    #                            `-device virtio-vga-gl,xres=,yres=,edid=on`
    #                            in `boot-vm`. Needed because cosmic-comp
    #                            doesn't react to dynamic mode changes
    #                            on an already-connected connector
    #                            (smithay PR #1923, not yet picked up
    #                            by cosmic-comp's pinned rev). Without
    #                            this, the kernel's default preferred
    #                            mode is 640x480; even 1280x800 clips
    #                            cosmic-initial-setup's create-account
    #                            page (avatar + 4 inputs + buttons need
    #                            ~880px tall to render without dropping
    #                            the password fields off the bottom).
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
        --karg quiet \
        --karg loglevel=3 \
        --karg systemd.show_status=false \
        --karg rd.udev.log_level=3 \
        --karg vt.global_cursor_default=0 \
        --karg systemd.debug_shell=ttyS1 \
        --karg systemd.log_target=kmsg \
        --karg systemd.log_color=0 \
        --karg video=Virtual-1:{{vm_xres}}x{{vm_yres}}

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
