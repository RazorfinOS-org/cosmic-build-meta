# COSMIC Wayland compositor
kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- core-deps/libdisplay-info.bst
- core/cosmic-protocols.bst
- freedesktop-sdk.bst:components/libseat.bst
- freedesktop-sdk.bst:components/libinput.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/pixman.bst
- freedesktop-sdk.bst:components/dummy-gbm.bst

depends:
- core-deps/libdisplay-info.bst
- freedesktop-sdk.bst:components/libseat.bst
- freedesktop-sdk.bst:components/libinput.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/dummy-gbm.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-comp.git
  track: master
  ref: epoch-1.0.11-0-g21679f215acfa7ae86072362c5d91b0cc4ed1fcd
- kind: cargo2
  url: "crates:"
  ref:
  - kind: registry
    name: ab_glyph
    version: 0.2.32
    sha: 01c0457472c38ea5bd1c3b5ada5e368271cb550be7a4ca4a0b4634e9913f6cc2
  - kind: registry
    name: ab_glyph_rasterizer
    version: 0.1.10
    sha: 366ffbaa4442f4684d91e2cd7c5ea7c4ed8add41959a31447066e279e432b618
  - kind: registry
    name: addr2line
    version: 0.25.1
    sha: 1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
  - kind: registry
    name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
  - kind: registry
    name: almost
    version: 0.2.0
    sha: 3aa2999eb46af81abb65c2d30d446778d7e613b60bbf4e174a027e80f90a3c14
  - kind: registry
    name: android-activity
    version: 0.6.0
    sha: ef6978589202a00cd7e118380c448a08b6ed394c3a8df3a430d0898e3a42d046
  - kind: registry
    name: android-properties
    version: 0.2.2
    sha: fc7eb209b1518d6bb87b283c20095f5228ecda460da70b44f0802523dea6da04
  - kind: registry
    name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - kind: registry
    name: anyhow
    version: 1.0.102
    sha: 7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c
  - kind: registry
    name: appendlist
    version: 1.4.0
    sha: e149dc73cd30538307e7ffa2acd3d2221148eaeed4871f246657b1c3eaa1cbd2
  - kind: registry
    name: apply
    version: 0.3.0
    sha: f47b57fc4521e3cae26a4d45b5227f8fadee4c345be0fefd8d5d1711afb8aeb9
  - kind: registry
    name: approx
    version: 0.4.0
    sha: 3f2a05fd1bd10b2527e20a2cd32d8873d115b8b39fe219ee25f42a8aca6ba278
  - kind: registry
    name: approx
    version: 0.5.1
    sha: cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6
  - kind: registry
    name: arc-swap
    version: 1.8.2
    sha: f9f3647c145568cec02c42054e07bdf9a5a698e15b466fb2341bfc393cd24aa5
  - kind: registry
    name: arrayref
    version: 0.3.9
    sha: 76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb
  - kind: registry
    name: arrayvec
    version: 0.7.6
    sha: 7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50
  - kind: registry
    name: as-raw-xcb-connection
    version: 1.0.1
    sha: 175571dd1d178ced59193a6fc02dde1b972eb0bc56c892cde9beeceac5bf0f6b
  - kind: registry
    name: ash
    version: 0.38.0+1.3.281
    sha: 0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f
  - kind: registry
    name: async-broadcast
    version: 0.7.2
    sha: 435a87a52755b8f27fcf321ac4f04b2802e337c8c4872923137471ec39c37532
  - kind: registry
    name: async-channel
    version: 2.5.0
    sha: 924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2
  - kind: registry
    name: async-executor
    version: 1.14.0
    sha: c96bf972d85afc50bf5ab8fe2d54d1586b4e0b46c97c50a0c9e71e2f7bcd812a
  - kind: registry
    name: async-io
    version: 2.6.0
    sha: 456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc
  - kind: registry
    name: async-lock
    version: 3.4.2
    sha: 290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311
  - kind: registry
    name: async-process
    version: 2.5.0
    sha: fc50921ec0055cdd8a16de48773bfeec5c972598674347252c0399676be7da75
  - kind: registry
    name: async-recursion
    version: 1.1.1
    sha: 3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11
  - kind: registry
    name: async-signal
    version: 0.2.13
    sha: 43c070bbf59cd3570b6b2dd54cd772527c7c3620fce8be898406dd3ed6adc64c
  - kind: registry
    name: async-task
    version: 4.7.1
    sha: 8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de
  - kind: registry
    name: async-trait
    version: 0.1.89
    sha: 9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb
  - kind: registry
    name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - kind: registry
    name: atomic_float
    version: 1.1.0
    sha: 628d228f918ac3b82fe590352cc719d30664a0c13ca3a60266fe02c7132d480a
  - kind: git
    commit: 043ab4859d53ffd3d55334685303d8df39c9f768
    repo: https://github.com/jackpot51/rust-atomicwrites
    name: atomicwrites
    version: 0.4.2
  - kind: registry
    name: auto_enums
    version: 0.8.7
    sha: 9c170965892137a3a9aeb000b4524aa3cc022a310e709d848b6e1cdce4ab4781
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - kind: registry
    name: backtrace
    version: 0.3.76
    sha: bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6
  - kind: registry
    name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: basic-toml
    version: 0.1.10
    sha: ba62675e8242a4c4e806d12f11d136e626e6c8361d6b829310732241652a178a
  - kind: registry
    name: bit-set
    version: 0.8.0
    sha: 08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3
  - kind: registry
    name: bit-vec
    version: 0.8.0
    sha: 5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.11.0
    sha: 843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block2
    version: 0.5.1
    sha: 2c132eebf10f5cad5289222520a4a058514204aed6d791f1cf4fe8088b82d15f
  - kind: registry
    name: blocking
    version: 1.6.2
    sha: e83f8d02be6967315521be875afa792a316e28d57b5a2d401897e2a7921b7f21
  - kind: registry
    name: borsh
    version: 1.6.0
    sha: d1da5ab77c1437701eeff7c88d968729e7766172279eab0676857b3d63af7a6f
  - kind: registry
    name: bstr
    version: 1.12.1
    sha: 63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab
  - kind: registry
    name: btoi
    version: 0.5.0
    sha: 3b5ab9db53bcda568284df0fd39f6eac24ad6f7ba7ff1168b9e76eba6576b976
  - kind: registry
    name: bumpalo
    version: 3.20.2
    sha: 5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb
  - kind: registry
    name: by_address
    version: 1.2.1
    sha: 64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06
  - kind: registry
    name: bytemuck
    version: 1.25.0
    sha: c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec
  - kind: registry
    name: bytemuck_derive
    version: 1.10.2
    sha: f9abbd1bc6865053c427f7198e6af43bfdedc55ab791faed4fbd361d789575ff
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.11.1
    sha: 1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33
  - kind: registry
    name: calloop
    version: 0.13.0
    sha: b99da2f8558ca23c71f4fd15dc57c906239752dd27ff3c00a1d56b685b7cbfec
  - kind: registry
    name: calloop
    version: 0.14.4
    sha: 4dbf9978365bac10f54d1d4b04f7ce4427e51f71d61f2fe15e3fed5166474df7
  - kind: registry
    name: calloop-wayland-source
    version: 0.3.0
    sha: 95a66a987056935f7efce4ab5668920b5d0dac4a7c99991a67395f13702ddd20
  - kind: registry
    name: calloop-wayland-source
    version: 0.4.1
    sha: 138efcf0940a02ebf0cc8d1eff41a1682a46b431630f4c52450d6265876021fa
  - kind: registry
    name: cc
    version: 1.2.56
    sha: aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2
  - kind: registry
    name: cesu8
    version: 1.1.0
    sha: 6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c
  - kind: registry
    name: cfg-expr
    version: 0.20.6
    sha: 78cef5b5a1a6827c7322ae2a636368a573006b27cfa76c7ebd53e834daeaab6a
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: cgmath
    version: 0.18.0
    sha: 1a98d30140e3296250832bbaaff83b27dcd6fa3cc70fb6f1f3e5c9c0023b5317
  - kind: registry
    name: chacha20
    version: 0.10.0
    sha: 6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601
  - kind: registry
    name: chrono
    version: 0.4.44
    sha: c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0
  - kind: registry
    name: clap_lex
    version: 1.0.0
    sha: 3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831
  - kind: registry
    name: clipboard-win
    version: 5.4.1
    sha: bde03770d3df201d4fb868f2c9c59e66a3e4e2bd06692a0fe701e7103c7e84d4
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_macos
    version: 0.1.0
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_wayland
    version: 0.2.2
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_x11
    version: 0.4.2
  - kind: registry
    name: cocoa
    version: 0.25.0
    sha: f6140449f97a6e97f9511815c5632d84c8aacf8ac271ad77c559218161a1373c
  - kind: registry
    name: cocoa-foundation
    version: 0.1.2
    sha: 8c6234cbb2e4c785b456c0644748b1ac416dd045799740356f8363dfe00c93f7
  - kind: registry
    name: codespan-reporting
    version: 0.12.0
    sha: fe6d2e5af09e8c8ad56c969f2157a3d4238cebc7c55f0a517728c38f7b200f81
  - kind: registry
    name: color_quant
    version: 1.1.0
    sha: 3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b
  - kind: registry
    name: combine
    version: 4.6.7
    sha: ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: configparser
    version: 3.1.0
    sha: e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b
  - kind: registry
    name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: core-graphics
    version: 0.23.2
    sha: c07782be35f9e1140080c6b96f0d44b739e2278479f64e02fdab4e32dfd8b081
  - kind: registry
    name: core-graphics-types
    version: 0.1.3
    sha: 45390e6114f68f718cc7a830514a96f903cccd70d02a8f6d9f643ac4ba45afaf
  - kind: registry
    name: core_maths
    version: 0.1.1
    sha: 77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30
  - kind: git
    commit: 160b086abe03cd34a8a375d7fbe47b24308d1f38
    repo: github:pop-os//cosmic-protocols
    query:
      branch: main
    name: cosmic-client-toolkit
    version: 0.2.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: cosmic-config-derive
    version: 1.0.0
  - kind: git
    commit: 7a61a704f6d1ec41f71cbe766e3cc484858523fa
    repo: github:pop-os/freedesktop-icons
    name: cosmic-freedesktop-icons
    version: 0.4.0
  - kind: git
    commit: 160b086abe03cd34a8a375d7fbe47b24308d1f38
    repo: github:pop-os//cosmic-protocols
    query:
      branch: main
    name: cosmic-protocols
    version: 0.2.0
  - kind: git
    commit: 6e8e795970fa06d434af22775e415b517f7552d3
    repo: github:pop-os/cosmic-randr/
    name: cosmic-randr-shell
    version: 0.1.0
  - kind: git
    commit: e37160f14d1e7ee428f973cd2848b4e95f83dfe1
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-config
    version: 0.1.0
  - kind: git
    commit: 507e342c21d3ce6ae41b1d4f3fa2f0ad5ee23e75
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-settings-daemon
    version: 0.1.0
  - kind: git
    commit: e37160f14d1e7ee428f973cd2848b4e95f83dfe1
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-daemon-config
    version: 0.1.0
  - kind: git
    commit: d5a972a2b63649fad11ea3a7e80f7dc4c592f01a
    repo: github:pop-os/cosmic-text.git
    name: cosmic-text
    version: 0.18.2
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: cosmic-theme
    version: 1.0.0
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: cpufeatures
    version: 0.3.0
    sha: 8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crossbeam-utils
    version: 0.8.21
    sha: d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28
  - kind: registry
    name: crunchy
    version: 0.2.4
    sha: 460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5
  - kind: git
    commit: c49de15bce4d8254ac136d1be9911960cc85ce12
    repo: github:pop-os/glyphon.git
    query:
      tag: cosmic-0.14
    name: cryoglyph
    version: 0.1.0
  - kind: registry
    name: crypto-common
    version: 0.1.7
    sha: 78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a
  - kind: registry
    name: css-color
    version: 0.2.8
    sha: 42aaeae719fd78ce501d77c6cdf01f7e96f26bcd5617a4903a1c2b97e388543a
  - kind: registry
    name: csscolorparser
    version: 0.8.2
    sha: 64a878cfd6075649977f548ed439564cfdbe1f190a6656a00b48af7740f2f148
  - kind: registry
    name: ctor-lite
    version: 0.1.2
    sha: e162d0c2e2068eb736b71e5597eff0b9944e6b973cd9f37b6a288ab9bf20e300
  - kind: registry
    name: cursor-icon
    version: 1.2.0
    sha: f27ae1dd37df86211c42e150270f82743308803d90a6f6e6651cd730d5e1732f
  - kind: registry
    name: darling
    version: 0.21.3
    sha: 9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0
  - kind: registry
    name: darling_core
    version: 0.21.3
    sha: 1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4
  - kind: registry
    name: darling_macro
    version: 0.21.3
    sha: d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81
  - kind: registry
    name: data-url
    version: 0.3.2
    sha: be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376
  - kind: registry
    name: deranged
    version: 0.5.8
    sha: 7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c
  - kind: registry
    name: derive_setters
    version: 0.1.9
    sha: b7e6f6fa1f03c14ae082120b84b3c7fbd7b8588d924cf2d7c3daf9afd49df8b9
  - kind: registry
    name: derive_utils
    version: 0.15.0
    sha: ccfae181bab5ab6c5478b2ccb69e4c68a02f8c3ec72f6616bfec9dbc599d2ee0
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch
    version: 0.2.0
    sha: bd0c93bb4b0c6d9b77f4435b0ae98c24d17f1c45b2ff844c6151a07256ca923b
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: dlib
    version: 0.5.2
    sha: 330c60081dcc4c72131f8eb70510f1ac07223e5d4163db481a04a0befcffa412
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: dnd
    version: 0.1.0
  - kind: registry
    name: document-features
    version: 0.2.12
    sha: d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61
  - kind: registry
    name: downcast-rs
    version: 1.2.1
    sha: 75b325c5dbd37f80359721ad39aca5a29fb04c89279657cffdda8736d0c0b9d2
  - kind: registry
    name: dpi
    version: 0.1.2
    sha: d8b14ccef22fc6f5a8f4d7d768562a182c04ce9a3b3157b91390b52ddfdf1a76
  - kind: registry
    name: drm
    version: 0.11.1
    sha: a0f8a69e60d75ae7dab4ef26a59ca99f2a89d4c142089b537775ae0c198bdcde
  - kind: registry
    name: drm
    version: 0.14.1
    sha: 80bc8c5c6c2941f70a55c15f8d9f00f9710ebda3ffda98075f996a0e6c92756f
  - kind: registry
    name: drm-ffi
    version: 0.7.1
    sha: 41334f8405792483e32ad05fbb9c5680ff4e84491883d2947a4757dc54cb2ac6
  - kind: registry
    name: drm-ffi
    version: 0.9.0
    sha: d8e41459d99a9b529845f6d2c909eb9adf3b6d2f82635ae40be8de0601726e8b
  - kind: registry
    name: drm-fourcc
    version: 2.2.0
    sha: 0aafbcdb8afc29c1a7ee5fbe53b5d62f4565b35a042a662ca9fecd0b54dae6f4
  - kind: registry
    name: drm-sys
    version: 0.6.1
    sha: 2d09ff881f92f118b11105ba5e34ff8f4adf27b30dae8f12e28c193af1c83176
  - kind: registry
    name: drm-sys
    version: 0.8.0
    sha: bafb66c8dbc944d69e15cfcc661df7e703beffbaec8bd63151368b06c5f9858c
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: ecolor
    version: 0.31.1
    sha: bc4feb366740ded31a004a0e4452fbf84e80ef432ecf8314c485210229672fd1
  - kind: registry
    name: egui
    version: 0.31.1
    sha: 25dd34cec49ab55d85ebf70139cb1ccd29c977ef6b6ba4fe85489d6877ee9ef3
  - kind: registry
    name: egui_extras
    version: 0.31.1
    sha: 624659a2e972a46f4d5f646557906c55f1cd5a0836eddbe610fdf1afba1b4226
  - kind: registry
    name: egui_glow
    version: 0.31.1
    sha: 910906e3f042ea6d2378ec12a6fd07698e14ddae68aed2d819ffe944a73aab9e
  - kind: registry
    name: egui_plot
    version: 0.31.0
    sha: 1794c66fb727dac28dffed2e4b548e5118d1cccc331d368a35411d68725dde71
  - kind: registry
    name: emath
    version: 0.31.1
    sha: 9e4cadcff7a5353ba72b7fea76bf2122b5ebdbc68e8155aa56dfdea90083fe1b
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
  - kind: registry
    name: endi
    version: 1.1.1
    sha: 66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099
  - kind: registry
    name: enum-map
    version: 2.7.3
    sha: 6866f3bfdf8207509a033af1a75a7b08abda06bbaaeae6669323fd5a097df2e9
  - kind: registry
    name: enum-map-derive
    version: 0.17.0
    sha: f282cfdfe92516eb26c2af8589c274c7c17681f5ecc03c18255fe741c6aa64eb
  - kind: registry
    name: enumflags2
    version: 0.7.12
    sha: 1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef
  - kind: registry
    name: enumflags2_derive
    version: 0.7.12
    sha: 67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827
  - kind: registry
    name: epaint
    version: 0.31.1
    sha: 41fcc0f5a7c613afd2dee5e4b30c3e6acafb8ad6f0edb06068811f708a67c562
  - kind: registry
    name: epaint_default_fonts
    version: 0.31.1
    sha: fc7e7a64c02cf7a5b51e745a9e45f60660a286f151c238b9d397b3e923f5082f
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: error-code
    version: 3.3.2
    sha: dea2df4cf52843e0452895c455a1a2cfbb842a1e7329671acf418fdc53ed4c59
  - kind: registry
    name: etagere
    version: 0.2.15
    sha: fc89bf99e5dc15954a60f707c1e09d7540e5cd9af85fa75caa0b510bc08c5342
  - kind: registry
    name: euclid
    version: 0.22.13
    sha: df61bf483e837f88d5c2291dcf55c67be7e676b3a51acc48db3a7b163b91ed63
  - kind: registry
    name: event-listener
    version: 5.4.1
    sha: e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: fast-srgb8
    version: 1.0.0
    sha: dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: find-crate
    version: 0.6.3
    sha: 59a98bbaacea1c0eb6a0876280051b892eb73594fd90cf3b20e9c817029c57d2
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: flate2
    version: 1.1.9
    sha: 843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c
  - kind: registry
    name: float-cmp
    version: 0.10.0
    sha: b09cf3155332e944990140d967ff5eceb70df778b34f77d8075db46e4704e6d8
  - kind: registry
    name: float-cmp
    version: 0.9.0
    sha: 98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4
  - kind: registry
    name: float_next_after
    version: 1.0.0
    sha: 8bf7cc16383c4b8d58b9905a8509f02926ce3058053c056376248d958c9df1e8
  - kind: registry
    name: fluent
    version: 0.17.0
    sha: 8137a6d5a2c50d6b0ebfcb9aaa91a28154e0a70605f112d30cb0cd4a78670477
  - kind: registry
    name: fluent-bundle
    version: 0.16.0
    sha: 01203cb8918f5711e73891b347816d932046f95f54207710bda99beaeb423bf4
  - kind: registry
    name: fluent-langneg
    version: 0.13.1
    sha: 7eebbe59450baee8282d71676f3bfed5689aeab00b27545e83e5f14b1195e8b0
  - kind: registry
    name: fluent-syntax
    version: 0.12.0
    sha: 54f0d287c53ffd184d04d8677f590f4ac5379785529e5e08b1c8083acdd5c198
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: foldhash
    version: 0.1.5
    sha: d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2
  - kind: registry
    name: foldhash
    version: 0.2.0
    sha: 77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb
  - kind: registry
    name: font-types
    version: 0.10.1
    sha: 39a654f404bbcbd48ea58c617c2993ee91d1cb63727a37bf2323a4edeed1b8c5
  - kind: registry
    name: font-types
    version: 0.11.0
    sha: b1e4d2d0cf79d38430cc9dc9aadec84774bff2e1ba30ae2bf6c16cfce9385a23
  - kind: registry
    name: fontconfig-parser
    version: 0.5.8
    sha: bbc773e24e02d4ddd8395fd30dc147524273a83e54e0f312d986ea30de5f5646
  - kind: registry
    name: fontdb
    version: 0.23.0
    sha: 457e789b3d1202543297a350643cf459f836cade38934e7a4cf6a39e7cde2905
  - kind: registry
    name: foreign-types
    version: 0.5.0
    sha: d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965
  - kind: registry
    name: foreign-types-macros
    version: 0.2.3
    sha: 1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742
  - kind: registry
    name: foreign-types-shared
    version: 0.3.1
    sha: aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: fsevent-sys
    version: 4.1.0
    sha: 76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2
  - kind: registry
    name: futures
    version: 0.3.32
    sha: 8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d
  - kind: registry
    name: futures-channel
    version: 0.3.32
    sha: 07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d
  - kind: registry
    name: futures-core
    version: 0.3.32
    sha: 7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d
  - kind: registry
    name: futures-executor
    version: 0.3.32
    sha: baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d
  - kind: registry
    name: futures-io
    version: 0.3.32
    sha: cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718
  - kind: registry
    name: futures-lite
    version: 2.6.1
    sha: f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad
  - kind: registry
    name: futures-macro
    version: 0.3.32
    sha: e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b
  - kind: registry
    name: futures-sink
    version: 0.3.32
    sha: c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893
  - kind: registry
    name: futures-task
    version: 0.3.32
    sha: 037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393
  - kind: registry
    name: futures-util
    version: 0.3.32
    sha: 389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6
  - kind: registry
    name: gbm
    version: 0.18.0
    sha: ce852e998d3ca5e4a97014fb31c940dc5ef344ec7d364984525fd11e8a547e6a
  - kind: registry
    name: gbm-sys
    version: 0.4.0
    sha: c13a5f2acc785d8fb6bf6b7ab6bfb0ef5dad4f4d97e8e70bb8e470722312f76f
  - kind: registry
    name: generator
    version: 0.8.8
    sha: 52f04ae4152da20c76fe800fa48659201d5cf627c5149ca0b707b69d7eef6cf9
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: gethostname
    version: 1.1.0
    sha: 1bd49230192a3797a9a4d6abe9b3eed6f7fa4c8a8a4947977c6f80025f92cbd8
  - kind: registry
    name: getrandom
    version: 0.2.17
    sha: ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0
  - kind: registry
    name: getrandom
    version: 0.3.4
    sha: 899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd
  - kind: registry
    name: getrandom
    version: 0.4.1
    sha: 139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gimli
    version: 0.32.3
    sha: e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: registry
    name: glam
    version: 0.25.0
    sha: 151665d9be52f9bb40fc7966565d39666f2d1e69233571b71b87791c7e0528b3
  - kind: registry
    name: glow
    version: 0.16.0
    sha: c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08
  - kind: registry
    name: grid
    version: 1.0.0
    sha: f9e2d4c0a8296178d8802098410ca05d86b17a10bb5ab559b3fb404c1f948220
  - kind: registry
    name: guillotiere
    version: 0.6.2
    sha: b62d5865c036cb1393e23c50693df631d3f5d7bcca4c04fe4cc0fd592e74a782
  - kind: registry
    name: half
    version: 2.7.1
    sha: 6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b
  - kind: registry
    name: harfrust
    version: 0.5.0
    sha: 4f9f40651a03bc0f7316bd75267ff5767e93017ef3cfffe76c6aa7252cc5a31c
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.15.5
    sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
  - kind: registry
    name: hashbrown
    version: 0.16.1
    sha: 841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100
  - kind: registry
    name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hermit-abi
    version: 0.3.9
    sha: d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024
  - kind: registry
    name: hermit-abi
    version: 0.5.2
    sha: fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hexf-parse
    version: 0.2.1
    sha: dfa686283ad6dd069f105e5ab091b04c62850d3e4cf5d67debad1933f55023df
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: home
    version: 0.5.12
    sha: cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d
  - kind: registry
    name: i18n-config
    version: 0.4.8
    sha: 3e06b90c8a0d252e203c94344b21e35a30f3a3a85dc7db5af8f8df9f3e0c63ef
  - kind: registry
    name: i18n-embed
    version: 0.16.0
    sha: a217bbb075dcaefb292efa78897fc0678245ca67f265d12c351e42268fcb0305
  - kind: registry
    name: i18n-embed-fl
    version: 0.10.0
    sha: e598ed73b67db92f61e04672e599eef2991a262a40e1666735b8a86d2e7e9f30
  - kind: registry
    name: i18n-embed-impl
    version: 0.8.4
    sha: 0f2cc0e0523d1fe6fc2c6f66e5038624ea8091b3e7748b5e8e0c84b1698db6c2
  - kind: registry
    name: iana-time-zone
    version: 0.1.65
    sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_debug
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_futures
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_graphics
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_program
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_renderer
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_runtime
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_tiny_skia
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_wgpu
    version: 0.14.0
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: iced_widget
    version: 0.14.2
  - kind: registry
    name: icu_collections
    version: 2.1.1
    sha: 4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43
  - kind: registry
    name: icu_locale_core
    version: 2.1.1
    sha: edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6
  - kind: registry
    name: icu_normalizer
    version: 2.1.1
    sha: 5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599
  - kind: registry
    name: icu_normalizer_data
    version: 2.1.1
    sha: 7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a
  - kind: registry
    name: icu_properties
    version: 2.1.2
    sha: 020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec
  - kind: registry
    name: icu_properties_data
    version: 2.1.2
    sha: 616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af
  - kind: registry
    name: icu_provider
    version: 2.1.1
    sha: 85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614
  - kind: registry
    name: id-arena
    version: 2.3.0
    sha: 3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954
  - kind: git
    commit: 632a57d6d49160e18d7300fa7edae52281ec5482
    repo: github:Drakulix/id-tree.git
    query:
      branch: feature/copy_clone
    name: id_tree
    version: 1.8.0
  - kind: registry
    name: ident_case
    version: 1.0.1
    sha: b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39
  - kind: registry
    name: idna
    version: 1.1.0
    sha: 3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de
  - kind: registry
    name: idna_adapter
    version: 1.2.1
    sha: 3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344
  - kind: registry
    name: image
    version: 0.25.9
    sha: e6506c6c10786659413faa717ceebcb8f70731c0a60cbae39795fdf114519c1a
  - kind: registry
    name: image-webp
    version: 0.2.4
    sha: 525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3
  - kind: registry
    name: imagesize
    version: 0.12.0
    sha: 029d73f573d8e8d63e6d5020011d3255b28c3ba85d6cf870a07184ed23de9284
  - kind: registry
    name: imagesize
    version: 0.13.0
    sha: edcd27d72f2f071c64249075f42e205ff93c9a4c5f6c6da53e79ed9f9832c285
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.13.0
    sha: 7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017
  - kind: registry
    name: inotify
    version: 0.11.0
    sha: f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3
  - kind: registry
    name: inotify-sys
    version: 0.1.5
    sha: e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb
  - kind: registry
    name: input
    version: 0.9.1
    sha: fbdc09524a91f9cacd26f16734ff63d7dc650daffadd2b6f84d17a285bd875a9
  - kind: registry
    name: input-sys
    version: 1.18.0
    sha: bd4f5b4d1c00331c5245163aacfe5f20be75b564c7112d45893d4ae038119eb0
  - kind: registry
    name: intl-memoizer
    version: 0.5.3
    sha: 310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f
  - kind: registry
    name: intl_pluralrules
    version: 7.0.2
    sha: 078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972
  - kind: registry
    name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - kind: registry
    name: itoa
    version: 1.0.17
    sha: 92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2
  - kind: registry
    name: jiff
    version: 0.2.22
    sha: 819b44bc7c87d9117eb522f14d46e918add69ff12713c475946b0a29363ed1c2
  - kind: registry
    name: jiff-static
    version: 0.2.22
    sha: 470252db18ecc35fd766c0891b1e3ec6cbbcd62507e85276c01bf75d8e94d4a1
  - kind: registry
    name: jiff-tzdb
    version: 0.1.5
    sha: 68971ebff725b9e2ca27a601c5eb38a4c5d64422c4cbab0c535f248087eda5c2
  - kind: registry
    name: jiff-tzdb-platform
    version: 0.1.3
    sha: 875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8
  - kind: registry
    name: jni
    version: 0.21.1
    sha: 1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97
  - kind: registry
    name: jni-sys
    version: 0.3.0
    sha: 8eaf4bc02d17cbdd7ff4c7438cafcdf7fb9a4613313ad11b4f8fefe7d3fa0130
  - kind: registry
    name: jobserver
    version: 0.1.34
    sha: 9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33
  - kind: registry
    name: js-sys
    version: 0.3.89
    sha: f4eacb0641a310445a4c513f2a5e23e19952e269c6a38887254d5f837a305506
  - kind: registry
    name: kamadak-exif
    version: 0.6.1
    sha: 1130d80c7374efad55a117d715a3af9368f0fa7a2c54573afc15a188cd984837
  - kind: registry
    name: kdl
    version: 6.5.0
    sha: 81a29e7b50079ff44549f68c0becb1c73d7f6de2a4ea952da77966daf3d4761e
  - kind: registry
    name: keyframe
    version: 1.1.1
    sha: 60708bf7981518d09095d6f5673ce5cf6a64f1e0d9708b554f670e6d9d2bd9a9
  - kind: registry
    name: khronos_api
    version: 3.1.0
    sha: e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc
  - kind: registry
    name: known-folders
    version: 1.4.1
    sha: 770919970f7d2f74fea948900d35e2ef64f44129e8ae4015f59de1f0aca7c2a5
  - kind: registry
    name: kqueue
    version: 1.1.1
    sha: eac30106d7dce88daf4a3fcb4879ea939476d5074a9b7ddd0fb97fa4bed5596a
  - kind: registry
    name: kqueue-sys
    version: 1.0.4
    sha: ed9625ffda8729b85e45cf04090035ac368927b8cebc34898e7c120f52e4838b
  - kind: registry
    name: kurbo
    version: 0.10.4
    sha: 1618d4ebd923e97d67e7cd363d80aef35fe961005cbbbb3d2dad8bdd1bc63440
  - kind: registry
    name: kurbo
    version: 0.11.3
    sha: c62026ae44756f8a599ba21140f350303d4f08dcdcc71b5ad9c9bb8128c13c62
  - kind: registry
    name: kurbo
    version: 0.9.5
    sha: bd85a5776cd9500c2e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: leb128fmt
    version: 0.1.0
    sha: 09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2
  - kind: registry
    name: libc
    version: 0.2.182
    sha: 6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112
  - kind: git
    commit: 0bb006c5bbf7eb89491891d45bfc8f21f8eb1305
    repo: github:pop-os/libcosmic
    name: libcosmic
    version: 1.0.0
  - kind: registry
    name: libdisplay-info
    version: 0.3.0
    sha: 59fd96dbb2381ff31f314f07accbdf8550febdcc5cd8761ecaf7c1763361c359
  - kind: registry
    name: libdisplay-info-derive
    version: 0.1.1
    sha: 8dc2c710cf5819e91220a446d9e64acc6814386cc22c509c3f0df83c0b874a98
  - kind: registry
    name: libdisplay-info-sys
    version: 0.3.0
    sha: 26590d55b8819f9c6b0d95d9d12dc9edbfd1f2413e88814a33b631ac049bb51f
  - kind: registry
    name: libloading
    version: 0.8.9
    sha: d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55
  - kind: registry
    name: libm
    version: 0.2.16
    sha: b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981
  - kind: registry
    name: libredox
    version: 0.1.12
    sha: 3d0b95e02c851351f877147b7deea7b1afb1df71b63aa5f8270716e0c5720616
  - kind: registry
    name: libseat
    version: 0.2.4
    sha: 6656c69b6e0366ffb83faa232f3e4fda5fc91161722d140f2c95ce2e90b1ef31
  - kind: registry
    name: libseat-sys
    version: 0.2.0
    sha: e8a484fa48be5f62a8d3ffed767779d0ab808cfead91de98ef4362d469097dfb
  - kind: registry
    name: libsystemd
    version: 0.7.2
    sha: 19c97a761fc86953c5b885422b22c891dbf5bcb9dcc99d0110d6ce4c052759f0
  - kind: registry
    name: libudev-sys
    version: 0.1.4
    sha: 3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324
  - kind: registry
    name: lilt
    version: 0.8.1
    sha: f67562e5eff6b20553fa9be1c503356768420994e28f67e3eafe6f41910e57ad
  - kind: registry
    name: linebender_resource_handle
    version: 0.1.1
    sha: d4a5ff6bcca6c4867b1c4fd4ef63e4db7436ef363e0ad7531d1558856bae64f4
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: linux-raw-sys
    version: 0.6.5
    sha: 2a385b1be4e5c3e362ad2ffa73c392e53f031eaa5b7d648e64cd87f27f6063d7
  - kind: registry
    name: litemap
    version: 0.8.1
    sha: 6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77
  - kind: registry
    name: litrs
    version: 1.0.0
    sha: 11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.29
    sha: 5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897
  - kind: registry
    name: log-panics
    version: 2.1.0
    sha: 68f9dd8546191c1850ecf67d22f5ff00a935b890d0e84713159a55495cc2ac5f
  - kind: registry
    name: logind-zbus
    version: 5.3.2
    sha: 469c962578b549a82f3d0cc72d0f77d1123780fa7121e2b03d78b0780f6ccac6
  - kind: registry
    name: loom
    version: 0.7.2
    sha: 419e0dc8046cb947daa77eb95ae174acfbddb7673b4151f56d1eed8e93fbfaca
  - kind: registry
    name: lru
    version: 0.16.3
    sha: a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593
  - kind: registry
    name: lyon
    version: 1.0.16
    sha: dbcb7d54d54c8937364c9d41902d066656817dce1e03a44e5533afebd1ef4352
  - kind: registry
    name: lyon_algorithms
    version: 1.0.16
    sha: f4c0829e28c4f336396f250d850c3987e16ce6db057ffe047ce0dd54aab6b647
  - kind: registry
    name: lyon_geom
    version: 1.0.18
    sha: e260b6de923e6e47adfedf6243013a7a874684165a6a277594ee3906021b2343
  - kind: registry
    name: lyon_path
    version: 1.0.16
    sha: 1aeca86bcfd632a15984ba029b539ffb811e0a70bf55e814ef8b0f54f506fdeb
  - kind: registry
    name: lyon_tessellation
    version: 1.0.16
    sha: f3f586142e1280335b1bc89539f7c97dd80f08fc43e9ab1b74ef0a42b04aa353
  - kind: registry
    name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: memchr
    version: 2.8.0
    sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
  - kind: registry
    name: memmap2
    version: 0.9.10
    sha: 714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: miette
    version: 7.6.0
    sha: 5f98efec8807c63c752b5bd61f862c165c115b0a35685bdcfd9238c7aeb592b7
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: mime
    version: 0.1.0
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - kind: registry
    name: mime_guess2
    version: 2.3.1
    sha: 1706dc14a2e140dec0a7a07109d9a3d5890b81e85bd6c60b906b249a77adf0ca
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: mint
    version: 0.5.9
    sha: e53debba6bda7a793e5f99b8dacf19e626084f525f7829104ba9898f367d85ff
  - kind: registry
    name: mio
    version: 1.1.1
    sha: a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc
  - kind: registry
    name: moxcms
    version: 0.7.11
    sha: ac9557c559cd6fc9867e122e20d2cbefc9ca29d80d027a8e39310920ed2f0a97
  - kind: registry
    name: mutate_once
    version: 0.1.2
    sha: 13d2233c9842d08cfe13f9eac96e207ca6a2ea10b80259ebe8ad0268be27d2af
  - kind: registry
    name: naga
    version: 27.0.3
    sha: 066cf25f0e8b11ee0df221219010f213ad429855f57c494f995590c861a9a7d8
  - kind: registry
    name: ndk
    version: 0.9.0
    sha: c3f42e7bbe13d351b6bead8286a43aac9534b82bd3cc43e47037f012ebfd62d4
  - kind: registry
    name: ndk-context
    version: 0.1.1
    sha: 27b02d87554356db9e9a873add8782d4ea6e3e58ea071a9adb9a2e8ddb884a8b
  - kind: registry
    name: ndk-sys
    version: 0.6.0+11769913
    sha: ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873
  - kind: registry
    name: nix
    version: 0.29.0
    sha: 71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46
  - kind: registry
    name: nohash-hasher
    version: 0.2.0
    sha: 2bf50223579dc7cdcfb3bfcacf7069ff68243f8c363f62ffa99cf000a6b9c451
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: notify
    version: 8.2.0
    sha: 4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3
  - kind: registry
    name: notify-types
    version: 2.1.0
    sha: 42b8cfee0e339a0337359f3c88165702ac6e600dc01c0cc9579a92d62b08477a
  - kind: registry
    name: nu-ansi-term
    version: 0.50.3
    sha: 7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5
  - kind: registry
    name: num
    version: 0.4.3
    sha: 35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23
  - kind: registry
    name: num-bigint
    version: 0.4.6
    sha: a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9
  - kind: registry
    name: num-complex
    version: 0.4.6
    sha: 73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495
  - kind: registry
    name: num-conv
    version: 0.2.0
    sha: cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70e49aa4a6b7d74e9919050
  - kind: registry
    name: num-integer
    version: 0.1.46
    sha: 7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f
  - kind: registry
    name: num-iter
    version: 0.1.45
    sha: 1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf
  - kind: registry
    name: num-rational
    version: 0.4.2
    sha: f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: num_enum
    version: 0.7.5
    sha: b1207a7e20ad57b847bbddc6776b968420d38292bbfe2089accff5e19e82454c
  - kind: registry
    name: num_enum_derive
    version: 0.7.5
    sha: ff32365de1b6743cb203b710788263c44a03de03802daf96092f2da4fe6ba4d7
  - kind: registry
    name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - kind: registry
    name: objc-foundation
    version: 0.1.1
    sha: 1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9
  - kind: registry
    name: objc-sys
    version: 0.3.5
    sha: cdb91bdd390c7ce1a8607f35f3ca7151b65afc0ff5ff3b34fa350f7d7c7e4310
  - kind: registry
    name: objc2
    version: 0.5.2
    sha: 46a785d4eeff09c14c487497c162e92766fbb3e4059a71840cecc03d9a50b804
  - kind: registry
    name: objc2-app-kit
    version: 0.2.2
    sha: e4e89ad9e3d7d297152b17d39ed92cd50ca8063a89a9fa569046d41568891eff
  - kind: registry
    name: objc2-cloud-kit
    version: 0.2.2
    sha: 74dd3b56391c7a0596a295029734d3c1c5e7e510a4cb30245f8221ccea96b009
  - kind: registry
    name: objc2-contacts
    version: 0.2.2
    sha: a5ff520e9c33812fd374d8deecef01d4a840e7b41862d849513de77e44aa4889
  - kind: registry
    name: objc2-core-data
    version: 0.2.2
    sha: 617fbf49e071c178c0b24c080767db52958f716d9eabdf0890523aeae54773ef
  - kind: registry
    name: objc2-core-image
    version: 0.2.2
    sha: 55260963a527c99f1819c4f8e3b47fe04f9650694ef348ffd2227e8196d34c80
  - kind: registry
    name: objc2-core-location
    version: 0.2.2
    sha: 000cfee34e683244f284252ee206a27953279d370e309649dc3ee317b37e5781
  - kind: registry
    name: objc2-encode
    version: 4.1.0
    sha: ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33
  - kind: registry
    name: objc2-foundation
    version: 0.2.2
    sha: 0ee638a5da3799329310ad4cfa62fbf045d5f56e3ef5ba4149e7452dcf89d5a8
  - kind: registry
    name: objc2-link-presentation
    version: 0.2.2
    sha: a1a1ae721c5e35be65f01a03b6d2ac13a54cb4fa70d8a5da293d7b0020261398
  - kind: registry
    name: objc2-metal
    version: 0.2.2
    sha: dd0cba1276f6023976a406a14ffa85e1fdd19df6b0f737b063b95f6c8c7aadd6
  - kind: registry
    name: objc2-quartz-core
    version: 0.2.2
    sha: e42bee7bff906b14b167da2bac5efe6b6a07e6f7c0a21a7308d40c960242dc7a
  - kind: registry
    name: objc2-symbols
    version: 0.2.2
    sha: 0a684efe3dec1b305badae1a28f6555f6ddd3bb2c2267896782858d5a78404dc
  - kind: registry
    name: objc2-ui-kit
    version: 0.2.2
    sha: b8bb46798b20cd6b91cbd113524c490f1686f4c4e8f49502431415f3512e2b6f
  - kind: registry
    name: objc2-uniform-type-identifiers
    version: 0.2.2
    sha: 44fa5f9748dbfe1ca6c0b79ad20725a11eca7c2218bceb4b005cb1be26273bfe
  - kind: registry
    name: objc2-user-notifications
    version: 0.2.2
    sha: 76cfcbf642358e8689af64cee815d139339f3ed8ad05103ed5eaf73db8d84cb3
  - kind: registry
    name: objc_id
    version: 0.1.1
    sha: c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b
  - kind: registry
    name: object
    version: 0.37.3
    sha: ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe
  - kind: registry
    name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: orbclient
    version: 0.3.50
    sha: 52ad2c6bae700b7aa5d1cc30c59bdd3a1c180b09dbaea51e2ae2b8e1cf211fdd
  - kind: registry
    name: ordered-float
    version: 5.1.0
    sha: 7f4779c6901a562440c3786d08192c6fbda7c1c2060edd10006b05ee35d10f2d
  - kind: registry
    name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - kind: registry
    name: ouroboros
    version: 0.18.5
    sha: 1e0f050db9c44b97a94723127e6be766ac5c340c48f2c4bb3ffa11713744be59
  - kind: registry
    name: ouroboros_macro
    version: 0.18.5
    sha: 3c7028bdd3d43083f6d8d4d5187680d0d3560d54df4cc9d752005268b41e64d0
  - kind: registry
    name: owned_ttf_parser
    version: 0.25.1
    sha: 36820e9051aca1014ddc75770aab4d68bc1e9e632f0f5627c4086bc216fb583b
  - kind: registry
    name: palette
    version: 0.7.6
    sha: 4cbf71184cc5ecc2e4e1baccdb21026c20e5fc3dcf63028a086131b3ab00b6e6
  - kind: registry
    name: palette_derive
    version: 0.7.6
    sha: f5030daf005bface118c096f510ffb781fc28f9ab6a32ab224d8631be6851d30
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: parking_lot
    version: 0.12.5
    sha: 93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a
  - kind: registry
    name: parking_lot_core
    version: 0.9.12
    sha: 2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1
  - kind: registry
    name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: phf
    version: 0.11.3
    sha: 1fd6780a80ae0c52cc120a26a1a42c1ae51b247a253e4e06113d23d2c2edd078
  - kind: registry
    name: phf
    version: 0.13.1
    sha: c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf
  - kind: registry
    name: phf_generator
    version: 0.11.3
    sha: 3c80231409c20246a13fddb31776fb942c38553c51e871f8cbd687a4cfb5843d
  - kind: registry
    name: phf_generator
    version: 0.13.1
    sha: 135ace3a761e564ec88c03a77317a7c6b80bb7f7135ef2544dbe054243b89737
  - kind: registry
    name: phf_macros
    version: 0.11.3
    sha: f84ac04429c13a7ff43785d75ad27569f2951ce0ffd30a3321230db2fc727216
  - kind: registry
    name: phf_macros
    version: 0.13.1
    sha: 812f032b54b1e759ccd5f8b6677695d5268c588701effba24601f6932f8269ef
  - kind: registry
    name: phf_shared
    version: 0.11.3
    sha: 67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5
  - kind: registry
    name: phf_shared
    version: 0.13.1
    sha: e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266
  - kind: registry
    name: pico-args
    version: 0.5.0
    sha: 5be167a7af36ee22fe3115051bc51f6e6c7054c9348e28deb4f49bd6f705a315
  - kind: registry
    name: pin-project
    version: 1.1.10
    sha: 677f1add503faace112b9f1373e43e9e054bfdd22ff1a63c1bc485eaec6a6a8a
  - kind: registry
    name: pin-project-internal
    version: 1.1.10
    sha: 6e918e4ff8c4549eb882f14b3a4bc8c8bc93de829416eacf579f1207a8fbf861
  - kind: registry
    name: pin-project-lite
    version: 0.2.16
    sha: 3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: piper
    version: 0.2.4
    sha: 96c8c490f422ef9a4efd2cb5b42b76c8613d7e7dfc1caf667b8a3350a5acc066
  - kind: registry
    name: pixman
    version: 0.2.1
    sha: cea217d496c19ac0a8e502b37078e1f683d16344adee9eb247a5d57c165e1edf
  - kind: registry
    name: pixman-sys
    version: 0.1.0
    sha: a1a0483e89e81d7915defe83c51f23f6800594d64f6f4a21253ce87fd8444ada
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: png
    version: 0.17.16
    sha: 82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526
  - kind: registry
    name: png
    version: 0.18.1
    sha: 60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61
  - kind: registry
    name: polling
    version: 3.11.0
    sha: 5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218
  - kind: registry
    name: portable-atomic
    version: 1.13.1
    sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
  - kind: registry
    name: portable-atomic-util
    version: 0.2.5
    sha: 7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5
  - kind: registry
    name: potential_utf
    version: 0.1.4
    sha: b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: prettyplease
    version: 0.2.37
    sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
  - kind: registry
    name: proc-macro-crate
    version: 3.4.0
    sha: 219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983
  - kind: registry
    name: proc-macro-error-attr2
    version: 2.0.0
    sha: 96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5
  - kind: registry
    name: proc-macro-error2
    version: 2.0.1
    sha: 11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
  - kind: registry
    name: proc-macro2-diagnostics
    version: 0.10.1
    sha: af066a9c399a26e020ada66a034357a868728e72cd426f3adcd35f80d88d88c8
  - kind: registry
    name: profiling
    version: 1.0.17
    sha: 3eb8486b569e12e2c32ad3e204dbaba5e4b5b216e9367044f25f1dba42341773
  - kind: registry
    name: profiling-procmacros
    version: 1.0.17
    sha: 52717f9a02b6965224f95ca2a81e2e0c5c43baacd28ca057577988930b6c3d5b
  - kind: registry
    name: pxfm
    version: 0.1.27
    sha: 7186d3822593aa4393561d186d1393b3923e9d6163d3fbfd6e825e3e6cf3e6a8
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quote
    version: 1.0.44
    sha: 21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: rand
    version: 0.10.0
    sha: bc266eb313df6c5c09c1c7b1fbe2510961e5bcd3add930c1e31f7ed9da0feff8
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand
    version: 0.9.2
    sha: 6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1
  - kind: registry
    name: rand_chacha
    version: 0.9.0
    sha: d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb
  - kind: registry
    name: rand_core
    version: 0.10.0
    sha: 0c8d0fd677905edcbeedbf2edb6494d676f0e98d54d5cf9bda0b061cb8fb8aba
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: rand_core
    version: 0.9.5
    sha: 76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c
  - kind: registry
    name: rangemap
    version: 1.7.1
    sha: 973443cf09a9c8656b574a866ab68dfa19f0867d0340648c7d2f6a71b8a8ea68
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: rctree
    version: 0.5.0
    sha: 3b42e27ef78c35d3998403c1d26f3efd9e135d3e5121b0a4845cc5cc27547f4f
  - kind: registry
    name: read-fonts
    version: 0.35.0
    sha: 6717cf23b488adf64b9d711329542ba34de147df262370221940dfabc2c91358
  - kind: registry
    name: read-fonts
    version: 0.37.0
    sha: 7b634fabf032fab15307ffd272149b622260f55974d9fad689292a5d33df02e5
  - kind: registry
    name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_syscall
    version: 0.7.2
    sha: 6d94dd2f7cd932d4dc02cc8b2b50dfd38bd079a4e5d79198b99743d7fcf9a4b4
  - kind: registry
    name: redox_users
    version: 0.5.2
    sha: a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac
  - kind: registry
    name: ref-cast
    version: 1.0.25
    sha: f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d
  - kind: registry
    name: ref-cast-impl
    version: 1.0.25
    sha: b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da
  - kind: registry
    name: regex
    version: 1.12.3
    sha: e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276
  - kind: registry
    name: regex-automata
    version: 0.4.14
    sha: 6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f
  - kind: registry
    name: regex-syntax
    version: 0.8.10
    sha: dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a
  - kind: registry
    name: renderdoc-sys
    version: 1.1.0
    sha: 19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832
  - kind: registry
    name: resvg
    version: 0.37.0
    sha: cadccb3d99a9efb8e5e00c16fbb732cbe400db2ec7fc004697ee7d97d86cf1f4
  - kind: registry
    name: resvg
    version: 0.45.1
    sha: a8928798c0a55e03c9ca6c4c6846f76377427d2c1e1f7e6de3c06ae57942df43
  - kind: registry
    name: rgb
    version: 0.8.52
    sha: 0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce
  - kind: registry
    name: ron
    version: 0.11.0
    sha: db09040cc89e461f1a265139777a2bde7f8d8c67c4936f700c63ce3e2904d468
  - kind: registry
    name: ron
    version: 0.12.0
    sha: fd490c5b18261893f14449cbd28cb9c0b637aebf161cd77900bfdedaff21ec32
  - kind: registry
    name: roxmltree
    version: 0.19.0
    sha: 3cd14fd5e3b777a7422cca79358c57a8f6e3a703d9ac187448d0daf220c2407f
  - kind: registry
    name: roxmltree
    version: 0.20.0
    sha: 6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97
  - kind: registry
    name: rust-embed
    version: 8.11.0
    sha: 04113cb9355a377d83f06ef1f0a45b8ab8cd7d8b1288160717d66df5c7988d27
  - kind: registry
    name: rust-embed-impl
    version: 8.11.0
    sha: da0902e4c7c8e997159ab384e6d0fc91c221375f6894346ae107f47dd0f3ccaa
  - kind: registry
    name: rust-embed-utils
    version: 8.11.0
    sha: 5bcdef0be6fe7f6fa333b1073c949729274b05f123a0ad7efcb8efd878e5c3b1
  - kind: registry
    name: rustc-demangle
    version: 0.1.27
    sha: b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - kind: registry
    name: rustc-hash
    version: 2.1.1
    sha: 357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.4
    sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
  - kind: registry
    name: rustybuzz
    version: 0.20.1
    sha: fd3c7c96f8a08ee34eff8857b11b49b07d71d1c3f4e88f8a88d4c9e9f90b1702
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: sanitize-filename
    version: 0.6.0
    sha: bc984f4f9ceb736a7bb755c3e3bd17dc56370af2600c9780dcc48c66453da34d
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.1
    sha: a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc
  - kind: registry
    name: scoped-tls
    version: 1.0.1
    sha: e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: self_cell
    version: 1.2.2
    sha: b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89
  - kind: registry
    name: semver
    version: 1.0.27
    sha: d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2
  - kind: registry
    name: serde
    version: 1.0.228
    sha: 9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e
  - kind: registry
    name: serde_core
    version: 1.0.228
    sha: 41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad
  - kind: registry
    name: serde_derive
    version: 1.0.228
    sha: d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79
  - kind: registry
    name: serde_json
    version: 1.0.149
    sha: 83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86
  - kind: registry
    name: serde_repr
    version: 0.1.20
    sha: 175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c
  - kind: registry
    name: serde_spanned
    version: 1.0.4
    sha: f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776
  - kind: registry
    name: serde_with
    version: 3.16.1
    sha: 4fa237f2807440d238e0364a218270b98f767a00d3dada77b1c53ae88940e2e7
  - kind: registry
    name: serde_with_macros
    version: 3.16.1
    sha: 52a8e3ca0ca629121f70ab50f95249e5a6f925cc0f6ffe8256c45b728875706c
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: simd-adler32
    version: 0.3.8
    sha: e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2
  - kind: registry
    name: simplecss
    version: 0.2.2
    sha: 7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c
  - kind: registry
    name: siphasher
    version: 0.3.11
    sha: 38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d
  - kind: registry
    name: siphasher
    version: 1.0.2
    sha: b2aa850e253778c88a04c3d7323b043aeda9d3e30d5971937c1855769763678e
  - kind: registry
    name: skrifa
    version: 0.37.0
    sha: 8c31071dedf532758ecf3fed987cdb4bd9509f900e026ab684b4ecb81ea49841
  - kind: registry
    name: skrifa
    version: 0.40.0
    sha: 7fbdfe3d2475fbd7ddd1f3e5cf8288a30eb3e5f95832829570cd88115a7434ac
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
  - kind: registry
    name: slotmap
    version: 1.1.1
    sha: bdd58c3c93c3d278ca835519292445cb4b0d4dc59ccfdf7ceadaab3f8aeb4038
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: git
    commit: e84a4ca82d58d783839083bd48c4ab120715c4b6
    repo: github:smithay/smithay.git
    query:
      rev: e84a4ca
    name: smithay
    version: 0.7.0
  - kind: registry
    name: smithay-client-toolkit
    version: 0.19.2
    sha: 3457dea1f0eb631b4034d61d4d8c32074caa6cd1ab2d59f2327bd8461e2c0016
  - kind: registry
    name: smithay-client-toolkit
    version: 0.20.0
    sha: 0512da38f5e2b31201a93524adb8d3136276fa4fe4aafab4e1f727a82b534cc0
  - kind: git
    commit: 859b02c88f45c554049a67c6ddeec1692ce0e20b
    repo: github:pop-os/smithay-clipboard
    query:
      tag: sctk-0.20
    name: smithay-clipboard
    version: 0.8.0
  - kind: registry
    name: smithay-egui
    version: 0.2.0
    sha: 6794c95b83518f9f91ae8c2faee52302d521c0d541d016b4ed632374041d9c42
  - kind: registry
    name: smol_str
    version: 0.2.2
    sha: dd538fb6910ac1099850255cf94a94df6551fbdd602454387d0adb2d1ca6dead
  - kind: registry
    name: smol_str
    version: 0.3.5
    sha: 0f7a918bd2a9951d18ee6e48f076843e8e73a9a5d22cf05bcd4b7a81bdd04e17
  - kind: registry
    name: snowflake
    version: 1.3.0
    sha: 27207bb65232eda1f588cf46db2fee75c0808d557f6b3cf19a75f5d6d7c94df1
  - kind: git
    commit: a3f77e251e7422803f693df6e3fc313c010c4dcb
    repo: github:pop-os/softbuffer
    query:
      tag: cosmic-4.0
    name: softbuffer
    version: 0.4.1
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: strict-num
    version: 0.1.1
    sha: 6637bab7722d379c8b41ba849228d680cc12d0a45ba1fa2b48f2a30577a06731
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: registry
    name: svg_fmt
    version: 0.4.5
    sha: 0193cc4331cfd2f3d2011ef287590868599a2f33c3e69bc22c1a3d3acf9e02fb
  - kind: registry
    name: svgtypes
    version: 0.13.0
    sha: 6e44e288cd960318917cbd540340968b90becc8bc81f171345d706e7a89d9d70
  - kind: registry
    name: svgtypes
    version: 0.15.3
    sha: 68c7541fff44b35860c1a7a47a7cadf3e4a304c457b58f9870d9706ece028afc
  - kind: registry
    name: swash
    version: 0.2.6
    sha: 47846491253e976bdd07d0f9cc24b7daf24720d11309302ccbbc6e6b6e53550a
  - kind: registry
    name: syn
    version: 2.0.117
    sha: e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: sys-locale
    version: 0.3.2
    sha: 8eab9a99a024a169fe8a903cf9d4a3b3601109bcc13bd9e3c6fff259138626c4
  - kind: registry
    name: system-deps
    version: 7.0.7
    sha: 48c8f33736f986f16d69b6cb8b03f55ddcad5c41acc4ccc39dd88e84aa805e7f
  - kind: registry
    name: taffy
    version: 0.9.2
    sha: 41ba83ebaf2954d31d05d67340fd46cebe99da2b7133b0dd68d70c65473a437b
  - kind: registry
    name: target-lexicon
    version: 0.13.3
    sha: df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c
  - kind: registry
    name: tempfile
    version: 3.26.0
    sha: 82a72c767771b47409d2345987fda8628641887d5466101319899796367354a0
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.18
    sha: 4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.18
    sha: ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5
  - kind: registry
    name: thread_local
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.47
    sha: 743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c
  - kind: registry
    name: time-core
    version: 0.1.8
    sha: 7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca
  - kind: registry
    name: time-macros
    version: 0.2.27
    sha: 2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215
  - kind: registry
    name: tiny-skia
    version: 0.11.4
    sha: 83d13394d44dae3207b52a326c0c85a8bf87f1541f23b0d143811088497b09ab
  - kind: registry
    name: tiny-skia-path
    version: 0.11.4
    sha: 9c9e7fc0c2e86a30b117d0462aa261b72b7a99b7ebd7deb3a14ceda95c5bdc93
  - kind: registry
    name: tiny-xlib
    version: 0.2.4
    sha: 0324504befd01cab6e0c994f34b2ffa257849ee019d3fb3b64fb2c858887d89e
  - kind: registry
    name: tinystr
    version: 0.8.2
    sha: 42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869
  - kind: registry
    name: tinyvec
    version: 1.10.0
    sha: bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml
    version: 0.9.12+spec-1.1.0
    sha: cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863
  - kind: registry
    name: toml_datetime
    version: 0.7.5+spec-1.1.0
    sha: 92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347
  - kind: registry
    name: toml_edit
    version: 0.23.10+spec-1.0.0
    sha: 84c8b9f757e028cee9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269
  - kind: registry
    name: toml_parser
    version: 1.0.9+spec-1.1.0
    sha: 702d4415e08923e7e1ef96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4
  - kind: registry
    name: toml_writer
    version: 1.0.6+spec-1.1.0
    sha: ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607
  - kind: registry
    name: tracing
    version: 0.1.44
    sha: 63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100
  - kind: registry
    name: tracing-attributes
    version: 0.1.31
    sha: 7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da
  - kind: registry
    name: tracing-core
    version: 0.1.36
    sha: db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a
  - kind: registry
    name: tracing-journald
    version: 0.3.2
    sha: 2d3a81ed245bfb62592b1e2bc153e77656d94ee6a0497683a65a12ccaf2438d0
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.22
    sha: 2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e
  - kind: registry
    name: tracy-client
    version: 0.18.4
    sha: a4f6fc3baeac5d86ab90c772e9e30620fc653bf1864295029921a15ef478e6a5
  - kind: registry
    name: tracy-client-sys
    version: 0.28.0
    sha: c5f7c95348f20c1c913d72157b3c6dee6ea3e30b3d19502c5a7f6d3f160dacbf
  - kind: registry
    name: ttf-parser
    version: 0.25.1
    sha: d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31
  - kind: registry
    name: type-map
    version: 0.5.1
    sha: cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: typenum
    version: 1.19.0
    sha: 562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb
  - kind: registry
    name: udev
    version: 0.9.3
    sha: af4e37e9ea4401fc841ff54b9ddfc9be1079b1e89434c1a6a865dd68980f7e9f
  - kind: registry
    name: uds_windows
    version: 1.1.0
    sha: 89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9
  - kind: registry
    name: uncased
    version: 0.9.10
    sha: e1b88fcfe09e89d3866a5c11019378088af2d24c3fbd4f0543f96b479ec90697
  - kind: registry
    name: unic-langid
    version: 0.9.6
    sha: a28ba52c9b05311f4f6e62d5d9d46f094bd6e84cb8df7b3ef952748d752a7d05
  - kind: registry
    name: unic-langid-impl
    version: 0.9.6
    sha: dce1bf08044d4b7a94028c93786f8566047edc11110595914de93362559bc658
  - kind: registry
    name: unicase
    version: 2.9.0
    sha: dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142
  - kind: registry
    name: unicode-bidi
    version: 0.3.18
    sha: 5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5
  - kind: registry
    name: unicode-bidi-mirroring
    version: 0.4.0
    sha: 5dfa6e8c60bb66d49db113e0125ee8711b7647b5579dc7f5f19c42357ed039fe
  - kind: registry
    name: unicode-ccc
    version: 0.4.0
    sha: ce61d488bcdc9bc8b5d1772c404828b17fc481c0a582b5581e95fb233aef503e
  - kind: registry
    name: unicode-ident
    version: 1.0.24
    sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-properties
    version: 0.1.4
    sha: 7df058c713841ad818f1dc5d3fd88063241cc61f49f5fbea4b951e8cf5a8d71d
  - kind: registry
    name: unicode-script
    version: 0.5.8
    sha: 383ad40bb927465ec0ce7720e033cb4ca06912855fc35db31b5755d0de75b1ee
  - kind: registry
    name: unicode-segmentation
    version: 1.12.0
    sha: f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493
  - kind: registry
    name: unicode-vo
    version: 0.1.0
    sha: b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94
  - kind: registry
    name: unicode-width
    version: 0.1.14
    sha: 7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - kind: registry
    name: url
    version: 2.5.8
    sha: ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed
  - kind: registry
    name: usvg
    version: 0.37.0
    sha: 38b0a51b72ab80ca511d126b77feeeb4fb1e972764653e61feac30adc161a756
  - kind: registry
    name: usvg
    version: 0.45.1
    sha: 80be9b06fbae3b8b303400ab20778c80bbaf338f563afe567cf3c9eea17b47ef
  - kind: registry
    name: usvg-parser
    version: 0.37.0
    sha: 9bd4e3c291f45d152929a31f0f6c819245e2921bfd01e7bd91201a9af39a2bdc
  - kind: registry
    name: usvg-tree
    version: 0.37.0
    sha: 8ee3d202ebdb97a6215604b8f5b4d6ef9024efd623cf2e373a6416ba976ec7d3
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: uuid
    version: 1.21.0
    sha: b672338555252d43fd2240c714dc444b8c6fb0a5c5335e65a07bba7742735ddb
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: version-compare
    version: 0.2.1
    sha: 03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasip2
    version: 1.0.2+wasi-0.2.9
    sha: 9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5
  - kind: registry
    name: wasip3
    version: 0.4.0+wasi-0.3.0-rc-2026-01-06
    sha: 5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5
  - kind: registry
    name: wasm-bindgen
    version: 0.2.112
    sha: 05d7d0fce354c88b7982aec4400b3e7fcf723c32737cef571bd165f7613557ee
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.62
    sha: ee85afca410ac4abba5b584b12e77ea225db6ee5471d0aebaae0861166f9378a
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.112
    sha: 55839b71ba921e4f75b674cb16f843f4b1f3b26ddfcb3454de1cf65cc021ec0f
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.112
    sha: caf2e969c2d60ff52e7e98b7392ff1588bffdd1ccd4769eba27222fd3d621571
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.112
    sha: 0861f0dcdf46ea819407495634953cdcc8a8c7215ab799a7a7ce366be71c7b30
  - kind: registry
    name: wasm-encoder
    version: 0.244.0
    sha: 990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319
  - kind: registry
    name: wasm-metadata
    version: 0.244.0
    sha: bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909
  - kind: registry
    name: wasmparser
    version: 0.244.0
    sha: 47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe
  - kind: registry
    name: wasmtimer
    version: 0.4.3
    sha: 1c598d6b99ea013e35844697fc4670d08339d5cda15588f193c6beedd12f644b
  - kind: registry
    name: wayland-backend
    version: 0.3.12
    sha: fee64194ccd96bf648f42a65a7e589547096dfa702f7cadef84347b66ad164f9
  - kind: registry
    name: wayland-client
    version: 0.31.12
    sha: b8e6faa537fbb6c186cb9f1d41f2f811a4120d1b57ec61f50da451a0c5122bec
  - kind: registry
    name: wayland-csd-frame
    version: 0.3.0
    sha: 625c5029dbd43d25e6aa9615e88b829a5cad13b2819c4ae129fdbb7c31ab4c7e
  - kind: registry
    name: wayland-cursor
    version: 0.31.12
    sha: 5864c4b5b6064b06b1e8b74ead4a98a6c45a285fe7a0e784d24735f011fdb078
  - kind: registry
    name: wayland-egl
    version: 0.32.9
    sha: 8a2c9ef35f3b2e11d5709d8e75dc1e7e064fd8eec5d705d56073fafca85de854
  - kind: registry
    name: wayland-protocols
    version: 0.32.10
    sha: baeda9ffbcfc8cd6ddaade385eaf2393bd2115a69523c735f12242353c3df4f3
  - kind: registry
    name: wayland-protocols-experimental
    version: 20250721.0.1
    sha: 40a1f863128dcaaec790d7b4b396cc9b9a7a079e878e18c47e6c2d2c5a8dcbb1
  - kind: registry
    name: wayland-protocols-misc
    version: 0.3.10
    sha: 791c58fdeec5406aa37169dd815327d1e47f334219b523444bc26d70ceb4c34e
  - kind: registry
    name: wayland-protocols-plasma
    version: 0.3.10
    sha: aa98634619300a535a9a97f338aed9a5ff1e01a461943e8346ff4ae26007306b
  - kind: registry
    name: wayland-protocols-wlr
    version: 0.3.10
    sha: e9597cdf02cf0c34cd5823786dce6b5ae8598f05c2daf5621b6e178d4f7345f3
  - kind: registry
    name: wayland-scanner
    version: 0.31.8
    sha: 5423e94b6a63e68e439803a3e153a9252d5ead12fd853334e2ad33997e3889e3
  - kind: registry
    name: wayland-server
    version: 0.31.11
    sha: 9297ab90f8d1f597711d36455c5b1b2290eca59b8134485e377a296b80b118c9
  - kind: registry
    name: wayland-sys
    version: 0.31.8
    sha: 1e6dbfc3ac5ef974c92a2235805cc0114033018ae1290a72e474aa8b28cbbdfd
  - kind: registry
    name: web-sys
    version: 0.3.89
    sha: 10053fbf9a374174094915bbce141e87a6bf32ecd9a002980db4b638405e8962
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: weezl
    version: 0.1.12
    sha: a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88
  - kind: registry
    name: wgpu
    version: 27.0.1
    sha: bfe68bac7cde125de7a731c3400723cadaaf1703795ad3f4805f187459cd7a77
  - kind: registry
    name: wgpu-core
    version: 27.0.3
    sha: 27a75de515543b1897b26119f93731b385a19aea165a1ec5f0e3acecc229cae7
  - kind: registry
    name: wgpu-core-deps-windows-linux-android
    version: 27.0.0
    sha: 71197027d61a71748e4120f05a9242b2ad142e3c01f8c1b47707945a879a03c3
  - kind: registry
    name: wgpu-hal
    version: 27.0.4
    sha: 5b21cb61c57ee198bc4aff71aeadff4cbb80b927beb912506af9c780d64313ce
  - kind: registry
    name: wgpu-types
    version: 27.0.1
    sha: afdcf84c395990db737f2dd91628706cb31e86d72e53482320d368e52b5da5eb
  - kind: registry
    name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - kind: registry
    name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: window_clipboard
    version: 0.4.1
  - kind: registry
    name: windows-core
    version: 0.62.2
    sha: b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb
  - kind: registry
    name: windows-implement
    version: 0.60.2
    sha: 053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf
  - kind: registry
    name: windows-interface
    version: 0.59.3
    sha: 3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-result
    version: 0.4.1
    sha: 7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5
  - kind: registry
    name: windows-strings
    version: 0.5.1
    sha: 7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091
  - kind: registry
    name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
  - kind: registry
    name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - kind: registry
    name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - kind: registry
    name: windows-sys
    version: 0.59.0
    sha: 1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b
  - kind: registry
    name: windows-sys
    version: 0.60.2
    sha: f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb
  - kind: registry
    name: windows-sys
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - kind: registry
    name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows-targets
    version: 0.53.5
    sha: 4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.53.1
    sha: a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.53.1
    sha: b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006
  - kind: registry
    name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnu
    version: 0.53.1
    sha: 960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.53.1
    sha: fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c
  - kind: registry
    name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_i686_msvc
    version: 0.53.1
    sha: 1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.53.1
    sha: 9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.53.1
    sha: 0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.53.1
    sha: d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650
  - kind: registry
    name: winit
    version: 0.30.12
    sha: c66d4b9ed69c4009f6321f762d6e61ad8a2389cd431b97cb1e146812e9e6c732
  - kind: registry
    name: winnow
    version: 0.6.24
    sha: c8d71a593cc5c42ad7876e2c1fda56f314f3754c084128833e64f1345ff8a03a
  - kind: registry
    name: winnow
    version: 0.7.14
    sha: 5a5364e9d77fcdeeaa6062ced926ee3381faa2ee02d3eb83a5c27a8825540829
  - kind: registry
    name: wit-bindgen
    version: 0.51.0
    sha: d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5
  - kind: registry
    name: wit-bindgen-core
    version: 0.51.0
    sha: ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc
  - kind: registry
    name: wit-bindgen-rust
    version: 0.51.0
    sha: b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21
  - kind: registry
    name: wit-bindgen-rust-macro
    version: 0.51.0
    sha: 0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a
  - kind: registry
    name: wit-component
    version: 0.244.0
    sha: 9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2
  - kind: registry
    name: wit-parser
    version: 0.244.0
    sha: ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736
  - kind: registry
    name: writeable
    version: 0.6.2
    sha: 9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9
  - kind: registry
    name: x11-dl
    version: 2.21.0
    sha: 38735924fedd5314a6e548792904ed8c6de6636285cb9fec04d5b1db85c1516f
  - kind: registry
    name: x11rb
    version: 0.13.2
    sha: 9993aa5be5a26815fe2c3eacfc1fde061fc1a1f094bf1ad2a18bf9c495dd7414
  - kind: registry
    name: x11rb-protocol
    version: 0.13.2
    sha: ea6fc2961e4ef194dcbfe56bb845534d0dc8098940c7e5c012a258bfec6701bd
  - kind: registry
    name: xcursor
    version: 0.3.10
    sha: bec9e4a500ca8864c5b47b8b482a73d62e4237670e5b5f1d6b9e3cae50f28f2b
  - kind: registry
    name: xdg
    version: 3.0.0
    sha: 2fb433233f2df9344722454bc7e96465c9d03bff9d77c248f9e7523fe79585b5
  - kind: registry
    name: xdg-user
    version: 0.2.1
    sha: a1d5cd803f28ce5a488c8b129858222998c0a06bbec81f9d1b71faed1f9f9f0e
  - kind: registry
    name: xkbcommon
    version: 0.8.0
    sha: 8d66ca9352cbd4eecbbc40871d8a11b4ac8107cfc528a6e14d7c19c69d0e1ac9
  - kind: registry
    name: xkbcommon
    version: 0.9.0
    sha: a7a974f48060a14e95705c01f24ad9c3345022f4d97441b8a36beb7ed5c4a02d
  - kind: registry
    name: xkbcommon-dl
    version: 0.4.2
    sha: d039de8032a9a8856a6be89cea3e5d12fdd82306ab7c94d74e6deab2460651c5
  - kind: registry
    name: xkeysym
    version: 0.2.1
    sha: b9cc00251562a284751c9973bace760d86c0276c471b4be569fe6b068ee97a56
  - kind: registry
    name: xml-rs
    version: 0.8.28
    sha: 3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f
  - kind: registry
    name: xmlwriter
    version: 0.1.0
    sha: ec7a2a501ed189703dba8b08142f057e887dfc4b2cc4db2d343ac6376ba3e0b9
  - kind: registry
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yazi
    version: 0.2.1
    sha: e01738255b5a16e78bbb83e7fbba0a1e7dd506905cfc53f4622d89015a03fbb5
  - kind: registry
    name: yoke
    version: 0.8.1
    sha: 72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954
  - kind: registry
    name: yoke-derive
    version: 0.8.1
    sha: b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d
  - kind: registry
    name: zbus
    version: 5.14.0
    sha: ca82f95dbd3943a40a53cfded6c2d0a2ca26192011846a1810c4256ef92c60bc
  - kind: registry
    name: zbus_macros
    version: 5.14.0
    sha: 897e79616e84aac4b2c46e9132a4f63b93105d54fe8c0e8f6bffc21fa8d49222
  - kind: registry
    name: zbus_names
    version: 4.3.1
    sha: ffd8af6d5b78619bab301ff3c560a5bd22426150253db278f164d6cf3b72c50f
  - kind: registry
    name: zeno
    version: 0.3.3
    sha: 6df3dc4292935e51816d896edcd52aa30bc297907c26167fec31e2b0c6a32524
  - kind: registry
    name: zerocopy
    version: 0.8.39
    sha: db6d35d663eadb6c932438e763b262fe1a70987f9ae936e60158176d710cae4a
  - kind: registry
    name: zerocopy-derive
    version: 0.8.39
    sha: 4122cd3169e94605190e77839c9a40d40ed048d305bfdc146e7df40ab0f3e517
  - kind: registry
    name: zerofrom
    version: 0.1.6
    sha: 50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5
  - kind: registry
    name: zerofrom-derive
    version: 0.1.6
    sha: d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502
  - kind: registry
    name: zerotrie
    version: 0.2.3
    sha: 2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851
  - kind: registry
    name: zerovec
    version: 0.11.5
    sha: 6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002
  - kind: registry
    name: zerovec-derive
    version: 0.11.2
    sha: eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3
  - kind: registry
    name: zmij
    version: 1.0.21
    sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
  - kind: registry
    name: zune-core
    version: 0.4.12
    sha: 3f423a2c17029964870cfaabb1f13dfab7d092a62a29a89264f4d36990ca414a
  - kind: registry
    name: zune-core
    version: 0.5.1
    sha: cb8a0807f7c01457d0379ba880ba6322660448ddebc890ce29bb64da71fb40f9
  - kind: registry
    name: zune-jpeg
    version: 0.4.21
    sha: 29ce2c8a9384ad323cf564b67da86e21d3cfdff87908bc1223ed5c99bc792713
  - kind: registry
    name: zune-jpeg
    version: 0.5.12
    sha: 410e9ecef634c709e3831c2cfdb8d9c32164fae1c67496d5b68fff728eec37fe
  - kind: registry
    name: zvariant
    version: 5.10.0
    sha: 5708299b21903bbe348e94729f22c49c55d04720a004aa350f1f9c122fd2540b
  - kind: registry
    name: zvariant_derive
    version: 5.10.0
    sha: 5b59b012ebe9c46656f9cc08d8da8b4c726510aef12559da3e5f1bf72780752c
  - kind: registry
    name: zvariant_utils
    version: 3.3.0
    sha: f75c23a64ef8f40f13a6989991e643554d9bef1d682a281160cf0c1bc389c5e9
