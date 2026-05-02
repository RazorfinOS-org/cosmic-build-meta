# nftables - userspace netfilter frontend (replaces iptables).
#
# Recipe mirrors gnome-build-meta's elements/gnomeos-deps/nftables.bst;
# the python wheel build is dropped (we don't ship the python bindings).
kind: autotools

sources:
- kind: git_repo
  url: netfilter:nftables
  track: 'v*'
  ref: v1.1.6-0-g95f82543dcc76bb00e257d2af75a1d1cfd2c7fe8

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/asciidoc.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/flex.bst

depends:
- freedesktop-sdk.bst:components/gmp.bst
- freedesktop-sdk.bst:components/iptables.bst
- freedesktop-sdk.bst:components/jansson.bst
- freedesktop-sdk.bst:components/libmnl.bst
- freedesktop-sdk.bst:components/libnftnl.bst
- freedesktop-sdk.bst:bootstrap/readline.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --with-cli=readline
    --with-xtables
    --with-json
    --disable-python
