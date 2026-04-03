# cosmic-build-meta

BuildStream 2.x meta-project for building the [COSMIC](https://github.com/pop-os/cosmic-epoch) desktop environment.

## Overview

This project builds all COSMIC desktop components from source using [BuildStream](https://buildstream.build/) on top of [freedesktop-sdk](https://freedesktop-sdk.io/) as the base runtime. It is designed to be consumed as a **junction** by downstream projects that assemble complete OS images.

## Requirements

- [podman](https://podman.io/) (container runtime)
- [just](https://github.com/casey/just) (command runner)
- ~50 GB free disk space (for build cache)

## Quick Start

```sh
# Build the full COSMIC stack
just build-all

# Build a single component
just build cosmic/cosmic-comp.bst

# Track upstream sources for latest refs
just track cosmic/cosmic-comp.bst

# Open a shell in a component's build sandbox
just shell cosmic/cosmic-comp.bst
```

Run `just` with no arguments to see all available commands.

## Project Structure

```
project.conf                          # BuildStream configuration
Justfile                              # Podman wrapper for bst commands
elements/
  freedesktop-sdk.bst                 # Junction to freedesktop-sdk base
  cosmic/
    deps.bst                          # Stack: all COSMIC components
    public-stacks/
      cosmic-session.bst              # Stack: minimal desktop session
      cosmic-apps.bst                 # Stack: COSMIC applications
      cosmic-full.bst                 # Stack: complete desktop
    cosmic-comp.bst                   # Wayland compositor
    cosmic-session.bst                # Session manager
    cosmic-panel.bst                  # Desktop panel
    ...                               # (30+ component elements)
  plugins/
    buildstream-plugins.bst           # Core BST plugins
    buildstream-plugins-community.bst # Community BST plugins
plugins/
  local/sources/cargo2.py             # Custom cargo2 plugin with submodule support
include/
  aliases.yml                         # URL aliases for source repos
```

## Using as a Junction

Downstream projects can pull in cosmic-build-meta as a BuildStream junction:

```yaml
# elements/cosmic-build-meta.bst
kind: junction

sources:
- kind: git_repo
  url: github:RazorfinOS-org/cosmic-build-meta.git
  track: main
  ref: <commit-ref>
```

Then depend on the public stacks:

```yaml
# Full desktop with all apps
depends:
  - cosmic-build-meta.bst:cosmic/public-stacks/cosmic-full.bst

# Or just the session (no apps)
depends:
  - cosmic-build-meta.bst:cosmic/public-stacks/cosmic-session.bst

# Or cherry-pick individual components
depends:
  - cosmic-build-meta.bst:cosmic/cosmic-comp.bst
  - cosmic-build-meta.bst:cosmic/cosmic-panel.bst
```

To override the freedesktop-sdk junction with your own:

```yaml
# elements/cosmic-build-meta.bst
kind: junction
sources: [...]
config:
  overrides:
    freedesktop-sdk.bst: freedesktop-sdk.bst
```

## Public Stacks

| Stack | Description |
|-------|-------------|
| `cosmic-session.bst` | Compositor, session, shell, greeter, icons, wallpapers |
| `cosmic-apps.bst` | Files, Edit, Terminal, Store, Settings, Player, etc. |
| `cosmic-full.bst` | Session + Apps |

## Architecture

All COSMIC Rust components are built with `kind: manual` using `cargo build --release --frozen` and the custom cargo2 source plugin for dependency vendoring. The cargo2 plugin includes support for git submodules required by some COSMIC crates.

Base system libraries (wayland, libinput, mesa, systemd, etc.) come from the freedesktop-sdk junction.

## Known Build Workarounds

| Component | Workaround | Reason |
|-----------|-----------|--------|
| All Rust elements | `RUSTFLAGS="-C link-arg=-fuse-ld=lld"` | freedesktop-sdk sandbox requires lld |
| All `kind: manual` | Explicit `PKG_CONFIG_PATH` | Sandbox doesn't set this by default |
| cosmic-greeter | `VERGEN_IDEMPOTENT=true` | build.rs uses vergen which expects git |
| cosmic-edit | `RUSTONIG_SYSTEM_LIBONIG=1` | Use system oniguruma instead of bundled |
| greetd | Sed patch for nix crate features | Vendored nix 0.28 needs `"feature"` feature |

## Supported Architectures

- x86_64 (primary)
- aarch64
- riscv64 (experimental)
