# Networking: NetworkManager + wpa-supplicant (wifi) + nftables.
kind: stack

depends:
  - freedesktop-sdk.bst:components/networkmanager.bst
  - freedesktop-sdk.bst:components/wpa-supplicant.bst

  # mDNS / DNS-SD lives in cosmic-deps/desktop-services.bst (avahi).

  # Locally-vendored (not in FDSDK 25.08)
  - cosmic-deps/nftables.bst
  # firewalld deferred -- needs intltool which FDSDK 25.08 doesn't ship.
