# fprintd - fingerprint daemon + pam_fprintd + enroll/verify CLIs.
# D-Bus activated (no preset); PAM wiring in oci/integration/fprintd-pam.bst.
# Mirrors gnome-build-meta's gnomeos-deps/fprintd.bst; test/doc deps dropped.
kind: meson

variables:
  meson-local: >-
    -Dman=false
    -Dpam_modules_dir='%{libdir}/security'

sources:
- kind: git_repo
  url: freedesktop:libfprint/fprintd.git
  track: 'v*'

  ref: v1.94.5-0-gb54a007ccf58ac0ae074c7151b223f35cbd17306
build-depends:
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- cosmic-deps/libfprint.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/polkit.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
