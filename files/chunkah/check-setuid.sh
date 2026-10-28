#!/usr/bin/env bash
# Verify the canonical setuid-root binaries kept their modes and owners
# through an image transform. chunkah advertises "zero diff apart from mtime", but this
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

# Canonical FDSDK setuid set plus nvidia-modprobe, as path:mode:group (all
# owned by root). Entries absent in a given variant are skipped (not every
# binary ships in every image). dbus's launch helper is 4750 root:messagebus
# by design (fix-ownership.sh restores the group); polkit's agent helper is
# socket-activated in polkit 127 and no longer setuid.
setuid_paths=(
    usr/bin/pkexec:4755:root
    usr/bin/sudo:4755:root
    usr/bin/su:4755:root
    usr/bin/mount:4755:root
    usr/bin/umount:4755:root
    usr/bin/passwd:4755:root
    usr/bin/chage:4755:root
    usr/bin/chsh:4755:root
    usr/bin/chfn:4755:root
    usr/bin/gpasswd:4755:root
    usr/bin/newgrp:4755:root
    usr/bin/nvidia-modprobe:4755:root
    usr/libexec/dbus-daemon-launch-helper:4750:messagebus
)

# group_id <name>: gid from the image's own /etc/group, not the host's.
group_id() {
    while IFS=: read -r name _ gid _; do
        [ "$name" = "$1" ] && { echo "$gid"; return 0; }
    done < "$root/etc/group"
    echo "?"
}

fail=0 checked=0
for entry in "${setuid_paths[@]}"; do
    IFS=: read -r f want group <<< "$entry"
    p="$root/$f"
    [ -e "$p" ] || continue
    checked=$((checked + 1))
    read -r mode uid gid <<< "$(stat -c '%a %u %g' "$p")"
    if [ "$mode" = "$want" ] && [ "$uid" = 0 ] && [ "$gid" = "$(group_id "$group")" ]; then
        printf '  ok    %-48s %s root:%s\n' "$f" "$mode" "$group"
    else
        printf '  LOST  %-48s %s %s:%s (expected %s root:%s)\n' \
            "$f" "$mode" "$uid" "$gid" "$want" "$group" >&2
        fail=1
    fi
done

if [ "$checked" = 0 ]; then
    echo "setuid check: WARNING — no setuid binaries found under ${root}" >&2
    exit 1
fi
if [ "$fail" = 0 ]; then
    echo "setuid check: PASS (${checked} binaries at expected modes and owners)"
else
    echo "setuid check: FAIL" >&2
    exit 1
fi
