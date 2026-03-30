kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- cosmic/just.bst
- cosmic/greetd.bst
- freedesktop-sdk.bst:components/linux-pam.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/libinput.bst

depends:
- cosmic/greetd.bst
- freedesktop-sdk.bst:components/linux-pam.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/libinput.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-greeter.git
  track: master
  ref: epoch-1.0.8-6-g63cd93bddd01bf714e98553966d4da12eac0ee5b
- kind: cargo2
  url: "crates:"
  ref:
  - kind: registry
    name: ab_glyph
    version: 0.2.31
    sha: e074464580a518d16a7126262fffaaa47af89d4099d4cb403f8ed938ba12ee7d
  - kind: registry
    name: ab_glyph_rasterizer
    version: 0.1.10
    sha: 366ffbaa4442f4684d91e2cd7c5ea7c4ed8add41959a31447066e279e432b618
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit
    version: 0.16.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_atspi_common
    version: 0.9.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_consumer
    version: 0.24.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_macos
    version: 0.17.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_unix
    version: 0.12.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_windows
    version: 0.22.0
  - kind: git
    commit: 956955342dadab7e588e21be726817fca39510f3
    repo: https://github.com/wash2/accesskit
    query:
      tag: iced-xdg-surface-0.13
    name: accesskit_winit
    version: 0.22.0
  - kind: registry
    name: addr2line
    version: 0.24.2
    sha: dfbe277e56a376000877090da837660b4427aad530e3028d44e0bffe4f89a1c1
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
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - kind: registry
    name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
  - kind: registry
    name: aligned-vec
    version: 0.6.4
    sha: dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b
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
    version: 1.0.99
    sha: b0674a1ddeecb70197781e945de4b3b8ffb61fa939a5597bcf48503737663100
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
    version: 1.7.1
    sha: 69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457
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
    name: ash
    version: 0.38.0+1.3.281
    sha: 0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f
  - kind: registry
    name: ashpd
    version: 0.11.0
    sha: 6cbdf310d77fd3aaee6ea2093db7011dc2d35d2eb3481e5607f1f8d942ed99df
  - kind: registry
    name: ashpd
    version: 0.12.0
    sha: da0986d5b4f0802160191ad75f8d33ada000558757db3defb70299ca95d9fcbd
  - kind: registry
    name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
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
    version: 1.13.3
    sha: 497c00e0fd83a72a79a39fcbd8e3e2f055d6f6c7e025f3b3d91f4f8e76527fb8
  - kind: registry
    name: async-fn-stream
    version: 0.2.2
    sha: e71711442f1016c768c259bec59300a10efe753bc3e686ec19e2c6a54a97c29b
  - kind: registry
    name: async-fn-stream
    version: 0.3.0
    sha: ed32de479678e0c4fea3e910c3b082ce52179d6fd6dcc07bc202faf7829812e2
  - kind: registry
    name: async-io
    version: 1.13.0
    sha: 0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af
  - kind: registry
    name: async-io
    version: 2.6.0
    sha: 456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc
  - kind: registry
    name: async-lock
    version: 2.8.0
    sha: 287272293e9d8c41773cec55e365490fe034813a2f172f502d6ddcf75b2f582b
  - kind: registry
    name: async-lock
    version: 3.4.1
    sha: 5fd03604047cee9b6ce9de9f70c6cd540a0520c813cbd49bae61f33ab80ed1dc
  - kind: registry
    name: async-process
    version: 1.8.1
    sha: ea6438ba0a08d81529c69b36700fa2f95837bfe3e776ab39cde9c14d9149da88
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
    version: 0.19.0
    sha: 6059f350ab6f593ea00727b334265c4dfc7fd442ee32d264794bd9bdc68e87ca
  - kind: registry
    name: atspi-common
    version: 0.3.0
    sha: 92af95f966d2431f962bc632c2e68eda7777330158bf640c4af4249349b2cdf5
  - kind: registry
    name: atspi-connection
    version: 0.3.0
    sha: a0c65e7d70f86d4c0e3b2d585d9bf3f979f0b19d635a336725a88d279f76b939
  - kind: registry
    name: atspi-proxies
    version: 0.3.0
    sha: 6495661273703e7a229356dcbe8c8f38223d697aacfaf0e13590a9ac9977bb52
  - kind: registry
    name: auto_enums
    version: 0.8.7
    sha: 9c170965892137a3a9aeb000b4524aa3cc022a310e709d848b6e1cdce4ab4781
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - kind: registry
    name: av1-grain
    version: 0.2.4
    sha: 4f3efb2ca85bc610acfa917b5aaa36f3fcbebed5b3182d7f877b02531c4b80c8
  - kind: registry
    name: avif-serialize
    version: 0.8.6
    sha: 47c8fbc0f831f4519fe8b810b6a7a91410ec83031b8233f730a0480029f6a23f
  - kind: registry
    name: backtrace
    version: 0.3.75
    sha: 6806a6321ec58106fea15becdad98371e28d92ccbc7c8f1b3b6dd724fe8f1002
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: basic-toml
    version: 0.1.10
    sha: ba62675e8242a4c4e806d12f11d136e626e6c8361d6b829310732241652a178a
  - kind: registry
    name: bindgen
    version: 0.69.5
    sha: 271383c67ccabffb7381723dea0672a673f292304fcb45c01cc648c7a8d58088
  - kind: registry
    name: bit-set
    version: 0.6.0
    sha: f0481a0e032742109b1133a095184ee93d88f3dc9e0d28a5d033dc77a073f44f
  - kind: registry
    name: bit-vec
    version: 0.7.0
    sha: d2c54ff287cfc0a34f38a6b832ea1bd8e448a330b3e40a50859e6488bee07f22
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.9.4
    sha: 2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394
  - kind: registry
    name: bitstream-io
    version: 2.6.0
    sha: 6099cdc01846bc367c4e7dd630dc5966dccf36b652fae7a74e17b640411a91b2
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
    name: block2
    version: 0.6.1
    sha: 340d2f0bdb2a43c1d3cd40513185b2bd7def0aa1052f956455114bc98f82dcf2
  - kind: registry
    name: blocking
    version: 1.6.2
    sha: e83f8d02be6967315521be875afa792a316e28d57b5a2d401897e2a7921b7f21
  - kind: registry
    name: built
    version: 0.7.7
    sha: 56ed6191a7e78c36abdb16ab65341eefd73d64d303fffccdbb00d51e4205967b
  - kind: registry
    name: bumpalo
    version: 3.19.0
    sha: 46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43
  - kind: registry
    name: by_address
    version: 1.2.1
    sha: 64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06
  - kind: registry
    name: bytemuck
    version: 1.23.2
    sha: 3995eaeebcdf32f91f980d360f78732ddc061097ab4e39991ae7a6ace9194677
  - kind: registry
    name: bytemuck_derive
    version: 1.10.1
    sha: 4f154e572231cb6ba2bd1176980827e3d5dc04cc183a75dea38109fbdd672d29
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
    version: 1.10.1
    sha: d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a
  - kind: registry
    name: calendrical_calculations
    version: 0.2.2
    sha: 53c5d386a9f2c8b97e1a036420bcf937db4e5c9df33eb0232025008ced6104c0
  - kind: registry
    name: calloop
    version: 0.13.0
    sha: b99da2f8558ca23c71f4fd15dc57c906239752dd27ff3c00a1d56b685b7cbfec
  - kind: registry
    name: calloop
    version: 0.14.3
    sha: cb9f6e1368bd4621d2c86baa7e37de77a938adf5221e5dd3d6133340101b309e
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
    version: 1.2.37
    sha: 65193589c6404eb80b450d618eaf9a2cafaaafd57ecce47370519ef674a7bd44
  - kind: registry
    name: cesu8
    version: 1.1.0
    sha: 6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c
  - kind: registry
    name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - kind: registry
    name: cfg-expr
    version: 0.15.8
    sha: d067ad48b8650848b989a59a86c6c36a995d02d2bf778d45c3c5d57bc2718f02
  - kind: registry
    name: cfg-if
    version: 1.0.3
    sha: 2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9
  - kind: registry
    name: cfg_aliases
    version: 0.1.1
    sha: fd16c4719339c4530435d38e511904438d07cce7950afa3718a84ac36c10e89e
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chrono
    version: 0.4.42
    sha: 145052bdd345b87320e369255277e3fb5152762ad123a901ef5c262dd38fe8d2
  - kind: registry
    name: chrono-tz
    version: 0.10.4
    sha: a6139a8597ed92cf816dfb33f5dd6cf0bb93a6adc938f11039f371bc5bcd26c3
  - kind: registry
    name: clang-sys
    version: 1.8.1
    sha: 0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4
  - kind: registry
    name: clap_lex
    version: 0.7.5
    sha: b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675
  - kind: registry
    name: clipboard-win
    version: 5.4.1
    sha: bde03770d3df201d4fb868f2c9c59e66a3e4e2bd06692a0fe701e7103c7e84d4
  - kind: git
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
    name: clipboard_macos
    version: 0.1.0
  - kind: git
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
    name: clipboard_wayland
    version: 0.2.2
  - kind: git
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
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
    version: 0.11.1
    sha: 3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e
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
    name: com
    version: 0.6.0
    sha: 7e17887fd17353b65b1b2ef1c526c83e26cd72e74f598a8dc1bee13a48f3d9f6
  - kind: registry
    name: com_macros
    version: 0.6.0
    sha: d375883580a668c7481ea6631fc1a8863e33cc335bf56bfad8d7e6d4b04b13a5
  - kind: registry
    name: com_macros_support
    version: 0.6.0
    sha: ad899a1087a9296d5644792d7cb72b8e34c1bec8e7d4fbc002230169a6e8710c
  - kind: registry
    name: combine
    version: 4.6.7
    sha: ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
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
    commit: 8196fc642509fe644e45529e2df0fd08796aaf71
    repo: github:pop-os/cosmic-applets
    name: cosmic-applets-config
    version: 0.1.0
  - kind: git
    commit: 6841c5aeea24422b9ab2b1ea8925c8a9153de149
    repo: github:pop-os/cosmic-bg
    name: cosmic-bg-config
    version: 0.1.0
  - kind: git
    commit: af1997b1827ad64aab46fa31c0b77fb20d7a537a
    repo: github:pop-os/cosmic-protocols//
    name: cosmic-client-toolkit
    version: 0.1.0
  - kind: git
    commit: 64a9c1badfd6f9b3af3af6db2b07b3d76d6f5102
    repo: github:pop-os/cosmic-comp
    name: cosmic-comp-config
    version: 0.1.0
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: cosmic-config
    version: 0.1.0
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: cosmic-config-derive
    version: 0.1.0
  - kind: git
    commit: 3b86984332be2c930a3536ab714b843c851fa8ca
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-dbus-a11y
    version: 0.1.0
  - kind: git
    commit: 3b86984332be2c930a3536ab714b843c851fa8ca
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-dbus-networkmanager
    version: 0.1.0
  - kind: git
    commit: 8a05c322c482ff3c69cf34bacfee98907ac45307
    repo: github:pop-os/freedesktop-icons
    name: cosmic-freedesktop-icons
    version: 0.3.0
  - kind: git
    commit: af1997b1827ad64aab46fa31c0b77fb20d7a537a
    repo: github:pop-os/cosmic-protocols//
    name: cosmic-protocols
    version: 0.1.0
  - kind: git
    commit: bce9cdf2d447508d4e2d54a2be4fcd738ab51df5
    repo: github:pop-os/cosmic-randr
    name: cosmic-randr-shell
    version: 0.1.0
  - kind: git
    commit: ee782f454a09310a28abe73653e6c82d06a79855
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-config
    version: 0.1.0
  - kind: git
    commit: 3b86984332be2c930a3536ab714b843c851fa8ca
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-settings-daemon
    version: 0.1.0
  - kind: git
    commit: ee782f454a09310a28abe73653e6c82d06a79855
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-daemon-config
    version: 0.1.0
  - kind: git
    commit: f858ca0b6416a2b75d5f7fa513bc6fc43647d3f8
    repo: github:pop-os/cosmic-settings-subscriptions
    name: cosmic-settings-subscriptions
    version: 0.1.0
  - kind: git
    commit: 355b7febb17ecb0522346fcc5aff6ea78e33e78a
    repo: github:pop-os/cosmic-text.git
    name: cosmic-text
    version: 0.14.2
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: cosmic-theme
    version: 0.1.0
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
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
    name: crossbeam-utils
    version: 0.8.21
    sha: d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28
  - kind: registry
    name: crunchy
    version: 0.2.4
    sha: 460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5
  - kind: registry
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: css-color
    version: 0.2.8
    sha: 42aaeae719fd78ce501d77c6cdf01f7e96f26bcd5617a4903a1c2b97e388543a
  - kind: registry
    name: csscolorparser
    version: 0.7.2
    sha: 5fda6aace1fbef3aa217b27f4c8d7d071ef2a70a5ca51050b1f17d40299d3f16
  - kind: registry
    name: ctor-lite
    version: 0.1.0
    sha: 1f791803201ab277ace03903de1594460708d2d54df6053f2d9e82f592b19e3b
  - kind: registry
    name: cursor-icon
    version: 1.2.0
    sha: f27ae1dd37df86211c42e150270f82743308803d90a6f6e6651cd730d5e1732f
  - kind: registry
    name: d3d12
    version: 22.0.0
    sha: bdbd1f579714e3c809ebd822c81ef148b1ceaeb3d535352afc73fd0c4c6a0017
  - kind: registry
    name: darling
    version: 0.20.11
    sha: fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee
  - kind: registry
    name: darling_core
    version: 0.20.11
    sha: 0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e
  - kind: registry
    name: darling_macro
    version: 0.20.11
    sha: fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead
  - kind: registry
    name: data-url
    version: 0.3.2
    sha: be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376
  - kind: registry
    name: deranged
    version: 0.5.3
    sha: d630bccd429a5bb5a64b5e94f693bfc48c9f8566418fda4c494cc94f911f87cc
  - kind: registry
    name: derivative
    version: 2.2.0
    sha: fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b
  - kind: registry
    name: derive_builder
    version: 0.20.2
    sha: 507dfb09ea8b7fa618fcf76e953f4f5e192547945816d5358edffe39f6f94947
  - kind: registry
    name: derive_builder_core
    version: 0.20.2
    sha: 2d5bcf7b024d6835cfb3d473887cd966994907effbe9227e8c8219824d06c4e8
  - kind: registry
    name: derive_builder_macro
    version: 0.20.2
    sha: ab63b0e2bf4d5928aff72e83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c
  - kind: registry
    name: derive_setters
    version: 0.1.8
    sha: ae5c625eda104c228c06ecaf988d1c60e542176bd7a490e60eeda3493244c0c9
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
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch
    version: 0.2.0
    sha: bd0c93bb4b0c6d9b77f4435b0ae98c24d17f1c45b2ff844c6151a07256ca923b
  - kind: registry
    name: dispatch2
    version: 0.3.0
    sha: 89a09f22a6c6069a18470eb92d2298acf25463f14256d24778e1230d789a2aec
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: dlib
    version: 0.5.2
    sha: 330c60081dcc4c72131f8eb70510f1ac07223e5d4163db481a04a0befcffa412
  - kind: git
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
    name: dnd
    version: 0.1.0
  - kind: registry
    name: document-features
    version: 0.2.11
    sha: 95249b50c6c185bee49034bcb378a49dc2b5dff0be90ff6616d31d64febab05d
  - kind: registry
    name: downcast-rs
    version: 1.2.1
    sha: 75b325c5dbd37f80359721ad39aca5a29fb04c89279657cffdda8736d0c0b9d2
  - kind: git
    commit: dbe91fcc363c101f1d6ed5301d49911b01a26f61
    repo: github:pop-os/winit.git
    query:
      tag: iced-xdg-surface-0.13
    name: dpi
    version: 0.1.1
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
    version: 1.1.0
    sha: a3d8a32ae18130a3c84dd492d4215c3d913c3b07c6b63c2eb3eb7ff1101ab7bf
  - kind: registry
    name: enum-repr
    version: 0.2.6
    sha: bad30c9c0fa1aaf1ae5010dab11f1117b15d35faf62cda4bbbc53b9987950f18
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
    version: 0.22.11
    sha: ad9cdb4b747e485a12abb0e6566612956c7a1bafa3bdb8d682c5b6d403589e48
  - kind: registry
    name: event-listener
    version: 2.5.3
    sha: 0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0
  - kind: registry
    name: event-listener
    version: 3.1.0
    sha: d93877bcde0eb80ca09131a08d23f0a5c18a620b01db137dba666d18cd9b30c2
  - kind: registry
    name: event-listener
    version: 5.4.1
    sha: e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: eyre
    version: 0.6.12
    sha: 7cd915d99f24784cdc19fd37ef22b97e3ff0ae756c7e492e9fbfe897d61e2aec
  - kind: registry
    name: fast-srgb8
    version: 1.0.0
    sha: dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1
  - kind: registry
    name: fastrand
    version: 1.9.0
    sha: e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be
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
    version: 0.1.1
    sha: 7fd99930f64d146689264c637b5af2f0233a933bef0d8570e2526bf9e083192d
  - kind: registry
    name: fixed_decimal
    version: 0.7.0
    sha: 35943d22b2f19c0cb198ecf915910a8158e94541c89dcc63300d7799d46c2c5e
  - kind: registry
    name: flate2
    version: 1.1.2
    sha: 4a3d7db9596fecd151c5f638c0ee5d5bd487b6e0ea232e5dc96d5250f6f94b1d
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
    version: 0.13.0
    sha: 2c4ad0989667548f06ccd0e306ed56b61bd4d35458d54df5ec7587c0e8ed5e94
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
    name: font-types
    version: 0.9.0
    sha: 02a596f5713680923a2080d86de50fe472fb290693cf0f701187a1c8b36996b7
  - kind: registry
    name: fontconfig-parser
    version: 0.5.8
    sha: bbc773e24e02d4ddd8395fd30dc147524273a83e54e0f312d986ea30de5f5646
  - kind: registry
    name: fontdb
    version: 0.18.0
    sha: e32eac81c1135c1df01d4e6d4233c47ba11f6a6d07f33e0bba09d18797077770
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
    name: freedesktop-desktop-entry
    version: 0.7.14
    sha: de88bb3b555a4b38372082c5ede431e1e0e14f32be1d02998c6366eb4d2682ed
  - kind: registry
    name: fsevent-sys
    version: 4.1.0
    sha: 76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2
  - kind: registry
    name: futures
    version: 0.3.31
    sha: 65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876
  - kind: registry
    name: futures-channel
    version: 0.3.31
    sha: 2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10
  - kind: registry
    name: futures-core
    version: 0.3.31
    sha: 05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e
  - kind: registry
    name: futures-executor
    version: 0.3.31
    sha: 1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f
  - kind: registry
    name: futures-io
    version: 0.3.31
    sha: 9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6
  - kind: registry
    name: futures-lite
    version: 1.13.0
    sha: 49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce
  - kind: registry
    name: futures-lite
    version: 2.6.1
    sha: f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad
  - kind: registry
    name: futures-macro
    version: 0.3.31
    sha: 162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650
  - kind: registry
    name: futures-sink
    version: 0.3.31
    sha: e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7
  - kind: registry
    name: futures-task
    version: 0.3.31
    sha: f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988
  - kind: registry
    name: futures-util
    version: 0.3.31
    sha: 9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: gethostname
    version: 1.0.2
    sha: fc257fdb4038301ce4b9cd1b3b51704509692bb3ff716a410cbd07925d9dae55
  - kind: registry
    name: getrandom
    version: 0.2.16
    sha: 335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592
  - kind: registry
    name: getrandom
    version: 0.3.3
    sha: 26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4
  - kind: registry
    name: gettext-rs
    version: 0.7.2
    sha: a44e92f7dc08430aca7ed55de161253a22276dfd69c5526e5c5e95d1f7cf338a
  - kind: registry
    name: gettext-sys
    version: 0.22.5
    sha: bb45773f5b8945f12aecd04558f545964f943dacda1b1155b3d738f5469ef661
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gimli
    version: 0.31.1
    sha: 07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f
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
    name: glow
    version: 0.13.1
    sha: bd348e04c43b32574f2de31c8bb397d96c9fcfa1371bd4ca6d8bdc464ab121b1
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
    version: 0.26.0
    sha: fdd4240fc91d3433d5e5b0fc5b67672d771850dc19bbee03c1381e19322803d7
  - kind: registry
    name: gpu-descriptor
    version: 0.3.2
    sha: b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca
  - kind: registry
    name: gpu-descriptor-types
    version: 0.2.0
    sha: fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91
  - kind: registry
    name: greetd_ipc
    version: 0.10.3
    sha: 700d2e5bfc91a042d1d531b46de245085c6a179debedf149aa97c7ca71492078
  - kind: registry
    name: grid
    version: 0.11.0
    sha: 1df00eed8d1f0db937f6be10e46e8072b0671accb504cf0f959c5c52c679f5b9
  - kind: registry
    name: guillotiere
    version: 0.6.2
    sha: b62d5865c036cb1393e23c50693df631d3f5d7bcca4c04fe4cc0fd592e74a782
  - kind: registry
    name: half
    version: 2.6.0
    sha: 459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9
  - kind: registry
    name: harfrust
    version: 0.2.1
    sha: 75a4c970f1a00edc1626f1e3cc039492b15b73df28b9fff70f95404a571b4fae
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.15.5
    sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
  - kind: registry
    name: hassle-rs
    version: 0.11.0
    sha: af2a7e73e1f34c48da31fb668a907f250794837e08faa144fd24f0b8b741e890
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
    version: 0.1.64
    sha: 33e57f83510bb73707521ebaffa789ec8caf86f9657cad665b092b581d40e9fb
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_accessibility
    version: 0.1.0
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_core
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_futures
    version: 0.14.0-dev
  - kind: git
    commit: 6ef9d12a20cfd0f7bdf38136a26ded9f7459ec8b
    repo: github:pop-os/glyphon.git
    query:
      tag: iced-0.14-dev
    name: iced_glyphon
    version: 0.6.0
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_graphics
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_renderer
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_runtime
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_tiny_skia
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_wgpu
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_widget
    version: 0.14.0-dev
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: iced_winit
    version: 0.14.0-dev
  - kind: registry
    name: icu
    version: 2.0.0
    sha: ab13fe39da5da564b88228e9f08815c9d0efbe9ec244e72b149d9994e10f1054
  - kind: registry
    name: icu_calendar
    version: 2.0.5
    sha: 1f6c40ba6481ed7ddd358437af0f000eb9f661345845977d9d1b38e606374e1f
  - kind: registry
    name: icu_calendar_data
    version: 2.0.0
    sha: 7219c8639ab936713a87b571eed2bc2615aa9137e8af6eb221446ee5644acc18
  - kind: registry
    name: icu_casemap
    version: 2.0.0
    sha: 6dc5e74b3c9d7b63e0d7c5fd54ee8c135705df2ea2aa558082dd555dc9747a97
  - kind: registry
    name: icu_casemap_data
    version: 2.0.0
    sha: f7584067558ab4c60c95d1ac2abd1588689cb4bcd4e099507f62dae86ae8d2c0
  - kind: registry
    name: icu_collator
    version: 2.0.0
    sha: 42ad4c6a556938dfd31f75a8c54141079e8821dc697ffb799cfe0f0fa11f2edc
  - kind: registry
    name: icu_collator_data
    version: 2.0.0
    sha: d880b8e680799eabd90c054e1b95526cd48db16c95269f3c89fb3117e1ac92c5
  - kind: registry
    name: icu_collections
    version: 2.0.0
    sha: 200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47
  - kind: registry
    name: icu_datetime
    version: 2.0.0
    sha: 0790c15e3d6ae3303365fa2337b4f6469de257916141110d14dcaf73f1d31ac5
  - kind: registry
    name: icu_datetime_data
    version: 2.0.1
    sha: 83791ac10bb7b774f130bb81fa89c4059de710dcef53caa0b86e645212d6d54c
  - kind: registry
    name: icu_decimal
    version: 2.0.0
    sha: fec61c43fdc4e368a9f450272833123a8ef0d7083a44597660ce94d791b8a2e2
  - kind: registry
    name: icu_decimal_data
    version: 2.0.0
    sha: b70963bc35f9bdf1bc66a5c1f458f4991c1dc71760e00fa06016b2c76b2738d5
  - kind: registry
    name: icu_experimental
    version: 0.3.0
    sha: ebe3d7e64892a434b08d5a58b53127e47a095ff780305f563c8c01798a1051b0
  - kind: registry
    name: icu_experimental_data
    version: 0.3.0
    sha: b60d32ba5610adfc2083f5a759f55d9a9082ebf72750f126cb1630844eea1acf
  - kind: registry
    name: icu_list
    version: 2.0.0
    sha: e26f94ec776bb8b28cedc7dcf91033b822c5cb4c1783cf7a3f796fc168aa0c8b
  - kind: registry
    name: icu_list_data
    version: 2.0.0
    sha: 5a456a2412458ca45e181d9d51c5090ef8cd90f5692e11d34bafab3b3be1c76b
  - kind: registry
    name: icu_locale
    version: 2.0.0
    sha: 6ae5921528335e91da1b6c695dbf1ec37df5ac13faa3f91e5640be93aa2fbefd
  - kind: registry
    name: icu_locale_core
    version: 2.0.0
    sha: 0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a
  - kind: registry
    name: icu_locale_data
    version: 2.0.0
    sha: 4fdef0c124749d06a743c69e938350816554eb63ac979166590e2b4ee4252765
  - kind: registry
    name: icu_normalizer
    version: 2.0.0
    sha: 436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979
  - kind: registry
    name: icu_normalizer_data
    version: 2.0.0
    sha: 00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3
  - kind: registry
    name: icu_pattern
    version: 0.4.0
    sha: 983825f401e6bc4a13c45d552ffd9ad6f3f6b6bc0ec03f31d6835a90a46deb1f
  - kind: registry
    name: icu_plurals
    version: 2.0.0
    sha: 0fd83a65f58b6f28e1f3da8c6ada6b415ee3ad5cb480b75bdb669f34d72dd179
  - kind: registry
    name: icu_plurals_data
    version: 2.0.0
    sha: 9ec552d761eaf4a1c39ad28936e0af77a41bf01ff756ea54be4f8bfc21c265d7
  - kind: registry
    name: icu_properties
    version: 2.0.1
    sha: 016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b
  - kind: registry
    name: icu_properties_data
    version: 2.0.1
    sha: 298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632
  - kind: registry
    name: icu_provider
    version: 2.0.0
    sha: 03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af
  - kind: registry
    name: icu_segmenter
    version: 2.0.0
    sha: e185fc13b6401c138cf40db12b863b35f5edf31b88192a545857b41aeaf7d3d3
  - kind: registry
    name: icu_segmenter_data
    version: 2.0.0
    sha: 5360a2fbe97f617c4f8b944356dedb36d423f7da7f13c070995cf89e59f01220
  - kind: registry
    name: icu_time
    version: 2.0.0
    sha: 10d01a4a2dcbc5e5180ef113920e7461d0e9caaddb3567d81c4eca262efe55c0
  - kind: registry
    name: icu_time_data
    version: 2.0.1
    sha: 8472be4410d26a03d7208cae3a76c798dd6766e8226ab977cd8b2d349a6dbf08
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
    version: 0.25.8
    sha: 529feb3e6769d234375c4cf1ee2ce713682b8e76538cb13f9fc23e1400a591e7
  - kind: registry
    name: image-webp
    version: 0.2.4
    sha: 525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3
  - kind: registry
    name: imagesize
    version: 0.12.0
    sha: 029d73f573d8e8d63e6d5020011d3255b28c3ba85d6cf870a07184ed23de9284
  - kind: registry
    name: imgref
    version: 1.12.0
    sha: e7c5cedc30da3a610cac6b4ba17597bdf7152cf974e8aab3afb3d54455e371c8
  - kind: registry
    name: immutable-chunkmap
    version: 2.1.2
    sha: 9a3e98b1520e49e252237edc238a39869da9f3241f2ec19dc788c1d24694d1e4
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
    version: 2.11.3
    sha: 92119844f513ffa41556430369ab02c295a3578af21cf945caa3e9e0c2481ac3
  - kind: registry
    name: ini_core
    version: 0.2.0
    sha: 7a467a31a9f439b5262fa99c17084537bff57f24703d5a09a2b5c9657ec73a61
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
    name: instant
    version: 0.1.13
    sha: e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222
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
    name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - kind: registry
    name: io-uring
    version: 0.7.10
    sha: 046fa2d4d00aea763528b4950358d0ead425372445dc8ff86312b3c69ff7727b
  - kind: registry
    name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itoa
    version: 1.0.15
    sha: 4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c
  - kind: registry
    name: ixdtf
    version: 0.5.0
    sha: 8289f7f711a1a51f80e2e368355d023042ca55d8d554fd5e953f01464c15842d
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
    name: jpeg-decoder
    version: 0.3.2
    sha: 00810f1d8b74be64b13dbf3db89ac67740615d6c891f0e7b6179326533011a07
  - kind: registry
    name: js-sys
    version: 0.3.80
    sha: 852f13bec5eba4ba9afbeb93fd7c13fe56147f055939ae21c43a29a0ecb2702e
  - kind: registry
    name: kamadak-exif
    version: 0.5.5
    sha: ef4fc70d0ab7e5b6bafa30216a6b48705ea964cdfc29c050f2412295eba58077
  - kind: registry
    name: kdl
    version: 6.5.0
    sha: 81a29e7b50079ff44549f68c0becb1c73d7f6de2a4ea952da77966daf3d4761e
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
    version: 1.3.1
    sha: c644f4623d1c55eb60a9dac35e0858a59f982fb87db6ce34c872372b0a5b728f
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
    name: lazycell
    version: 1.3.0
    sha: 830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55
  - kind: registry
    name: libc
    version: 0.2.175
    sha: 6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543
  - kind: git
    commit: c01254dd18c95f05742690f04964feef7d931192
    repo: github:pop-os/libcosmic
    name: libcosmic
    version: 0.1.0
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.10
    sha: 5037190e1f70cbeef565bd267599242926f724d3b8a9f510fd7e0b540cfa4404
  - kind: registry
    name: libloading
    version: 0.8.8
    sha: 07033963ba89ebaf1584d767badaa2e8fcec21aedea6b8c0346d487d49c28667
  - kind: registry
    name: libm
    version: 0.2.15
    sha: f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de
  - kind: registry
    name: libredox
    version: 0.1.10
    sha: 416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb
  - kind: registry
    name: libudev-sys
    version: 0.1.4
    sha: 3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324
  - kind: registry
    name: linux-raw-sys
    version: 0.11.0
    sha: df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039
  - kind: registry
    name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
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
    version: 0.8.0
    sha: 241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956
  - kind: registry
    name: litrs
    version: 0.4.2
    sha: f5e54036fe321fd421e10d732f155734c4e4afd610dd556d9a82833ab3ee0bed
  - kind: registry
    name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - kind: registry
    name: lock_api
    version: 0.4.13
    sha: 96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765
  - kind: registry
    name: log
    version: 0.4.28
    sha: 34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432
  - kind: registry
    name: logind-zbus
    version: 5.3.2
    sha: 469c962578b549a82f3d0cc72d0f77d1123780fa7121e2b03d78b0780f6ccac6
  - kind: registry
    name: loop9
    version: 0.1.5
    sha: 0fae87c125b03c1d2c0150c90365d7d6bcc53fb73a9acaef207d2d065860f062
  - kind: registry
    name: lru
    version: 0.12.5
    sha: 234cf4f4a04dc1f57e24b96cc0cd600cf2af460d4161ac5ecdd0af8e1f3b2a38
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
    version: 1.0.16
    sha: ce9333c02ea4517fd31207f126124352ad59975218c114c55dbb8f9d56fd4b45
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
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: memchr
    version: 2.7.5
    sha: 32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0
  - kind: registry
    name: memmap2
    version: 0.8.0
    sha: 43a5a03cefb0d953ec0be133036f14e109412fa594edc2f77227249db66cc3ed
  - kind: registry
    name: memmap2
    version: 0.9.8
    sha: 843a98750cd611cc2965a8213b53b43e715f13c37a9e096c6408e69990961db7
  - kind: registry
    name: memoffset
    version: 0.7.1
    sha: 5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: metal
    version: 0.29.0
    sha: 7ecfd3296f8c56b7c1f6fbac3c71cefa9d78ce009850c45000015f206dc7fa21
  - kind: registry
    name: miette
    version: 7.6.0
    sha: 5f98efec8807c63c752b5bd61f862c165c115b0a35685bdcfd9238c7aeb592b7
  - kind: git
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
    name: mime
    version: 0.1.0
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
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
    version: 1.0.4
    sha: 78bed444cc8a2160f01cbcf811ef18cac863ad68ae8ca62092e8db51d51c761c
  - kind: registry
    name: moxcms
    version: 0.7.5
    sha: ddd32fa8935aeadb8a8a6b6b351e40225570a37c43de67690383d87ef170cd08
  - kind: registry
    name: mutate_once
    version: 0.1.2
    sha: 13d2233c9842d08cfe13f9eac96e207ca6a2ea10b80259ebe8ad0268be27d2af
  - kind: registry
    name: naga
    version: 22.1.0
    sha: 8bd5a652b6faf21496f2cfd88fc49989c8db0825d1f6746b1a71a6ede24a63ad
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
    version: 0.5.0+25.2.9519653
    sha: 8c196769dd60fd4f363e11d948139556a344e79d451aeb2fa2fd040738ef7691
  - kind: registry
    name: ndk-sys
    version: 0.6.0+11769913
    sha: ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873
  - kind: registry
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nix
    version: 0.26.4
    sha: 598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b
  - kind: registry
    name: nix
    version: 0.30.1
    sha: 74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: noop_proc_macro
    version: 0.3.0
    sha: 0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8
  - kind: registry
    name: notify
    version: 8.2.0
    sha: 4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3
  - kind: registry
    name: notify-types
    version: 2.0.0
    sha: 5e0826a989adedc2a244799e823aece04662b66609d96af8dff7ac6df9a8925d
  - kind: registry
    name: nu-ansi-term
    version: 0.50.1
    sha: d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399
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
    version: 0.1.0
    sha: 51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9
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
    version: 0.7.4
    sha: a973b4e44ce6cad84ce69d797acf9a044532e4184c4f267913d1b546a0727b7a
  - kind: registry
    name: num_enum_derive
    version: 0.7.4
    sha: 77e878c846a8abae00dd069496dbe8751b16ac1c3d6bd2a7283a938e8228f90d
  - kind: registry
    name: num_threads
    version: 0.1.7
    sha: 5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9
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
    version: 0.6.2
    sha: 561f357ba7f3a2a61563a186a163d0a3a5247e1089524a3981d49adb775078bc
  - kind: registry
    name: objc2-app-kit
    version: 0.2.2
    sha: e4e89ad9e3d7d297152b17d39ed92cd50ca8063a89a9fa569046d41568891eff
  - kind: registry
    name: objc2-app-kit
    version: 0.3.1
    sha: e6f29f568bec459b0ddff777cec4fe3fd8666d82d5a40ebd0ff7e66134f89bcc
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
    name: objc2-core-foundation
    version: 0.3.1
    sha: 1c10c2894a6fed806ade6027bcd50662746363a9589d3ec9d9bef30a4e4bc166
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
    name: objc2-foundation
    version: 0.3.1
    sha: 900831247d2fe1a09a683278e5384cfb8c80c79fe6b166f9d14bfdde0ea1b03c
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
    version: 0.36.7
    sha: 62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87
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
    version: 0.3.48
    sha: ba0b26cec2e24f08ed8bb31519a9333140a6599b867dac464bb150bdb796fd43
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
    version: 4.2.2
    sha: 48dd4f4a2c8405440fd0462561f0e5806bd0f77e86f51c761481bdd4018b545e
  - kind: registry
    name: palette
    version: 0.7.6
    sha: 4cbf71184cc5ecc2e4e1baccdb21026c20e5fc3dcf63028a086131b3ab00b6e6
  - kind: registry
    name: palette_derive
    version: 0.7.6
    sha: f5030daf005bface118c096f510ffb781fc28f9ab6a32ab224d8631be6851d30
  - kind: registry
    name: pam-client
    version: 0.5.0
    sha: 51bd776116a7ada5ebbe31f54cdc5b1030ed7265686cf7c8a21c057a2f8dab9a
  - kind: registry
    name: pam-sys
    version: 1.0.0-alpha5
    sha: ce9484729b3e52c0bacdc5191cb6a6a5f31ef4c09c5e4ab1209d3340ad9e997b
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: parking_lot
    version: 0.11.2
    sha: 7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99
  - kind: registry
    name: parking_lot
    version: 0.12.4
    sha: 70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13
  - kind: registry
    name: parking_lot_core
    version: 0.8.6
    sha: 60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc
  - kind: registry
    name: parking_lot_core
    version: 0.9.11
    sha: bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5
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
    version: 0.12.1
    sha: 913273894cec178f401a31ec4b656318d95473527be05c0752cc41cdc32be8b7
  - kind: registry
    name: phf_generator
    version: 0.11.3
    sha: 3c80231409c20246a13fddb31776fb942c38553c51e871f8cbd687a4cfb5843d
  - kind: registry
    name: phf_macros
    version: 0.11.3
    sha: f84ac04429c13a7ff43785d75ad27569f2951ce0ffd30a3321230db2fc727216
  - kind: registry
    name: phf_shared
    version: 0.11.3
    sha: 67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5
  - kind: registry
    name: phf_shared
    version: 0.12.1
    sha: 06005508882fb681fd97892ecff4b7fd0fee13ef1aa569f8695dae7ab9099981
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
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: png
    version: 0.17.16
    sha: 82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526
  - kind: registry
    name: png
    version: 0.18.0
    sha: 97baced388464909d42d89643fe4361939af9b7ce7a31ee32a168f832a70f2a0
  - kind: registry
    name: polling
    version: 2.8.0
    sha: 4b2d323e8ca7996b3e23126511a523f7e62924d93ecd5ae73b333815b0eb3dce
  - kind: registry
    name: polling
    version: 3.11.0
    sha: 5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218
  - kind: registry
    name: pollster
    version: 0.4.0
    sha: 2f3a9f18d041e6d0e102a0a46750538147e5e8992d3b4873aaafee2520b00ce3
  - kind: registry
    name: potential_utf
    version: 0.1.3
    sha: 84df19adbe5b5a0782edcab45899906947ab039ccf4573713735ee7de1e6b08a
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
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
    version: 1.3.1
    sha: 7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919
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
    version: 1.0.101
    sha: 89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de
  - kind: registry
    name: proc-macro2-diagnostics
    version: 0.10.1
    sha: af066a9c399a26e020ada66a034357a868728e72cd426f3adcd35f80d88d88c8
  - kind: registry
    name: procfs
    version: 0.17.0
    sha: cc5b72d8145275d844d4b5f6d4e1eef00c8cd889edb6035c21675d1bb1f45c9f
  - kind: registry
    name: procfs-core
    version: 0.17.0
    sha: 239df02d8349b06fc07398a3a1697b06418223b1c7725085e801e7c0fc6a12ec
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
    version: 0.8.1
    sha: 1190fd18ae6ce9e137184f207593877e70f39b015040156b1e05081cdfe3733a
  - kind: registry
    name: pwd
    version: 1.4.0
    sha: 72c71c0c79b9701efe4e1e4b563b2016dd4ee789eb99badcb09d61ac4b92e4a2
  - kind: registry
    name: pxfm
    version: 0.1.23
    sha: f55f4fedc84ed39cb7a489322318976425e42a147e2be79d8f878e2884f94e84
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.37.5
    sha: 331e97a1af0bf59823e6eadffe373d7b27f485be8748f71471c662c1f269b7fb
  - kind: registry
    name: quote
    version: 1.0.40
    sha: 1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
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
    version: 0.9.3
    sha: 99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38
  - kind: registry
    name: range-alloc
    version: 0.1.4
    sha: c3d6831663a5098ea164f89cff59c6284e95f4e3c76ce9848d4529f5ccca9bde
  - kind: registry
    name: rangemap
    version: 1.6.0
    sha: f93e7e49bb0bf967717f7bd674458b3d6b0c5f48ec7e3038166026a69fc22223
  - kind: registry
    name: rav1e
    version: 0.7.1
    sha: cd87ce80a7665b1cce111f8a16c1f3929f6547ce91ade6addf4ec86a8dda5ce9
  - kind: registry
    name: ravif
    version: 0.11.20
    sha: 5825c26fddd16ab9f515930d49028a630efec172e903483c94796cfe31893e6b
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
    version: 0.29.3
    sha: 04ca636dac446b5664bd16c069c00a9621806895b8bb02c2dc68542b23b8f25d
  - kind: registry
    name: read-fonts
    version: 0.34.0
    sha: 8941f8e9d5f8ad3aebea330d01ac68c0167600eb31a86ecd86e97be4d13b51f5
  - kind: registry
    name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - kind: registry
    name: redox_syscall
    version: 0.5.17
    sha: 5407465600fb0548f1442edf71dd20683c6ed326200ace4b1ef0763521bb3b77
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
    version: 1.0.24
    sha: 4a0ae411dbe946a674d89546582cea4ba2bb8defac896622d6496f14c23ba5cf
  - kind: registry
    name: ref-cast-impl
    version: 1.0.24
    sha: 1165225c21bff1f3bbce98f5a1f889949bc902d3575308cc7b0de30b4f6d27c7
  - kind: registry
    name: regex
    version: 1.11.2
    sha: 23d7fd106d8c02486a8d64e778353d1cffe08ce79ac2e82f540c86d0facf6912
  - kind: registry
    name: regex-automata
    version: 0.4.10
    sha: 6b9458fa0bfeeac22b5ca447c63aaf45f28439a709ccd244698632f9aa6394d6
  - kind: registry
    name: regex-syntax
    version: 0.8.6
    sha: caf4aa5b0f434c91fe5c7f1ecb6a5ece2130b02ad2a590589dda5146df959001
  - kind: registry
    name: renderdoc-sys
    version: 1.1.0
    sha: 19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832
  - kind: registry
    name: resvg
    version: 0.42.0
    sha: 944d052815156ac8fa77eaac055220e95ba0b01fa8887108ca710c03805d9051
  - kind: registry
    name: rfd
    version: 0.15.4
    sha: ef2bee61e6cffa4635c72d7d81a84294e28f0930db0ddcb0f66d10244674ebed
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
    version: 0.9.0
    sha: 63f3aa105dea217ef30d89581b65a4d527a19afc95ef5750be3890e8d3c5b837
  - kind: registry
    name: roxmltree
    version: 0.20.0
    sha: 6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97
  - kind: registry
    name: rpassword
    version: 6.0.1
    sha: 2bf099a1888612545b683d2661a1940089f6c2e5a8e38979b2159da876bfd956
  - kind: registry
    name: rust-embed
    version: 8.7.2
    sha: 025908b8682a26ba8d12f6f2d66b987584a4a87bc024abc5bbc12553a8cd178a
  - kind: registry
    name: rust-embed-impl
    version: 8.7.2
    sha: 6065f1a4392b71819ec1ea1df1120673418bf386f50de1d6f54204d836d4349c
  - kind: registry
    name: rust-embed-utils
    version: 8.7.2
    sha: f6cc0c81648b20b70c491ff8cce00c1c3b223bb8ed2b5d41f0e54c6c4c0a3594
  - kind: registry
    name: rustc-demangle
    version: 0.1.26
    sha: 56f7d92ca342cea22a06f2121d944b4fd82af56988c270852495420f961d4ace
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
    version: 0.37.28
    sha: 519165d378b97752ca44bbe15047d5d3409e875f39327546b42ac81d7e18c1b6
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.2
    sha: cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
  - kind: registry
    name: rustybuzz
    version: 0.14.1
    sha: cfb9cf8877777222e4a3bc7eb247e398b56baba500c38c1c46842431adc8b55c
  - kind: registry
    name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
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
    version: 1.0.4
    sha: 82d20c4491bc164fa2f6c5d44565947a52ad80b9505d8e36f8d54c27c739fcd0
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
    version: 0.10.1
    sha: b6277f0217056f77f1d8f49f2950ac6c278c0d607c45f5ee99328d792ede24ec
  - kind: registry
    name: self_cell
    version: 1.2.0
    sha: 0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749
  - kind: registry
    name: serde
    version: 1.0.225
    sha: fd6c24dee235d0da097043389623fb913daddf92c76e9f5a1db88607a0bcbd1d
  - kind: registry
    name: serde-xml-rs
    version: 0.6.0
    sha: fb3aa78ecda1ebc9ec9847d5d3aba7d618823446a049ba2491940506da6e2782
  - kind: registry
    name: serde_core
    version: 1.0.225
    sha: 659356f9a0cb1e529b24c01e43ad2bdf520ec4ceaf83047b83ddcc2251f96383
  - kind: registry
    name: serde_derive
    version: 1.0.225
    sha: 0ea936adf78b1f766949a4977b91d2f5595825bd6ec079aa9543ad2685fc4516
  - kind: registry
    name: serde_json
    version: 1.0.145
    sha: 402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c
  - kind: registry
    name: serde_repr
    version: 0.1.20
    sha: 175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c
  - kind: registry
    name: serde_spanned
    version: 0.6.9
    sha: bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3
  - kind: registry
    name: serde_with
    version: 3.14.0
    sha: f2c45cd61fefa9db6f254525d46e392b852e0e61d9a1fd36e5bd183450a556d5
  - kind: registry
    name: serde_with_macros
    version: 3.14.0
    sha: de90945e6565ce0d9a25098082ed4ee4002e047cb59892c318d66821e14bb30f
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
    name: signal-hook-registry
    version: 1.4.6
    sha: b2a4719bff48cee6b39d12c020eeb490953ad2443b7055bd0b21fca26bd8c28b
  - kind: registry
    name: simd-adler32
    version: 0.3.7
    sha: d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe
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
    version: 1.0.1
    sha: 56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d
  - kind: registry
    name: skrifa
    version: 0.31.3
    sha: dbeb4ca4399663735553a09dd17ce7e49a0a0203f03b706b39628c4d913a8607
  - kind: registry
    name: skrifa
    version: 0.36.0
    sha: 37004372610e83ee2a4c69c7d896b41f33da6a3dc1a4fe07dd9b2629a549b1dc
  - kind: registry
    name: slab
    version: 0.4.11
    sha: 7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589
  - kind: registry
    name: slotmap
    version: 1.0.7
    sha: dbff4acf519f630b3a3ddcfaea6c06b42174d9a44bc70c620e9ed1649d58b82a
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: smithay-client-toolkit
    version: 0.19.2
    sha: 3457dea1f0eb631b4034d61d4d8c32074caa6cd1ab2d59f2327bd8461e2c0016
  - kind: registry
    name: smithay-client-toolkit
    version: 0.20.0
    sha: 0512da38f5e2b31201a93524adb8d3136276fa4fe4aafab4e1f727a82b534cc0
  - kind: git
    commit: 5a3007def49eb678d1144850c9ee04b80707c56a
    repo: github:pop-os/smithay-clipboard
    query:
      tag: pop-dnd-5
    name: smithay-clipboard
    version: 0.8.0
  - kind: registry
    name: smol_str
    version: 0.2.2
    sha: dd538fb6910ac1099850255cf94a94df6551fbdd602454387d0adb2d1ca6dead
  - kind: registry
    name: socket2
    version: 0.4.10
    sha: 9f7916fc008ca5542385b89a3d3ce689953c143e9304a9bf8beec1de48994c0d
  - kind: registry
    name: socket2
    version: 0.6.0
    sha: 233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807
  - kind: git
    commit: a3f77e251e7422803f693df6e3fc313c010c4dcb
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
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
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
    name: svg_fmt
    version: 0.4.5
    sha: 0193cc4331cfd2f3d2011ef287590868599a2f33c3e69bc22c1a3d3acf9e02fb
  - kind: registry
    name: svgtypes
    version: 0.15.3
    sha: 68c7541fff44b35860c1a7a47a7cadf3e4a304c457b58f9870d9706ece028afc
  - kind: registry
    name: swash
    version: 0.2.5
    sha: f745de914febc7c9ab4388dfaf94bbc87e69f57bb41133a9b0c84d4be49856f3
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.106
    sha: ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6
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
    version: 6.2.2
    sha: a3e535eb8dded36d55ec13eddacd30dec501792ff23a0b1682c38601b8cf2349
  - kind: git
    commit: 7781c70241f7f572130c13106f2a869a9cf80885
    repo: https://github.com/DioxusLabs/taffy
    query:
      rev: 7781c70
    name: taffy
    version: 0.3.11
  - kind: registry
    name: target-lexicon
    version: 0.12.16
    sha: 61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1
  - kind: registry
    name: temp-dir
    version: 0.1.16
    sha: 83176759e9416cf81ee66cb6508dbfe9c96f20b8b56265a39917551c23c70964
  - kind: registry
    name: tempfile
    version: 3.22.0
    sha: 84fa4d11fadde498443cca10fd3ac23c951f0dc59e080e9f4b93d4df4e4eea53
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
    version: 2.0.16
    sha: 3467d614147380f2e4e374161426ff399c91084acd2363eaf549172b3d5e60c0
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.16
    sha: 6c5e1be1c48b9172ee610da68fd9cd2770e7a4056cb3fc98710ee6906f0c7960
  - kind: registry
    name: thread_local
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.43
    sha: 83bde6f1ec10e72d583d91623c939f623002284ef622b87de38cfd546cbf2031
  - kind: registry
    name: time-core
    version: 0.1.6
    sha: 40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b
  - kind: registry
    name: time-macros
    version: 0.2.24
    sha: 30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3
  - kind: git
    commit: 3b86984332be2c930a3536ab714b843c851fa8ca
    repo: github:pop-os/dbus-settings-bindings
    name: timedate-zbus
    version: 0.1.0
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
    version: 0.8.1
    sha: 5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b
  - kind: registry
    name: tinyvec
    version: 1.10.0
    sha: bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.47.1
    sha: 89e49afdadebb872d3145a5638b59eb0691ea23e46ca484037cfab3b76b95038
  - kind: registry
    name: tokio-macros
    version: 2.5.0
    sha: 6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e68e8ac134855e7e2bdbaf8cab8
  - kind: registry
    name: tokio-stream
    version: 0.1.17
    sha: eca58d7bba4a75707817a2c44174253f9236b2d5fbd055602e9d5c07c139a047
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml
    version: 0.8.23
    sha: dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362
  - kind: registry
    name: toml_datetime
    version: 0.6.11
    sha: 22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c
  - kind: registry
    name: toml_datetime
    version: 0.7.1
    sha: a197c0ec7d131bfc6f7e82c8442ba1595aeab35da7adbf05b6b73cd06a16b6be
  - kind: registry
    name: toml_edit
    version: 0.19.15
    sha: 1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421
  - kind: registry
    name: toml_edit
    version: 0.22.27
    sha: 41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a
  - kind: registry
    name: toml_edit
    version: 0.23.5
    sha: c2ad0b7ae9cfeef5605163839cb9221f453399f15cfb5c10be9885fcf56611f9
  - kind: registry
    name: toml_parser
    version: 1.0.2
    sha: b551886f449aa90d4fe2bdaa9f4a2577ad2dde302c61ecf262d80b116db95c10
  - kind: registry
    name: tracing
    version: 0.1.41
    sha: 784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0
  - kind: registry
    name: tracing-attributes
    version: 0.1.30
    sha: 81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903
  - kind: registry
    name: tracing-core
    version: 0.1.34
    sha: b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678
  - kind: registry
    name: tracing-error
    version: 0.2.1
    sha: 8b1581020d7a273442f5b45074a6a57d5757ad0a47dac0e9f0bd57b81936f3db
  - kind: registry
    name: tracing-journald
    version: 0.3.1
    sha: fc0b4143302cf1022dac868d521e36e8b27691f72c84b3311750d5188ebba657
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.20
    sha: 2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5
  - kind: registry
    name: ttf-parser
    version: 0.21.1
    sha: 2c591d83f69777866b9126b24c6dd9a18351f177e49d625920d19f989fd31cf8
  - kind: registry
    name: ttf-parser
    version: 0.25.1
    sha: d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31
  - kind: registry
    name: type-map
    version: 0.5.1
    sha: cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90
  - kind: registry
    name: typenum
    version: 1.18.0
    sha: 1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f
  - kind: registry
    name: udev
    version: 0.9.3
    sha: af4e37e9ea4401fc841ff54b9ddfc9be1079b1e89434c1a6a865dd68980f7e9f
  - kind: registry
    name: uds_windows
    version: 1.1.0
    sha: 89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9
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
    version: 2.8.1
    sha: 75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539
  - kind: registry
    name: unicode-bidi
    version: 0.3.18
    sha: 5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5
  - kind: registry
    name: unicode-bidi-mirroring
    version: 0.2.0
    sha: 23cb788ffebc92c5948d0e997106233eeb1d8b9512f93f41651f52b6c5f5af86
  - kind: registry
    name: unicode-ccc
    version: 0.2.0
    sha: 1df77b101bcc4ea3d78dafc5ad7e4f58ceffe0b2b16bf446aeb50b6cb4157656
  - kind: registry
    name: unicode-ident
    version: 1.0.19
    sha: f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-properties
    version: 0.1.3
    sha: e70f2a8b45122e719eb623c01822704c4e0907e7e426a05927e1a1cfff5b75d0
  - kind: registry
    name: unicode-script
    version: 0.5.7
    sha: 9fb421b350c9aff471779e262955939f565ec18b86c15364e6bdf0d662ca7c1f
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
  - kind: git
    commit: 3b86984332be2c930a3536ab714b843c851fa8ca
    repo: github:pop-os/dbus-settings-bindings
    name: upower_dbus
    version: 0.3.2
  - kind: registry
    name: url
    version: 2.5.7
    sha: 08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - kind: registry
    name: usvg
    version: 0.42.0
    sha: b84ea542ae85c715f07b082438a4231c3760539d902e11d093847a0b22963032
  - kind: registry
    name: utf16_iter
    version: 1.0.5
    sha: c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: v_frame
    version: 0.3.9
    sha: 666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: vergen
    version: 8.3.2
    sha: 2990d9ea5967266ea0ccf413a4aa5c42a93dbcfda9cb49a97de6931726b12566
  - kind: registry
    name: version-compare
    version: 0.2.0
    sha: 852e951cb7832cb45cb1169900d19760cfa39b82bc0ea9c0e5a14ae88411c98b
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: waker-fn
    version: 1.2.0
    sha: 317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasi
    version: 0.14.7+wasi-0.2.4
    sha: 883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c
  - kind: registry
    name: wasip2
    version: 1.0.1+wasi-0.2.4
    sha: 0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7
  - kind: registry
    name: wasm-bindgen
    version: 0.2.103
    sha: ab10a69fbd0a177f5f649ad4d8d3305499c42bab9aef2f7ff592d0ec8f833819
  - kind: registry
    name: wasm-bindgen-backend
    version: 0.2.103
    sha: 0bb702423545a6007bbc368fde243ba47ca275e549c8a28617f56f6ba53b1d1c
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.53
    sha: a0b221ff421256839509adbb55998214a70d829d3a28c69b4a6672e9d2a42f67
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.103
    sha: fc65f4f411d91494355917b605e1480033152658d71f722a90647f56a70c88a0
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.103
    sha: ffc003a991398a8ee604a401e194b6b3a39677b3173d6e74495eb51b82e99a32
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.103
    sha: 293c37f4efa430ca14db3721dfbe48d8c33308096bd44d80ebaa775ab71ba1cf
  - kind: registry
    name: wasm-timer
    version: 0.2.5
    sha: be0ecb0db480561e9a7642b5d3e4187c128914e58aa84330b9493e3eb68c5e7f
  - kind: registry
    name: wayland-backend
    version: 0.3.11
    sha: 673a33c33048a5ade91a6b139580fa174e19fb0d23f396dca9fa15f2e1e49b35
  - kind: registry
    name: wayland-client
    version: 0.31.11
    sha: c66a47e840dc20793f2264eb4b3e4ecb4b75d91c0dd4af04b456128e0bdd449d
  - kind: registry
    name: wayland-csd-frame
    version: 0.3.0
    sha: 625c5029dbd43d25e6aa9615e88b829a5cad13b2819c4ae129fdbb7c31ab4c7e
  - kind: registry
    name: wayland-cursor
    version: 0.31.11
    sha: 447ccc440a881271b19e9989f75726d60faa09b95b0200a9b7eb5cc47c3eeb29
  - kind: registry
    name: wayland-protocols
    version: 0.32.9
    sha: efa790ed75fbfd71283bd2521a1cfdc022aabcc28bdcff00851f9e4ae88d9901
  - kind: registry
    name: wayland-protocols-experimental
    version: 20250721.0.1
    sha: 40a1f863128dcaaec790d7b4b396cc9b9a7a079e878e18c47e6c2d2c5a8dcbb1
  - kind: registry
    name: wayland-protocols-misc
    version: 0.3.9
    sha: 2dfe33d551eb8bffd03ff067a8b44bb963919157841a99957151299a6307d19c
  - kind: registry
    name: wayland-protocols-plasma
    version: 0.3.9
    sha: a07a14257c077ab3279987c4f8bb987851bf57081b93710381daea94f2c2c032
  - kind: registry
    name: wayland-protocols-wlr
    version: 0.3.9
    sha: efd94963ed43cf9938a090ca4f7da58eb55325ec8200c3848963e98dc25b78ec
  - kind: registry
    name: wayland-scanner
    version: 0.31.7
    sha: 54cb1e9dc49da91950bdfd8b848c49330536d9d1fb03d4bfec8cae50caa50ae3
  - kind: registry
    name: wayland-server
    version: 0.31.10
    sha: fcbd4f3aba6c9fba70445ad2a484c0ef0356c1a9459b1e8e435bedc1971a6222
  - kind: registry
    name: wayland-sys
    version: 0.31.7
    sha: 34949b42822155826b41db8e5d0c1be3a2bd296c747577a43a3e6daefc296142
  - kind: registry
    name: web-sys
    version: 0.3.80
    sha: fbe734895e869dc429d78c4b433f8d17d95f8d05317440b4fad5ab2d33e596dc
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: weezl
    version: 0.1.10
    sha: a751b3277700db47d3e574514de2eced5e54dc8a5436a3bf7a0b248b2cee16f3
  - kind: registry
    name: wgpu
    version: 22.1.0
    sha: e1d1c4ba43f80542cf63a0a6ed3134629ae73e8ab51e4b765a67f3aa062eb433
  - kind: registry
    name: wgpu-core
    version: 22.1.0
    sha: 0348c840d1051b8e86c3bcd31206080c5e71e5933dabd79be1ce732b0b2f089a
  - kind: registry
    name: wgpu-hal
    version: 22.0.0
    sha: f6bbf4b4de8b2a83c0401d9e5ae0080a2792055f25859a02bf9be97952bbed4f
  - kind: registry
    name: wgpu-types
    version: 22.0.0
    sha: bc9d91f0e2c4b51434dfa6db77846f2793149d8e73f800fa2e41f52b8eac3c5d
  - kind: registry
    name: whitespace-conf
    version: 1.0.0
    sha: 88bce969a15062afb2d34155402d78cd50d1ddeca000a42353ef0c71ddd68995
  - kind: registry
    name: widestring
    version: 1.2.0
    sha: dd7cf3379ca1aac9eea11fba24fd7e315d621f8dfe35c8d7d2be8b793726e07d
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
    commit: 6b9faab87bea9cebec6ae036906fd67fed254f5f
    repo: github:pop-os/window_clipboard.git
    query:
      tag: pop-0.13-2
    name: window_clipboard
    version: 0.4.1
  - kind: registry
    name: windows
    version: 0.52.0
    sha: e48a53791691ab099e5e2ad123536d0fff50652600abaf43bbf952894110d0be
  - kind: registry
    name: windows
    version: 0.54.0
    sha: 9252e5725dbed82865af151df558e754e4a3c2c30818359eb17465f1346a1b49
  - kind: registry
    name: windows-core
    version: 0.52.0
    sha: 33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9
  - kind: registry
    name: windows-core
    version: 0.54.0
    sha: 12661b9c89351d684a50a8a643ce5f608e20243b9fb84687800163429f161d65
  - kind: registry
    name: windows-core
    version: 0.62.0
    sha: 57fe7168f7de578d2d8a05b07fd61870d2e73b4020e9f49aa00da8471723497c
  - kind: registry
    name: windows-implement
    version: 0.53.0
    sha: 942ac266be9249c84ca862f0a164a39533dc2f6f33dc98ec89c8da99b82ea0bd
  - kind: registry
    name: windows-implement
    version: 0.60.0
    sha: a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836
  - kind: registry
    name: windows-interface
    version: 0.53.0
    sha: da33557140a288fae4e1d5f8873aaf9eb6613a9cf82c3e070223ff177f598b60
  - kind: registry
    name: windows-interface
    version: 0.59.1
    sha: bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8
  - kind: registry
    name: windows-link
    version: 0.1.3
    sha: 5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a
  - kind: registry
    name: windows-link
    version: 0.2.0
    sha: 45e46c0661abb7180e7b9c281db115305d49ca1709ab8242adf09666d2173c65
  - kind: registry
    name: windows-result
    version: 0.1.2
    sha: 5e383302e8ec8515204254685643de10811af0ed97ea37210dc26fb0032647f8
  - kind: registry
    name: windows-result
    version: 0.4.0
    sha: 7084dcc306f89883455a206237404d3eaf961e5bd7e0f312f7c91f57eb44167f
  - kind: registry
    name: windows-strings
    version: 0.5.0
    sha: 7218c655a553b0bed4426cf54b20d7ba363ef543b52d515b3e48d7fd55318dda
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
    version: 0.61.0
    sha: e201184e40b2ede64bc2ea34968b28e33622acdbbf37104f0e4a33f7abe657aa
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
    version: 0.53.3
    sha: d5fe6031c4041849d7c496a8ded650796e7b6ecc19df1a431c1a363342e5dc91
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
    version: 0.53.0
    sha: 86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764
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
    version: 0.53.0
    sha: c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c
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
    version: 0.53.0
    sha: c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.53.0
    sha: 9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11
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
    version: 0.53.0
    sha: 581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d
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
    version: 0.53.0
    sha: 2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba
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
    version: 0.53.0
    sha: 0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57
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
    version: 0.53.0
    sha: 271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486
  - kind: git
    commit: dbe91fcc363c101f1d6ed5301d49911b01a26f61
    repo: github:pop-os/winit.git
    query:
      tag: iced-xdg-surface-0.13
    name: winit
    version: 0.30.5
  - kind: registry
    name: winnow
    version: 0.5.40
    sha: f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876
  - kind: registry
    name: winnow
    version: 0.6.24
    sha: c8d71a593cc5c42ad7876e2c1fda56f314f3754c084128833e64f1345ff8a03a
  - kind: registry
    name: winnow
    version: 0.7.13
    sha: 21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf
  - kind: registry
    name: wit-bindgen
    version: 0.46.0
    sha: f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59
  - kind: registry
    name: write16
    version: 1.0.0
    sha: d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936
  - kind: registry
    name: writeable
    version: 0.6.1
    sha: ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb
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
    version: 2.5.2
    sha: 213b7324336b53d2414b2db8537e56544d981803139155afa84f76eeebb7a546
  - kind: registry
    name: xdg
    version: 3.0.0
    sha: 2fb433233f2df9344722454bc7e96465c9d03bff9d77c248f9e7523fe79585b5
  - kind: registry
    name: xdg-home
    version: 1.3.0
    sha: ec1cdab258fb55c0da61328dc52c8764709b249011b2cad0454c72f0bf10a1f6
  - kind: registry
    name: xkb-data
    version: 0.2.1
    sha: ddbaf7dc9e1a13a8a6dd4beb794d463ae16d150879092c757f4aea2d17b81305
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
    name: xml-rs
    version: 0.8.27
    sha: 6fd8403733700263c6eb89f192880191f1b83e332f7a20371ddcf421c4a337c7
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
    version: 0.8.0
    sha: 5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc
  - kind: registry
    name: yoke-derive
    version: 0.8.0
    sha: 38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6
  - kind: registry
    name: zbus
    version: 3.15.2
    sha: 675d170b632a6ad49804c8cf2105d7c31eddd3312555cffd4b740e08e97c25e6
  - kind: registry
    name: zbus
    version: 5.11.0
    sha: 2d07e46d035fb8e375b2ce63ba4e4ff90a7f73cf2ffb0138b29e1158d2eaadf7
  - kind: registry
    name: zbus_macros
    version: 3.15.2
    sha: 7131497b0f887e8061b430c530240063d33bf9455fa34438f388a245da69e0a5
  - kind: registry
    name: zbus_macros
    version: 5.11.0
    sha: 57e797a9c847ed3ccc5b6254e8bcce056494b375b511b3d6edcec0aeb4defaca
  - kind: registry
    name: zbus_names
    version: 2.6.1
    sha: 437d738d3750bed6ca9b8d423ccc7a8eb284f6b1d6d4e225a0e4e6258d864c8d
  - kind: registry
    name: zbus_names
    version: 4.2.0
    sha: 7be68e64bf6ce8db94f63e72f0c7eb9a60d733f7e0499e628dfab0f84d6bcb97
  - kind: registry
    name: zeno
    version: 0.3.3
    sha: 6df3dc4292935e51816d896edcd52aa30bc297907c26167fec31e2b0c6a32524
  - kind: registry
    name: zerocopy
    version: 0.8.27
    sha: 0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c
  - kind: registry
    name: zerocopy-derive
    version: 0.8.27
    sha: 88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831
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
    version: 0.2.2
    sha: 36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595
  - kind: registry
    name: zerovec
    version: 0.11.4
    sha: e7aa2bd55086f1ab526693ecbe444205da57e25f4489879da80635a46d90e73b
  - kind: registry
    name: zerovec-derive
    version: 0.11.1
    sha: 5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f
  - kind: registry
    name: zune-core
    version: 0.4.12
    sha: 3f423a2c17029964870cfaabb1f13dfab7d092a62a29a89264f4d36990ca414a
  - kind: registry
    name: zune-jpeg
    version: 0.4.21
    sha: 29ce2c8a9384ad323cf564b67da86e21d3cfdff87908bc1223ed5c99bc792713
  - kind: registry
    name: zvariant
    version: 3.15.2
    sha: 4eef2be88ba09b358d3b58aca6e41cd853631d44787f319a1383ca83424fb2db
  - kind: registry
    name: zvariant
    version: 5.7.0
    sha: 999dd3be73c52b1fccd109a4a81e4fcd20fab1d3599c8121b38d04e1419498db
  - kind: registry
    name: zvariant_derive
    version: 3.15.2
    sha: 37c24dc0bed72f5f90d1f8bb5b07228cbf63b3c6e9f82d82559d4bae666e7ed9
  - kind: registry
    name: zvariant_derive
    version: 5.7.0
    sha: 6643fd0b26a46d226bd90d3f07c1b5321fe9bb7f04673cb37ac6d6883885b68e
  - kind: registry
    name: zvariant_utils
    version: 1.0.1
    sha: 7234f0d811589db492d16893e3f21e8e2fd282e6d01b0cddee310322062cc200
  - kind: registry
    name: zvariant_utils
    version: 3.2.1
    sha: c6949d142f89f6916deca2232cf26a8afacf2b9fdc35ce766105e104478be599
environment:
  # Workaround: build.rs uses vergen crate which requires git metadata.
  # In the sandbox there's no .git directory, so we set idempotent mode
  # and provide fallback values to avoid build failures.
  VERGEN_IDEMPOTENT: "true"
  VERGEN_GIT_SHA: "unknown"
  VERGEN_GIT_COMMIT_DATE: "2024-01-01"

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
