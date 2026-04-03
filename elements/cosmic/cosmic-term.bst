kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- cosmic/just.bst
- cosmic/libcosmic.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-term.git
  track: master
  ref: epoch-1.0.8-15-g8ae5918ccd15844a822eb63c091625b8ac798b2b
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
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit
    version: 0.22.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_atspi_common
    version: 0.15.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_consumer
    version: 0.32.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_macos
    version: 0.23.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_unix
    version: 0.18.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_windows
    version: 0.30.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: https://github.com/wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_winit
    version: 0.30.0
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: aes
    version: 0.8.4
    sha: b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
  - kind: registry
    name: alacritty_terminal
    version: 0.25.1
    sha: 46319972e74179d707445f64aaa2893bbf6a111de3a9af29b7eb382f8b39e282
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
    name: alloc-no-stdlib
    version: 2.0.4
    sha: cc7bb162ec39d46ab1ca8c77bf72e890535becd1751bb45f64c597edb4c8c6b3
  - kind: registry
    name: alloc-stdlib
    version: 0.2.2
    sha: 94fb8275041c72129eb51b7d0322c29b8387a0386127718b096429201a5d6ece
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
    name: anstream
    version: 0.6.21
    sha: 43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a
  - kind: registry
    name: anstyle
    version: 1.0.14
    sha: 940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000
  - kind: registry
    name: anstyle-parse
    version: 0.2.7
    sha: 4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2
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
    version: 1.0.102
    sha: 7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c
  - kind: registry
    name: apply
    version: 0.3.0
    sha: f47b57fc4521e3cae26a4d45b5227f8fadee4c345be0fefd8d5d1711afb8aeb9
  - kind: registry
    name: approx
    version: 0.5.1
    sha: cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6
  - kind: registry
    name: arbitrary
    version: 1.4.2
    sha: c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1
  - kind: registry
    name: arc-swap
    version: 1.8.2
    sha: f9f3647c145568cec02c42054e07bdf9a5a698e15b466fb2341bfc393cd24aa5
  - kind: registry
    name: arg_enum_proc_macro
    version: 0.3.4
    sha: 0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea
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
    name: as-slice
    version: 0.2.1
    sha: 516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516
  - kind: registry
    name: ash
    version: 0.38.0+1.3.281
    sha: 0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f
  - kind: registry
    name: ashpd
    version: 0.11.1
    sha: d2f3f79755c74fd155000314eb349864caa787c6592eace6c6882dad873d9c39
  - kind: registry
    name: ashpd
    version: 0.12.3
    sha: 33a3c86f3fd70c0ffa500ed189abfa90b5a52398a45d5dc372fcc38ebeb7a645
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
  - kind: git
    commit: 043ab4859d53ffd3d55334685303d8df39c9f768
    repo: https://github.com/jackpot51/rust-atomicwrites
    name: atomicwrites
    version: 0.4.2
  - kind: registry
    name: atspi
    version: 0.29.0
    sha: c77886257be21c9cd89a4ae7e64860c6f0eefca799bb79127913052bd0eefb3d
  - kind: registry
    name: atspi-common
    version: 0.13.0
    sha: 20c5617155740c98003016429ad13fe43ce7a77b007479350a9f8bf95a29f63d
  - kind: registry
    name: atspi-proxies
    version: 0.13.0
    sha: 2230e48787ed3eb4088996eab66a32ca20c0b67bbd4fd6cdfe79f04f1f04c9fc
  - kind: registry
    name: auto_enums
    version: 0.8.8
    sha: 65398a2893f41bce5c9259f6e1a4f03fbae40637c1bdc755b4f387f48c613b03
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
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
    version: 0.8.8
    sha: 375082f007bd67184fb9c0374614b29f9aaa604ec301635f72338bb65386a53d
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
    name: bit_field
    version: 0.10.3
    sha: 1e4b40c7323adcfc0a41c4b88143ed58346ff65a288fc144329c5c45e05d70c6
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.11.0
    sha: 843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af
  - kind: registry
    name: bitstream-io
    version: 4.9.0
    sha: 60d4bd9d1db2c6bdf285e223a7fa369d5ce98ec767dec949c6ca62863ce61757
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block-padding
    version: 0.3.3
    sha: a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93
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
    version: 1.6.2
    sha: e83f8d02be6967315521be875afa792a316e28d57b5a2d401897e2a7921b7f21
  - kind: registry
    name: borsh
    version: 1.6.1
    sha: cfd1e3f8955a5d7de9fab72fc8373fade9fb8a703968cb200ae3dc6cf08e185a
  - kind: registry
    name: brotli-decompressor
    version: 5.0.0
    sha: 874bb8112abecc98cbd6d81ea4fa7e94fb9449648c93cc89aa40c81c24d7de03
  - kind: registry
    name: bstr
    version: 1.12.1
    sha: 63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab
  - kind: registry
    name: btoi
    version: 0.5.0
    sha: 3b5ab9db53bcda568284df0fd39f6eac24ad6f7ba7ff1168b9e76eba6576b976
  - kind: registry
    name: built
    version: 0.8.0
    sha: f4ad8f11f288f48ca24471bbd51ac257aaeaaa07adae295591266b792902ae64
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
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.11.1
    sha: 1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33
  - kind: registry
    name: bzip2
    version: 0.6.1
    sha: f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c
  - kind: registry
    name: calendrical_calculations
    version: 0.2.3
    sha: 3a0b39595c6ee54a8d0900204ba4c401d0ab4eb45adaf07178e8d017541529e7
  - kind: registry
    name: calloop
    version: 0.14.4
    sha: 4dbf9978365bac10f54d1d4b04f7ce4427e51f71d61f2fe15e3fed5166474df7
  - kind: registry
    name: calloop-wayland-source
    version: 0.4.1
    sha: 138efcf0940a02ebf0cc8d1eff41a1682a46b431630f4c52450d6265876021fa
  - kind: registry
    name: cbc
    version: 0.1.2
    sha: 26b52a9543ae338f279b96b0b9fed9c8093744685043739079ce85cd58f289a6
  - kind: registry
    name: cc
    version: 1.2.57
    sha: 7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423
  - kind: registry
    name: cesu8
    version: 1.1.0
    sha: 6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c
  - kind: registry
    name: cfb
    version: 0.7.3
    sha: d38f2da7a0a2c4ccf0065be06397cc26a81f4e528be095826eee9d4adbb8c60f
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chrono
    version: 0.4.44
    sha: c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0
  - kind: registry
    name: cipher
    version: 0.4.4
    sha: 773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad
  - kind: registry
    name: clap_lex
    version: 0.7.7
    sha: c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32
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
    name: colorchoice
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
  - kind: registry
    name: combine
    version: 4.6.7
    sha: ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd
  - kind: registry
    name: compio
    version: 0.18.0
    sha: 9b84ee96a86948d04388f3a0b8c36b9f0a6b40b3528ac0d65737e53632fb37fe
  - kind: registry
    name: compio-buf
    version: 0.8.0
    sha: 3e8777c3ad31ab42f8a3a4a1bd629b78f688371df9b0f528d94dfbdbe5c945c9
  - kind: registry
    name: compio-driver
    version: 0.11.3
    sha: ec8557d3804525f0e97594681f675929931782c9f8783a51c9f86da86b819150
  - kind: registry
    name: compio-fs
    version: 0.11.0
    sha: 65ee36e1acf2cec4835efe9a986c012b2462c5ef53580e4ee84ae6d5a3d8e3b3
  - kind: registry
    name: compio-io
    version: 0.9.1
    sha: 637522f28a64fd5f7dcceaa4ddef13fa8d8020025e8c993f7a069e237835580e
  - kind: registry
    name: compio-log
    version: 0.1.0
    sha: fc4e560213c1996b618da369b7c9109564b41af9033802ae534465c4ee4e132f
  - kind: registry
    name: compio-macros
    version: 0.1.2
    sha: f05ed201484967dc70de77a8f7a02b29aaa8e6c81cbea2e75492ee0c8d97766b
  - kind: registry
    name: compio-runtime
    version: 0.11.0
    sha: d6c1c71f011bdd9c8f30e97d877b606505ee6d241c7782cfaed172f66acbd9cd
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: configparser
    version: 3.1.0
    sha: e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b
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
    name: core2
    version: 0.4.0
    sha: b49ba7ef1ad6107f8824dbe97de947cbaac53c44e7f9756a1fba0d37c1eec505
  - kind: registry
    name: core_affinity
    version: 0.8.3
    sha: a034b3a7b624016c6e13f5df875747cc25f884156aad2abd12b6c46797971342
  - kind: registry
    name: core_maths
    version: 0.1.1
    sha: 77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30
  - kind: git
    commit: d0e95be25e423cfe523b11111a3666ed7aaf0dc4
    repo: github:pop-os/cosmic-protocols
    query:
      rev: d0e95be
    name: cosmic-client-toolkit
    version: 0.1.0
  - kind: git
    commit: 160b086abe03cd34a8a375d7fbe47b24308d1f38
    repo: github:pop-os/cosmic-protocols
    query:
      rev: 160b086
    name: cosmic-client-toolkit
    version: 0.2.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: cosmic-config-derive
    version: 1.0.0
  - kind: git
    commit: 49d353d369f7cb242ab55ae94ab402873a66a473
    repo: github:pop-os/cosmic-files.git
    name: cosmic-files
    version: 1.0.8
  - kind: git
    commit: 7a61a704f6d1ec41f71cbe766e3cc484858523fa
    repo: github:pop-os/freedesktop-icons
    name: cosmic-freedesktop-icons
    version: 0.4.0
  - kind: git
    commit: d0e95be25e423cfe523b11111a3666ed7aaf0dc4
    repo: github:pop-os/cosmic-protocols
    query:
      rev: d0e95be
    name: cosmic-protocols
    version: 0.1.0
  - kind: git
    commit: 160b086abe03cd34a8a375d7fbe47b24308d1f38
    repo: github:pop-os/cosmic-protocols
    query:
      rev: 160b086
    name: cosmic-protocols
    version: 0.2.0
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
    commit: d5a972a2b63649fad11ea3a7e80f7dc4c592f01a
    repo: github:pop-os/cosmic-text.git
    name: cosmic-text
    version: 0.18.2
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: cosmic-theme
    version: 1.0.0
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: crc
    version: 3.3.0
    sha: 9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675
  - kind: registry
    name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crossbeam-deque
    version: 0.8.6
    sha: 9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.18
    sha: 5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e
  - kind: registry
    name: crossbeam-queue
    version: 0.3.12
    sha: 0f58bbc28f91df819d0aa2a2c00cd19754769c2fad90579b3592b1c9ba7a3115
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
    version: 0.8.3
    sha: 199f851bd3cb5004c09474252c7f74e7c047441ed0979bf3688a7106a13da952
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
    name: darling
    version: 0.23.0
    sha: 25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d
  - kind: registry
    name: darling_core
    version: 0.21.3
    sha: 1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4
  - kind: registry
    name: darling_core
    version: 0.23.0
    sha: 9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0
  - kind: registry
    name: darling_macro
    version: 0.21.3
    sha: d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81
  - kind: registry
    name: darling_macro
    version: 0.23.0
    sha: ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d
  - kind: registry
    name: data-url
    version: 0.3.2
    sha: be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376
  - kind: registry
    name: deflate64
    version: 0.1.11
    sha: 807800ff3288b621186fe0a8f3392c4652068257302709c24efd918c3dffcdc2
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
    version: 0.15.1
    sha: 362f47930db19fe7735f527e6595e4900316b893ebf6d48ad3d31be928d57dd6
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: dirs
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-next
    version: 2.0.0
    sha: b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1
  - kind: registry
    name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dirs-sys-next
    version: 0.1.2
    sha: 4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d
  - kind: registry
    name: dispatch2
    version: 0.3.1
    sha: 1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
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
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
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
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
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
    name: env_filter
    version: 1.0.0
    sha: 7a1c3cc8e57274ec99de65301228b537f1e4eedc1b8e0f9411c6caac8ae7308f
  - kind: registry
    name: env_logger
    version: 0.11.9
    sha: b2daee4ea451f429a58296525ddf28b45a3b64f1acf6587e2067437bb11e218d
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
    name: exr
    version: 1.74.0
    sha: 4300e043a56aa2cb633c01af81ca8f699a321879a7854d3896a0ba89056363be
  - kind: registry
    name: fast-srgb8
    version: 1.0.0
    sha: dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fax
    version: 0.2.6
    sha: f05de7d48f37cd6730705cbca900770cab77a89f413d23e100ad7fad7795a0ab
  - kind: registry
    name: fax_derive
    version: 0.2.0
    sha: a0aca10fb742cb43f9e7bb8467c91aa9bcb8e3ffbc6a6f7389bb93ffc920577d
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: file-id
    version: 0.2.3
    sha: e1fc6a637b6dc58414714eddd9170ff187ecb0933d4c7024d1abbd23a3cc26e9
  - kind: registry
    name: filetime
    version: 0.2.27
    sha: f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db
  - kind: registry
    name: find-crate
    version: 0.6.3
    sha: 59a98bbaacea1c0eb6a0876280051b892eb73594fd90cf3b20e9c817029c57d2
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: fixed_decimal
    version: 0.7.1
    sha: 35eabf480f94d69182677e37571d3be065822acfafd12f2f085db44fbbcc8e57
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
    name: flume
    version: 0.12.0
    sha: 5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be
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
    name: fork
    version: 0.4.0
    sha: 30268f1eefccc9d72f43692e8b89e659aeb52e84016c3b32b6e7e9f1c8f38f94
  - kind: registry
    name: fork
    version: 0.6.0
    sha: 29714eb48a54d35d6f107e38cc58003f2e26825f222119db8369d28b24b79f2a
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: freedesktop-desktop-entry
    version: 0.8.1
    sha: 28273c5c6b97a5f07724f6652f064c0c7f637f9aa5e7c09c83bc3bc4ad4ea245
  - kind: registry
    name: freedesktop_entry_parser
    version: 2.0.0
    sha: fc6d3a3635983a889f065aa9ce760384713f23a9b4a04f696f86c39a5d7a6a5a
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
    version: 0.4.2
    sha: 0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555
  - kind: registry
    name: gettext-rs
    version: 0.7.7
    sha: 5d5857dc1b7f0fee86961de833f434e29494d72af102ce5355738c0664222bdf
  - kind: registry
    name: gettext-sys
    version: 0.26.0
    sha: 4ea859ab0dd7e70ff823032b3e077d03d39c965d68c6c10775add60e999d8ee9
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gif
    version: 0.14.1
    sha: f5df2ba84018d80c213569363bdcd0c64e6933c67fe4c1d60ecf822971a3c35e
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: registry
    name: glam
    version: 0.25.0
    sha: 151665d9be52f9bb40fc7966565d39666f2d1e69233571b71b87791c7e0528b3
  - kind: registry
    name: glob
    version: 0.3.3
    sha: 0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280
  - kind: registry
    name: globset
    version: 0.4.18
    sha: 52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3
  - kind: registry
    name: glow
    version: 0.16.0
    sha: c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08
  - kind: registry
    name: glutin_wgl_sys
    version: 0.6.1
    sha: 2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e
  - kind: registry
    name: gpu-alloc
    version: 0.6.0
    sha: fbcd2dba93594b227a1f57ee09b8b9da8892c34d55aa332e034a228d0fe6a171
  - kind: registry
    name: gpu-alloc-types
    version: 0.3.0
    sha: 98ff03b468aa837d70984d55f5d3f846f6ec31fe34bbb97c4f85219caeee1ca4
  - kind: registry
    name: gpu-allocator
    version: 0.27.0
    sha: c151a2a5ef800297b4e79efa4f4bec035c5f51d5ae587287c9b952bdf734cacd
  - kind: registry
    name: gpu-descriptor
    version: 0.3.2
    sha: b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca
  - kind: registry
    name: gpu-descriptor-types
    version: 0.2.0
    sha: fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91
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
    version: 0.5.2
    sha: 9da2e5ae821f6e96664977bf974d6d6a2d6682f9ccee23e62ec1d134246845f9
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
    version: 0.5.2
    sha: fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c
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
    version: 0.12.4
    sha: 7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7
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
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_accessibility
    version: 0.1.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_debug
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_futures
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_graphics
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_program
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_renderer
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_runtime
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_tiny_skia
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_wgpu
    version: 0.14.0
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_widget
    version: 0.14.2
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: iced_winit
    version: 0.14.0
  - kind: registry
    name: icu
    version: 2.1.1
    sha: 67ab713dd86fa032cb5487f9ac3a85d47b5dcf4c7b8c7dd00210b3cadd6a6551
  - kind: registry
    name: icu_calendar
    version: 2.1.1
    sha: d6f0e52e009b6b16ba9c0693578796f2dd4aaa59a7f8f920423706714a89ac4e
  - kind: registry
    name: icu_calendar_data
    version: 2.1.1
    sha: 527f04223b17edfe0bd43baf14a0cb1b017830db65f3950dc00224860a9a446d
  - kind: registry
    name: icu_casemap
    version: 2.1.1
    sha: d4ca9983e8bf51223c2f89014fa4eaa9e9b336c47f3af0d000538f86f841fba1
  - kind: registry
    name: icu_casemap_data
    version: 2.1.1
    sha: 98d4663d0f99b301033a19e0acf94e9d2fa4b107638580165e5a6ccc49ad1450
  - kind: registry
    name: icu_collator
    version: 2.1.1
    sha: 32eed11a5572f1088b63fa21dc2e70d4a865e5739fc2d10abc05be93bae97019
  - kind: registry
    name: icu_collator_data
    version: 2.1.1
    sha: 5ab06f0e83a613efddba3e4913e00e43ed4001fae651cb7d40fc7e66b83b6fb9
  - kind: registry
    name: icu_collections
    version: 2.1.1
    sha: 4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43
  - kind: registry
    name: icu_datetime
    version: 2.1.1
    sha: 1b9d49f41ded8e63761b6b4c3120dfdc289415a1ed10107db6198eb311057ca5
  - kind: registry
    name: icu_datetime_data
    version: 2.1.2
    sha: 46597233625417b7c8052a63d916e4fdc73df21614ac0b679492a5d6e3b01aeb
  - kind: registry
    name: icu_decimal
    version: 2.1.1
    sha: a38c52231bc348f9b982c1868a2af3195199623007ba2c7650f432038f5b3e8e
  - kind: registry
    name: icu_decimal_data
    version: 2.1.1
    sha: 2905b4044eab2dd848fe84199f9195567b63ab3a93094711501363f63546fef7
  - kind: registry
    name: icu_experimental
    version: 0.4.0
    sha: f4ffa4d60b9cb8b024082afaf9e94d853184e483ec69322c74dc437bf8a882a5
  - kind: registry
    name: icu_experimental_data
    version: 0.4.1
    sha: a0bce39e12480e91c7ddb748218050c459e241f491d130ea6ee92c3e5cd254f7
  - kind: registry
    name: icu_list
    version: 2.1.1
    sha: d3a0b7b126e2fc42777d3c348611553d540bd3683caa39b387c5dd1036bb21a8
  - kind: registry
    name: icu_list_data
    version: 2.1.1
    sha: 51044c242fe2a882cc0a464314bbdb9f441556a1cb238fb527fc47355ec2827b
  - kind: registry
    name: icu_locale
    version: 2.1.1
    sha: 532b11722e350ab6bf916ba6eb0efe3ee54b932666afec989465f9243fe6dd60
  - kind: registry
    name: icu_locale_core
    version: 2.1.1
    sha: edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6
  - kind: registry
    name: icu_locale_data
    version: 2.1.2
    sha: 1c5f1d16b4c3a2642d3a719f18f6b06070ab0aef246a6418130c955ae08aa831
  - kind: registry
    name: icu_normalizer
    version: 2.1.1
    sha: 5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599
  - kind: registry
    name: icu_normalizer_data
    version: 2.1.1
    sha: 7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a
  - kind: registry
    name: icu_pattern
    version: 0.4.1
    sha: 7a7ff8c0ff6f61cdce299dcb54f557b0a251adbc78f6f0c35a21332c452b4a1b
  - kind: registry
    name: icu_plurals
    version: 2.1.1
    sha: 4f9cfe49f5b1d1163cc58db451562339916a9ca5cbcaae83924d41a0bf839474
  - kind: registry
    name: icu_plurals_data
    version: 2.1.1
    sha: f018a98dccf7f0eb02ba06ac0ff67d102d8ded80734724305e924de304e12ff0
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
    name: icu_segmenter
    version: 2.1.2
    sha: a807a7488f3f758629ae86d99d9d30dce24da2fb2945d74c80a4f4a62c71db73
  - kind: registry
    name: icu_segmenter_data
    version: 2.1.1
    sha: 6ebbb7321d9e21d25f5660366cb6c08201d0175898a3a6f7a41ee9685af21c80
  - kind: registry
    name: icu_time
    version: 2.1.1
    sha: 8242b00da3b3b6678f731437a11c8833a43c821ae081eca60ba1b7579d45b6d8
  - kind: registry
    name: icu_time_data
    version: 2.1.1
    sha: 3e10b0e5e87a2c84bd5fa407705732052edebe69291d347d0c3033785470edbf
  - kind: registry
    name: id-arena
    version: 2.3.0
    sha: 3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954
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
    name: ignore
    version: 0.4.25
    sha: d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a
  - kind: registry
    name: image
    version: 0.25.10
    sha: 85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104
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
    version: 1.12.0
    sha: e7c5cedc30da3a610cac6b4ba17597bdf7152cf974e8aab3afb3d54455e371c8
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.13.0
    sha: 7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017
  - kind: registry
    name: infer
    version: 0.16.0
    sha: bc150e5ce2330295b8616ce0e3f53250e53af31759a9dbedad1621ba29151847
  - kind: registry
    name: inotify
    version: 0.11.1
    sha: bd5b3eaf1a28b758ac0faa5a4254e8ab2705605496f1b1f3fbbc3988ad73d199
  - kind: registry
    name: inotify-sys
    version: 0.1.5
    sha: e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb
  - kind: registry
    name: inout
    version: 0.1.4
    sha: 879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01
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
    name: is-docker
    version: 0.2.0
    sha: 928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3
  - kind: registry
    name: is-wsl
    version: 0.4.0
    sha: 173609498df190136aa7dea1a91db051746d339e18476eed5ca40521f02d7aa5
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
    version: 1.0.17
    sha: 92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2
  - kind: registry
    name: ixdtf
    version: 0.6.4
    sha: 84de9d95a6d2547d9b77ee3f25fa0ee32e3c3a6484d47a55adebc0439c077992
  - kind: registry
    name: jiff
    version: 0.2.23
    sha: 1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359
  - kind: registry
    name: jiff-static
    version: 0.2.23
    sha: 2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4
  - kind: registry
    name: jiff-tzdb
    version: 0.1.6
    sha: c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076
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
    version: 0.3.91
    sha: b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c
  - kind: registry
    name: jxl-bitstream
    version: 1.1.0
    sha: b480e752277e29eb4054f69546887a9b84656fe78c08f54ba5850ced98a378fe
  - kind: registry
    name: jxl-coding
    version: 1.0.1
    sha: cd972bcd125e776f1eb241ac50e39f956095a1c2770c64736c968f8946bd9a3c
  - kind: registry
    name: jxl-color
    version: 0.11.0
    sha: f316b1358c1711755b3ee8e8cb5c4a1dad12e796233088a7a513440782de80b2
  - kind: registry
    name: jxl-frame
    version: 0.13.3
    sha: 2d967c6fd669c7c01060b5022d8835fa82fd46b06ffc98b549f17600a097c2b3
  - kind: registry
    name: jxl-grid
    version: 0.6.1
    sha: a0e0ef92d5d60e76bf41098e57e985f523185e08fad54268da448637feca6989
  - kind: registry
    name: jxl-image
    version: 0.13.0
    sha: c5f752d62577c702a94dbbce4045caf08cb58639e8a4d56464b40ecf33ffe565
  - kind: registry
    name: jxl-jbr
    version: 0.2.1
    sha: e35d032bcec660647828527ff42c6f5776d2fd44b8357f9f6d9ac6dc07218e46
  - kind: registry
    name: jxl-modular
    version: 0.11.2
    sha: da758b2f989aafd9eeb39489fe43d7be5a3a0d2ad61cf1bad705eb6990a6053c
  - kind: registry
    name: jxl-oxide
    version: 0.12.5
    sha: ee8ecd2678ed70c1eda42b811ccb2e25ab836edeb18e7f1178c1f917ed36b772
  - kind: registry
    name: jxl-oxide-common
    version: 1.0.0
    sha: b62394c5021b3a9e7e0dbb2d639d555d019090c9946c39f6d3b09d390db4157b
  - kind: registry
    name: jxl-render
    version: 0.12.3
    sha: aa0c3100918bd3c41bb0f8ce1f4f1664e48f3032ff8eeab0d6a2cfc3276f462d
  - kind: registry
    name: jxl-threadpool
    version: 1.0.0
    sha: 25f15eb830aa77a7f21148d72e153562a26bfe570139bd4922eab1908dd499d3
  - kind: registry
    name: jxl-vardct
    version: 0.11.1
    sha: ce72a18c6d3a47172ab6c479be2bdb56f22066b5d7092663f03b4490820b4511
  - kind: registry
    name: kamadak-exif
    version: 0.6.1
    sha: 1130d80c7374efad55a117d715a3af9368f0fa7a2c54573afc15a188cd984837
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
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: leb128fmt
    version: 0.1.0
    sha: 09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2
  - kind: registry
    name: lebe
    version: 0.5.3
    sha: 7a79a3332a6609480d7d0c9eab957bca6b455b91bb84e66d19f5ff66294b85b8
  - kind: registry
    name: libbz2-rs-sys
    version: 0.2.2
    sha: 2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7
  - kind: registry
    name: libc
    version: 0.2.183
    sha: b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d
  - kind: git
    commit: 3da55e807440a99f6ed62edc2e7a84ca4be9b844
    repo: github:pop-os/libcosmic.git
    name: libcosmic
    version: 1.0.0
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.12
    sha: f12a681b7dd8ce12bff52488013ba614b869148d54dd79836ab85aafdd53f08d
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
    version: 0.1.14
    sha: 1744e39d1d6a9948f4f388969627434e31128196de472883b39f148769bfe30a
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
    name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.29
    sha: 5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897
  - kind: registry
    name: loom
    version: 0.7.2
    sha: 419e0dc8046cb947daa77eb95ae174acfbddb7673b4151f56d1eed8e93fbfaca
  - kind: registry
    name: loop9
    version: 0.1.5
    sha: 0fae87c125b03c1d2c0150c90365d7d6bcc53fb73a9acaef207d2d065860f062
  - kind: registry
    name: lru
    version: 0.16.3
    sha: a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593
  - kind: registry
    name: lyon
    version: 1.0.19
    sha: bd0578bdecb7d6d88987b8b2b1e3a4e2f81df9d0ece1078623324a567904e7b7
  - kind: registry
    name: lyon_algorithms
    version: 1.0.19
    sha: 9815fac08e6fd96733a11dce4f9d15a3f338e96a2e2311ee21e1b738efc2bc0f
  - kind: registry
    name: lyon_geom
    version: 1.0.19
    sha: 4336502e29e32af93cf2dad2214ed6003c17ceb5bd499df77b1de663b9042b92
  - kind: registry
    name: lyon_path
    version: 1.0.19
    sha: 5c463f9c428b7fc5ec885dcd39ce4aa61e29111d0e33483f6f98c74e89d8621e
  - kind: registry
    name: lyon_tessellation
    version: 1.0.19
    sha: 05a35a7dd71b845ff317ce1834c4185506b79790294bde397df8d5c23031e357
  - kind: registry
    name: lzma-rust2
    version: 0.15.7
    sha: 1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69
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
    version: 0.10.6
    sha: d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf
  - kind: registry
    name: memchr
    version: 2.8.0
    sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
  - kind: registry
    name: memmap2
    version: 0.8.0
    sha: 43a5a03cefb0d953ec0be133036f14e109412fa594edc2f77227249db66cc3ed
  - kind: registry
    name: memmap2
    version: 0.9.10
    sha: 714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: metal
    version: 0.32.0
    sha: 00c15a6f673ff72ddcc22394663290f870fb224c1bfce55734a75c414150e605
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
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: mio
    version: 1.1.1
    sha: a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc
  - kind: registry
    name: miow
    version: 0.6.1
    sha: 536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08
  - kind: registry
    name: moxcms
    version: 0.8.1
    sha: bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b
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
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
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
    version: 8.2.0
    sha: 4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3
  - kind: registry
    name: notify-debouncer-full
    version: 0.7.0
    sha: c02b49179cfebc9932238d04d6079912d26de0379328872846118a0fa0dbb302
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
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
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
    name: num_cpus
    version: 1.17.0
    sha: 91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b
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
    version: 0.5.2
    sha: 46a785d4eeff09c14c487497c162e92766fbb3e4059a71840cecc03d9a50b804
  - kind: registry
    name: objc2
    version: 0.6.4
    sha: 3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f
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
    name: once_cell
    version: 1.21.4
    sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: open
    version: 5.3.3
    sha: 43bb73a7fa3799b198970490a51174027ba0d4ec504b03cd08caf513d40024bc
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: orbclient
    version: 0.3.51
    sha: 59aed3b33578edcfa1bc96a321d590d31832b6ad55a26f0313362ce687e9abd6
  - kind: registry
    name: ordered-float
    version: 5.1.0
    sha: 7f4779c6901a562440c3786d08192c6fbda7c1c2060edd10006b05ee35d10f2d
  - kind: registry
    name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - kind: registry
    name: ordermap
    version: 1.1.0
    sha: cfa78c92071bbd3628c22b1a964f7e0eb201dc1456555db072beb1662ecd6715
  - kind: registry
    name: os_pipe
    version: 1.2.3
    sha: 7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967
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
    name: pastey
    version: 0.1.1
    sha: 35fb2e5f958ec131621fdd531e9fc186ed768cbe395337403ae56c17a74c68ec
  - kind: registry
    name: pathdiff
    version: 0.2.3
    sha: df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3
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
    version: 1.1.11
    sha: f1749c7ed4bcaf4c3d0a3efc28538844fb29bcdd7d2b67b2be7e20ba861ff517
  - kind: registry
    name: pin-project-internal
    version: 1.1.11
    sha: d9b20ed30f105399776b9c883e68e536ef602a16ae6f596d2c473591d6ad64c6
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: piper
    version: 0.2.5
    sha: c835479a4443ded371d6c535cbfd8d31ad92c5d23ae9770a61bc155e4992a3c1
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
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
  - kind: registry
    name: pollster
    version: 0.4.0
    sha: 2f3a9f18d041e6d0e102a0a46750538147e5e8992d3b4873aaafee2520b00ce3
  - kind: registry
    name: portable-atomic
    version: 1.13.1
    sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
  - kind: registry
    name: portable-atomic-util
    version: 0.2.6
    sha: 091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3
  - kind: registry
    name: potential_utf
    version: 0.1.4
    sha: b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppmd-rust
    version: 1.4.0
    sha: efca4c95a19a79d1c98f791f10aebd5c1363b473244630bb7dbde1dc98455a24
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: presser
    version: 0.3.1
    sha: e8cf8e6a8aa66ce33f63993ffc4ea4271eb5b0530a9002db8455ea6050c77bfa
  - kind: registry
    name: prettyplease
    version: 0.2.37
    sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
  - kind: registry
    name: proc-macro-crate
    version: 3.5.0
    sha: e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f
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
    name: procfs
    version: 0.18.0
    sha: 25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7
  - kind: registry
    name: procfs-core
    version: 0.18.0
    sha: e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405
  - kind: registry
    name: profiling
    version: 1.0.17
    sha: 3eb8486b569e12e2c32ad3e204dbaba5e4b5b216e9367044f25f1dba42341773
  - kind: registry
    name: profiling-procmacros
    version: 1.0.17
    sha: 52717f9a02b6965224f95ca2a81e2e0c5c43baacd28ca057577988930b6c3d5b
  - kind: registry
    name: pure-rust-locales
    version: 0.8.2
    sha: 869675ad2d7541aea90c6d88c81f46a7f4ea9af8cd0395d38f11a95126998a0d
  - kind: registry
    name: pxfm
    version: 0.1.28
    sha: b5a041e753da8b807c9255f28de81879c78c876392ff2469cde94799b2896b9d
  - kind: registry
    name: qoi
    version: 0.4.1
    sha: 7f6d64c71eb498fe9eae14ce4ec935c555749aef511cca85b5568910d6e48001
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.36.2
    sha: f7649a7b4df05aed9ea7ec6f628c67c9953a43869b8bc50929569b2999d443fe
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quick-xml
    version: 0.39.2
    sha: 958f21e8e7ceb5a1aa7fa87fab28e7c75976e0bfe7e23ff069e0a260f894067d
  - kind: registry
    name: quote
    version: 1.0.45
    sha: 41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924
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
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand
    version: 0.9.2
    sha: 6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1
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
    version: 1.7.1
    sha: 973443cf09a9c8656b574a866ab68dfa19f0867d0340648c7d2f6a71b8a8ea68
  - kind: registry
    name: rav1e
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
  - kind: registry
    name: ravif
    version: 0.13.0
    sha: e52310197d971b0f5be7fe6b57530dcd27beb35c1b013f29d66c1ad73fbbcc45
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: rayon
    version: 1.11.0
    sha: 368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f
  - kind: registry
    name: rayon-core
    version: 1.13.0
    sha: 22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91
  - kind: registry
    name: read-fonts
    version: 0.35.0
    sha: 6717cf23b488adf64b9d711329542ba34de147df262370221940dfabc2c91358
  - kind: registry
    name: read-fonts
    version: 0.37.0
    sha: 7b634fabf032fab15307ffd272149b622260f55974d9fad689292a5d33df02e5
  - kind: registry
    name: recently-used-xbel
    version: 1.2.0
    sha: 63ab2febcd4f0245fbadd0b44f7cd35207128a7b210a089e65740625a45399b5
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_syscall
    version: 0.7.3
    sha: 6ce70a74e890531977d37e532c34d45e9055d2409ed08ddba14529471ed0be16
  - kind: registry
    name: redox_users
    version: 0.4.6
    sha: ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43
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
    version: 0.45.1
    sha: a8928798c0a55e03c9ca6c4c6846f76377427d2c1e1f7e6de3c06ae57942df43
  - kind: registry
    name: rfd
    version: 0.16.0
    sha: a15ad77d9e70a92437d8f74c35d99b4e4691128df018833e99f90bcd36152672
  - kind: registry
    name: rgb
    version: 0.8.53
    sha: 47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4
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
    name: rustix-openpty
    version: 0.2.0
    sha: 1de16c7c59892b870a6336f185dc10943517f1327447096bbb7bb32cd85e2393
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
    name: sctk-adwaita
    version: 0.11.0
    sha: 1dd3accc0f3f4bbaf2c9e1957a030dc582028130c67660d44c0a0345a22ca69b
  - kind: registry
    name: secret-service
    version: 5.1.0
    sha: 9a62d7f86047af0077255a29494136b9aaaf697c76ff70b8e49cded4e2623c14
  - kind: registry
    name: secstr
    version: 0.5.1
    sha: e04f657244f605c4cf38f6de5993e8bd050c8a303f86aeabff142d5c7c113e12
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
    name: serde_with
    version: 3.18.0
    sha: dd5414fad8e6907dbdd5bc441a50ae8d6e26151a03b1de04d89a5576de61d01f
  - kind: registry
    name: serde_with_macros
    version: 3.18.0
    sha: d3db8978e608f1fe7357e211969fd9abdcae80bac1ba7a3369bb7eb6b404eb65
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
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
    name: signal-hook
    version: 0.3.18
    sha: d881a16cf4426aa584979d30bd82cb33429027e42122b169753d6ef1085ed6e2
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: simd-adler32
    version: 0.3.8
    sha: e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: simplecss
    version: 0.2.2
    sha: 7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c
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
    version: 0.3.6
    sha: 4aaa7368fcf4852a4c2dd92df0cace6a71f2091ca0a23391ce7f3a31833f1523
  - kind: registry
    name: socket2
    version: 0.6.3
    sha: 3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e
  - kind: git
    commit: a3f77e251e7422803f693df6e3fc313c010c4dcb
    repo: github:pop-os/softbuffer
    query:
      tag: cosmic-4.0
    name: softbuffer
    version: 0.4.1
  - kind: registry
    name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
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
    name: synchrony
    version: 0.1.6
    sha: e6d5f5d3091c2d998f6ab4c8b495c0d232ad0aecbc1fa9ac52c247a79d497e16
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: sys-locale
    version: 0.3.2
    sha: 8eab9a99a024a169fe8a903cf9d4a3b3601109bcc13bd9e3c6fff259138626c4
  - kind: registry
    name: taffy
    version: 0.9.2
    sha: 41ba83ebaf2954d31d05d67340fd46cebe99da2b7133b0dd68d70c65473a437b
  - kind: registry
    name: tar
    version: 0.4.44
    sha: 1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a
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
    name: thin-cell
    version: 0.1.2
    sha: 4164c6c316ba9733b0ab021e7f9852c788a4b991b49c25820f1be48e1d41345b
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
    name: tiff
    version: 0.11.3
    sha: b63feaf3343d35b6ca4d50483f94843803b0f51634937cc2ec519fc32232bc52
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
    version: 1.11.0
    sha: 3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.50.0
    sha: 27ad5e34374e03cfffefc301becb44e9dc3c17584f414349ebe29ed26661822d
  - kind: registry
    name: tokio-macros
    version: 2.6.1
    sha: 5c55a2eff8b69ce66c84f85e1da1c233edc36ceb85a2058d11b0d6a3c7e7569c
  - kind: registry
    name: tokio-stream
    version: 0.1.18
    sha: 32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml_datetime
    version: 1.0.1+spec-1.1.0
    sha: 9b320e741db58cac564e26c607d3cc1fdc4a88fd36c879568c07856ed83ff3e9
  - kind: registry
    name: toml_edit
    version: 0.25.5+spec-1.1.0
    sha: 8ca1a40644a28bce036923f6a431df0b34236949d111cc07cb6dca830c9ef2e1
  - kind: registry
    name: toml_parser
    version: 1.0.10+spec-1.1.0
    sha: 7df25b4befd31c4816df190124375d5a20c6b6921e2cad937316de3fccd63420
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
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.23
    sha: cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319
  - kind: git
    commit: a225f753a88e722aeeb27bb2fb00144739911035
    repo: https://github.com/jackpot51/trash-rs.git
    query:
      branch: cosmic
    name: trash
    version: 5.2.2
  - kind: registry
    name: ttf-parser
    version: 0.25.1
    sha: d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31
  - kind: registry
    name: type-map
    version: 0.5.1
    sha: cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90
  - kind: registry
    name: typed-path
    version: 0.12.3
    sha: 8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: typenum
    version: 1.19.0
    sha: 562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb
  - kind: registry
    name: uds_windows
    version: 1.2.1
    sha: f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e
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
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - kind: registry
    name: url
    version: 2.5.8
    sha: ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - kind: registry
    name: usvg
    version: 0.45.1
    sha: 80be9b06fbae3b8b303400ab20778c80bbaf338f563afe567cf3c9eea17b47ef
  - kind: registry
    name: utf16_iter
    version: 1.0.5
    sha: c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.22.0
    sha: a68d3c8f01c0cfa54a75291d83601161799e4a89a39e0929f4b0354d88757a37
  - kind: registry
    name: uzers
    version: 0.12.2
    sha: 0b8275fb1afee25b4111d2dc8b5c505dbbc4afd0b990cb96deb2d88bff8be18d
  - kind: registry
    name: v_frame
    version: 0.3.9
    sha: 666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: vte
    version: 0.15.0
    sha: a5924018406ce0063cd67f8e008104968b74b563ee1b85dde3ed1f7cb87d3dbd
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
    version: 0.2.114
    sha: 6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.64
    sha: e9c5522b3a28661442748e09d40924dfb9ca614b21c00d3fd135720e48b67db8
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.114
    sha: 18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.114
    sha: 03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.114
    sha: 75a326b8c223ee17883a4251907455a2431acc2791c98c26279376490c378c16
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
    version: 0.3.14
    sha: aa75f400b7f719bcd68b3f47cd939ba654cedeef690f486db71331eec4c6a406
  - kind: registry
    name: wayland-client
    version: 0.31.13
    sha: ab51d9f7c071abeee76007e2b742499e535148035bb835f97aaed1338cf516c3
  - kind: registry
    name: wayland-csd-frame
    version: 0.3.0
    sha: 625c5029dbd43d25e6aa9615e88b829a5cad13b2819c4ae129fdbb7c31ab4c7e
  - kind: registry
    name: wayland-cursor
    version: 0.31.13
    sha: 4b3298683470fbdc6ca40151dfc48c8f2fd4c41a26e13042f801f85002384091
  - kind: registry
    name: wayland-protocols
    version: 0.32.11
    sha: b23b5df31ceff1328f06ac607591d5ba360cf58f90c8fad4ac8d3a55a3c4aec7
  - kind: registry
    name: wayland-protocols-experimental
    version: 20250721.0.1
    sha: 40a1f863128dcaaec790d7b4b396cc9b9a7a079e878e18c47e6c2d2c5a8dcbb1
  - kind: registry
    name: wayland-protocols-misc
    version: 0.3.11
    sha: 429b99200febaf95d4f4e46deff6fe4382bcff3280ee16a41cf887b3c3364984
  - kind: registry
    name: wayland-protocols-plasma
    version: 0.3.11
    sha: d392fc283a87774afc9beefcd6f931582bb97fe0e6ced0b306a62cb1d026527c
  - kind: registry
    name: wayland-protocols-wlr
    version: 0.3.11
    sha: 78248e4cc0eff8163370ba5c158630dcae1f3497a586b826eca2ef5f348d6235
  - kind: registry
    name: wayland-scanner
    version: 0.31.9
    sha: c86287151a309799b821ca709b7345a048a2956af05957c89cb824ab919fa4e3
  - kind: registry
    name: wayland-server
    version: 0.31.12
    sha: 63736a4a73e781cf6a736aa32c5d6773c3eb5389197562742a8c611b49b5e359
  - kind: registry
    name: wayland-sys
    version: 0.31.10
    sha: 374f6b70e8e0d6bf9461a32988fd553b59ff630964924dad6e4a4eb6bd538d17
  - kind: registry
    name: web-sys
    version: 0.3.91
    sha: 854ba17bb104abfb26ba36da9729addc7ce7f06f5c0f90f3c391f8461cca21f9
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
    name: wgpu-core-deps-apple
    version: 27.0.0
    sha: 0772ae958e9be0c729561d5e3fd9a19679bcdfb945b8b1a1969d9bfe8056d233
  - kind: registry
    name: wgpu-core-deps-emscripten
    version: 27.0.0
    sha: b06ac3444a95b0813ecfd81ddb2774b66220b264b3e2031152a4a29fda4da6b5
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
    name: widestring
    version: 1.2.1
    sha: 72069c3113ab32ab29e5584db3c6ec55d416895e60715417b5b883a357c3e471
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
    version: 0.56.0
    sha: 1de69df01bdf1ead2f4ac895dc77c9351aefff65b2f3db429a343f9cbf05e132
  - kind: registry
    name: windows
    version: 0.58.0
    sha: dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6
  - kind: registry
    name: windows
    version: 0.61.3
    sha: 9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893
  - kind: registry
    name: windows-collections
    version: 0.2.0
    sha: 3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8
  - kind: registry
    name: windows-core
    version: 0.56.0
    sha: 4698e52ed2d08f8658ab0c39512a7c00ee5fe2688c65f8c0a4f06750d729f2a6
  - kind: registry
    name: windows-core
    version: 0.58.0
    sha: 6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99
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
    name: windows-implement
    version: 0.56.0
    sha: f6fc35f58ecd95a9b71c4f2329b911016e6bec66b3f2e6a4aad86bd2e99e2f9b
  - kind: registry
    name: windows-implement
    version: 0.58.0
    sha: 2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b
  - kind: registry
    name: windows-implement
    version: 0.60.2
    sha: 053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf
  - kind: registry
    name: windows-interface
    version: 0.56.0
    sha: 08990546bf4edef8f431fa6326e032865f27138718c587dc21bc0265bbcb57cc
  - kind: registry
    name: windows-interface
    version: 0.58.0
    sha: 053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515
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
    name: windows-result
    version: 0.1.2
    sha: 5e383302e8ec8515204254685643de10811af0ed97ea37210dc26fb0032647f8
  - kind: registry
    name: windows-result
    version: 0.2.0
    sha: 1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e
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
    version: 0.1.0
    sha: 4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10
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
    name: windows-threading
    version: 0.1.0
    sha: b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6
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
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-android
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-appkit
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-common
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-core
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-orbital
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-uikit
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-wayland
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-web
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-win32
    version: 0.31.0-beta.2
  - kind: git
    commit: a610ac9c7a72b39ff102ed4d946291618dc725b6
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-x11
    version: 0.31.0-beta.2
  - kind: registry
    name: winnow
    version: 0.7.15
    sha: df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945
  - kind: registry
    name: winnow
    version: 1.0.0
    sha: a90e88e4667264a994d34e6d1ab2d26d398dcdca8b7f52bec8668957517fc7d8
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
    name: write16
    version: 1.0.0
    sha: d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936
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
    name: xattr
    version: 1.6.1
    sha: 32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156
  - kind: registry
    name: xcursor
    version: 0.3.10
    sha: bec9e4a500ca8864c5b47b8b482a73d62e4237670e5b5f1d6b9e3cae50f28f2b
  - kind: registry
    name: xdg
    version: 3.0.0
    sha: 2fb433233f2df9344722454bc7e96465c9d03bff9d77c248f9e7523fe79585b5
  - kind: git
    commit: f8efb3fb1fad582539e2af7d1e9fbc9613dcc7d9
    repo: https://github.com/ebassi/xdg-mime-rs
    name: xdg-mime
    version: 0.4.0
  - kind: registry
    name: xdgen
    version: 0.1.0
    sha: 25af88f104f06d5aeb80c77e5eb85e6f6f355f86f6e34307a14befd716efe4bf
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
    version: 1.2.1
    sha: b8aa498d22c9bbaf482329839bc5620c46be275a19a812e9a22a2b07529a642a
  - kind: registry
    name: xml-rs
    version: 0.8.28
    sha: 3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f
  - kind: registry
    name: xmltree
    version: 0.12.0
    sha: cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70
  - kind: registry
    name: xmlwriter
    version: 0.1.0
    sha: ec7a2a501ed189703dba8b08142f057e887dfc4b2cc4db2d343ac6376ba3e0b9
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
    name: zbus-lockstep
    version: 0.5.2
    sha: 6998de05217a084b7578728a9443d04ea4cd80f2a0839b8d78770b76ccd45863
  - kind: registry
    name: zbus-lockstep-macros
    version: 0.5.2
    sha: 10da05367f3a7b7553c8cdf8fa91aee6b64afebe32b51c95177957efc47ca3a0
  - kind: registry
    name: zbus_macros
    version: 5.14.0
    sha: 897e79616e84aac4b2c46e9132a4f63b93105d54fe8c0e8f6bffc21fa8d49222
  - kind: registry
    name: zbus_names
    version: 4.3.1
    sha: ffd8af6d5b78619bab301ff3c560a5bd22426150253db278f164d6cf3b72c50f
  - kind: registry
    name: zbus_xml
    version: 5.1.0
    sha: 441a0064125265655bccc3a6af6bef56814d9277ac83fce48b1cd7e160b80eac
  - kind: registry
    name: zeno
    version: 0.3.3
    sha: 6df3dc4292935e51816d896edcd52aa30bc297907c26167fec31e2b0c6a32524
  - kind: registry
    name: zerocopy
    version: 0.8.42
    sha: f2578b716f8a7a858b7f02d5bd870c14bf4ddbbcf3a4c05414ba6503640505e3
  - kind: registry
    name: zerocopy-derive
    version: 0.8.42
    sha: 7e6cc098ea4d3bd6246687de65af3f920c430e236bee1e3bf2e441463f08a02f
  - kind: registry
    name: zerofrom
    version: 0.1.6
    sha: 50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5
  - kind: registry
    name: zerofrom-derive
    version: 0.1.6
    sha: d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502
  - kind: registry
    name: zeroize
    version: 1.8.2
    sha: b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0
  - kind: registry
    name: zeroize_derive
    version: 1.4.3
    sha: 85a5b4158499876c763cb03bc4e49185d3cccbabb15b33c627f7884f43db852e
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
    name: zip
    version: 7.2.0
    sha: c42e33efc22a0650c311c2ef19115ce232583abbe80850bc8b66509ebef02de0
  - kind: registry
    name: zlib-rs
    version: 0.6.3
    sha: 3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513
  - kind: registry
    name: zmij
    version: 1.0.21
    sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
  - kind: registry
    name: zopfli
    version: 0.8.3
    sha: f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249
  - kind: registry
    name: zstd
    version: 0.13.3
    sha: e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a
  - kind: registry
    name: zstd-safe
    version: 7.2.4
    sha: 8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d
  - kind: registry
    name: zstd-sys
    version: 2.0.16+zstd.1.5.7
    sha: 91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748
  - kind: registry
    name: zune-core
    version: 0.4.12
    sha: 3f423a2c17029964870cfaabb1f13dfab7d092a62a29a89264f4d36990ca414a
  - kind: registry
    name: zune-core
    version: 0.5.1
    sha: cb8a0807f7c01457d0379ba880ba6322660448ddebc890ce29bb64da71fb40f9
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
    version: 0.5.13
    sha: ec5f41c76397b7da451efd19915684f727d7e1d516384ca6bd0ec43ec94de23c
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
