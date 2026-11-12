kind: manual

build-depends:
- core-deps/sandbox-tools.bst
# COSMIC 1.7 image stack decodes AVIF; dav1d-sys needs the C library.
- freedesktop-sdk.bst:components/dav1d.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/_private/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- core-deps/just.bst
- core/libcosmic.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/libinput.bst
- freedesktop-sdk.bst:components/pipewire.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/findutils.bst
- freedesktop-sdk.bst:components/sed.bst

depends:
- freedesktop-sdk.bst:components/dav1d.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-settings.git
  track: master
  ref: epoch-1.11.0-37-g6aaf30d69ec3ed64eeb1d441ef5fe0a2017b3fe6
- kind: cargo2
  url: "crates:"
  ref:
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: a11y-zbus
    version: 1.0.0
  - kind: registry
    name: ab_glyph
    version: 0.2.32
    sha: 01c0457472c38ea5bd1c3b5ada5e368271cb550be7a4ca4a0b4634e9913f6cc2
  - kind: registry
    name: ab_glyph_rasterizer
    version: 0.1.10
    sha: 366ffbaa4442f4684d91e2cd7c5ea7c4ed8add41959a31447066e279e432b618
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit
    version: 0.22.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_atspi_common
    version: 0.15.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_consumer
    version: 0.32.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_macos
    version: 0.23.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_unix
    version: 0.18.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_windows
    version: 0.30.0
  - kind: git
    commit: 6c20249d3b9fd45e7002efad9f6b6171a9257912
    repo: github:wash2/accesskit
    query:
      rev: 6c20249
    name: accesskit_winit
    version: 0.30.0
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: accounts-zbus
    version: 1.0.0
  - kind: registry
    name: addr2line
    version: 0.27.1
    sha: e567177890eb1617b1f774005b66b26b2377afd138a2ca37aae7d8f0c81429d4
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: aes
    version: 0.8.4
    sha: b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0
  - kind: registry
    name: aes
    version: 0.9.4
    sha: fc0fc36d7440d015b45468ba08a21e80e056ebbd014c611c6298bb7503e04bd1
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.5
    sha: c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba
  - kind: registry
    name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
  - kind: registry
    name: aligned
    version: 0.4.3
    sha: ee4508988c62edf04abd8d92897fca0c2995d907ce1dfeaf369dac3716a40685
  - kind: registry
    name: aligned-vec
    version: 0.6.4
    sha: dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b
  - kind: registry
    name: allocator-api2
    version: 0.2.21
    sha: 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
  - kind: registry
    name: almost
    version: 0.2.0
    sha: 3aa2999eb46af81abb65c2d30d446778d7e613b60bbf4e174a027e80f90a3c14
  - kind: registry
    name: android-activity
    version: 0.6.1
    sha: 0f2a1bb052857d5dd49572219344a7332b31b76405648eabac5bc68978251bcd
  - kind: registry
    name: android-properties
    version: 0.2.2
    sha: fc7eb209b1518d6bb87b283c20095f5228ecda460da70b44f0802523dea6da04
  - kind: registry
    name: android_system_properties
    version: 0.1.6
    sha: ae221649c9976a6f6c56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc
  - kind: registry
    name: anstream
    version: 1.0.0
    sha: 824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d
  - kind: registry
    name: anstyle
    version: 1.0.14
    sha: 940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000
  - kind: registry
    name: anstyle-parse
    version: 1.0.0
    sha: 52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e
  - kind: registry
    name: anstyle-query
    version: 1.1.5
    sha: 40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc
  - kind: registry
    name: anstyle-wincon
    version: 3.0.11
    sha: 291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d
  - kind: registry
    name: anyhow
    version: 1.0.104
    sha: 330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470
  - kind: registry
    name: apply
    version: 0.3.0
    sha: f47b57fc4521e3cae26a4d45b5227f8fadee4c345be0fefd8d5d1711afb8aeb9
  - kind: registry
    name: approx
    version: 0.5.1
    sha: cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6
  - kind: git
    commit: c14084db5c0dce7b56830b705c9f3cf6f9603469
    repo: github:jackpot51/appstream
    name: appstream
    version: 0.2.2
  - kind: registry
    name: arbitrary
    version: 1.5.0
    sha: 3bc62ac97cc33321f50863d514c3bc38a453947a8f9e781137e47c7401020aed
  - kind: registry
    name: arc-swap
    version: 1.9.3
    sha: 380962b3d93b99642e50b9febf72c071e97e8b32d86eae9cf4ef582bb960ae6e
  - kind: registry
    name: arg_enum_proc_macro
    version: 0.3.4
    sha: 0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea
  - kind: registry
    name: array-init
    version: 2.1.0
    sha: 3d62b7694a562cdf5a74227903507c56ab2cc8bdd1f781ed5cb4cf9c9f810bfc
  - kind: registry
    name: arrayref
    version: 0.3.9
    sha: 76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb
  - kind: registry
    name: arrayvec
    version: 0.7.8
    sha: d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56
  - kind: registry
    name: as-raw-xcb-connection
    version: 1.0.1
    sha: 175571dd1d178ced59193a6fc02dde1b972eb0bc56c892cde9beeceac5bf0f6b
  - kind: registry
    name: as-slice
    version: 0.2.1
    sha: 516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516
  - kind: registry
    name: ash
    version: 0.38.0+1.3.281
    sha: 0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f
  - kind: registry
    name: ashpd
    version: 0.12.3
    sha: 33a3c86f3fd70c0ffa500ed189abfa90b5a52398a45d5dc372fcc38ebeb7a645
  - kind: registry
    name: ashpd
    version: 0.13.13
    sha: fb8421aaa9644a5faf26735f258b669b15f063313ef8f8e2bdb28912a1a6f111
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
    version: 1.14.1
    sha: f426a31126c735126297bc5ea7a521263c9faff4f63ca415267ee625651c4f37
  - kind: registry
    name: async-io
    version: 2.6.0
    sha: 456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc
  - kind: registry
    name: async-lock
    version: 3.5.0
    sha: 0876700b0d007ad25d5508865a4259c3af9af6d296bf663a0d586d0bc3369f6f
  - kind: registry
    name: async-process
    version: 2.5.0
    sha: fc50921ec0055cdd8a16de48773bfeec5c972598674347252c0399676be7da75
  - kind: registry
    name: async-recursion
    version: 1.2.0
    sha: 4f8abc12baad266b1c8cec146854c195b5864b4221d4b2ca7296a7ae82d9e451
  - kind: registry
    name: async-signal
    version: 0.2.14
    sha: 52b5aaafa020cf5053a01f2a60e8ff5dccf550f0f77ec54a4e47285ac2bab485
  - kind: registry
    name: async-task
    version: 4.7.1
    sha: 8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de
  - kind: registry
    name: async-trait
    version: 0.1.92
    sha: 82f6aeea286b8eb4dd3431a1be1b59d290ace00f5bfd8e2a159bc2a05e2c1667
  - kind: registry
    name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - kind: git
    commit: 043ab4859d53ffd3d55334685303d8df39c9f768
    repo: github:jackpot51/rust-atomicwrites
    name: atomicwrites
    version: 0.4.2
  - kind: git
    commit: e1e6e8bcd781a3155a9ff7e0b1e5193e5587f94c
    repo: github:wash2/atspi
    name: atspi
    version: 0.29.0
  - kind: git
    commit: e1e6e8bcd781a3155a9ff7e0b1e5193e5587f94c
    repo: github:wash2/atspi
    name: atspi-common
    version: 0.13.0
  - kind: git
    commit: e1e6e8bcd781a3155a9ff7e0b1e5193e5587f94c
    repo: github:wash2/atspi
    name: atspi-proxies
    version: 0.13.0
  - kind: registry
    name: auto_enums
    version: 0.8.10
    sha: 3091d68264354f211516b91dce6f71046e444fab1867716035f736667243affb
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: av-data
    version: 0.4.4
    sha: fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e
  - kind: registry
    name: av-scenechange
    version: 0.14.1
    sha: 0f321d77c20e19b92c39e7471cf986812cbb46659d2af674adc4331ef3f18394
  - kind: registry
    name: av1-grain
    version: 0.2.5
    sha: 8cfddb07216410377231960af4fcab838eaa12e013417781b78bd95ee22077f8
  - kind: registry
    name: avif-serialize
    version: 0.8.9
    sha: e7178fe5f7d460b13895ebb9dcb28a3a6216d2df2574a0806cb51b555d297f38
  - kind: registry
    name: backtrace
    version: 0.3.77
    sha: 42f4220217f3288537b83684130f42fad43320b1c3b805f1910d683d52ded24f
  - kind: registry
    name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: base64
    version: 0.23.1
    sha: ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5
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
    name: bit_field
    version: 0.10.3
    sha: 1e4b40c7323adcfc0a41c4b88143ed58346ff65a288fc144329c5c45e05d70c6
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.13.2
    sha: 3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06
  - kind: registry
    name: bitreader
    version: 0.3.11
    sha: 886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066
  - kind: registry
    name: bitstream-io
    version: 4.10.0
    sha: 7eff00be299a18769011411c9def0d827e8f2d7bf0c3dbf53633147a8867fd1f
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block-buffer
    version: 0.12.1
    sha: d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa
  - kind: registry
    name: block-buffer
    version: 0.9.0
    sha: 4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4
  - kind: registry
    name: block-padding
    version: 0.4.2
    sha: 710f1dd022ef4e93f8a438b4ba958de7f64308434fa6a87104481645cc30068b
  - kind: registry
    name: block2
    version: 0.5.1
    sha: 2c132eebf10f5cad5289222520a4a058514204aed6d791f1cf4fe8088b82d15f
  - kind: registry
    name: block2
    version: 0.6.2
    sha: cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5
  - kind: registry
    name: blocking
    version: 1.7.0
    sha: a70e4329df6cb94385eed412ec92375c3cdd8a6e502493d1229b6414e4036dfa
  - kind: registry
    name: blowfish
    version: 0.7.0
    sha: 32fa6a061124e37baba002e496d203e23ba3d7b73750be82dbfbc92913048a5b
  - kind: registry
    name: borsh
    version: 1.8.1
    sha: 553c5d846a6ba5150c65e3b1b8ec073bcf1abc20f9b7220de384a4443ea4e20a
  - kind: registry
    name: bs58
    version: 0.5.1
    sha: bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4
  - kind: registry
    name: bstr
    version: 1.13.1
    sha: 6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f
  - kind: registry
    name: btoi
    version: 0.5.0
    sha: 3b5ab9db53bcda568284df0fd39f6eac24ad6f7ba7ff1168b9e76eba6576b976
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: build_helpers
    version: 0.14.0
  - kind: registry
    name: built
    version: 0.8.1
    sha: 5c0e531d93d39c34eef561e929e8a7f86d77a5af08aac4f6d6e39976c51858e9
  - kind: registry
    name: bumpalo
    version: 3.20.3
    sha: 72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649
  - kind: registry
    name: by_address
    version: 1.2.1
    sha: 64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06
  - kind: registry
    name: byte-slice-cast
    version: 1.2.3
    sha: 7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d
  - kind: registry
    name: bytemuck
    version: 1.25.2
    sha: 95832e849adfb21180ccb6826a99da14e5d266ae5c2e668e1602cf234f153797
  - kind: registry
    name: bytemuck_derive
    version: 1.12.1
    sha: 6a1f896587b6f2c069c73d2f0913e2d590c3990285cd2f0b6aa02b786b4c679c
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.12.1
    sha: fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04
  - kind: registry
    name: bzip2
    version: 0.5.2
    sha: 49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47
  - kind: registry
    name: bzip2-sys
    version: 0.1.13+1.0.8
    sha: 225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14
  - kind: registry
    name: calendrical_calculations
    version: 0.2.4
    sha: 5abbd6eeda6885048d357edc66748eea6e0268e3dd11f326fff5bd248d779c26
  - kind: registry
    name: calloop
    version: 0.14.5
    sha: 43b32313e937c8721c9d17ee9bf60699a6402b4b7c2cb6ac1bee0ffcaa4b4e5e
  - kind: registry
    name: calloop-wayland-source
    version: 0.4.1
    sha: 138efcf0940a02ebf0cc8d1eff41a1682a46b431630f4c52450d6265876021fa
  - kind: registry
    name: cbc
    version: 0.2.1
    sha: ce2dc9ee5f88d11e0beb842c88b33c8a5cf0d1329c4b19494af42b07dbfe8896
  - kind: registry
    name: cc
    version: 1.11.1
    sha: 4ff2a8126fff0f8c839080d619675a585e61720bb12d2baceae45769fd66f155
  - kind: registry
    name: cfb
    version: 0.7.3
    sha: d38f2da7a0a2c4ccf0065be06397cc26a81f4e528be095826eee9d4adbb8c60f
  - kind: registry
    name: cfg-expr
    version: 0.20.10
    sha: 9ba9e9ec16c447027685b1f897b720e18e9a8afd00bd7332c483537e38086c9f
  - kind: registry
    name: cfg-if
    version: 1.0.5
    sha: 4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600
  - kind: registry
    name: cfg_aliases
    version: 0.1.1
    sha: fd16c4719339c4530435d38e511904438d07cce7950afa3718a84ac36c10e89e
  - kind: registry
    name: cfg_aliases
    version: 0.2.2
    sha: f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527
  - kind: registry
    name: chacha20
    version: 0.10.2
    sha: 65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06
  - kind: registry
    name: chrono
    version: 0.4.45
    sha: 1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327
  - kind: registry
    name: cipher
    version: 0.2.5
    sha: 12f8e7987cbd042a63249497f41aed09f8e65add917ea6566effbc56578d6801
  - kind: registry
    name: cipher
    version: 0.4.4
    sha: 773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad
  - kind: registry
    name: cipher
    version: 0.5.2
    sha: e8cf2a2c93cd704877c0858356ed03480ff301ee950b43f1cbe4573b088bfa6c
  - kind: registry
    name: clap
    version: 4.6.7
    sha: aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946
  - kind: registry
    name: clap_builder
    version: 4.6.7
    sha: ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d
  - kind: registry
    name: clap_derive
    version: 4.6.7
    sha: f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0
  - kind: registry
    name: clap_lex
    version: 1.1.1
    sha: 1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486
  - kind: registry
    name: clipboard-win
    version: 5.4.3
    sha: 052af7878466feccda12ba7a6a67d019d712f296809559b47c12c8cc196d3a9a
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
    name: cmov
    version: 0.5.4
    sha: 0c9ea0ac24bc397ab3c98583a3c9ba74fa56b09a4449bbe172b9b1ddb016027a
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
    name: color-eyre
    version: 0.6.5
    sha: e5920befb47832a6d61ee3a3a846565cfa39b331331e68a3b1d1116630f2f26d
  - kind: registry
    name: color-spantrace
    version: 0.3.0
    sha: b8b88ea9df13354b55bc7234ebcce36e6ef896aca2e42a15de9e10edce01b427
  - kind: registry
    name: color_quant
    version: 1.1.0
    sha: 3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b
  - kind: registry
    name: colorchoice
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
  - kind: registry
    name: combine
    version: 4.6.9
    sha: 4356eba6976435498d05a311ee9fc486da3bc81c200d3f0d7dd9703b41913f92
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: configparser
    version: 3.3.0
    sha: 031ad3d167622974ed636505ae4556267ed4aa2aea0464122fa6bc9698a32825
  - kind: registry
    name: const-oid
    version: 0.10.2
    sha: a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c
  - kind: registry
    name: constant_time_eq
    version: 0.3.1
    sha: 7c74b8349d32d297c9134b8c88677813a227df8f779daa29bfc29c183fe3dca6
  - kind: registry
    name: core-foundation
    version: 0.10.1
    sha: b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6
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
    name: core-graphics-types
    version: 0.2.0
    sha: 3d44a101f213f6c4cdc1853d4b78aef6db6bdfa3468798cc1d9912f4735013eb
  - kind: registry
    name: core_maths
    version: 0.1.1
    sha: 77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30
  - kind: git
    commit: 09e93d38798d2fc2ac53d03e4988800c179c8dea
    repo: github:pop-os/cosmic-bg
    name: cosmic-bg-config
    version: 1.11.0
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-bluez-zbus
    version: 1.0.0
  - kind: git
    commit: c0cff4db14c37ed954983158e4055aa94c7741d9
    repo: github:pop-os/cosmic-protocols//
    query:
      rev: c0cff4d
    name: cosmic-client-toolkit
    version: 0.2.0
  - kind: git
    commit: 46b26e63ca22a7acb27adf0c4708ba62a48d356d
    repo: github:pop-os/cosmic-comp
    name: cosmic-comp-config
    version: 1.0.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: cosmic-config-derive
    version: 1.0.0
  - kind: git
    commit: ab4c57b8e416c6af9297cb04d101889896fd9a92
    repo: github:pop-os/freedesktop-icons
    name: cosmic-freedesktop-icons
    version: 0.4.0
  - kind: git
    commit: 6d6f07af60bb307882cdcbd0bda0a6fc76bd0df3
    repo: github:pop-os/cosmic-idle
    name: cosmic-idle-config
    version: 1.11.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: cosmic-launch
    version: 0.1.0
  - kind: git
    commit: 8fc81e8857e46c018ea21ab985aaf30ac853c007
    repo: github:pop-os/cosmic-mime-apps
    name: cosmic-mime-apps
    version: 0.2.0
  - kind: git
    commit: 6b146a2b0a23d88ae84223ad06c6813bda5a9386
    repo: github:pop-os/cosmic-osk
    name: cosmic-osk-config
    version: 1.11.0
  - kind: git
    commit: ca20ce3185b3b4404f429d59d429c40b58a2ddef
    repo: github:pop-os/cosmic-panel
    name: cosmic-panel-config
    version: 1.11.0
  - kind: git
    commit: c0cff4db14c37ed954983158e4055aa94c7741d9
    repo: github:pop-os/cosmic-protocols//
    query:
      rev: c0cff4d
    name: cosmic-protocols
    version: 0.2.0
  - kind: git
    commit: f1a97655c97e8799bf4a37a8f5103a8ab5e5068d
    repo: github:pop-os/cosmic-randr
    name: cosmic-randr
    version: 1.11.0
  - kind: git
    commit: f1a97655c97e8799bf4a37a8f5103a8ab5e5068d
    repo: github:pop-os/cosmic-randr
    name: cosmic-randr-shell
    version: 1.11.0
  - kind: git
    commit: 2df041e6e90757782a7884729ae3723e86cee122
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-audio-client
    version: 1.11.0
  - kind: git
    commit: 2df041e6e90757782a7884729ae3723e86cee122
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-audio-core
    version: 1.11.0
  - kind: git
    commit: 2df041e6e90757782a7884729ae3723e86cee122
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-config
    version: 1.11.0
  - kind: git
    commit: 2df041e6e90757782a7884729ae3723e86cee122
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-daemon-config
    version: 1.11.0
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-settings-daemon-zbus
    version: 1.0.0
  - kind: registry
    name: cosmic-text
    version: 0.19.0
    sha: be17b688510d934ce13f48a2beba700e11583e281e0fda99c22bb256a14eda73
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: cosmic-theme
    version: 1.0.0
  - kind: registry
    name: cpubits
    version: 0.1.1
    sha: 15b85f9c39137c3a891689859392b1bd49812121d0d61c9caf00d46ed5ce06ae
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: cpufeatures
    version: 0.3.1
    sha: 5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566
  - kind: registry
    name: crc
    version: 3.4.0
    sha: 5eb8a2a1cd12ab0d987a5d5e825195d372001a4094a0376319d5a0ad71c1ba0d
  - kind: registry
    name: crc-catalog
    version: 2.5.0
    sha: 217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853
  - kind: registry
    name: crc32fast
    version: 1.5.4
    sha: 5f97d3416d5337d15c4b0d78c8c91df922ca143f57ec20e2d1c188333047ef04
  - kind: registry
    name: crossbeam-deque
    version: 0.8.8
    sha: 622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.21
    sha: dc74980687109a3b14c72fd458107bf0baa1da1a1a805e178d15501ba9b86d9d
  - kind: registry
    name: crossbeam-utils
    version: 0.8.23
    sha: a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6
  - kind: registry
    name: crunchy
    version: 0.2.4
    sha: 460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5
  - kind: git
    commit: e429a025df36ab8145708acb309080ae3deec17a
    repo: github:iced-rs/cryoglyph.git
    query:
      rev: e429a025df36ab8145708acb309080ae3deec17a
    name: cryoglyph
    version: 0.1.0
  - kind: registry
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: crypto-common
    version: 0.2.2
    sha: ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453
  - kind: registry
    name: crypto-mac
    version: 0.10.1
    sha: bff07008ec701e8028e2ceb8f83f0e4274ee62bd2dbdc4fefff2e9a91824081a
  - kind: registry
    name: css-color
    version: 0.2.8
    sha: 42aaeae719fd78ce501d77c6cdf01f7e96f26bcd5617a4903a1c2b97e388543a
  - kind: registry
    name: ctor
    version: 0.10.1
    sha: 83cf0d42651b16c6dfe68685716d18480d18a9c39c62d76e8cf3eb6ed5d8bcbf
  - kind: registry
    name: ctutils
    version: 0.4.8
    sha: 261af4dc7a06ea8a527a8717d8cbba3417530d6ea14e1edb3de6b67806be474f
  - kind: registry
    name: cursor-icon
    version: 1.2.0
    sha: f27ae1dd37df86211c42e150270f82743308803d90a6f6e6651cd730d5e1732f
  - kind: registry
    name: darling
    version: 0.21.3
    sha: 9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0
  - kind: registry
    name: darling
    version: 0.24.1
    sha: ed17f5901b6630b993ca003def43f2f8ef4014fc13b047b57aad617ff32bc2ec
  - kind: registry
    name: darling_core
    version: 0.21.3
    sha: 1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4
  - kind: registry
    name: darling_core
    version: 0.24.1
    sha: 6837e2cf7485aaae18f86181d2f0e9a7ed297a025e220aeabf63fdebd3a2ddff
  - kind: registry
    name: darling_macro
    version: 0.21.3
    sha: d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81
  - kind: registry
    name: darling_macro
    version: 0.24.1
    sha: 2ac7135c3ef02b2f7833bbeb1be5ba7f966dcde8a87c6b87f65a778d71a02785
  - kind: registry
    name: data-url
    version: 0.3.2
    sha: be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376
  - kind: registry
    name: dav1d
    version: 0.11.1
    sha: 3ee89cb860616069c67520dcd66cacdb900b57c799f634a0eb6d91f6e2a82b61
  - kind: registry
    name: dav1d-sys
    version: 0.8.3
    sha: c3c91aea6668645415331133ed6f8ddf0e7f40160cd97a12d59e68716a58704b
  - kind: registry
    name: deflate64
    version: 0.1.12
    sha: ac6b926516df9c60bfa16e107b21086399f8285a44ca9711344b9e553c5146e2
  - kind: registry
    name: defmt
    version: 1.2.0
    sha: e4a0795ac740cb54d7b3775c9c17345f6aaecf884c01733b39d6017738e0e3e1
  - kind: registry
    name: defmt-macros
    version: 1.2.0
    sha: 840bb056bd99c495c9188198a258ab787c79f306d864db3e6e8451442d6d8366
  - kind: registry
    name: defmt-parser
    version: 1.1.0
    sha: 71958f69fb2de856c5dd51ac9377e986ca1aa5919f931bf5395a807277f889a0
  - kind: registry
    name: deranged
    version: 0.5.9
    sha: 9e9de72ce2ad1f90dc62fa25f0f430ef85eb4b0d8fa0be4f30373bc40a21d28e
  - kind: registry
    name: derive_arbitrary
    version: 1.5.0
    sha: 1b034bd7d5f032402a2479444dcc6f74e36a03f31854d41680fb240ef682a1ac
  - kind: registry
    name: derive_setters
    version: 0.1.9
    sha: b7e6f6fa1f03c14ae082120b84b3c7fbd7b8588d924cf2d7c3daf9afd49df8b9
  - kind: registry
    name: derive_utils
    version: 0.16.0
    sha: dc05a5d33db20c784f873e84934ad94bb209a090987ac5f62fede2c178234f23
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: digest
    version: 0.11.3
    sha: f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2
  - kind: registry
    name: digest
    version: 0.9.0
    sha: d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs
    version: 7.0.0
    sha: 8d57d423b3c82e89b9a24ca3091fee61f456a26edbd28d26c65906f4bc1dcd8f
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch2
    version: 0.3.1
    sha: 1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38
  - kind: registry
    name: displaydoc
    version: 0.2.7
    sha: c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8
  - kind: registry
    name: dlib
    version: 0.5.3
    sha: ab8ecd87370524b461f8557c119c405552c396ed91fc0a8eec68679eab26f94a
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
    name: downcast-rs
    version: 2.0.2
    sha: 117240f60069e65410b3ae1bb213295bd828f707b5bec6596a1afc8793ce0cbc
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: dpi
    version: 0.1.2
  - kind: registry
    name: drm
    version: 0.11.1
    sha: a0f8a69e60d75ae7dab4ef26a59ca99f2a89d4c142089b537775ae0c198bdcde
  - kind: registry
    name: drm-ffi
    version: 0.7.1
    sha: 41334f8405792483e32ad05fbb9c5680ff4e84491883d2947a4757dc54cb2ac6
  - kind: registry
    name: drm-fourcc
    version: 2.2.0
    sha: 0aafbcdb8afc29c1a7ee5fbe53b5d62f4565b35a042a662ca9fecd0b54dae6f4
  - kind: registry
    name: drm-sys
    version: 0.6.1
    sha: 2d09ff881f92f118b11105ba5e34ff8f4adf27b30dae8f12e28c193af1c83176
  - kind: registry
    name: dtor
    version: 0.8.1
    sha: edf234dd1594d6dd434a8fb8cada51ddbbc593e40e4a01556a0b31c62da2775b
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: either
    version: 1.19.0
    sha: 0e9c71c2167ca323c882b99918929403426e2373ea17242ff5653e0d5e1058be
  - kind: registry
    name: endi
    version: 1.1.1
    sha: 66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099
  - kind: registry
    name: enumflags2
    version: 0.7.12
    sha: 1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef
  - kind: registry
    name: enumflags2_derive
    version: 0.7.12
    sha: 67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827
  - kind: registry
    name: equator
    version: 0.4.2
    sha: 4711b213838dfee0117e3be6ac926007d7f433d7bbe33595975d4190cb07e6fc
  - kind: registry
    name: equator-macro
    version: 0.4.2
    sha: 44f23cf4b44bfce11a86ace86f8a73ffdec849c9fd00a386a53d278bd9e81fb3
  - kind: registry
    name: equivalent
    version: 1.0.3
    sha: 00d174d5400e5e8fd687ad1049e2f578285fa914201b1af7e8b112a4546bd826
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: error-code
    version: 3.4.0
    sha: 0b5343afd4a8365a643ac588dab4cf234a190c7f6c88c9f6dd6ffe00837661b7
  - kind: registry
    name: error_set
    version: 0.9.2
    sha: 8ce8f47d095467cd3c796a35d95a0363877f59a91cc2df0c47770cb87dbb6a3c
  - kind: registry
    name: error_set_impl
    version: 0.9.2
    sha: 7521f538d4b71021e32ee4e6c4ed2426fd04c49e0a0d34ea3c65dcb4ca5f7930
  - kind: registry
    name: etagere
    version: 0.2.15
    sha: fc89bf99e5dc15954a60f707c1e09d7540e5cd9af85fa75caa0b510bc08c5342
  - kind: registry
    name: euclid
    version: 0.22.14
    sha: f1a05365e3b1c6d1650318537c7460c6923f1abdd272ad6842baa2b509957a06
  - kind: registry
    name: event-listener
    version: 5.4.2
    sha: 5a23add41df1562121a9393cb065eab5146a1242410f23a644851e90cfd669d2
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: exr
    version: 1.74.2
    sha: 711fe42c9964295e01ee3fba3f9fe0e1d24b98886950d68efe81b1c76e21adf3
  - kind: registry
    name: eyre
    version: 0.6.14
    sha: c08309dbcc659c5549a24ddb9b27027640641b282ef5768267c7e675558986a3
  - kind: registry
    name: fallible_collections
    version: 0.4.9
    sha: a88c69768c0a15262df21899142bc6df9b9b823546d4b4b9a7bc2d6c448ec6fd
  - kind: registry
    name: fast_image_resize
    version: 6.1.0
    sha: e9c50201dc184ba6553da1695aac20a042efffbe2d84542cee31917c86c3ab1e
  - kind: registry
    name: fastrand
    version: 2.5.0
    sha: da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223
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
    version: 0.1.15
    sha: 1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48
  - kind: registry
    name: fixed_decimal
    version: 0.7.3
    sha: 2214fb00f669ee96bee5bb29dfb1ddabe058b2bc426817efc79afa03c9bc55ae
  - kind: registry
    name: flate2
    version: 1.1.11
    sha: 626d4928326b646e70f65ed36fc7cf9f206bdb68a0019ee7c6b4709da4e084c4
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
    version: 0.11.3
    sha: 5b38ad915f6dadd993ced50848a8291a543bd41ca62bc10740d5e64e2ab4cfd7
  - kind: registry
    name: font-types
    version: 0.12.7
    sha: 835ae9d781464a79026cde387f9cbc650c9a4909d7cf7e658b127e3c35d2f35d
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
    version: 0.2.4
    sha: ea5190182e6915eb873ddbc16e23b711b6eb1f9c00a0d0a3a91b5f6228475225
  - kind: registry
    name: foreign-types-shared
    version: 0.3.1
    sha: aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: freedesktop-desktop-entry
    version: 0.8.4
    sha: 42a69ad6111a2b572cb41e0f3542d546386e841013cee7c45d705b61a15a87dd
  - kind: registry
    name: freedesktop_entry_parser
    version: 2.0.0
    sha: fc6d3a3635983a889f065aa9ce760384713f23a9b4a04f696f86c39a5d7a6a5a
  - kind: registry
    name: fs-err
    version: 3.3.2
    sha: b5c95b673b8f6f7235229ae11c5642d81b04c2e64c1e2fb417bc0cf73ca45f29
  - kind: registry
    name: futures
    version: 0.3.34
    sha: 9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3
  - kind: registry
    name: futures-channel
    version: 0.3.34
    sha: b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4
  - kind: registry
    name: futures-core
    version: 0.3.34
    sha: 92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e
  - kind: registry
    name: futures-executor
    version: 0.3.34
    sha: 031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432
  - kind: registry
    name: futures-io
    version: 0.3.34
    sha: 53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed
  - kind: registry
    name: futures-lite
    version: 2.6.1
    sha: f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad
  - kind: registry
    name: futures-macro
    version: 0.3.34
    sha: 9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44
  - kind: registry
    name: futures-sink
    version: 0.3.34
    sha: 1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d
  - kind: registry
    name: futures-task
    version: 0.3.34
    sha: cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd
  - kind: registry
    name: futures-timer
    version: 3.0.4
    sha: af43fadb8a98512d547e37b4e92e0ced13e205c061b87b4623eff01d918d6968
  - kind: registry
    name: futures-util
    version: 0.3.34
    sha: 0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc
  - kind: registry
    name: generic-array
    version: 0.14.9
    sha: 4bb6743198531e02858aeaea5398fcc883e71851fcbcb5a2f773e2fb6cb1edf2
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
    version: 0.4.3
    sha: 300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099
  - kind: registry
    name: gettext-rs
    version: 0.7.7
    sha: 5d5857dc1b7f0fee86961de833f434e29494d72af102ce5355738c0664222bdf
  - kind: registry
    name: gettext-rs
    version: 0.8.0
    sha: 9df5e3fa8c077b15fdfa8ce130e2bc73d663b8aaa6d51b71421b8659980b1d80
  - kind: registry
    name: gettext-sys
    version: 0.26.0
    sha: 4ea859ab0dd7e70ff823032b3e077d03d39c965d68c6c10775add60e999d8ee9
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gimli
    version: 0.34.0
    sha: 1033caf0b349c518623b5396bfb2cf0bddf44f0306d543a250e5743297aafd10
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
    name: glutin_wgl_sys
    version: 0.6.1
    sha: 2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e
  - kind: registry
    name: gpu-allocator
    version: 0.28.0
    sha: 51255ea7cfaadb6c5f1528d43e92a82acb2b96c43365989a28b2d44ee38f8795
  - kind: registry
    name: gpu-descriptor
    version: 0.3.2
    sha: b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca
  - kind: registry
    name: gpu-descriptor-types
    version: 0.2.0
    sha: fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91
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
    version: 0.5.2
    sha: 9da2e5ae821f6e96664977bf974d6d6a2d6682f9ccee23e62ec1d134246845f9
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.13.2
    sha: 43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e
  - kind: registry
    name: hashbrown
    version: 0.15.5
    sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
  - kind: registry
    name: hashbrown
    version: 0.16.1
    sha: 841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100
  - kind: registry
    name: hashbrown
    version: 0.17.1
    sha: ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
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
    version: 0.5.3
    sha: e17592d60ebacc7d5e169f4663c5f84f9161cc90328abcfe8456f41e4dfcb284
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hex_color
    version: 3.0.0
    sha: d37f101bf4c633f7ca2e4b5e136050314503dd198e78e325ea602c327c484ef0
  - kind: registry
    name: hexf-parse
    version: 0.2.1
    sha: dfa686283ad6dd069f105e5ab091b04c62850d3e4cf5d67debad1933f55023df
  - kind: registry
    name: hkdf
    version: 0.13.0
    sha: 4aaa26c720c68b866f2c96ef5c1264b3e6f473fe5d4ce61cd44bbe913e553018
  - kind: registry
    name: hmac
    version: 0.10.1
    sha: c1441c6b1e930e2817404b5046f1f989899143a12bf92de603b69f4e0aee1e15
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: hmac
    version: 0.13.0
    sha: 6303bc9732ae41b04cb554b844a762b4115a61bfaa81e3e83050991eeb56863f
  - kind: registry
    name: hostname-validator
    version: 1.1.1
    sha: f558a64ac9af88b5ba400d99b579451af0d39c6d360980045b91aac966d705e2
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: hostname1-zbus
    version: 1.0.0
  - kind: registry
    name: hybrid-array
    version: 0.4.15
    sha: 27f864f10dfb56725ce5ce5472bc52252c8f93a4ab86327122cebf62c5f59a17
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
    version: 0.10.1
    sha: 602e6bd30c3db2749e13e38b363a3d98d9d41de1d8de7a79c31bb69e45b47cda
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
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_accessibility
    version: 0.1.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_debug
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_futures
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_graphics
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_program
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_renderer
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_runtime
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_tiny_skia
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_wgpu
    version: 0.14.0
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_widget
    version: 0.14.2
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: iced_winit
    version: 0.14.0
  - kind: registry
    name: icu
    version: 2.4.0
    sha: 399a42bd0e3f8171bfaa58545d0cfa60b09af031e979e277555c6a080668a054
  - kind: registry
    name: icu_calendar
    version: 2.4.0
    sha: a68ffb801cc7acb8dcae62da7c692c47934698d2dd4f479ddee1eb442763dea1
  - kind: registry
    name: icu_calendar_data
    version: 2.4.0
    sha: 514da54e79efa36b5976232d5b3d1d8ee1b47b19ab658f1b1ebe39221696c2d8
  - kind: registry
    name: icu_casemap
    version: 2.4.0
    sha: 1a6f143e9349267b80ae071a6ec25d4797c45756d8b2671a8b24b7b25b81ab94
  - kind: registry
    name: icu_casemap_data
    version: 2.4.0
    sha: 71a5c321208537711696af55bc2ab5dad939e4f6e0aef92dd6a2555deceedf3a
  - kind: registry
    name: icu_collator
    version: 2.4.0
    sha: 24cb0205c419b2036da3f9082964905d6849b3f2130dd4a517940c45899a544b
  - kind: registry
    name: icu_collator_data
    version: 2.4.0
    sha: 183f47e821a327661c1ebe152f61d5b6c2000010d228cadbbf226e0e2b8c2634
  - kind: registry
    name: icu_collections
    version: 2.4.0
    sha: fe090a42a0d3140fed8c63263ed1fecc02422cb2f4bfe55cd8de2de1b8e105dd
  - kind: registry
    name: icu_datetime
    version: 2.4.0
    sha: 3c338aa7ebff734470e216a4196fa84b123a366cc786c445741b6f5647412c3c
  - kind: registry
    name: icu_datetime_data
    version: 2.4.0
    sha: 4bddb757c2df1635453c4e8cb2d4ba7ad026e904893f29699315826c0951bbd9
  - kind: registry
    name: icu_decimal
    version: 2.4.0
    sha: 1150ad5e272740670464934ee76facda43ef2e11f85c27b7ba76ccb33edf2d05
  - kind: registry
    name: icu_decimal_data
    version: 2.4.0
    sha: 5595ab78370d48abd24a062f3db115d5108dd0b65634352036cae532aebb0df8
  - kind: registry
    name: icu_experimental
    version: 0.7.0
    sha: 64423d9f65806f0a864c4d1f156a46b910cba98b6cf6a764f3297f671423b7ec
  - kind: registry
    name: icu_experimental_data
    version: 0.7.0
    sha: 3028e254d20c6c04d2ff4f59f13cce34e3f147dfcc3a80b82441256c22181722
  - kind: registry
    name: icu_list
    version: 2.4.0
    sha: 61b7401916042e00e2ff603d4a1dd4767772ec361d341a03e549ed2879b56591
  - kind: registry
    name: icu_list_data
    version: 2.4.0
    sha: 22b55746bcc43fb7397bc6590980c78a4981d62c04bd7a0db1e3cbc1d2d63457
  - kind: registry
    name: icu_locale
    version: 2.4.0
    sha: fe8fa57bcddc15cb921582ee5259c5b77da39f946f188ca5213fad24d9241236
  - kind: registry
    name: icu_locale_core
    version: 2.4.0
    sha: 25d29b57c17c6528d0dc4c2141cfa2d08200465acb537a3909c8b9b8a4a984c0
  - kind: registry
    name: icu_locale_data
    version: 2.4.0
    sha: a64014dac577a11d8d2cee48517c73c1984bd72ab11031e934269bd3cefb2ad9
  - kind: registry
    name: icu_locale_fallback
    version: 2.4.0
    sha: 406e9ae5b95d8aa37db6293405931b766a6172d1848daee22d70eb44aa78a43c
  - kind: registry
    name: icu_locale_fallback_data
    version: 2.4.0
    sha: 3632ebbd0c5c3637ba1a40bdf8288f2cb9d2268e73441a69d5fc73d7cfbaa87c
  - kind: registry
    name: icu_normalizer
    version: 2.4.0
    sha: 404a3b8c486f205c87fe7f23ab6894d84a4ad76d6e4671ae1981ba7def87c599
  - kind: registry
    name: icu_normalizer_data
    version: 2.4.0
    sha: 20f0088bfb7441f7a37fa0c9e20cb1e9cba1cac6b9ce8cd2a6dc44294f8e8cbc
  - kind: registry
    name: icu_pattern
    version: 0.5.1
    sha: bc43ce0e76ee8cb0482dc6e2dbb9b76278e8038f45daabf2a2877577e2ceb18f
  - kind: registry
    name: icu_plurals
    version: 2.4.0
    sha: 2ef046647b445acf95ce0f8083fa292467d3df649959fa9a20f3f8abfd957c5d
  - kind: registry
    name: icu_plurals_data
    version: 2.4.0
    sha: d43ff7df2c1a1d41588a6ddcba354d513d4a3e10eec22c06fe56d13c12a848ea
  - kind: registry
    name: icu_properties
    version: 2.4.0
    sha: 2ea83d991c56158f7cf898bf86436c1dfe7c07ee82fe88951f2695c9f37a379f
  - kind: registry
    name: icu_properties_data
    version: 2.4.0
    sha: b98f29af82d02b163fe50161388350e743bb3107cc8e8c2f7314cb505faddfcf
  - kind: registry
    name: icu_provider
    version: 2.4.0
    sha: 413099315636c588ee8f011190b329b971a09a8fae9d157e01dcae8379468514
  - kind: registry
    name: icu_segmenter
    version: 2.4.0
    sha: 61b195dc605f81aa181bec9b3bd14e26cc71b903e4644f6af578ca9772c7a710
  - kind: registry
    name: icu_segmenter_data
    version: 2.4.0
    sha: 913a7d294ad056474749152107309fdee3ec17d2482d1ab70fdc61a81c64b9a3
  - kind: registry
    name: icu_time
    version: 2.4.0
    sha: 17d45ee651f21433b1c6352311f2ad9b5253c26be0e25d9a0869cb8247b8cfde
  - kind: registry
    name: icu_time_data
    version: 2.4.0
    sha: a6d7d711f44237fa9300406ab6e521148594056862343370b5df265a0d15c088
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
    version: 1.2.2
    sha: cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714
  - kind: registry
    name: image
    version: 0.25.10
    sha: 85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104
  - kind: registry
    name: image-extras
    version: 0.1.1
    sha: 60d02eb2c9ccbbab470538fce34c7bc3be7b4e59268e65a3171367b296cdb842
  - kind: registry
    name: image-webp
    version: 0.2.4
    sha: 525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3
  - kind: registry
    name: imagesize
    version: 0.13.0
    sha: edcd27d72f2f071c64249075f42e205ff93c9a4c5f6c6da53e79ed9f9832c285
  - kind: registry
    name: imgref
    version: 1.12.3
    sha: 6e44b0a4eaa4c82f441d50a963f2d5f05a787240aeee097597033e72accfd22f
  - kind: registry
    name: indenter
    version: 0.3.4
    sha: 964de6e86d545b246d84badc0fef527924ace5134f30641c203ef52ba83f58d5
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.2
    sha: cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855
  - kind: registry
    name: infer
    version: 0.19.0
    sha: a588916bfdfd92e71cacef98a63d9b1f0d74d6599980d11894290e7ddefffcf7
  - kind: registry
    name: inotify
    version: 0.11.5
    sha: 4cc00ea907cab49550b7da656f80ebb97be1b997d931fbcd28d39734e17ce592
  - kind: registry
    name: inotify-sys
    version: 0.1.8
    sha: c033f80b2c113cdf91ab7a33faa9cbc014726dcad99880c8609af2a370edf37d
  - kind: registry
    name: inout
    version: 0.1.4
    sha: 879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01
  - kind: registry
    name: inout
    version: 0.2.5
    sha: 3b5cf4372d022092674a83b8febf5865f7a573cc0c5baec5e49c879b6a20978f
  - kind: registry
    name: input
    version: 0.10.0
    sha: f9793345a65d71317763a33066b5d8351f8760dde8d4930fe9e39b5f14a7959d
  - kind: registry
    name: input-sys
    version: 1.19.0
    sha: 36eee07d8e02bd95bf52b2e642cf13d33701b94c6e4b04fbf1d1fb07e9cb19e7
  - kind: registry
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: intl-memoizer
    version: 0.5.3
    sha: 310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f
  - kind: registry
    name: intl_pluralrules
    version: 7.0.2
    sha: 078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972
  - kind: registry
    name: intmap
    version: 3.1.3
    sha: a2e611826a1868311677fdcdfbec9e8621d104c732d080f546a854530232f0ee
  - kind: registry
    name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.2
    sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itoa
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: ixdtf
    version: 0.6.7
    sha: 4754a1731458af0443709c9667302793d3f63cc90ec4ba4c8259f2b9515478e5
  - kind: registry
    name: jiff
    version: 0.2.39
    sha: 3ac703058abac89e5c39b0b879dce2b6b14a4ba36600c7e7e3d0c60a6883ef3c
  - kind: registry
    name: jiff-core
    version: 0.1.2
    sha: aee43309eb53bafb8c36d35d6e444769c8f8e6206a9fbf7546f5db9d7d4a0e93
  - kind: registry
    name: jiff-static
    version: 0.2.39
    sha: 6dc32470c67eb7d0e9ccb74303fa925313dc04cecb1aa048beaa6f391e36a93d
  - kind: registry
    name: jiff-tzdb
    version: 0.1.9
    sha: fa8377070c6bae868759445e5a77f66d84f0b72f3a054bfb00e6d038b8282da7
  - kind: registry
    name: jiff-tzdb-platform
    version: 0.1.3
    sha: 875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8
  - kind: registry
    name: jni
    version: 0.22.4
    sha: 5efd9a482cf3a427f00d6b35f14332adc7902ce91efb778580e180ff90fa3498
  - kind: registry
    name: jni-macros
    version: 0.22.4
    sha: a00109accc170f0bdb141fed3e393c565b6f5e072365c3bd58f5b062591560a3
  - kind: registry
    name: jni-sys
    version: 0.3.1
    sha: 41a652e1f9b6e0275df1f15b32661cf0d4b78d4d87ddec5e0c3c20f097433258
  - kind: registry
    name: jni-sys
    version: 0.4.1
    sha: c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2
  - kind: registry
    name: jni-sys-macros
    version: 0.4.1
    sha: 38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264
  - kind: registry
    name: jobserver
    version: 0.1.35
    sha: 1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3
  - kind: registry
    name: js-sys
    version: 0.3.107
    sha: 8dc09d2154098bbf4ef54eab6b117a3c24cbbffe94046b16ee6d6d4510584d3a
  - kind: registry
    name: jxl
    version: 0.8.0
    sha: b8379fc83d79477900c9aed78cb8370a556d834081bebcb771c6010381c4e230
  - kind: registry
    name: jxl-image-rs-integration
    version: 0.8.0
    sha: 040122e58dac2a6ac1ef70ba8630f35461870c5e7f94d62d7db27f09f96bbe97
  - kind: registry
    name: jxl_macros
    version: 0.8.0
    sha: eeb27c06a9957bd9c8e65d0aeea0db6a555a9e1c85597e284f8304015c410c87
  - kind: registry
    name: jxl_simd
    version: 0.8.0
    sha: a645451b4d34b4017caf24110a14eb737e275b5d3d121bc754e67727ee65af0e
  - kind: registry
    name: jxl_transforms
    version: 0.8.0
    sha: 21c4b7f8957f5ba578b2e28cd5ebbc97dad58a3ad5ff26765da61e8dab8f1cad
  - kind: registry
    name: kamadak-exif
    version: 0.6.2
    sha: 8772c92c0f41c4a672cbdee6728253e5ae8fcc1c5eb5c6c676579565684bbf68
  - kind: registry
    name: kdl
    version: 6.7.1
    sha: 082ddf81b2acd76fe04412655d17befedfff1837db772f8e74c38050d25ed670
  - kind: registry
    name: keyboard-types
    version: 0.8.3
    sha: 0fbe853b403ae61a04233030ae8a79d94975281ed9770a1f9e246732b534b28d
  - kind: registry
    name: khronos-egl
    version: 6.0.0
    sha: 6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76
  - kind: registry
    name: khronos_api
    version: 3.1.0
    sha: e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc
  - kind: registry
    name: known-folders
    version: 1.4.2
    sha: 7a1886916523694cd6ea3d175f03a1e5010699a2a4cc13696d83d7bea1d80638
  - kind: registry
    name: kqueue
    version: 1.2.1
    sha: 8d763e5b24120b4ddf50de6c92308156765aabfbbccebf401da7cff2d70a41ea
  - kind: registry
    name: kqueue-sys
    version: 1.1.2
    sha: 07293a4e297ac234359b510362495713f75ea345d5307140414f20c69ffeb087
  - kind: registry
    name: kurbo
    version: 0.10.4
    sha: 1618d4ebd923e97d67e7cd363d80aef35fe961005cbbbb3d2dad8bdd1bc63440
  - kind: registry
    name: kurbo
    version: 0.11.3
    sha: c62026ae44756f8a599ba21140f350303d4f08dcdcc71b5ad9c9bb8128c13c62
  - kind: registry
    name: lazy_static
    version: 1.5.1
    sha: 20870f649af7073d53e38067b2a84312175d56ea15217e1b15bc83506ec50afb
  - kind: registry
    name: lebe
    version: 0.5.3
    sha: 7a79a3332a6609480d7d0c9eab957bca6b455b91bb84e66d19f5ff66294b85b8
  - kind: registry
    name: libc
    version: 0.2.191
    sha: 65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a
  - kind: git
    commit: dd108aa99d7306110eef06da43eafc109e1ab151
    repo: github:pop-os/libcosmic
    name: libcosmic
    version: 1.0.0
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.13
    sha: a9fd2f41a1cba099f79a0b6b6c35656cf7c03351a7bae8ff0f28f25270f929d2
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
    version: 0.1.25
    sha: 61ff90caf6077a803a240f62fdbe88645a890bbca49ef8174c3cb0404362171d
  - kind: registry
    name: libudev-sys
    version: 0.1.4
    sha: 3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324
  - kind: registry
    name: lilt
    version: 0.8.2
    sha: 337d4c256f7d9f2dbd633891d48ace853efa5b1554122d9220b172ad9c03c3a9
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
    version: 0.8.3
    sha: 47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae
  - kind: registry
    name: litrs
    version: 1.0.1
    sha: 4744e383959f0db86ede514b809b1c53251889093803c05267acc7d4e7030d70
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: locale1-zbus
    version: 1.0.0
  - kind: registry
    name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - kind: git
    commit: 947cc560257ebe68fda3f854ee45773072a915d4
    repo: github:AerynOS/locales-rs
    name: locales-rs
    version: 0.1.0
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.35
    sha: 5d15f86d12da44cd8d4ec3c73984537eb7f4cadcb9776a575a0a8a05ca11005c
  - kind: registry
    name: loop9
    version: 0.1.5
    sha: 0fae87c125b03c1d2c0150c90365d7d6bcc53fb73a9acaef207d2d065860f062
  - kind: registry
    name: lru
    version: 0.16.4
    sha: 7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39
  - kind: registry
    name: lyon
    version: 1.0.19
    sha: bd0578bdecb7d6d88987b8b2b1e3a4e2f81df9d0ece1078623324a567904e7b7
  - kind: registry
    name: lyon_algorithms
    version: 1.0.22
    sha: f3a6b9d4e8b48acd531fbf1241ad9b270df6e60b6b92bdea1469f4f40899d805
  - kind: registry
    name: lyon_geom
    version: 1.0.20
    sha: d82dd26aa4dc0b5b70b9115de59824842bcb43cf4a28e1b1e6d0ad148c93f93e
  - kind: registry
    name: lyon_path
    version: 1.0.19
    sha: 5c463f9c428b7fc5ec885dcd39ce4aa61e29111d0e33483f6f98c74e89d8621e
  - kind: registry
    name: lyon_tessellation
    version: 1.0.23
    sha: fd4872650e70dc907dd4f7ebc449d7d657a0d2658e423b2e724970870bbbf75b
  - kind: registry
    name: lzma-rs
    version: 0.3.0
    sha: 297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e
  - kind: registry
    name: lzma-sys
    version: 0.1.20
    sha: 5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27
  - kind: registry
    name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: md-5
    version: 0.9.1
    sha: 7b5a279bb9607f9f53c22d496eade00d138d1bdcccd07d74650387cf94942a15
  - kind: registry
    name: memchr
    version: 2.8.3
    sha: cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98
  - kind: registry
    name: memmap2
    version: 0.8.0
    sha: 43a5a03cefb0d953ec0be133036f14e109412fa594edc2f77227249db66cc3ed
  - kind: registry
    name: memmap2
    version: 0.9.12
    sha: 6b0ca1155a9ecc25aa12e8313a119f32edf0255fea2f44839c4ac0a12b2ac157
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: metal
    version: 0.33.0
    sha: c7047791b5bc903b8cd963014b355f71dc9864a9a0b727057676c1dcae5cbc15
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
    version: 0.3.18
    sha: d5848f5a9e8117cf94f2f90faac24a87ff81600ff8628c1e3deaab572e76bfa1
  - kind: registry
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: miniz_oxide
    version: 0.9.1
    sha: b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c
  - kind: registry
    name: mio
    version: 1.2.4
    sha: 1788edb87fdc09c7e26304471e2f5be8cdefb1b6930d6e3985fc02ff53bf86ee
  - kind: registry
    name: moxcms
    version: 0.8.1
    sha: bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b
  - kind: registry
    name: mp4parse
    version: 0.17.0
    sha: 63a35203d3c6ce92d5251c77520acb2e57108c88728695aa883f70023624c570
  - kind: registry
    name: mutate_once
    version: 0.1.2
    sha: 13d2233c9842d08cfe13f9eac96e207ca6a2ea10b80259ebe8ad0268be27d2af
  - kind: registry
    name: naga
    version: 28.0.0
    sha: 618f667225063219ddfc61251087db8a9aec3c3f0950c916b614e403486f1135
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
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nmrs
    version: 3.5.7
    sha: dad6d55d9b3eaa211e75ef740a95756807c2cb23d679a8e4454815c0bebe9b14
  - kind: registry
    name: no_std_io2
    version: 0.9.4
    sha: 418abd1b6d34fbf6cae440dc874771b0525a604428704c76e48b29a5e67b8003
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: noop_proc_macro
    version: 0.3.0
    sha: 0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8
  - kind: registry
    name: notify
    version: 8.2.1
    sha: 82f812702fbc75d35416d3f884e04925be7e9498f4eceea2e24ba34559284674
  - kind: registry
    name: notify-types
    version: 2.2.0
    sha: 0a437a9308232ce794b1e7fdf540d38ea37efc3c73492640c13b4c8568b8f108
  - kind: registry
    name: ntapi
    version: 0.4.3
    sha: c3b335231dfd352ffb0f8017f3b6027a4917f7df785ea2143d8af2adc66980ae
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
    version: 0.4.8
    sha: c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367
  - kind: registry
    name: num-complex
    version: 0.4.6
    sha: 73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495
  - kind: registry
    name: num-conv
    version: 0.2.2
    sha: 521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441
  - kind: registry
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
  - kind: registry
    name: num-integer
    version: 0.1.47
    sha: 7ce2d95d4b3734dc35aa2f45e1aa22cd416814592a4f9d9205e11affd5b8e10b
  - kind: registry
    name: num-iter
    version: 0.1.46
    sha: c92800bd69a1eac91786bcfe9da64a897eb72911b8dc3095decbd07429e8048b
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
    version: 0.7.6
    sha: 5d0bca838442ec211fa11de3a8b0e0e8f3a4522575b5c4c06ed722e005036f26
  - kind: registry
    name: num_enum_derive
    version: 0.7.6
    sha: 680998035259dcfcafe653688bf2aa6d3e2dc05e98be6ab46afb089dc84f1df8
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
    version: 0.5.3
    sha: 19d5490aaf8f1d7cf7688dfa9b0ce07900e168852c45cd2c03f534dfd27cfd0b
  - kind: registry
    name: objc2
    version: 0.6.5
    sha: 08849bbd4767dfae9457696856ae1c84fe4e0281bbe4a7abff2d0e06fb7981f8
  - kind: registry
    name: objc2-app-kit
    version: 0.2.2
    sha: e4e89ad9e3d7d297152b17d39ed92cd50ca8063a89a9fa569046d41568891eff
  - kind: registry
    name: objc2-app-kit
    version: 0.3.2
    sha: d49e936b501e5c5bf01fda3a9452ff86dc3ea98ad5f283e1455153142d97518c
  - kind: registry
    name: objc2-core-data
    version: 0.2.2
    sha: 617fbf49e071c178c0b24c080767db52958f716d9eabdf0890523aeae54773ef
  - kind: registry
    name: objc2-core-foundation
    version: 0.3.2
    sha: 2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536
  - kind: registry
    name: objc2-core-graphics
    version: 0.3.2
    sha: e022c9d066895efa1345f8e33e584b9f958da2fd4cd116792e15e07e4720a807
  - kind: registry
    name: objc2-core-image
    version: 0.2.2
    sha: 55260963a527c99f1819c4f8e3b47fe04f9650694ef348ffd2227e8196d34c80
  - kind: registry
    name: objc2-core-services
    version: 0.3.2
    sha: 583300ad934cba24ff5292aee751ecc070f7ca6b39a574cc21b7b5e588e06a0b
  - kind: registry
    name: objc2-core-video
    version: 0.3.2
    sha: d425caf1df73233f29fd8a5c3e5edbc30d2d4307870f802d18f00d83dc5141a6
  - kind: registry
    name: objc2-encode
    version: 4.1.0
    sha: ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33
  - kind: registry
    name: objc2-foundation
    version: 0.2.2
    sha: 0ee638a5da3799329310ad4cfa62fbf045d5f56e3ef5ba4149e7452dcf89d5a8
  - kind: registry
    name: objc2-foundation
    version: 0.3.2
    sha: e3e0adef53c21f888deb4fa59fc59f7eb17404926ee8a6f59f5df0fd7f9f3272
  - kind: registry
    name: objc2-io-kit
    version: 0.3.2
    sha: 33fafba39597d6dc1fb709123dfa8289d39406734be322956a69f0931c73bb15
  - kind: registry
    name: objc2-metal
    version: 0.2.2
    sha: dd0cba1276f6023976a406a14ffa85e1fdd19df6b0f737b063b95f6c8c7aadd6
  - kind: registry
    name: objc2-quartz-core
    version: 0.2.2
    sha: e42bee7bff906b14b167da2bac5efe6b6a07e6f7c0a21a7308d40c960242dc7a
  - kind: registry
    name: objc2-ui-kit
    version: 0.3.2
    sha: d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22
  - kind: registry
    name: objc_id
    version: 0.1.1
    sha: c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b
  - kind: registry
    name: object
    version: 0.40.0
    sha: dd229a0361b9d0d4396176e02d65897f487eebeab7caa6d443855ee152ca0b9c
  - kind: registry
    name: once_cell
    version: 1.21.4
    sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: opaque-debug
    version: 0.3.1
    sha: c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: orbclient
    version: 0.3.55
    sha: 5df339f526ea9a60e371768d50efc2f2508c7203290731565d1f7a6f71d21747
  - kind: registry
    name: ordered-float
    version: 5.5.1
    sha: 7f59006ce1e204c30956638535b74d317bca99477b9356dfaec54c37f6f600ab
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
    name: owo-colors
    version: 4.4.0
    sha: 13c45bb4a6ae1280ec0803b1ef9d3455eb50f01efbbe1447ab020f1d54fba9d8
  - kind: registry
    name: palette
    version: 0.7.7
    sha: ddeed8580d347d2abf3dcf06a5f0b3dc020258338526b277847cd4248a70fc64
  - kind: registry
    name: palette_derive
    version: 0.7.7
    sha: 88537020289b719d81be994ccf1bbf4990f477e2f69ee52fe3e45f43a02e56be
  - kind: registry
    name: palette_math
    version: 0.7.7
    sha: 6e6eb142958d64335fb0e345c5b9ead2ecd6fc438c307e9d7d3c4fd428dbaf12
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
    name: pastey
    version: 0.1.1
    sha: 35fb2e5f958ec131621fdd531e9fc186ed768cbe395337403ae56c17a74c68ec
  - kind: registry
    name: pbkdf2
    version: 0.12.2
    sha: f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: phf
    version: 0.13.1
    sha: c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf
  - kind: registry
    name: phf
    version: 0.14.0
    sha: 010378780309880b08997fae13be7834dba947d36393bd372f2b1556deb2a2f6
  - kind: registry
    name: phf_generator
    version: 0.14.0
    sha: aeb62e0959d5a1bebc965f4d15d9e2b7cea002b6b0f5ba8cde6cc26738467100
  - kind: registry
    name: phf_macros
    version: 0.14.0
    sha: 5fa8d0ca26d424d27630da600c6624696e7dec8bf7b3b492b383c5dc49e5e085
  - kind: registry
    name: phf_shared
    version: 0.13.1
    sha: e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266
  - kind: registry
    name: phf_shared
    version: 0.14.0
    sha: c6fd9027e2d9319be6349febd1db4e8d02aa544921200c9b777720ac34a3aa89
  - kind: registry
    name: pico-args
    version: 0.5.0
    sha: 5be167a7af36ee22fe3115051bc51f6e6c7054c9348e28deb4f49bd6f705a315
  - kind: registry
    name: pin-project
    version: 1.1.13
    sha: 2466b2336ed02bcdca6b294417127b90ec92038d1d5c4fbeac971a922e0e0924
  - kind: registry
    name: pin-project-internal
    version: 1.1.13
    sha: c96395f0a926bc13b1c17622aaddda1ecb55d49c8f1bf9777e4d877800a43f8b
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: piper
    version: 0.2.5
    sha: c835479a4443ded371d6c535cbfd8d31ad92c5d23ae9770a61bc155e4992a3c1
  - kind: registry
    name: pkg-config
    version: 0.3.34
    sha: f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548
  - kind: registry
    name: plain
    version: 0.2.3
    sha: b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6
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
  - kind: git
    commit: 546d8a3f11e052f88d7ecfaa4a9b844beb4f8a6d
    repo: github:pop-os/system-updater
    name: pop-system-updater-zbus
    version: 0.1.0
  - kind: registry
    name: portable-atomic
    version: 1.15.0
    sha: 05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85
  - kind: registry
    name: portable-atomic-util
    version: 0.2.8
    sha: 10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715
  - kind: registry
    name: potential_utf
    version: 0.1.6
    sha: d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661
  - kind: registry
    name: powerfmt
    version: 0.2.1
    sha: 4a6394b9e965e73d0a289ee54f589087e2c676aedf60885baf52c76b771e4958
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: presser
    version: 0.3.1
    sha: e8cf8e6a8aa66ce33f63993ffc4ea4271eb5b0530a9002db8455ea6050c77bfa
  - kind: registry
    name: proc-macro-crate
    version: 3.5.0
    sha: e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f
  - kind: registry
    name: proc-macro-error-attr3
    version: 3.1.1
    sha: 9e564d14133360e1ae169ffde5da25881b5fa47261665b8e5713c212c27799da
  - kind: registry
    name: proc-macro-error3
    version: 3.1.1
    sha: 8f0d4471b3436c22106b21913b1dda531558918ae9b7ec55d58aa84b43552233
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
  - kind: registry
    name: proc-macro2-diagnostics
    version: 0.10.1
    sha: af066a9c399a26e020ada66a034357a868728e72cd426f3adcd35f80d88d88c8
  - kind: registry
    name: profiling
    version: 1.0.18
    sha: 3d595e54a326bc53c1c197b32d295e14b169e3cfeaa8dc82b529f947fba6bcf5
  - kind: registry
    name: profiling-procmacros
    version: 1.0.18
    sha: 4488a4a36b9a4ba6b9334a32a39971f77c1436ec82c38707bce707699cc3bbcb
  - kind: registry
    name: pulp
    version: 0.22.3
    sha: 046aa45b989642ec2e4717c8e72d677b13edd831a4d3b6cf37d9a3e54912496a
  - kind: registry
    name: pulp-wasm-simd-flag
    version: 0.1.1
    sha: 1d8f70e07b9c3962945a74e59ca1c511bba65b6419468acc217c457d93f3c740
  - kind: registry
    name: pwhash
    version: 1.0.0
    sha: 419a3ad8fa9f9d445e69d9b185a24878ae6e6f55c96e4512f4a0e28cd3bc5c56
  - kind: registry
    name: pxfm
    version: 0.1.30
    sha: d55d956fa96f5ec02be2e13af0e20391a5aa83d6a074e3ad368959d0fab299ea
  - kind: registry
    name: qrcode
    version: 0.13.0
    sha: 166f136dfdb199f98186f3649cf7a0536534a61417a1a30221b492b4fb60ce3f
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quick-xml
    version: 0.41.0
    sha: e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1
  - kind: registry
    name: quote
    version: 1.0.47
    sha: 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: r-efi
    version: 6.0.0
    sha: f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf
  - kind: registry
    name: rand
    version: 0.10.3
    sha: 65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af
  - kind: registry
    name: rand
    version: 0.8.8
    sha: e058c7de0b26af77780c769414d6257830bb240f3c38477dbc2c16e5f54d6d4c
  - kind: registry
    name: rand
    version: 0.9.5
    sha: b9ef1d0d795eb7d84685bca4f72f3649f064e6641543d3a8c415898726a57b41
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_chacha
    version: 0.9.0
    sha: d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb
  - kind: registry
    name: rand_core
    version: 0.10.1
    sha: 63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: rand_core
    version: 0.9.5
    sha: 76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c
  - kind: registry
    name: range-alloc
    version: 0.1.5
    sha: ca45419789ae5a7899559e9512e58ca889e41f04f1f2445e9f4b290ceccd1d08
  - kind: registry
    name: rangemap
    version: 1.8.0
    sha: a611d15b50743feb4c76b7d03edcb0e64f399c26961e4efe6975bc398be6aa3d
  - kind: registry
    name: rav1e
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
  - kind: registry
    name: ravif
    version: 0.13.0
    sha: e52310197d971b0f5be7fe6b57530dcd27beb35c1b013f29d66c1ad73fbbcc45
  - kind: registry
    name: raw-cpuid
    version: 11.6.0
    sha: 498cd0dc59d73224351ee52a95fee0f1a617a2eae0e7d9d720cc622c73a54186
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: rayon
    version: 1.12.0
    sha: fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d
  - kind: registry
    name: rayon-core
    version: 1.13.0
    sha: 22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91
  - kind: registry
    name: read-fonts
    version: 0.37.0
    sha: 7b634fabf032fab15307ffd272149b622260f55974d9fad689292a5d33df02e5
  - kind: registry
    name: read-fonts
    version: 0.41.0
    sha: 046a7d674daf459825b32f5062056d6882db0d2f5a479fbd76ccfc870ac18709
  - kind: registry
    name: reborrow
    version: 0.5.5
    sha: 03251193000f4bd3b042892be858ee50e8b3719f2b08e5833ac4353724632430
  - kind: registry
    name: redox_event
    version: 0.4.8
    sha: c5018d583d6d2f5499352aea8d177e9067d1eb03ab17c78169d5ba7a30001b15
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_syscall
    version: 0.9.5
    sha: 580c875845b41ecb1564ad1ae4703044cef774145e3d7a94dc2b3fa7c97868fd
  - kind: registry
    name: redox_users
    version: 0.5.3
    sha: 60dc65c0ff1a7ae1294b0c67b9f14baf70b644404010370171787bfac1038fc0
  - kind: registry
    name: ref-cast
    version: 1.0.27
    sha: 7e440fb4e4b4147295338efb76001ab9e4efc0e5839df2c47fc5ac2381d365c3
  - kind: registry
    name: ref-cast-impl
    version: 1.0.27
    sha: 92ecd8964f8453721699a1ed72037b0db49ce2f5a5138486ee89bed6f67cdf3a
  - kind: registry
    name: regex
    version: 1.13.1
    sha: f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d
  - kind: registry
    name: regex-automata
    version: 0.4.18
    sha: ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2
  - kind: registry
    name: regex-syntax
    version: 0.8.11
    sha: d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4
  - kind: registry
    name: renderdoc-sys
    version: 1.1.0
    sha: 19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832
  - kind: registry
    name: resvg
    version: 0.45.1
    sha: a8928798c0a55e03c9ca6c4c6846f76377427d2c1e1f7e6de3c06ae57942df43
  - kind: registry
    name: rgb
    version: 0.8.53
    sha: 47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4
  - kind: registry
    name: ron
    version: 0.12.3
    sha: 97b3fe97c18ff24299ea56f802c5693eb34266fb0bc8317f4e101debc8a3ceaf
  - kind: registry
    name: ron
    version: 0.8.1
    sha: b91f7eff05f748767f183df4320a63d6936e9c6107d97c9e6bdd9784f4289c94
  - kind: registry
    name: roxmltree
    version: 0.20.0
    sha: 6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97
  - kind: registry
    name: roxmltree
    version: 0.21.2
    sha: 9da7f59328b09405b181fee1018925fad50f157afb43c0c0f5c522c256dd5907
  - kind: registry
    name: rust-embed
    version: 8.13.0
    sha: 19afa5b4b6a611de00bd1bdae6ae6f39084c9399f0679c3f52d8469cf335cc23
  - kind: registry
    name: rust-embed-impl
    version: 8.13.0
    sha: e0d8afda6374eac59e066abee06d265247ebbaf3006cf878e2879e8356e34053
  - kind: registry
    name: rust-embed-utils
    version: 8.13.0
    sha: 0d84e8ba78bd384263e5922f084cbe1b081c3b7e69add59c8fb097b879ba968a
  - kind: registry
    name: rustc-demangle
    version: 0.1.28
    sha: b74b56ffa8bb2830709a538c2cbcae9aa062db0d2a42563bfb09bdaae44020eb
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - kind: registry
    name: rustc-hash
    version: 2.1.3
    sha: 6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.6
    sha: e5e76742e5294153d4dde1207dbec5bdd81eef6fabdc0d2118babadabfd858aa
  - kind: registry
    name: rustversion
    version: 1.0.23
    sha: cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f
  - kind: registry
    name: rustybuzz
    version: 0.20.1
    sha: fd3c7c96f8a08ee34eff8857b11b49b07d71d1c3f4e88f8a88d4c9e9f90b1702
  - kind: registry
    name: ryu
    version: 1.0.23
    sha: 9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.3
    sha: ab508826f74a77ca9d5aba6ff19b522583ee3eaf28a19384ff3d0e5835fadf6e
  - kind: registry
    name: scoped-tls
    version: 1.0.1
    sha: e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: sctk-adwaita
    version: 0.11.1
    sha: ea2a4360b9abcdcee43809e6fc11d6d61ca5d25734026a8fc46c2883eea3f13f
  - kind: registry
    name: secret-service
    version: 5.2.0
    sha: 5107b24b91445dd2aa449a258a1807b63240942157292354dc5bfdbeb8bc6db8
  - kind: registry
    name: secure-string
    version: 0.3.0
    sha: 548ba8c9ff631f7bb3a64de1e8ad73fe20f6d04090724f2b496ed45314ad7488
  - kind: registry
    name: self_cell
    version: 1.3.0
    sha: 2ab42ca02749e120097e328d91d415325bdf43b1c72c4c8badf37375fe40a813
  - kind: registry
    name: semver
    version: 1.0.28
    sha: 8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd
  - kind: registry
    name: serde
    version: 1.0.229
    sha: 4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba
  - kind: registry
    name: serde-xml-rs
    version: 0.6.0
    sha: fb3aa78ecda1ebc9ec9847d5d3aba7d618823446a049ba2491940506da6e2782
  - kind: registry
    name: serde_core
    version: 1.0.229
    sha: 67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48
  - kind: registry
    name: serde_derive
    version: 1.0.229
    sha: e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348
  - kind: registry
    name: serde_json
    version: 1.0.154
    sha: e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6
  - kind: registry
    name: serde_repr
    version: 0.1.21
    sha: 8d3b1629de253c70a0508c3899572da79ca359fdab27c7920ff00406df418906
  - kind: registry
    name: serde_spanned
    version: 1.1.3
    sha: 9c187e0a369471c550af028cba56d4f4fa2a489ad28151ae95a4d340a2a8b782
  - kind: registry
    name: serde_with
    version: 3.24.0
    sha: df9adc193c780ef8f159aee8b61e2d5801aaa555e6eb0947fe45530ec506296f
  - kind: registry
    name: serde_with_macros
    version: 3.24.0
    sha: 3e17bbc68e28663bbbb90df47e058aa7eda4fb445b89fe70457bb94fbccf6e49
  - kind: registry
    name: sha-1
    version: 0.9.8
    sha: 99cd6713db3cf16b6c84e06321e049a9b9f699826e16096d23bbcc44d15d51a6
  - kind: registry
    name: sha1
    version: 0.10.7
    sha: a978451301f4db1d02937a4ab3ccce137717b81826e79b7d49ffe3244a13c3b8
  - kind: registry
    name: sha1_smol
    version: 1.0.1
    sha: bbfa15b3dddfee50a0fff136974b3e1bde555604ba463834a7eb7deb6417705d
  - kind: registry
    name: sha2
    version: 0.11.1
    sha: 47d7069beb7d6ac7b9acd1039986e73443f24234f41074da099d6f994ac9ad19
  - kind: registry
    name: sha2
    version: 0.9.9
    sha: 4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3faa38fbb64dd88ac8013d800
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: simd-adler32
    version: 0.3.10
    sha: 3a219298ac11a56ea9a6d2120044824d6f01aeb034955e7af7bc16858527deea
  - kind: registry
    name: simd_cesu8
    version: 1.2.0
    sha: 11031e251abf8611c80f460e19dbdeb54a66db918e49c65a7065b46ac7aec520
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: simplecss
    version: 0.2.2
    sha: 7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c
  - kind: registry
    name: siphasher
    version: 1.0.4
    sha: 33f4fe9184a62d842c9ef383018f3306d8ba224fd9d836f56d7288308847c256
  - kind: registry
    name: skrifa
    version: 0.40.0
    sha: 7fbdfe3d2475fbd7ddd1f3e5cf8288a30eb3e5f95832829570cd88115a7434ac
  - kind: registry
    name: skrifa
    version: 0.44.0
    sha: 819ab7d62b1d3e72d9d9dea5650bac30424f9111364bb94928dbf5ecad1baa68
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
    version: 1.16.5
    sha: 149309498a5f7334b12ddae0cad8aba81ce785fe91755068867e017cf98fee46
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
    name: smol_str
    version: 0.3.7
    sha: eeb7109d23f319619d4cc0de5464613c8b7b1a09db2774a58101459cf6be2f10
  - kind: registry
    name: socket2
    version: 0.6.5
    sha: c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4
  - kind: git
    commit: c2b2c19ddb38ff17495643699f97cb1f2064a1be
    repo: github:pop-os/softbuffer
    query:
      tag: cosmic-4.0
    name: softbuffer
    version: 0.4.1
  - kind: registry
    name: spirv
    version: 0.3.0+sdk-1.3.268.0
    sha: eda41003dc44290527a59b13432d4a0379379fa074b70174882adfbdfd917844
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: static_init
    version: 1.0.4
    sha: 8bae1df58c5fea7502e8e352ec26b5579f6178e1fdb311e088580c980dee25ed
  - kind: registry
    name: static_init_macro
    version: 1.0.4
    sha: 1389c88ddd739ec6d3f8f83343764a0e944cd23cfbf126a9796a714b0b6edd6f
  - kind: registry
    name: strict-num
    version: 0.1.1
    sha: 6637bab7722d379c8b41ba849228d680cc12d0a45ba1fa2b48f2a30577a06731
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: strum
    version: 0.24.1
    sha: 063e6045c0e62079840579a7e47a355ae92f60eb74daaf156fb1e84ba164e63f
  - kind: registry
    name: strum_macros
    version: 0.24.3
    sha: 1e385be0d24f186b4ce2f9982191e7101bb737312ad61c1f2f984f34bcf85d59
  - kind: registry
    name: subtle
    version: 2.4.1
    sha: 6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601
  - kind: registry
    name: sunrise
    version: 3.0.0
    sha: 15eecb5ec59a060dd9fe8f88c48b701abecd6be9d9c28d55081b80bdda73981c
  - kind: registry
    name: svg_fmt
    version: 0.4.5
    sha: 0193cc4331cfd2f3d2011ef287590868599a2f33c3e69bc22c1a3d3acf9e02fb
  - kind: registry
    name: svgtypes
    version: 0.15.3
    sha: 68c7541fff44b35860c1a7a47a7cadf3e4a304c457b58f9870d9706ece028afc
  - kind: registry
    name: swash
    version: 0.2.10
    sha: 6c2499c2d826531388872b2268718aed907a39bd785ab0dcfe57fab26283f92e
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: switcheroo-control-zbus
    version: 1.0.0
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
  - kind: registry
    name: syn
    version: 3.0.9
    sha: d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b
  - kind: registry
    name: synstructure
    version: 0.14.0
    sha: 901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02
  - kind: registry
    name: sys-locale
    version: 0.3.2
    sha: 8eab9a99a024a169fe8a903cf9d4a3b3601109bcc13bd9e3c6fff259138626c4
  - kind: registry
    name: sysinfo
    version: 0.38.0
    sha: fe840c5b1afe259a5657392a4dbb74473a14c8db999c3ec2f4ae812e028a94da
  - kind: registry
    name: system-deps
    version: 7.0.8
    sha: 396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7
  - kind: registry
    name: taffy
    version: 0.15.1
    sha: 31f7bd2d97198df05186f93a3a3c306845f40e8b3c22bf9279cdd7e5cf5fea7d
  - kind: registry
    name: target-lexicon
    version: 0.13.5
    sha: adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca
  - kind: registry
    name: temp-dir
    version: 0.1.16
    sha: 83176759e9416cf81ee66cb6508dbfe9c96f20b8b56265a39917551c23c70964
  - kind: registry
    name: tempfile
    version: 3.27.0
    sha: 32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.21
    sha: 09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.21
    sha: fe5197923287db20a58125f0bc85c062f7f2c892de97b18c356f9efb14b28524
  - kind: registry
    name: thread_local
    version: 1.1.10
    sha: 1ad99c4c6d32803332c548b1af0540b357b3f5fc0be8f6c6bfe8b2e6ae784070
  - kind: registry
    name: time
    version: 0.3.55
    sha: cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134
  - kind: registry
    name: time-core
    version: 0.1.9
    sha: 9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109
  - kind: registry
    name: time-macros
    version: 0.2.32
    sha: 7e689342a48d2ea927c87ea50cabf8594854bf940e9310208848d680d668ed85
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: timedate1-zbus
    version: 1.0.0
  - kind: registry
    name: tiny-skia
    version: 0.11.4
    sha: 83d13394d44dae3207b52a326c0c85a8bf87f1541f23b0d143811088497b09ab
  - kind: registry
    name: tiny-skia
    version: 0.12.0
    sha: 47ffee5eaaf5527f630fb0e356b90ebdec84d5d18d937c5e440350f88c5a91ea
  - kind: registry
    name: tiny-skia-path
    version: 0.11.4
    sha: 9c9e7fc0c2e86a30b117d0462aa261b72b7a99b7ebd7deb3a14ceda95c5bdc93
  - kind: registry
    name: tiny-skia-path
    version: 0.12.0
    sha: edca365c3faccca67d06593c5980fa6c57687de727a03131735bb85f01fdeeb9
  - kind: registry
    name: tiny-xlib
    version: 0.2.5
    sha: a90a0ca3ee6a69f2ad28fd11621a4c3f03b371f366be500b64df260c4ffbafb4
  - kind: registry
    name: tinystr
    version: 0.8.5
    sha: abc840c238154d58f9e86b2792261edfde565a17696e1cda1a449de27979801a
  - kind: registry
    name: tinyvec
    version: 1.13.3
    sha: fd3ca314f692efd6c868f8408f53fe444634a845f96c028b97d35f6a1f79f0ee
  - kind: registry
    name: tokio
    version: 1.54.1
    sha: b52fd3255258d26fac7264ab5a76b53c13367136dc011d3d6ad4f8ed070396a3
  - kind: registry
    name: tokio-macros
    version: 2.7.2
    sha: 78773a2a397f451582ce068015985c33193cf6dea8b74d2a639fe457b2f07b0e
  - kind: registry
    name: tokio-stream
    version: 0.1.19
    sha: a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b
  - kind: registry
    name: tokio-util
    version: 0.7.20
    sha: e464cf451ba96ebfc6f9b6542f17ee8b8956e33f1e40d9690624e59d7a7f8a4b
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml
    version: 1.2.1+spec-1.1.0
    sha: d5755c51863cdac711f1956baf8eb9588e060755f7d3c4c979e70ea1e1f32cd7
  - kind: registry
    name: toml_datetime
    version: 1.1.3+spec-1.1.0
    sha: 173f25c883cd2176a2d8212155638c0a60d484a9d84546d270866f40f56b6e49
  - kind: registry
    name: toml_edit
    version: 0.25.19+spec-1.1.0
    sha: dd43688c4858d7264ae1cf9a9f874a67c3feb74a883b1cd7bebd6a4ea8307218
  - kind: registry
    name: toml_parser
    version: 1.1.5+spec-1.1.0
    sha: baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c
  - kind: registry
    name: toml_writer
    version: 1.2.0+spec-1.1.0
    sha: 009dbb7700f11c55ef83aebbe4c0e9cf1f1ac0844bd8d6f00dc38f302026e13a
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
    name: tracing-error
    version: 0.2.1
    sha: 8b1581020d7a273442f5b45074a6a57d5757ad0a47dac0e9f0bd57b81936f3db
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.23
    sha: cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319
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
    version: 1.20.1
    sha: b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20
  - kind: registry
    name: udev
    version: 0.9.3
    sha: af4e37e9ea4401fc841ff54b9ddfc9be1079b1e89434c1a6a865dd68980f7e9f
  - kind: registry
    name: uds_windows
    version: 1.2.1
    sha: f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e
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
    version: 2.10.0
    sha: 357cc3acc6a036009fd6c973ed009037c732d60d0b4f6c673e9041497482a28f
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
    version: 1.0.27
    sha: a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-properties
    version: 0.1.5
    sha: 993ad287eb20e8ba755312801cfe1413e0f25d604075863acaddca10b04c1833
  - kind: registry
    name: unicode-script
    version: 0.5.9
    sha: aa04c955db05429d464c74d495c1ee677e1866e783a4c3747f9c0cef7756cabf
  - kind: registry
    name: unicode-segmentation
    version: 1.13.3
    sha: c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8
  - kind: registry
    name: unicode-vo
    version: 0.1.0
    sha: b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94
  - kind: registry
    name: unicode-width
    version: 0.1.14
    sha: 7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af
  - kind: registry
    name: unicode-width
    version: 0.2.3
    sha: ca718471876992059f251e33aafc334346ada08042b7661dd1fe313a9bced557
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: upower-zbus
    version: 1.0.0
  - kind: registry
    name: url
    version: 2.5.8
    sha: ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed
  - kind: registry
    name: usvg
    version: 0.45.1
    sha: 80be9b06fbae3b8b303400ab20778c80bbaf338f563afe567cf3c9eea17b47ef
  - kind: registry
    name: utf16_iter
    version: 1.1.0
    sha: 1c7de35d9d8757dbc1f5125dc8b51438c68b4430546a735c3a9b91aaaaf9a18a
  - kind: registry
    name: utf8_iter
    version: 1.1.0
    sha: af3bd9d3e571c26fcce9d033b87ea5ab061b8d2ffe9b7a5675d810d68f03edf0
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: utf_types
    version: 1.0.0
    sha: 3a3b425286980a367278453f3b6d28cdcb134b574e5a35824a6ff5eebad50bb6
  - kind: registry
    name: uuid
    version: 1.29.0
    sha: 4a0e2d11620c50695fe12bbbfde96b3477fe606e7284c22d505c12ce51214514
  - kind: registry
    name: v_frame
    version: 0.3.9
    sha: 666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2
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
    version: 1.0.4+wasi-0.2.12
    sha: b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487
  - kind: registry
    name: wasm-bindgen
    version: 0.2.130
    sha: a0181c14ddd6c7b8b0b0132a5f1ea2f32be0d893cd3ea97b6e3b28886b8a3d1c
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.80
    sha: 5e14e0327cb5368ad60ccb22d04a9827a693c95a926d8d125e9fa39e0baec501
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.130
    sha: 6e931a02a39abdbf66966fc35902b5ed58344750a70885bed4ebb3d8eaf28ed9
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.130
    sha: 2ca4b54280e455bd831e33a6b8e734baf432fe63fbc35c42ac14ce67a043a53a
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.130
    sha: 3b1f9c3798725016c6ee5f2f57869ec0831e8bbc0ab0310a86e787e97f41389e
  - kind: registry
    name: wasmtimer
    version: 0.4.5
    sha: c62b7f338e4397a45d054c15a2b36a93d57cccdda7be11a7d7b045d47b5e70ce
  - kind: registry
    name: wayland-backend
    version: 0.3.17
    sha: 38a91b4eaddff87b1cd1074985e3713da4af2c49742d1b356b2c01670a67a078
  - kind: registry
    name: wayland-client
    version: 0.31.15
    sha: e3c36a0f861ad76d0901f2800b46321410d9f73f2ea88aac0650d86c32688073
  - kind: registry
    name: wayland-csd-frame
    version: 0.3.0
    sha: 625c5029dbd43d25e6aa9615e88b829a5cad13b2819c4ae129fdbb7c31ab4c7e
  - kind: registry
    name: wayland-cursor
    version: 0.31.14
    sha: 4a52d18780be9b1314328a3de5f930b73d2200112e3849ca6cb11822793fb34d
  - kind: registry
    name: wayland-protocols
    version: 0.32.13
    sha: 23d0c813de3daa2ed6520af85a3bd49b0e722a3078506899aa9686fea58dc4b6
  - kind: registry
    name: wayland-protocols-experimental
    version: 20250721.0.1
    sha: 40a1f863128dcaaec790d7b4b396cc9b9a7a079e878e18c47e6c2d2c5a8dcbb1
  - kind: registry
    name: wayland-protocols-misc
    version: 0.3.12
    sha: 6e9567599ef23e09b8dad6e429e5738d4509dfc46b3b21f32841a304d16b29c8
  - kind: registry
    name: wayland-protocols-plasma
    version: 0.3.12
    sha: 2b6d8cf1eb2c1c31ed1f5643c88a6e53538129d4af80030c8cabd1f9fa884d91
  - kind: registry
    name: wayland-protocols-wlr
    version: 0.3.12
    sha: eb04e52f7836d7c7976c78ca0250d61e33873c34156a2a1fc9474828ec268234
  - kind: registry
    name: wayland-scanner
    version: 0.31.11
    sha: 338e30461b3a2b67d70eb30a6d89f8e0c93a833e07d2ae89085cd070c4a00ac0
  - kind: registry
    name: wayland-server
    version: 0.31.14
    sha: 0dde9c29be0f723a573977de51ee455bf3dfa03652730a74f9dd3b337e374d75
  - kind: registry
    name: wayland-sys
    version: 0.31.11
    sha: d8eab23fefc9e41f8e841df4a9c707e8a8c4ed26e944ef69297184de2785e3be
  - kind: registry
    name: web-sys
    version: 0.3.107
    sha: d7d179596ff5ec0f6de4db64d54011bde6289cc49603d3a6e4ce3f329207ab88
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
    version: 28.0.0
    sha: f9cb534d5ffd109c7d1135f34cdae29e60eab94855a625dcfe1705f8bc7ad79f
  - kind: registry
    name: wgpu-core
    version: 28.0.1
    sha: d23f4642f53f666adcfd2d3218ab174d1e6681101aef18696b90cbe64d1c10f9
  - kind: registry
    name: wgpu-core-deps-apple
    version: 28.0.0
    sha: 87b7b696b918f337c486bf93142454080a32a37832ba8a31e4f48221890047da
  - kind: registry
    name: wgpu-core-deps-emscripten
    version: 28.0.0
    sha: 34b251c331f84feac147de3c4aa3aa45112622a95dd7ee1b74384fa0458dbd79
  - kind: registry
    name: wgpu-core-deps-windows-linux-android
    version: 28.0.0
    sha: 68ca976e72b2c9964eb243e281f6ce7f14a514e409920920dcda12ae40febaae
  - kind: registry
    name: wgpu-hal
    version: 28.0.1
    sha: 44d6cb474beb218824dcc9e1ce679d973f719262789bfb27407da560cac20eeb
  - kind: registry
    name: wgpu-types
    version: 28.0.0
    sha: e18308757e594ed2cd27dddbb16a139c42a683819d32a2e0b1b0167552f5840c
  - kind: registry
    name: which
    version: 8.0.6
    sha: bae2f2b2b816647a1cab1acc91f5bd20812d53cb344382635ec2181940c8034f
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
    name: windows
    version: 0.61.3
    sha: 9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893
  - kind: registry
    name: windows
    version: 0.62.2
    sha: 527fadee13e0c05939a6a05d5bd6eec6cd2e3dbd648b9f8e447c6518133d8580
  - kind: registry
    name: windows-collections
    version: 0.2.0
    sha: 3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8
  - kind: registry
    name: windows-collections
    version: 0.3.2
    sha: 23b2d95af1a8a14a3c7367e1ed4fc9c20e0a26e79551b1454d72583c97cc6610
  - kind: registry
    name: windows-core
    version: 0.61.2
    sha: c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3
  - kind: registry
    name: windows-core
    version: 0.62.2
    sha: b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb
  - kind: registry
    name: windows-future
    version: 0.2.1
    sha: fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e
  - kind: registry
    name: windows-future
    version: 0.3.2
    sha: e1d6f90251fe18a279739e78025bd6ddc52a7e22f921070ccdc67dde84c605cb
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
    version: 0.1.3
    sha: 5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-numerics
    version: 0.2.0
    sha: 9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1
  - kind: registry
    name: windows-numerics
    version: 0.3.1
    sha: 6e2e40844ac143cdb44aead537bbf727de9b044e107a0f1220392177d15b0f26
  - kind: registry
    name: windows-result
    version: 0.3.4
    sha: 56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6
  - kind: registry
    name: windows-result
    version: 0.4.1
    sha: 7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5
  - kind: registry
    name: windows-strings
    version: 0.4.2
    sha: 56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57
  - kind: registry
    name: windows-strings
    version: 0.5.1
    sha: 7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091
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
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows-threading
    version: 0.1.0
    sha: b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6
  - kind: registry
    name: windows-threading
    version: 0.2.1
    sha: 3949bd5b99cafdf1c7ca86b43ca564028dfe27d66958f2470940f73d86d75b37
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-android
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-appkit
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-common
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-core
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-orbital
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-uikit
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-wayland
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-web
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-win32
    version: 0.31.0-beta.2
  - kind: git
    commit: 9567503d34130113e36b0167a2b8829c3756e429
    repo: github:pop-os/winit.git
    query:
      rev: 9567503
    name: winit-x11
    version: 0.31.0-beta.2
  - kind: registry
    name: winnow
    version: 0.7.15
    sha: df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945
  - kind: registry
    name: winnow
    version: 1.0.5
    sha: 8c3b93199df0ab874cdf0c6a94f0a0dc3423fe41f1cafb62b8bd7b1deb277aef
  - kind: registry
    name: wit-bindgen
    version: 0.57.1
    sha: 1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e
  - kind: registry
    name: write16
    version: 1.0.0
    sha: d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936
  - kind: registry
    name: writeable
    version: 0.6.4
    sha: 3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc
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
    version: 0.3.11
    sha: 163b33ed8786455e2fa5d72f554057ce3f3182425434f756cd39c99839d88e23
  - kind: registry
    name: xdg
    version: 3.0.0
    sha: 2fb433233f2df9344722454bc7e96465c9d03bff9d77c248f9e7523fe79585b5
  - kind: git
    commit: ca20ce3185b3b4404f429d59d429c40b58a2ddef
    repo: github:pop-os/cosmic-panel
    name: xdg-shell-wrapper-config
    version: 1.11.0
  - kind: registry
    name: xdgen
    version: 0.1.0
    sha: 25af88f104f06d5aeb80c77e5eb85e6f6f355f86f6e34307a14befd716efe4bf
  - kind: registry
    name: xkb-data
    version: 0.2.2
    sha: 08bde286fb1aad6e18459bdf90da78b611bb8a1993605de5d1ddacca4995c10a
  - kind: registry
    name: xkbcommon
    version: 0.7.0
    sha: 13867d259930edc7091a6c41b4ce6eee464328c6ff9659b7e4c668ca20d4c91e
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
    name: xml
    version: 1.4.0
    sha: 2f45bb2c13fec6a6cb4c0f76a7e94839e110a14ec803ec2940777a94c347bc52
  - kind: registry
    name: xml-rs
    version: 0.8.29
    sha: e450f9b2ed1dff33c94c12589a87338689467b9c4f5d8a5710bd09a847d2c8a7
  - kind: registry
    name: xmltree
    version: 0.10.3
    sha: d7d8a75eaf6557bb84a65ace8609883db44a29951042ada9b393151532e41fcb
  - kind: registry
    name: xmltree
    version: 0.12.0
    sha: cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70
  - kind: registry
    name: xmlwriter
    version: 0.1.0
    sha: ec7a2a501ed189703dba8b08142f057e887dfc4b2cc4db2d343ac6376ba3e0b9
  - kind: registry
    name: xz2
    version: 0.1.7
    sha: 388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2
  - kind: registry
    name: y4m
    version: 0.8.0
    sha: 7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448
  - kind: registry
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yazi
    version: 0.2.2
    sha: ac366ea532fa8ee6a992cec9dea525b1dc284e69702f36c2ab5fbebadc81ec86
  - kind: registry
    name: yoke
    version: 0.8.4
    sha: 417ef3fcf6c300b7dbd25c85531a746931c02ad536f3cf4786ed1e88223340b3
  - kind: registry
    name: yoke-derive
    version: 0.8.4
    sha: ec8ebde2db3681e8c9980cc27822030e68752690ddfa9473e739aeb4dbde6d71
  - kind: registry
    name: zbus
    version: 5.19.0
    sha: 5db4be7c075cb421e4b7ee645541604239bd243ba7c357511f4ff3a74b555907
  - kind: registry
    name: zbus
    version: 6.2.1
    sha: 0ddb2961d9587ef9f24ad14cde1c3bc4c5edc9f1525932a8cffdd5bd98886eb9
  - kind: registry
    name: zbus-lockstep
    version: 0.5.2
    sha: 6998de05217a084b7578728a9443d04ea4cd80f2a0839b8d78770b76ccd45863
  - kind: registry
    name: zbus-lockstep-macros
    version: 0.5.2
    sha: 10da05367f3a7b7553c8cdf8fa91aee6b64afebe32b51c95177957efc47ca3a0
  - kind: registry
    name: zbus_macros
    version: 5.19.0
    sha: 2990635d09ade6df1868f72f8cac69a876a90981e8bd3c40b1be413f8dc88f40
  - kind: registry
    name: zbus_macros
    version: 6.2.1
    sha: 083b38add47c340fc12ec560124fb1d9c23acb584f7021099f85ec6587a03c54
  - kind: registry
    name: zbus_names
    version: 4.3.5
    sha: 812a12be4ead7a59e18ea8f047d08add0066b73bc62fc1467066a2472ae088dd
  - kind: registry
    name: zbus_polkit
    version: 6.0.0
    sha: 493c2474ae7bd12adcda9daabda8b7db0a8c95b4563876edf0f34afaf5f9e74e
  - kind: registry
    name: zbus_utils
    version: 6.1.0
    sha: af55e52da295311b368c45bcae221f020e28e97a2420360170ce389218e76ec7
  - kind: registry
    name: zbus_xml
    version: 5.2.1
    sha: d1586c021a01ca0a9216dcd874e546382e156a5cbab5fab6cb5f10087e22682a
  - kind: registry
    name: zcheapstr
    version: 1.2.0
    sha: 939f186d9ecebe044315a5cb6d6f78568bbc21152adc954d5a0c2f58bdbc9920
  - kind: registry
    name: zeno
    version: 0.3.3
    sha: 6df3dc4292935e51816d896edcd52aa30bc297907c26167fec31e2b0c6a32524
  - kind: registry
    name: zerocopy
    version: 0.8.63
    sha: e5fe1f8f1b06191a00962174c61aa5005e0bb391a6d80d07e24d115c01a92ed8
  - kind: registry
    name: zerocopy-derive
    version: 0.8.63
    sha: 863ad3ac83293fb4d740aedbfdc9240dd8d1a50c1099acd76ce80ce7c7230c7f
  - kind: registry
    name: zerofrom
    version: 0.1.8
    sha: 0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272
  - kind: registry
    name: zerofrom-derive
    version: 0.1.8
    sha: f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a
  - kind: registry
    name: zeroize
    version: 1.9.1
    sha: e13084392c5e4bc371903e2935a5eaeed24905a7511356b883835e18a78f6879
  - kind: registry
    name: zeroize_derive
    version: 1.5.0
    sha: 3c50655cbb0fe3fc43170059e702f1ce5e19b84cec58dc87b037a09935c2f328
  - kind: registry
    name: zerotrie
    version: 0.2.5
    sha: 4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f
  - kind: registry
    name: zerovec
    version: 0.11.9
    sha: f58a2799cfe9a1670c7ea8edbd52ef8edb93cb37a7f83bf31ba9e35d9dae6a40
  - kind: registry
    name: zerovec-derive
    version: 0.11.7
    sha: c3743ddbf47738d929cd1ae2e199d40d0162979dfe31aef8ae646d2bf00bf97a
  - kind: registry
    name: zip
    version: 2.6.1
    sha: 1dcb24d0152526ae49b9b96c1dcf71850ca1e0b882e4e28ed898a93c41334744
  - kind: registry
    name: zlib-rs
    version: 0.6.8
    sha: b268e58e7c693d7c271f93ffc4ba3b380412554231c85bf61ca7af91042a4112
  - kind: registry
    name: zlink
    version: 0.8.0
    sha: 198be428106fe2987e3c014daadf976120909f4a765587341c9d4c2624912d61
  - kind: registry
    name: zlink-core
    version: 0.8.0
    sha: 24a314bfe2e205db0b9cc286abc09b08f34837a06dd709b10ef7cf28bd622e4f
  - kind: registry
    name: zlink-idl
    version: 0.8.0
    sha: 9beafa91ab0672e1a2adc828cac4163152156d54046a0cad298807e290153ccf
  - kind: registry
    name: zlink-macros
    version: 0.8.0
    sha: ad68b7baceb8afe7b0b21e408961f6a9d28fe5f10e02b19ef15b7ac3be39fc90
  - kind: registry
    name: zlink-names
    version: 0.8.0
    sha: 3e2019f3c1186761aee19689ba2f99e659ec7f0d637ad1ee96f22a54434e743a
  - kind: registry
    name: zlink-smol
    version: 0.8.0
    sha: 43f8b15370cace714c53983a91688004407f897eb1cf9b877b3e9df9330a26aa
  - kind: registry
    name: zlink-tokio
    version: 0.8.0
    sha: a46c4f9f765ecac29e50b21dc5c73185a2c2885a3d1ca1485ff1a97d96bc1538
  - kind: registry
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
  - kind: registry
    name: zopfli
    version: 0.8.4
    sha: aaf7fc5d30c28483d93805c4a5e12b05bbb52407fa67c5f8bd552374cd01fb11
  - kind: registry
    name: zruntime
    version: 0.2.2
    sha: 23ef5ed7d628cdf0af82f93dfe03330a8e37383bf7422a1d3d6eb72326680be5
  - kind: registry
    name: zstd
    version: 0.13.4
    sha: cdb02c3132d251ab1606e9fc913a7da6c6ed08cc263df15edf082e1dc497d157
  - kind: registry
    name: zstd-safe
    version: 7.4.0
    sha: 1c8ea04668f5de8d8d51051714ba560c9536519cadcdb8829bba4fe2ad159b03
  - kind: registry
    name: zstd-sys
    version: 2.1.2+zstd.1.5.7
    sha: 481ada9c543b2323cbb7bbdbb5249177fbf0188ed959ed2c15e4b22421c84ed3
  - kind: registry
    name: zune-core
    version: 0.4.12
    sha: 3f423a2c17029964870cfaabb1f13dfab7d092a62a29a89264f4d36990ca414a
  - kind: registry
    name: zune-core
    version: 0.5.3
    sha: d56377fd46368984a170bc5aac5567e52ca5da874caa60bea39fcbca78fb658b
  - kind: registry
    name: zune-inflate
    version: 0.2.54
    sha: 73ab332fe2f6680068f3582b16a24f90ad7096d5d39b974d1c0aff0125116f02
  - kind: registry
    name: zune-jpeg
    version: 0.4.21
    sha: 29ce2c8a9384ad323cf564b67da86e21d3cfdff87908bc1223ed5c99bc792713
  - kind: registry
    name: zune-jpeg
    version: 0.5.15
    sha: 27bc9d5b815bc103f142aa054f561d9187d191692ec7c2d1e2b4737f8dbd7296
  - kind: registry
    name: zvariant
    version: 5.15.1
    sha: 80bf6d6cd6a4b601acb64cfb8284cdc643fcfa75ef26ae3c46ec8aa4e8a1fbb7
  - kind: registry
    name: zvariant_derive
    version: 5.15.1
    sha: ef2672456ba1cb54b5eaec136e63135b3c7495fb938e53b28a62e633496d486d
  - kind: registry
    name: zvariant_utils
    version: 4.2.0
    sha: bad0294361a320b694a328460dc73add56c306150f5cb6bfafc44446120008a3
config:
  configure-commands: []
  build-commands:
  - |
    just build-release
  install-commands:
  - |
    just rootdir="%{install-root}" prefix="%{prefix}" install
  strip-commands:
  - |
    %{strip-binaries}
