# LuaJIT runtime/development files for OGC gamescope's Lua scripting support.
# Freedesktop SDK 25.08 ships PUC Lua but not LuaJIT; gamescope's Meson build
# explicitly looks for the `luajit` pkg-config dependency.
kind: manual

sources:
- kind: git_repo
  url: github:LuaJIT/LuaJIT.git
  track: v2.1.ROLLING
  ref: v2.1.ROLLING-0-g2096ea625d78304e1955b4d7bfd5853cb547fba9

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