config:
  build-commands:
  - cargo build --release --frozen
  install-commands:
  # Mirror upstream Makefile's `install` target. Shipping only the
  # binary leaves the systemd user units (cosmic-session.target,
  # cosmic-comp.service), the wayland-sessions .desktop entry, the
  # /usr/bin/cosmic-service helper, and the default keybindings /
  # tiling-exception .ron files unbuilt -- breaking the COSMIC
  # session and leaving the desktop with no keyboard shortcuts.
  - |
    install -Dm0755 target/release/cosmic-comp \
        %{install-root}%{prefix}/bin/cosmic-comp
    install -Dm0644 data/keybindings.ron \
        %{install-root}%{datadir}/cosmic/com.system76.CosmicSettings.Shortcuts/v1/defaults
    install -Dm0644 data/tiling-exceptions.ron \
        %{install-root}%{datadir}/cosmic/com.system76.CosmicSettings.WindowRules/v1/tiling_exception_defaults
    install -Dm0644 data/cosmic.desktop \
        %{install-root}%{datadir}/wayland-sessions/cosmic.desktop
    install -Dm0644 data/cosmic-session.target \
        %{install-root}%{prefix}/lib/systemd/user/cosmic-session.target
    install -Dm0644 data/cosmic-session-pre.target \
        %{install-root}%{prefix}/lib/systemd/user/cosmic-session-pre.target
    install -Dm0644 data/cosmic-comp.service \
        %{install-root}%{prefix}/lib/systemd/user/cosmic-comp.service
    install -Dm0755 data/cosmic-service \
        %{install-root}%{prefix}/bin/cosmic-service
