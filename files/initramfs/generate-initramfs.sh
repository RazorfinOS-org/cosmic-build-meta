#!/bin/bash
# Vendored from gnome-build-meta files/gnomeos/generate-initramfs/
# (MIT, Copyright (c) 2017 freedesktop-sdk / GNOME Foundation).

set -eu

root="$1"
kernelver="$2"
shift 2
libdirs=("$@")

for mod in /usr/share/generate-initramfs/modules/*; do
    /usr/libexec/generate-initramfs/run-module.sh "${root}" "${kernelver}" "${mod}" "${libdirs[@]}"
done

ldconfig -r "${root}"
depmod -a -b "${root}/usr" "${kernelver}"
