# Complete gaming add-on stack for the COSMIC image.
#
# Goal: "freedesktop-sdk + COSMIC + gaming" without turning CBM into a Fedora
# package remix. The host stack provides the OS-level pieces Bazzite gets right
# (native Steam, gamescope, GameMode, controller rules/data, Vulkan discovery,
# native compatibility libs), while the app stack preinstalls non-Steam
# launchers/tools from Flathub.
kind: stack

depends:
  - gaming/host-platform.bst
  - gaming/flatpak-apps.bst
