#!/usr/bin/env bash
# Verify the canonical setuid-root binaries kept mode 4755 through an image
# transform. chunkah advertises "zero diff apart from mtime", but this
# project has lost setuid bits in image transforms before (see the BST
# compose / fakecap history), so the chunkah round-trip gets the same guard
# the live-ISO path already applies. Run against the rootfs of the chunked
# image; a regression here means non-root privilege escalation is broken
# (pkexec/sudo/nvidia-modprobe) on the deployed system.
#
# Usage: check-setuid.sh <rootfs>
set -euo pipefail

root="${1:?usage: check-setuid.sh <rootfs>}"
[ -d "$root" ] || { echo "no such rootfs: $root" >&2; exit 1; }

# Canonical FDSDK setuid set plus nvidia-modprobe. Entries absent in a
# given variant are skipped (not every binary ships in every image).
setuid_paths=(
    usr/bin/pkexec
    usr/bin/sudo
    usr/bin/su
    usr/bin/mount
    usr/bin/umount
    usr/bin/passwd
    usr/bin/chage
    usr/bin/chsh
    usr/bin/chfn
    usr/bin/gpasswd
    usr/bin/newgrp
    usr/bin/nvidia-modprobe
    usr/libexec/dbus-daemon-launch-helper
    usr/lib/polkit-1/polkit-agent-helper-1
    usr/lib/x86_64-linux-gnu/polkit-1/polkit-agent-helper-1
)

fail=0 checked=0
for f in "${setuid_paths[@]}"; do
    p="$root/$f"
    [ -e "$p" ] || continue
    checked=$((checked + 1))
    mode=$(stat -c '%a' "$p")
    if [ "$mode" = "4755" ]; then
        printf '  ok    %-48s %s\n' "$f" "$mode"
    else
        printf '  LOST  %-48s %s (expected 4755)\n' "$f" "$mode" >&2
        fail=1
    fi
done

if [ "$checked" = 0 ]; then
    echo "setuid check: WARNING — no setuid binaries found under ${root}" >&2
    exit 1
fi
if [ "$fail" = 0 ]; then
    echo "setuid check: PASS (${checked} binaries at 4755)"
else
    echo "setuid check: FAIL" >&2
    exit 1
fi
