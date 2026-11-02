#!/usr/bin/env bash
# Restore file ownership BuildStream can't carry: modes survive image
# assembly (fakecap only fakes xattrs), but every file lands root:root.
# Run on the writable rootfs before chunkah, which records each file's real
# uid/gid in the layer tars.
#
# Usage: fix-ownership.sh <rootfs>
set -euo pipefail

root="${1:?usage: fix-ownership.sh <rootfs>}"
[ -d "$root" ] || { echo "no such rootfs: $root" >&2; exit 1; }

# group_id <name>: gid from the image's own /etc/group, not the host's.
group_id() {
    while IFS=: read -r name _ gid _; do
        [ "$name" = "$1" ] && { echo "$gid"; return 0; }
    done < "$root/etc/group"
    echo "error: group '$1' not in $root/etc/group" >&2
    return 1
}

# dbus's launch helper is setuid root but only messagebus may run it.
# chown clears the setuid bit, so the mode is re-applied after.
f="$root/usr/libexec/dbus-daemon-launch-helper"
if [ -e "$f" ]; then
    gid="$(group_id messagebus)"
    chown "0:${gid}" "$f"
    chmod 4750 "$f"
    echo "  set   usr/libexec/dbus-daemon-launch-helper  4750 root:messagebus"
fi
