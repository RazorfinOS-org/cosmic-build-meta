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

  # Bluetooth A2DP audio codec. Without sbc, BT headphones connect but
  # play silence (pipewire-pulse can't negotiate any A2DP profile).
  - freedesktop-sdk.bst:components/sbc.bst

  # Voice codec used by Discord, Zoom, WebRTC, Mumble, web conferencing.
  - freedesktop-sdk.bst:components/opus.bst

  # FFmpeg + libav: covers virtually every container/codec a desktop
  # ever sees. cosmic-player and any Flatpak media app depend on this
  # being present at runtime.
  - freedesktop-sdk.bst:components/ffmpeg.bst

  # VAAPI runtime. Pairs with the VA driver mesa ships to give HW video
  # decode (h264/h265/av1) on Intel/AMD iGPUs. Without it, YouTube/
  # Netflix/Twitch in any browser falls back to CPU decode -- a laptop
  # battery murderer.
  - freedesktop-sdk.bst:components/libva.bst

  # AV1 codec (Netflix, YouTube modern). dav1d = decoder, aom = encoder
  # + reference decoder. Browsers and ffmpeg pick whichever's installed.
  - freedesktop-sdk.bst:components/dav1d.bst
  - freedesktop-sdk.bst:components/aom.bst

  # GStreamer (codecs + plugins)
  - freedesktop-sdk.bst:components/gstreamer.bst
  - freedesktop-sdk.bst:components/gstreamer-plugins-base.bst
  - freedesktop-sdk.bst:components/gstreamer-plugins-good.bst
  # plugins-bad/-ugly add patent-encumbered codecs (h264/h265/aac/mp3)
  # plus newer-but-not-yet-stable plugins. "bad" and "ugly" are GStreamer's
  # quality tiering, not legal warnings -- the licensing burden is the same
  # as ffmpeg above. Without them, cosmic-player can't open most user media.
  - freedesktop-sdk.bst:components/gstreamer-plugins-bad.bst
  - freedesktop-sdk.bst:components/gstreamer-plugins-ugly.bst
  - freedesktop-sdk.bst:components/gstreamer-libav.bst

  # Modern image formats. Browsers + cosmic-files thumbnailing all
  # need these or fall back to "broken image" placeholders.
  #   AVIF -- modern web (Chrome/Firefox)
  #   WebP -- ubiquitous on the web for ~10 years
  #   HEIF -- iPhone photos
  #   JXL  -- emerging, photo-quality replacement for JPEG
  - freedesktop-sdk.bst:components/libavif.bst
  - freedesktop-sdk.bst:components/libwebp.bst
  - freedesktop-sdk.bst:components/libheif.bst
  - freedesktop-sdk.bst:components/libjxl.bst
