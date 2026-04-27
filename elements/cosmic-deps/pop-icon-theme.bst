# Pop icon theme -- the runtime-icon dependency that the Cosmic icon
# theme INHERITS from (`Inherits=Pop,hicolor` in /usr/share/icons/Cosmic/index.theme).
#
# Without it the COSMIC desktop has effectively no UI icons: the
# Cosmic theme only ships COSMIC-branded apps and a few category
# icons; every standard freedesktop name (system-search-symbolic,
# edit-clear-symbolic, network-wireless-symbolic, audio-volume-*,
# folder, etc.) is expected to fall through to the Pop theme.
# cosmic-initial-setup's location/keyboard/language pages all use
# search_input which renders system-search-symbolic; without Pop
# icon theme they appear as missing-icon placeholders.
#
# Also installs /usr/share/pixmaps/faces/pop-robot.png which
# cosmic-initial-setup's user-creation page uses as the avatar fallback
# (DEFAULT_ICON_FILE = "/usr/share/pixmaps/faces/pop-robot.png" --
# src/page/user.rs:24). The PNG itself is NOT in pop-os/icon-theme
# upstream -- it ships in pop-os/default-settings (single file, GPL-3+).
# We layer it on as a kind:remote source and copy it into place after
# meson install. Without it, the Create Account page renders an empty
# circle where the avatar should be, and the file-chooser launched by
# "Choose profile image" opens into an empty $HOME with nothing to pick.
#
# Upstream: github:pop-os/icon-theme (a meson project that builds
# the Pop icon set).
kind: meson

sources:
- kind: git_repo
  url: github:pop-os/icon-theme.git
  track: master
  ref: v3.5.1-0-g1a575a8e99b4ae629b9b16543a3a04d148632ba9

# pop-robot.png lives in pop-os/default-settings, not in icon-theme.
# Pinned to the master_noble branch (Pop!_OS 24.04 default-settings).
- kind: remote
  url: github-raw:pop-os/default-settings/master_noble/usr/share/pixmaps/faces/pop-robot.png
  ref: 6cf89d2a245ebd16b14c8db9b1495f2448261d4a86b92ba53f0bfd5eef0622fa
  filename: pop-robot.png
  directory: pop-faces

build-depends:
- freedesktop-sdk.bst:components/meson.bst
# gtk-update-icon-cache is bundled in gtk3
- freedesktop-sdk.bst:components/gtk3.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/hicolor-icon-theme.bst

variables:
  strip-binaries: ''

config:
  install-commands:
    (>):
    # Layered from kind:remote source above (lives at pop-faces/
    # in the staged build dir, alongside the icon-theme repo's meson.build).
    - install -Dm644 pop-faces/pop-robot.png "%{install-root}/usr/share/pixmaps/faces/pop-robot.png"
