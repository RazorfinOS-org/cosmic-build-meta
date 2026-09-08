# Z shell -- the image's default login shell (wired via
# oci/integration/shell-defaults.bst). Not packaged by FDSDK 25.08; built
# from the release tarball. ncurses comes from bootstrap/ncurses.bst.
kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst

variables:
  # etcdir=/etc so the global zprofile/zshrc from shell-defaults are read.
  # gdbm/pcre modules disabled: not needed for an interactive shell, and
  # they would add deps FDSDK doesn't ship.
  conf-local: >-
    --enable-etcdir=%{sysconfdir}
    --enable-fndir=%{datadir}/zsh/functions
    --enable-site-fndir=%{datadir}/zsh/site-functions
    --enable-function-subdirs
    --with-tcsetpgrp
    --disable-gdbm
    --disable-pcre

sources:
- kind: tar
  # zsh.org rotates superseded releases from /pub/ to /pub/old/; on a
  # 404 here, bump the version or repoint at /pub/old/.
  url: zsh:zsh-5.9.2.tar.xz
  ref: 36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81
