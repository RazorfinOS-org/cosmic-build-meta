# Screen-reader stack: cosmic-settings flips ScreenReaderEnabled on the
# a11y bus, cosmic-session spawns orca, which speaks through
# speech-dispatcher -> espeak-ng. None of it is in FDSDK 25.08.
kind: stack

depends:
  - cosmic-deps/orca.bst               # the screen reader itself
  - cosmic-deps/speech-dispatcher.bst  # TTS server (pulls in dotconf)
  - cosmic-deps/espeak-ng.bst          # the one speech synthesizer
