kind: manual

sources:
- kind: remote
  (?):
  - arch == "x86_64":
      url: github-releases:ublue-os/packages/releases/download/homebrew-2026-03-10-01-31-26/homebrew-x86_64.tar.zst
      ref: 644d701fdde130c48ca7b47b2b1af28320819c4176f20c3c208719b3e4dd5c29
  - arch == "aarch64":
      url: github-releases:ublue-os/packages/releases/download/homebrew-2026-03-10-01-31-26/homebrew-aarch64.tar.zst
      ref: c1407069204ed952afa38fb8f4dabd73969001e7f26d18ac46d9b4a9b4a76639

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

runtime-depends:
- cosmic-deps/brew.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{datadir}"
    mv homebrew-%{arch}.tar.zst "%{install-root}%{datadir}/homebrew.tar.zst"
