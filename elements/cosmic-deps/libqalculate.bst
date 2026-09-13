# libqalculate + qalc CLI: pop-launcher's calc plugin shells out to
# qalc at runtime and silently does nothing without it.
kind: autotools

sources:
- kind: git_repo
  url: github:Qalculate/libqalculate.git
  track: 'v*'

  ref: v5.12.0-0-gd01cfdae6f965bf9264af3b52db8f5b0345fe1da
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/gmp.bst
- freedesktop-sdk.bst:components/mpfr.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/icu.bst
- freedesktop-sdk.bst:bootstrap/readline.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
