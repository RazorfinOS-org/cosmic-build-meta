#!/usr/bin/env bash
# Assign chunkah content "components" to the COSMIC rootfs via user.component
# (+ user.update-interval) xattrs, so `chunkah build` emits content-based
# layers instead of dumping everything into one blob.
#
# Why this exists: chunkah derives good layer groupings from a component
# source. RPM images get that free from the rpmdb; this image is
# BuildStream/FDSDK-based and has none, so we supply components by hand.
# chunkah reads these xattrs at build time (coreos/chunkah
# src/components/xattr.rs):
#   - a directory's user.component is INHERITED by everything beneath it,
#     unless a descendant sets its own (child overrides parent);
#   - user.update-interval attaches to the whole component; conflicting
#     values across one component are a hard error, so we keep each
#     component's interval single;
#   - symlinks can't hold xattrs but inherit their parent's component.
#
# We only tag the high-value, independently-versioned groups. chunkah's
# bigfiles/unclaimed logic already breaks out and distributes the untagged
# base sensibly, so tagging everything is unnecessary. Intervals track how
# often each group actually moves (better packing = better update deltas):
#   kernel/nvidia ~monthly, firmware ~quarterly, COSMIC + gaming weekly.
#
# Usage: assign-components.sh <rootfs>
set -euo pipefail

root="${1:?usage: assign-components.sh <rootfs>}"
[ -d "$root" ] || { echo "no such rootfs: $root" >&2; exit 1; }

# assign <component> <interval> <path>...
# Set component + interval on each existing path. On a directory the
# component propagates to descendants. Passing one interval per component
# everywhere avoids chunkah's conflicting-interval error.
assign() {
    local comp="$1" interval="$2"; shift 2
    local p
    for p in "$@"; do
        [ -e "$p" ] || continue
        setfattr -n user.component -v "$comp" "$p"
        setfattr -n user.update-interval -v "$interval" "$p"
        printf '  %-9s <- %s\n' "$comp" "${p#"$root"}"
    done
}

# assign_glob <component> <interval> <dir> <name-pattern>
# Per-file tagging for a component scattered among unrelated files in a
# shared directory (e.g. libnvidia*.so amid the base multiarch libdir,
# where the directory itself must stay "base").
assign_glob() {
    local comp="$1" interval="$2" dir="$3" pat="$4"
    [ -d "$dir" ] || return 0
    local n
    n=$(find "$dir" -maxdepth 1 -name "$pat" \
            \( -exec setfattr -n user.component -v "$comp" {} \; \
               -a -exec setfattr -n user.update-interval -v "$interval" {} \; \
               -a -print \) | wc -l)
    [ "$n" -gt 0 ] && printf '  %-9s <- %s/%s (%s)\n' "$comp" "${dir#"$root"}" "$pat" "$n"
    return 0
}

echo "Assigning chunkah components under ${root}:"

# --- kernel: modules move as a unit with the kernel; ~monthly bumps ---
assign kernel monthly "$root/usr/lib/modules"

# --- firmware: huge, rarely changes; isolate so a kernel bump doesn't drag
#     the whole firmware tree along in the delta ---
assign firmware quarterly "$root/usr/lib/firmware"

# --- nvidia: userspace scattered across the multiarch libdir + bins, plus
#     its own firmware subtree (this dir override wins over "firmware") ---
for abi in x86_64-linux-gnu aarch64-linux-gnu; do
    libdir="$root/usr/lib/$abi"
    assign_glob nvidia monthly "$libdir" 'libnvidia*'
    assign_glob nvidia monthly "$libdir" 'libGLX_nvidia*'
    assign_glob nvidia monthly "$libdir" 'libEGL_nvidia*'
    assign_glob nvidia monthly "$libdir" 'libGLESv*_nvidia*'
    assign_glob nvidia monthly "$libdir" 'libcuda*'
    assign_glob nvidia monthly "$libdir" 'libnvoptix*'
done
assign nvidia monthly "$root/usr/lib/firmware/nvidia"
for b in nvidia-smi nvidia-modprobe nvidia-persistenced nvidia-debugdump \
         nvidia-cuda-mps-control nvidia-cuda-mps-server; do
    assign nvidia monthly "$root/usr/bin/$b"
done

# --- COSMIC desktop: tracks upstream frequently (weekly source-track job) ---
for abi in x86_64-linux-gnu aarch64-linux-gnu; do
    assign_glob cosmic weekly "$root/usr/lib/$abi" 'libcosmic*'
done
assign_glob cosmic weekly "$root/usr/bin" 'cosmic-*'
assign cosmic weekly \
    "$root/usr/bin/xdg-desktop-portal-cosmic" \
    "$root/usr/share/cosmic" \
    "$root/usr/share/cosmic-launcher" \
    "$root/usr/share/icons/Cosmic"

# --- gaming: Steam/gamescope/tools + the 32-bit compat libdir (present only
#     in gaming builds; the guards no-op it otherwise) ---
assign gaming weekly "$root/usr/lib/i386-linux-gnu"
assign_glob gaming weekly "$root/usr/bin" 'steam*'
assign_glob gaming weekly "$root/usr/bin" 'gamescope*'
for b in mangohud vkbasalt inputplumber; do
    assign gaming weekly "$root/usr/bin/$b"
done

echo "Component assignment done."
