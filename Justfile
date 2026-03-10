# cosmic-build-meta Justfile
# Wraps BuildStream commands via a containerized bst2 environment

# List available commands
[group('info')]
default:
    @just --list

# Architecture - default to host arch
arch := env_var_or_default("BST_ARCH", `uname -m`)

# Same bst2 container image CI uses -- pinned by SHA for reproducibility
bst2_image := env_var_or_default("BST2_IMAGE", "registry.gitlab.com/freedesktop-sdk/infrastructure/freedesktop-sdk-docker-images/bst2:f89b4aef847ef040b345acceda15a850219eb8f1")

# Common BST options
bst_opts := "--option arch " + arch

# ── BuildStream wrapper ──────────────────────────────────────────────
# Runs any bst command inside the bst2 container via podman.
# Set BST_FLAGS env var to prepend flags (e.g. --no-interactive --config ...).
# Element paths are relative to element-path (elements/) set in project.conf,
# so use e.g. "just bst build cosmic/deps.bst" not "elements/cosmic/deps.bst".
# Usage: just bst build cosmic/deps.bst
#        just bst show cosmic/just.bst
#        BST_FLAGS="--no-interactive" just bst build cosmic/deps.bst
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
            # but there are no LFS objects in this repo. Without these overrides, \
            # LFS smudge/clean filters error out when BuildStream runs git \
            # operations (git_repo source plugin) because there is no LFS server. \
            git config --global filter.lfs.process "git-lfs filter-process --skip" 2>/dev/null; \
            git config --global filter.lfs.smudge "git-lfs smudge --skip -- %f" 2>/dev/null; \
            git config --global filter.lfs.required false 2>/dev/null; \
            ulimit -n 1048576 || true; \
            bst --colors {{bst_opts}} "$@"' -- ${BST_FLAGS:-} {{args}}

# ── Build ────────────────────────────────────────────────────────────

# Build a specific element
[group('build')]
build *elements:
    just bst build {{elements}}

# Build the full COSMIC stack
[group('build')]
build-all:
    just bst build cosmic/deps.bst

# Build just the session (no apps)
[group('build')]
build-session:
    just bst build cosmic/public-stacks/cosmic-session.bst

# Build just the applications
[group('build')]
build-apps:
    just bst build cosmic/public-stacks/cosmic-apps.bst

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
    just bst source track --deps all cosmic/deps.bst

# ── Inspection ───────────────────────────────────────────────────────

# Show element info
[group('info')]
show element:
    just bst show {{element}}

# List all elements in the dependency tree
[group('info')]
list:
    just bst show --format '%{name}' cosmic/deps.bst

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
