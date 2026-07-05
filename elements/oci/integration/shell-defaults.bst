# Default login-shell wiring: zsh (cosmic-deps/zsh.bst) for accounts created
# by cosmic-initial-setup, with bash kept as the fallback and for system
# accounts.
#   /etc/default/useradd -- SHELL=/usr/bin/zsh; accountsservice's
#                           `useradd -m` (no -s) picks it up
#   /etc/shells          -- lists zsh so chsh / pkexec accept it
#   /etc/zprofile        -- sources /etc/profile (PATH, Homebrew shellenv)
#   /etc/zshrc           -- global interactive defaults
#   /etc/skel/.zshrc     -- suppresses the zsh-newuser-install wizard
#   /etc/pam.d/chsh      -- restored (FDSDK's shadow.bst deletes it)
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
    # FDSDK's shadow may ship its own /etc/default/useradd and /etc/shells;
    # declare the overlap so ours wins at compose.
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
