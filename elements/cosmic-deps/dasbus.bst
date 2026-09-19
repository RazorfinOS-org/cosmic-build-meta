# dasbus - python D-Bus lib, hard orca dep. Mirrors gnome-build-meta,
# from git instead of pypi so source track manages the ref.
kind: pyproject

sources:
- kind: git_repo
  url: github:rhinstaller/dasbus.git
  track: 'v*'
  ref: v1.7-0-g413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
