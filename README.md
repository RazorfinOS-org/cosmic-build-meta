# cosmic-build-meta

The [COSMIC](https://github.com/pop-os/cosmic-epoch) desktop as a **bootc/OCI image**, built with [BuildStream 2.x](https://buildstream.build/) on top of [freedesktop-sdk](https://freedesktop-sdk.io/). Boots end-to-end into `cosmic-initial-setup` in QEMU. Also consumable as a BuildStream **junction** by downstream OS-image projects.

## Status

- 75 local elements (`elements/`), ~691 with freedesktop-sdk transitives. `just build` succeeds with 0 failures from a cold cache.
- Boots into `cosmic-initial-setup` → `cosmic-greeter` → user session under QEMU + KVM + OVMF.
- Known caveats:
  - Dynamic VM resolution resize is broken pending [smithay PR #1923](https://github.com/Smithay/smithay/pull/1923) being picked up by cosmic-comp's pinned rev. We work around it by pinning a fixed mode via a default `outputs.ron` ([cosmic-epoch #1351](https://github.com/pop-os/cosmic-epoch/issues/1351)).
  - No artifact cache stood up yet — cold builds take hours, mostly Rust compile time.
  - Only x86_64 has been built end-to-end. aarch64 and riscv64 are wired in `project.conf` but untested.
  - First-login per-user setup wizard is suppressed (settings configured in OEM mode don't carry over).

## Quick start

**Requirements**

- [podman](https://podman.io/) (rootful)
- [just](https://github.com/casey/just)
- ~50 GB free disk space
- For `boot-vm`: `qemu-system-x86_64`, OVMF firmware, KVM enabled

**Build, install, boot**

```sh
just build                      # multi-hour cold build, loads OCI image into rootful podman
just generate-bootable-image    # bootc install to-disk into a 30 GB sparse raw file
just boot-vm                    # QEMU + KVM + OVMF, GTK display
```

`just build` is incremental — once warm, only changed elements rebuild.

**Debugging the running VM**

- `build/console.log` — full kernel + systemd serial capture (also tee'd live to your terminal during `boot-vm`).
- `build/debug-shell.sock` — always-on root shell on serial1, reachable from another terminal:
  ```sh
  socat - UNIX-CONNECT:build/debug-shell.sock
  ```
  Useful when the graphical session is broken and the journal is the only way in.
- QEMU monitor: Ctrl-A then C in the `boot-vm` terminal.

`just --list` shows every recipe.

## Customising the VM

| Env var | Default | Effect |
|---|---|---|
| `COSMIC_VM_MEMORY` | `4G` | RAM passed to QEMU |
| `COSMIC_VM_CPUS` | `4` | vCPU count |
| `COSMIC_VM_XRES` / `COSMIC_VM_YRES` | `1680` / `1050` | Initial guest resolution. Must agree with `files/oci/cosmic-defaults/outputs.ron` — the Justfile vars only affect QEMU, not cosmic-comp's mode pick. |
| `COSMIC_OVMF_CODE` | `/usr/share/edk2/ovmf/OVMF_CODE.fd` | OVMF firmware path. Override on Debian (`/usr/share/OVMF/OVMF_CODE.fd`) or Arch (`/usr/share/edk2-ovmf/x64/OVMF_CODE.fd`). |
| `COSMIC_FILESYSTEM` | `btrfs` | Root filesystem for the bootable image (`btrfs` / `xfs` / `ext4`). |
| `COSMIC_IMAGE_NAME` / `COSMIC_IMAGE_TAG` | `cosmic-os` / `latest` | Podman image tag for `just bootc` and `just generate-bootable-image`. |
| `COSMIC_BOOTABLE_IMAGE` | `build/bootable.raw` | Path of the sparse raw disk image. |
| `COSMIC_BOOTABLE_SIZE` | `30G` | Size of the sparse fallocate. |

## Using as a junction

Downstream OS-image projects can consume cosmic-build-meta as a BuildStream junction.

**`elements/cosmic-build-meta.bst`** — declare the junction:

```yaml
kind: junction

sources:
- kind: git_repo
  url: github:RazorfinOS-org/cosmic-build-meta.git
  track: main
  ref: <commit-ref>

config:
  # Pin our freedesktop-sdk junction to the one cosmic-build-meta uses,
  # so the build graph doesn't end up with two divergent FDSDK copies.
  overrides:
    freedesktop-sdk.bst: cosmic-build-meta.bst:freedesktop-sdk.bst
```

**Depend on a public stack**:

```yaml
# Full desktop with all apps
depends:
  - cosmic-build-meta.bst:core/public-stacks/cosmic-full.bst

# Or just the session, no apps
depends:
  - cosmic-build-meta.bst:core/public-stacks/cosmic-session.bst

# Or cherry-pick individual components
depends:
  - cosmic-build-meta.bst:core/cosmic-comp.bst
  - cosmic-build-meta.bst:core/cosmic-panel.bst
```

**Public stacks**:

| Stack | Contents |
|---|---|
| `core/public-stacks/cosmic-session.bst` | Compositor, session, shell, greeter, icons, wallpapers |
| `core/public-stacks/cosmic-apps.bst` | Files, Edit, Terminal, Store, Settings, Player, Notifications, OSD |
| `core/public-stacks/cosmic-full.bst` | Session + apps |

If you need cargo2-vendored elements (every `core/cosmic-*` is one), register the `cargo2` source plugin in your downstream `project.conf` the same way `cosmic-build-meta` does. If you only consume the pre-built `oci/cosmic/image.bst` artifact, you can skip that.

## Project layout

```
elements/
  freedesktop-sdk.bst            Junction to FDSDK 25.08
  core/                          COSMIC binaries (compositor, shell, apps, greeter)
  core-deps/                     Build deps not in FDSDK (greetd, just, libdisplay-info, oniguruma, ...)
  cosmic-deps/                   Runtime system stack (base, fonts, networking, audio, bootc, ...)
  oci/                           Bootc/OCI image assembly chain
  plugins/                       Junctions for buildstream-plugins{,-community}
files/
  initramfs/                     Vendored generate-initramfs script tree + module set
  oci/                           Branding, presets, greetd config + kiosk wrappers, tmpfiles, sysusers
plugins/
  local/sources/cargo2.py        cargo2 plugin with git-submodule support
  local/elements/collect_initial_scripts.py
                                 Vendored from FDSDK (MIT, attribution preserved)
include/
  aliases.yml                    URL aliases (github / github-media / github-raw / crates / pypi / ...)
project.conf                     BST config: RUSTFLAGS, plugin registrations, manual element env
Justfile                         Podman wrapper for bst commands + image lifecycle recipes
```

## Architecture notes

**Rust components**. Every `core/cosmic-*.bst` is `kind: manual` running `just build-release` and `just install` from the upstream COSMIC repo. Cargo dependencies are vendored offline via `kind: cargo2` source — our local fork of `cargo2.py` adds git-submodule support that upstream doesn't have.

**Bootc/OCI image**. `elements/oci/cosmic/{stack,filesystem,image,init-scripts}.bst` mirrors the `oci/gnomeos/` shape from gnome-build-meta. The final assembly squashes layers with `podman build --squash-all` to work around bootc 1.15's splitstream EOF on multi-layer images.

**LFS overlays**. cosmic-wallpapers, cosmic-greeter, and cosmic-initial-setup ship media via Git LFS. We disable LFS smudge globally inside the BuildStream container (cargo2 vendoring otherwise breaks on synthetic crate trees), so each LFS-tracked file is layered back in via a `kind: remote` source pointing at `media.githubusercontent.com/media/...` — the `github-media:` URL alias. The `ref:` for each `kind: remote` is the LFS oid sha256, which equals the SHA256 of the file content — exactly what BST expects.

## Known build workarounds

| Component / area | Workaround | Reason |
|---|---|---|
| All Rust elements | `RUSTFLAGS="-C link-arg=-fuse-ld=lld"` in `project.conf` | FDSDK sandbox requires lld |
| All `kind: manual` | Centralised `PKG_CONFIG_PATH` in `project.conf` `elements.manual.environment` | Sandbox doesn't set it by default |
| All `kind: manual` Rust | `gcc-base.bst` + `binutils.bst` build-deps | Need `crtbeginS.o` and an assembler |
| cargo2 plugin | Local fork (`plugins/local/sources/cargo2.py`) with submodule support | Upstream cargo2 doesn't fetch git submodules |
| cargo2 vendoring | LFS smudge disabled globally in `Justfile` | LFS smudge filter breaks crate-tree fetches with HangupException |
| LFS-backed media (wallpapers, greeter background, theme thumbnails, layout icons, cities database) | `kind: remote` overlay per file from `github-media:...` | Otherwise pointer files ship instead of real blobs |
| cosmic-comp / cosmic-session / cosmic-settings-daemon / cosmic-workspaces-epoch / xdg-desktop-portal-cosmic | `kind: manual` not `kind: make` | Upstream Makefiles expect `vendor.tar` from `VENDOR=1`, doesn't exist with cargo2 vendoring |
| All Rust builds | `cargo build --release --offline --frozen` (not `--locked`) | `--locked` rejects sandboxed/vendored builds |
| Double-slash URLs | `bst source track` with refreshed Cargo.lock | cargo2 `translate_url()` normalises `pop-os//cosmic-protocols` to single slash; refresh restores the doubled form |
| greetd | `sed` patch enabling nix's `feature` cargo feature on agreety | Vendored nix 0.28 default features don't resolve offline; agreety uses `utsname` gated on that feature |
| greetd | URL must not have `.git` suffix inside container | sr.ht git-fetch quirk |
| cosmic-greeter | `VERGEN_IDEMPOTENT=true` + `libinput.bst` in `depends` | vergen build script needs git; linker needs `-linput` |
| cosmic-edit | `RUSTONIG_SYSTEM_LIBONIG=1` + `oniguruma.bst` build-dep | Use system oniguruma instead of bundled git submodule |
| Sandbox tooling | `findutils.bst`, `sed.bst`, `make.bst` added per-element as needed | FDSDK runtime image is minimal |
| Bootc image | `podman build --squash-all` after `bst artifact checkout` | bootc 1.15 splitstream EOF on multi-layer images |
| QEMU display | `files/oci/cosmic-defaults/outputs.ron` preset pinning Virtual-1 to 1680×1050 + tmpfiles `C` copy into `~cosmic-{initial-setup,greeter}/.local/state/cosmic-comp/` | smithay PR #1923 unmerged in cosmic-comp; without it the compositor ignores virtio-gpu hot-plug mode changes |
| First-login wizard re-run | Empty `/etc/skel/.config/cosmic-initial-setup-done` | accountsservice → useradd -m honours `/etc/skel`; the marker makes the autostart exit immediately |
| Quiet boot | `quiet loglevel=3 systemd.show_status=false rd.udev.log_level=3 vt.global_cursor_default=0` kargs + drop `console=tty0` | Avoid kernel/systemd scroll competing with cosmic-comp on the GTK display |
| `bst source track` re-tag wart | Manual describe-string bump after auto-PR | When upstream re-tags an unchanged commit, BST short-circuits because the commit hash didn't change — leaves the older `epoch-X.Y.Z` describe string |

## Supported architectures

- **x86_64** — primary, builds and boots end-to-end.
- **aarch64** — wired in `project.conf` `go-arch`, no known successful build.
- **riscv64** — experimental, wired, no known successful build.

## Credits

The bootc/OCI pipeline is heavily inspired by [gnome-build-meta](https://gitlab.gnome.org/GNOME/gnome-build-meta). The `elements/oci/` directory layout, `files/initramfs/generate-initramfs` script tree, and `plugins/local/elements/collect_initial_scripts.py` were vendored from there with attribution preserved in their source files.

The cargo2 source plugin is forked from [buildstream-plugins-community](https://gitlab.com/buildstream/buildstream-plugins-community) with git-submodule support added locally.
