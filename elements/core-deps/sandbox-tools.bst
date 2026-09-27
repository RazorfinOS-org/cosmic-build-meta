# Shell and coreutils for element build sandboxes. freedesktop-sdk 26.08
# cut bash and coreutils from public-stacks/runtime-minimal.bst, so every
# element that runs sandbox commands build-depends on this instead.
# Widen this stack, not individual elements, when commands need more tools.
kind: stack

depends:
- freedesktop-sdk.bst:bootstrap/bash.bst
- freedesktop-sdk.bst:bootstrap/coreutils.bst
# 26.08 coreutils links libgcc_s.so.1; stage its provider too.
- freedesktop-sdk.bst:components/gcc-libs.bst
