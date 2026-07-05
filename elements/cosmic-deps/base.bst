# Base platform: kernel, init, dbus, pam, polkit, core userland.
# Mirrors gnome-build-meta's gnomeos-deps base layer.
kind: stack

depends:
  # Kernel + firmware (we do NOT build our own kernel; FDSDK upstream)
  - freedesktop-sdk.bst:components/linux.bst
  - freedesktop-sdk.bst:components/linux-firmware.bst

  # Init system + core platform
  - freedesktop-sdk.bst:components/systemd.bst
  - freedesktop-sdk.bst:components/dbus.bst
  - freedesktop-sdk.bst:components/linux-pam.bst
  - freedesktop-sdk.bst:components/polkit.bst
  - freedesktop-sdk.bst:components/shadow.bst
  - freedesktop-sdk.bst:components/util-linux.bst
  - freedesktop-sdk.bst:components/iproute2.bst
  - freedesktop-sdk.bst:components/iputils.bst
  - freedesktop-sdk.bst:components/openssh-systemd.bst

  # Convenience userland (mirrors gnomeos-deps).
  # bash and coreutils live under bootstrap/ in FDSDK 25.08.
  # System CA bundle. Without /etc/ssl/certs/ca-certificates.crt
  # populated, every HTTPS client (curl, wget, git, python requests,
  # rust reqwest with native-tls) outside Flatpak fails verification.
  # fdsdk's vm/desktop pulls this in; we were missing it.
  - freedesktop-sdk.bst:components/ca-certificates.bst

  # GPG TUI pin entry. Required for `gpg`, `git commit -S`, smart-card
  # workflows (Yubikey/Nitrokey via tpm2-pkcs11 / scdaemon) when no
  # GUI pinentry is available. Tiny (~120 KB) curses binary.
  - freedesktop-sdk.bst:components/pinentry-ncurses.bst

  - freedesktop-sdk.bst:bootstrap/bash.bst
  - freedesktop-sdk.bst:components/bash-completion.bst
  # Ships /etc/bashrc, /etc/profile, /etc/skel/.bashrc + .profile.
  # Without this fdsdk leaves the rootfs with no system-wide bash
  # startup files at all, so interactive non-login shells (e.g. the
  # shell cosmic-term spawns) never source /etc/profile.d/*.sh -- and
  # /etc/profile.d/bash_completion.sh is what activates the
  # tab-completion data shipped by bash-completion.bst. Same element
  # fdsdk's vm/desktop image pulls in.
  - freedesktop-sdk.bst:components/bash-config.bst
  - freedesktop-sdk.bst:bootstrap/coreutils.bst
  - freedesktop-sdk.bst:components/less.bst
  - freedesktop-sdk.bst:components/nano.bst
  - freedesktop-sdk.bst:components/vim.bst

  # zsh -- the image's default login shell (wired via
  # oci/integration/shell-defaults.bst). Not packaged by FDSDK, so vendored
  # in cosmic-deps/zsh.bst. bash stays present (via runtime-minimal) as the
  # fallback shell and for system service accounts.
  - cosmic-deps/zsh.bst

  # Privilege escalation (runtime, distinct from polkit).
  # Without sudo, the user's first move on a fresh shell -- `sudo systemctl
  # status foo`, `sudo dnf install ...`, etc. -- silently 404s. polkit
  # handles GUI elevation; sudo handles terminal elevation. Both expected.
  - freedesktop-sdk.bst:components/sudo.bst

  # Power-user CLI baseline. None of these are huge; collectively they
  # turn the image from "minimal" to "actually usable from a terminal."
  #   procps    -- ps, top, free, kill, vmstat (every shell session needs)
  #   file      -- libmagic; what gets shipped, what mime-detection uses
  #   curl      -- expected by ~every script in existence
  #   rsync     -- copy-with-resume; expected for any backup/sync flow
  #   strace    -- debugging missing libs / syscall failures
  #   jq        -- JSON in shell; expected by countless tools and pipelines
  #   git       -- many user workflows; cosmic-store may shell out to it
  #   git-lfs   -- tracking LFS-backed repos in user worktrees (small add)
  #   unzip/zip -- archive handling; cosmic-files context menu falls back
  #   bzip2     -- .tar.bz2 still appears in the wild
  - freedesktop-sdk.bst:components/procps.bst
  - freedesktop-sdk.bst:components/file.bst
  - freedesktop-sdk.bst:components/curl.bst
  - freedesktop-sdk.bst:components/rsync.bst
  - freedesktop-sdk.bst:components/strace.bst
  - freedesktop-sdk.bst:components/jq.bst
  - freedesktop-sdk.bst:components/git.bst
  - freedesktop-sdk.bst:components/git-lfs.bst
  - freedesktop-sdk.bst:components/unzip.bst
  - freedesktop-sdk.bst:components/zip.bst
  - freedesktop-sdk.bst:components/bzip2.bst

  # Core GNU userland. FDSDK's runtime-minimal is just bash + coreutils +
  # glibc, so the rest of the POSIX/GNU toolkit only lands if something
  # else happens to pull it as a *runtime* dep. Several essentials have
  # ONLY build-stack referencers upstream and so never reached the image:
  #   which      -- missing entirely (only buildsystem-autotools pulls it);
  #                 bash-completion and countless scripts call it
  #   findutils  -- find, xargs, locate; assumed by a huge share of scripts
  #   gawk       -- awk; likewise assumed everywhere
  #   diffutils  -- diff, cmp, sdiff
  #   tar        -- unpack .tar.gz by hand; also required by Homebrew's
  #                 first-boot brew-setup.service (see cosmic-deps/extras.bst)
  # grep/sed/gzip currently arrive only transitively (via openssh/man-db);
  # pull them explicitly so they don't vanish if those deps ever change.
  - freedesktop-sdk.bst:components/which.bst
  - freedesktop-sdk.bst:components/findutils.bst
  - freedesktop-sdk.bst:components/gawk.bst
  - freedesktop-sdk.bst:components/diffutils.bst
  - freedesktop-sdk.bst:components/tar.bst
  - freedesktop-sdk.bst:components/grep.bst
  - freedesktop-sdk.bst:components/sed.bst
  - freedesktop-sdk.bst:components/gzip.bst
  # wget2 -- FDSDK ships wget2 (provides `wget`), companion to curl above.
  - freedesktop-sdk.bst:components/wget2.bst

  # Runtime baseline + GPU stack
  - freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
  - freedesktop-sdk.bst:vm/mesa-default.bst

  # Vulkan ICD loader (libvulkan.so.1). mesa ships drivers but not the
  # loader; without it, any app that calls vkCreateInstance() (cosmic-comp
  # could optionally, gaming via Flatpak certainly will) fails to find
  # any GPU. Pure runtime cost: ~200 KB.
  - freedesktop-sdk.bst:components/vulkan-icd-loader.bst

  # Generates /usr/lib/locale/* for ALL supported languages.
  # Without this, runtime-minimal only ships en_US.UTF-8 + C.UTF-8 (via
  # utf-locale.bst), and cosmic-initial-setup's language picker shows
  # only English even though iso-codes is installed.
  - freedesktop-sdk.bst:components/locales.bst
