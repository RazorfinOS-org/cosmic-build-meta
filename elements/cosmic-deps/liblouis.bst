# liblouis - braille translation for orca (optional `import louis`).
# make install skips the ctypes bindings, hence the manual pip install.
kind: autotools

sources:
- kind: git_repo
  url: github:liblouis/liblouis.git
  track: 'v*'
  ref: v3.39.0-0-g2e775aca674cd2910e272eed7736acceb4c2e4a2

build-depends:
- freedesktop-sdk.bst:components/help2man.bst
- freedesktop-sdk.bst:components/texinfo.bst
- freedesktop-sdk.bst:components/python3-pip.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --enable-ucs4

config:
  install-commands:
    (>):
    # python/pyproject.toml and python/louis/__init__.py are generated
    # by configure/make above; upstream leaves installing them to us.
    - |
      python3 -m pip install --no-deps --no-build-isolation --ignore-installed \
        --prefix "%{prefix}" --root "%{install-root}" ./python
