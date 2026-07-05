# Z shell -- the image's default login shell (set via
# oci/integration/shell-defaults.bst). FDSDK 25.08 doesn't package zsh, so
# we build it from the official release tarball. ncurses lives at
# bootstrap/ncurses.bst (not components/) and provides libtinfo + the
# terminfo database zsh needs at runtime.
kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst

variables:
  # Global rc dir = /etc (so /etc/zprofile, /etc/zshrc from shell-defaults
  # are read). gdbm/pcre modules disabled to avoid extra deps FDSDK would
  # otherwise need; neither is required for an interactive login shell.
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
  url: zsh:zsh-5.9.1.tar.xz
  ref: 5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416b5042e58d8280d
