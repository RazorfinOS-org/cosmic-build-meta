# gcr 3.x (gck-1/gcr-base-3) - gnome-keyring's crypto/PKCS#11 libs;
# keyring through 50.0 needs gcr-3, not gcr4. Mirrors gnome-build-meta's
# sdk/gcr-3.bst; gtk off also drops gcr-prompter (no interactive
# unlock dialogs -- PAM covers the login path).
kind: meson

sources:
- kind: git_repo
  url: gnome:GNOME/gcr.git
  track: '3.41.*'

  ref: 3.41.2-0-gcd63e8a0378e13ba0aa15c2a68d1070fa62e6532
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
# gnupg satisfies meson's unconditional find_program('gpg2','gpg') and
# provides the runtime gpg that gcr's gnupg collection spawns.
- freedesktop-sdk.bst:components/gnupg.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libgcrypt.bst
- freedesktop-sdk.bst:components/p11-kit.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dgtk=false
    -Dgtk_doc=false
    -Dintrospection=false
    -Dssh_agent=false
    -Dsystemd=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgck-1.so'
        - '%{libdir}/libgcr-base-3.so'
