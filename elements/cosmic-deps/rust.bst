# Rust 1.93 override -- vendored replacement for
# freedesktop-sdk.bst:components/rust.bst.
#
# Why this exists
# ---------------
# COSMIC's 1.0.12 epoch raised its MSRV to rustc 1.93. fdsdk 25.08.x
# (current and through 25.08.11 at least) ships rustc 1.92 from source,
# so every Rust-built COSMIC element fails with
#
#   error: rustc 1.92.0 is not supported by the following packages:
#     libcosmic@1.0.0 requires rustc 1.93
#     ...
#
# Rather than wait for fdsdk 25.10 (or rebuild rustc 1.93 from source --
# slow, and would need a stage1-1.92 chain) we override the junction's
# components/rust.bst with a thin element that unpacks rust-lang.org's
# official prebuilt 1.93.0 tarball and runs its install.sh into the
# sandbox prefix. The result is a drop-in replacement for downstream
# build-depends -- same /usr/bin/cargo + /usr/bin/rustc, same rustlib
# layout, with rustc 1.93 instead of 1.92.
#
# Multi-arch is handled the same way fdsdk handles rust-stage1: this
# stack picks the per-arch element based on target_arch. x86_64 and
# aarch64 are wired up; CI only builds x86_64 today but the project
# has aarch64 in its arch options.
#
# Drop this whole override (and the rust-dist alias in include/
# aliases.yml) once the freedesktop-sdk junction advances to a release
# that ships rustc >= 1.93, then revert elements/freedesktop-sdk.bst's
# components/rust.bst override line.

kind: stack

(?):
- arch == "x86_64":
    depends:
    - cosmic-deps/rust-1.93-x86_64.bst
- arch == "aarch64":
    depends:
    - cosmic-deps/rust-1.93-aarch64.bst
