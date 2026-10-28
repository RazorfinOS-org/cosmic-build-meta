#!/usr/bin/env bash
# Report pop-os/cosmic-epoch submodules that no element sources, so new
# upstream components get noticed (`bst source track` only follows elements
# we already have). Repos listed in ignore.txt are skipped.
#
# Usage: check-drift.sh [elements-dir]   (exits 1 on drift)
set -euo pipefail

elements="${1:-elements}"
ignore="$(dirname "$0")/ignore.txt"
gitmodules=https://raw.githubusercontent.com/pop-os/cosmic-epoch/master/.gitmodules

upstream="$(curl -fsSL "${gitmodules}" \
    | sed -nE 's#^[[:space:]]*url[[:space:]]*=[[:space:]]*https://github\.com/pop-os/##p' \
    | sed -E 's#/$##; s#\.git$##' | sort -u)"
[ -n "${upstream}" ] || { echo "error: no submodules parsed from ${gitmodules}" >&2; exit 1; }

# Source `url:` lines only: cargo2 refs name pop-os crates via `repo:`.
ours="$(grep -rhE '^[[:space:]-]*url:[[:space:]]*github:pop-os/' "${elements}" \
    | sed -E 's#.*github:pop-os/##; s#\.git$##; s#[[:space:]]+$##' | sort -u)"
skipped="$(sed -E 's/#.*//; s/[[:space:]]+//g; /^$/d' "${ignore}" | sort -u)"

missing="$(comm -23 <(echo "${upstream}") <(echo "${ours}") | comm -23 - <(echo "${skipped}"))"
if [ -z "${missing}" ]; then
    echo "epoch drift: none ($(echo "${upstream}" | wc -l) upstream submodules covered or ignored)"
    exit 0
fi
while read -r repo; do
    msg="cosmic-epoch submodule '${repo}' has no element (add one, or list it in files/epoch/ignore.txt)"
    if [ "${GITHUB_ACTIONS:-}" = true ]; then echo "::error::${msg}"; else echo "${msg}" >&2; fi
done <<< "${missing}"
exit 1
