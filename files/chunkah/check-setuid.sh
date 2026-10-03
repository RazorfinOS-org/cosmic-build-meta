#!/usr/bin/env bash
# Verify the canonical setuid-root binaries kept their modes through an image
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

# Canonical FDSDK setuid set plus nvidia-modprobe, as path:mode. Entries
# absent in a given variant are skipped (not every binary ships in every
# image). dbus's launch helper is 4750 root:messagebus by design; polkit's
# agent helper is socket-activated in polkit 127 and no longer setuid.
setuid_paths=(
    usr/bin/pkexec:4755
    usr/bin/sudo:4755
    usr/bin/su:4755
    usr/bin/mount:4755
    usr/bin/umount:4755
    usr/bin/passwd:4755
    usr/bin/chage:4755
    usr/bin/chsh:4755
    usr/bin/chfn:4755
    usr/bin/gpasswd:4755
    usr/bin/newgrp:4755
    usr/bin/nvidia-modprobe:4755
    usr/libexec/dbus-daemon-launch-helper:4750
)

fail=0 checked=0
for entry in "${setuid_paths[@]}"; do
    f=${entry%:*} want=${entry##*:}
    p="$root/$f"
    [ -e "$p" ] || continue
    checked=$((checked + 1))
    mode=$(stat -c '%a' "$p")
    if [ "$mode" = "$want" ]; then
        printf '  ok    %-48s %s\n' "$f" "$mode"
    else
        printf '  LOST  %-48s %s (expected %s)\n' "$f" "$mode" "$want" >&2
        fail=1
    fi
done

if [ "$checked" = 0 ]; then
    echo "setuid check: WARNING — no setuid binaries found under ${root}" >&2
    exit 1
fi
if [ "$fail" = 0 ]; then
    echo "setuid check: PASS (${checked} binaries at expected modes)"
else
    echo "setuid check: FAIL" >&2
    exit 1
fi
