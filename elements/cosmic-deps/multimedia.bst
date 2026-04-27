# Audio + multimedia codecs.
# pipewire-daemon and wireplumber are the modern audio stack; alsa-lib is
# kept because some legacy apps still expect it. rtkit gives the audio
# threads RT priority. gstreamer + plugin packs cover mp4/h264/aac for
# any GTK/Qt media app.
kind: stack

depends:
  # Audio
  - freedesktop-sdk.bst:components/pipewire-daemon.bst
  - freedesktop-sdk.bst:components/wireplumber.bst
  - freedesktop-sdk.bst:components/alsa-lib.bst
  - freedesktop-sdk.bst:components/rtkit.bst

  # GStreamer (codecs + plugins)
  - freedesktop-sdk.bst:components/gstreamer.bst
  - freedesktop-sdk.bst:components/gstreamer-plugins-base.bst
  - freedesktop-sdk.bst:components/gstreamer-plugins-good.bst
  - freedesktop-sdk.bst:components/gstreamer-libav.bst
