# Power management daemons; all vendored, none in FDSDK 25.08.
# system76-power, not power-profiles-daemon: cosmic-settings probes the
# s76 name first, and the two fight over the same governor/EPB knobs.
kind: stack

depends:
  - cosmic-deps/upower.bst
  - cosmic-deps/system76-power.bst
  - cosmic-deps/system76-scheduler.bst
