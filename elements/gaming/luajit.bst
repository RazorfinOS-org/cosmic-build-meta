# LuaJIT runtime/development files for OGC gamescope's Lua scripting support.
# Freedesktop SDK 25.08 ships PUC Lua but not LuaJIT; gamescope's Meson build
# explicitly looks for the `luajit` pkg-config dependency.
kind: manual

sources:
- kind: git_repo
  url: github:LuaJIT/LuaJIT.git
  # Upstream deleted the v2.1.ROLLING tag; pin the v2.1 branch tip
  # by bare commit like dakota (f277abd).
  track: v2.1
  ref: 1edc3e52b67eaf6ce5f809be8e17d6862594b8bc

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - make PREFIX="%{prefix}" MULTILIB="lib" BUILDMODE=dynamic
  install-commands:
  - make PREFIX="%{prefix}" MULTILIB="lib" DESTDIR="%{install-root}" install
  - find "%{install-root}" -name '*.a' -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libluajit-5.1.so'
