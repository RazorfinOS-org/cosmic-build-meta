# Default login-shell wiring for the image.
#
# Makes zsh (cosmic-deps/zsh.bst) the default shell for accounts created by
# cosmic-initial-setup, and gives it the global config it needs to behave
# well out of the box:
#   /etc/default/useradd -- SHELL=/usr/bin/zsh, so accountsservice's
#                           `useradd -m` (no -s) picks zsh for the new user.
#   /etc/shells          -- lists zsh so chsh / pkexec accept it.
#   /etc/zprofile        -- sources /etc/profile so login zsh gets PATH +
#                           the Homebrew shellenv from /etc/profile.d.
#   /etc/zshrc           -- global interactive defaults (history, completion,
#                           prompt, aliases).
#   /etc/skel/.zshrc     -- copied into each new home; suppresses the
#                           zsh-newuser-install first-run wizard.
#   /etc/pam.d/chsh      -- FDSDK's shadow.bst deletes this, which breaks
#                           `chsh`; restore it so users can switch shells.
#
# bash stays fully functional as a fallback (chsh back to /usr/bin/bash) and
# for the greeter / initial-setup / live system accounts, which pin bash.
kind: manual

sources:
- kind: local
  path: files/oci/shell
  directory: shell

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

public:
  bst:
    # FDSDK's shadow may ship a default /etc/default/useradd and/or
    # /etc/shells; declare the overlap so ours wins cleanly at compose.
    overlap-whitelist:
    - /etc/default/useradd
    - /etc/shells

config:
  install-commands:
  - install -Dm644 shell/useradd    "%{install-root}/etc/default/useradd"
  - install -Dm644 shell/shells     "%{install-root}/etc/shells"
  - install -Dm644 shell/zprofile   "%{install-root}/etc/zprofile"
  - install -Dm644 shell/zshrc      "%{install-root}/etc/zshrc"
  - install -Dm644 shell/skel.zshrc "%{install-root}/etc/skel/.zshrc"
  - install -Dm644 shell/chsh.pam   "%{install-root}/etc/pam.d/chsh"
