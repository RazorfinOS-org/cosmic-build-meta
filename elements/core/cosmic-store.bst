kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- core-deps/just.bst
- core/libcosmic.bst
- cosmic-deps/flatpak.bst

depends:
- cosmic-deps/flatpak.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-store.git
  track: master
  ref: epoch-1.7.0-2-gb8e6a644640c1553e935339781d7154674f92b6e
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
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit
    version: 0.22.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_atspi_common
    version: 0.15.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_consumer
    version: 0.32.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_macos
    version: 0.23.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_unix
    version: 0.18.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_windows
    version: 0.30.0
  - kind: git
    commit: f0599eed5f18111228266fe3f28991cc48b5964f
    repo: github:wash2/accesskit
    query:
      tag: cosmic-0.14
    name: accesskit_winit
    version: 0.30.0
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
    version: 1.1.5
    sha: c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba
  - kind: registry
    name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
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
    repo: github:jackpot51/appstream.git
    name: appstream
    version: 0.2.2
  - kind: registry
    name: arc-swap
    version: 1.9.2
    sha: c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b
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
    version: 0.8.10
    sha: 3091d68264354f211516b91dce6f71046e444fab1867716035f736667243affb
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: aws-lc-rs
    version: 1.18.1
    sha: b281d307588d634de920874890732659e2e7672f72b5e10e81badc1a8a83621e
  - kind: registry
    name: aws-lc-sys
    version: 0.45.0
    sha: 9bff6c3b54fad79a2e60b8102caf565819711497c1f5f092f49508e2f5c31b27
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
    name: bitcode
    version: 0.6.9
    sha: 0a6ed1b54d8dc333e7be604d00fa9262f4635485ffea923647b6521a5fff045d
  - kind: registry
    name: bitcode_derive
    version: 0.6.9
    sha: 238b90427dfad9da4a9abd60f3ec1cdee6b80454bde49ed37f1781dd8e9dc7f9
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.13.1
    sha: b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.12.1
    sha: d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa
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
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: build_helpers
    version: 0.14.0
  - kind: registry
    name: bumpalo
    version: 3.20.3
    sha: 72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649
  - kind: registry
    name: by_address
    version: 1.2.1
    sha: 64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06
  - kind: registry
    name: bytemuck
    version: 1.25.2
    sha: 95832e849adfb21180ccb6826a99da14e5d266ae5c2e668e1602cf234f153797
  - kind: registry
    name: bytemuck_derive
    version: 1.12.0
    sha: fc0e56a716f1e132ff6bf4bdac1c944a3fcdc1cae65f70a4a2a1ac3b401d2d1f
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.12.1
    sha: fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04
  - kind: registry
    name: calloop
    version: 0.14.4
    sha: 4dbf9978365bac10f54d1d4b04f7ce4427e51f71d61f2fe15e3fed5166474df7
  - kind: registry
    name: calloop-wayland-source
    version: 0.4.1
    sha: 138efcf0940a02ebf0cc8d1eff41a1682a46b431630f4c52450d6265876021fa
  - kind: registry
    name: cc
    version: 1.4.4
    sha: 0ad534f4357a5264cce5019c989cf66a4f0dc4e0d1b1d15f8aacec0ff7360273
  - kind: registry
    name: cfg-expr
    version: 0.20.9
    sha: fe4ece8474b5f766c63426647e7b4b316b67431ade1036a8313cee24a03ae917
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
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
    name: clap
    version: 4.6.6
    sha: 473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca
  - kind: registry
    name: clap_builder
    version: 4.6.6
    sha: 7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889
  - kind: registry
    name: clap_derive
    version: 4.6.4
    sha: d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061
  - kind: registry
    name: clap_lex
    version: 1.1.0
    sha: c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9
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
    name: cmake
    version: 0.1.58
    sha: c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678
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
    version: 4.6.8
    sha: cfc320937d09e6de266b31b9afb480f197d7a861be86be7cb2ea7e5d1bfffc5e
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: configparser
    version: 3.2.0
    sha: b46dec724fd22199ebde05033a0cbae453bc3b1ecff11eb6a6bb3eec4b90c6a4
  - kind: registry
    name: const-oid
    version: 0.10.2
    sha: a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c
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
    commit: 32283d76a8d0342da74c4cc022a533c52dcf378f
    repo: github:pop-os/cosmic-protocols
    query:
      rev: 32283d7
    name: cosmic-client-toolkit
    version: 0.2.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: cosmic-config-derive
    version: 1.0.0
  - kind: git
    commit: ab4c57b8e416c6af9297cb04d101889896fd9a92
    repo: github:pop-os/freedesktop-icons
    name: cosmic-freedesktop-icons
    version: 0.4.0
  - kind: git
    commit: 3c08c30c2d77afb5130bbc42a74f479979b372dd
    repo: github:pop-os/cosmic-panel
    name: cosmic-panel-config
    version: 0.1.0
  - kind: git
    commit: 32283d76a8d0342da74c4cc022a533c52dcf378f
    repo: github:pop-os/cosmic-protocols
    query:
      rev: 32283d7
    name: cosmic-protocols
    version: 0.2.0
  - kind: git
    commit: 67c995d5e659173352ca0adfb22108ac1bf91f5a
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-config
    version: 0.1.0
  - kind: git
    commit: eed01dd3609e90e3c8cd043656734c500956c793
    repo: github:pop-os/dbus-settings-bindings
    name: cosmic-settings-daemon
    version: 0.1.0
  - kind: registry
    name: cosmic-text
    version: 0.19.0
    sha: be17b688510d934ce13f48a2beba700e11583e281e0fda99c22bb256a14eda73
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: cosmic-theme
    version: 1.0.0
  - kind: registry
    name: cpufeatures
    version: 0.3.1
    sha: 5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566
  - kind: registry
    name: crc32fast
    version: 1.5.1
    sha: 8498c871161e1742aaa9d52551b2d6ebdd4c3d45a3be423e3728f33b955be550
  - kind: registry
    name: crossbeam-deque
    version: 0.8.7
    sha: 5181e0de7b61eb03a81e347d6dd8797bae9da5146707b51077e2d71a54ec0ceb
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.20
    sha: 2d6914041f254d6e9176c01941b21115dcfb7089e55135a35411081bd106ef3f
  - kind: registry
    name: crossbeam-utils
    version: 0.8.22
    sha: 61803da095bee82a81bb1a452ecc25d3b2f1416d1897eb86430c6159ef717c17
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
    version: 0.2.2
    sha: ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453
  - kind: registry
    name: css-color
    version: 0.2.8
    sha: 42aaeae719fd78ce501d77c6cdf01f7e96f26bcd5617a4903a1c2b97e388543a
  - kind: registry
    name: csscolorparser
    version: 0.8.4
    sha: 168dbdf4dced8f57fa4246ac9080598452b49d70bb2d0e46422142f113140dd8
  - kind: registry
    name: ctor
    version: 0.10.1
    sha: 83cf0d42651b16c6dfe68685716d18480d18a9c39c62d76e8cf3eb6ed5d8bcbf
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
    name: defmt
    version: 1.1.1
    sha: e2953bfe4f93bbd20cc71198842756f77d161884c99ebbabc41d80231ded88d1
  - kind: registry
    name: defmt-macros
    version: 1.1.1
    sha: bad9c72e7ca2137e0dc3813245a0d282fd6daad32fd800af018306a9169b5fe8
  - kind: registry
    name: defmt-parser
    version: 1.0.0
    sha: 10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e
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
    version: 0.16.0
    sha: dc05a5d33db20c784f873e84934ad94bb209a090987ac5f62fede2c178234f23
  - kind: registry
    name: digest
    version: 0.11.3
    sha: f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
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
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
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
    name: dtor
    version: 0.8.1
    sha: edf234dd1594d6dd434a8fb8cada51ddbbc593e40e4a01556a0b31c62da2775b
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: either
    version: 1.18.0
    sha: 252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
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
    version: 2.0.0
    sha: 900d271a03799a1ee8d1ca9b19893b48ca674a9284fefcfb85f05e74ed314217
  - kind: registry
    name: env_logger
    version: 0.11.11
    sha: de671bd27a75a797dc9ae289ba1e77276e75e2026408aab65185384e2d5cd3f6
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
    version: 3.4.0
    sha: 0b5343afd4a8365a643ac588dab4cf234a190c7f6c88c9f6dd6ffe00837661b7
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
    version: 0.1.11
    sha: d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890
  - kind: registry
    name: flate2
    version: 1.1.10
    sha: 6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb
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
    version: 0.12.4
    sha: e64eb721ca85a34323425f4041adc5d82704d3782d5f8f03793bc012419dce23
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
    version: 0.8.2
    sha: 1f805583a11d4b14f17370a74731e93433c5740d8c401ca8605d3476f4d31fc0
  - kind: registry
    name: freedesktop_entry_parser
    version: 2.0.1
    sha: 2b368437186ec63ceb50d0832ee1ebcb5878037fe16ead1c68081d4aee0d140a
  - kind: registry
    name: fs_extra
    version: 1.3.0
    sha: 42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c
  - kind: registry
    name: fsevent-sys
    version: 4.1.0
    sha: 76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2
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
    name: futures-util
    version: 0.3.34
    sha: 0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc
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
    version: 0.8.0
    sha: 9df5e3fa8c077b15fdfa8ce130e2bc73d663b8aaa6d51b71421b8659980b1d80
  - kind: registry
    name: gettext-sys
    version: 0.27.0
    sha: 4caa7e4460b196107cc1bb2629488e8b6dbb7f34f6683ea6753c4ac22f590785
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gio
    version: 0.21.5
    sha: c5ff48bf600c68b476e61dc6b7c762f2f4eb91deef66583ba8bb815c30b5811a
  - kind: registry
    name: gio-sys
    version: 0.21.5
    sha: 0071fe88dba8e40086c8ff9bbb62622999f49628344b1d1bf490a48a29d80f22
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: registry
    name: glam
    version: 0.25.0
    sha: 151665d9be52f9bb40fc7966565d39666f2d1e69233571b71b87791c7e0528b3
  - kind: registry
    name: glam
    version: 0.33.6
    sha: 21fef0953c54fd3de2f44b743fbf77e044c81a25faee03636dfccc0d35135e23
  - kind: registry
    name: glib
    version: 0.21.5
    sha: 16de123c2e6c90ce3b573b7330de19be649080ec612033d397d72da265f1bd8b
  - kind: registry
    name: glib-macros
    version: 0.21.5
    sha: cf59b675301228a696fe01c3073974643365080a76cc3ed5bc2cbc466ad87f17
  - kind: registry
    name: glib-sys
    version: 0.21.5
    sha: 2d95e1a3a19ae464a7286e14af9a90683c64d70c02532d88d87ce95056af3e6c
  - kind: registry
    name: glow
    version: 0.16.0
    sha: c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08
  - kind: registry
    name: glutin_wgl_sys
    version: 0.6.1
    sha: 2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e
  - kind: registry
    name: gobject-sys
    version: 0.21.5
    sha: 2dca35da0d19a18f4575f3cb99fe1c9e029a2941af5662f326f738a21edaf294
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
    name: grid
    version: 1.0.1
    sha: b40ca9252762c466af32d0b1002e91e4e1bc5398f77455e55474deb466355ff5
  - kind: registry
    name: guillotiere
    version: 0.6.2
    sha: b62d5865c036cb1393e23c50693df631d3f5d7bcca4c04fe4cc0fd592e74a782
  - kind: registry
    name: h2
    version: 0.4.19
    sha: ef8e5e5a340588f4452631496976cf8636d4a7ecf600239fdc27615d2530bc16
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
    name: http
    version: 1.5.0
    sha: 918d3568bebf352712bc2ef3d46a8bcf1a75b373be6539de198e9105cbbf9ce0
  - kind: registry
    name: http-body
    version: 1.1.0
    sha: ca2a8f2913ee65f60facd6a5905613afaa448497a0230cc41ce022d93290bc2c
  - kind: registry
    name: http-body-util
    version: 0.1.5
    sha: 23169fe34a5fbcdd3f3862e78fb9b6fccd5f02a6dc6f732547005d45631ce71c
  - kind: registry
    name: httparse
    version: 1.10.1
    sha: 6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87
  - kind: registry
    name: hybrid-array
    version: 0.4.14
    sha: 707114b52a152fa7bdb290cd7cd5912d9467273b6d74e21b8d81aca1f8533f6b
  - kind: registry
    name: hyper
    version: 1.11.1
    sha: 27b501faa50e7a26c3d3560ca625132f4078a17771f4810baf70475ae48cbe43
  - kind: registry
    name: hyper-rustls
    version: 0.27.9
    sha: 33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f
  - kind: registry
    name: hyper-util
    version: 0.1.20
    sha: 96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0
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
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_accessibility
    version: 0.1.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_debug
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_futures
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_graphics
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_program
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_renderer
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_runtime
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_tiny_skia
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_wgpu
    version: 0.14.0
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_widget
    version: 0.14.2
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: iced_winit
    version: 0.14.0
  - kind: registry
    name: icu_collator
    version: 2.3.1
    sha: 08984ed58ac439ebf3e13d2cf26b0c46a60afcd21721c1d14087c0b240344dda
  - kind: registry
    name: icu_collator_data
    version: 2.3.0
    sha: f7d7e54efdddeb1208c08dd5d32b53a879ac00d2d3d051b2255fd26821d16368
  - kind: registry
    name: icu_collections
    version: 2.3.0
    sha: fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513
  - kind: registry
    name: icu_locale
    version: 2.3.1
    sha: 785f595c61ef57169a467eeed7b4b6936a66f6cacbb116a96ee86da983251bf4
  - kind: registry
    name: icu_locale_core
    version: 2.3.0
    sha: d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb
  - kind: registry
    name: icu_locale_data
    version: 2.3.0
    sha: d37d91460e362a5cf58907cd7ce871411775ee6294e49a5cc8e6cec16dfa75ea
  - kind: registry
    name: icu_locale_fallback
    version: 2.3.0
    sha: 251af8e57c9400e3eb58242fe5b8b1152b2a64fdf4cf632f923c38ccee6f2fa9
  - kind: registry
    name: icu_locale_fallback_data
    version: 2.3.0
    sha: decf2a22ec8fa68f1a0c1129a3f8583f8f8bc24e8b9ccbe98ead99f62a4dc3a8
  - kind: registry
    name: icu_normalizer
    version: 2.3.0
    sha: 12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f
  - kind: registry
    name: icu_normalizer_data
    version: 2.3.0
    sha: 1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0
  - kind: registry
    name: icu_properties
    version: 2.3.0
    sha: 7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148
  - kind: registry
    name: icu_properties_data
    version: 2.3.0
    sha: e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa
  - kind: registry
    name: icu_provider
    version: 2.3.1
    sha: d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73
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
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.11.4
    sha: 4b0f83760fb341a774ed326568e19f5a863af4a952def8c39f9ab92fd95b88e5
  - kind: registry
    name: inotify
    version: 0.11.5
    sha: 4cc00ea907cab49550b7da656f80ebb97be1b997d931fbcd28d39734e17ce592
  - kind: registry
    name: inotify-sys
    version: 0.1.8
    sha: c033f80b2c113cdf91ab7a33faa9cbc014726dcad99880c8609af2a370edf37d
  - kind: registry
    name: intl-memoizer
    version: 0.5.3
    sha: 310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f
  - kind: registry
    name: intl_pluralrules
    version: 7.0.2
    sha: 078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972
  - kind: registry
    name: ipnet
    version: 2.12.1
    sha: 6a756c3fac73139e83f14c2d742155dd2b78d3ee56597b419a0579b7bdd6dd78
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
    name: itoa
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: jiff
    version: 0.2.35
    sha: 668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc
  - kind: registry
    name: jiff-core
    version: 0.1.0
    sha: 7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09
  - kind: registry
    name: jiff-static
    version: 0.2.35
    sha: 3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204
  - kind: registry
    name: jiff-tzdb
    version: 0.1.8
    sha: 142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e
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
    version: 0.3.104
    sha: 0e0c1080212aad755ea003d18543e8768dd432c48819efd73a7bf1e39b7a5a3a
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
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: libc
    version: 0.2.189
    sha: 3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2
  - kind: git
    commit: 9cc82abd9ca5601bb0341edd12a9acbc97e77801
    repo: github:pop-os/libcosmic.git
    name: libcosmic
    version: 1.0.0
  - kind: registry
    name: libflatpak
    version: 0.7.0
    sha: 8893413fbb293f3f608ae24154f28377fc63f3e0ac6e68f53ffd0467deedc25b
  - kind: registry
    name: libflatpak-sys
    version: 0.7.0
    sha: 828e83dbef64ac0f440c4479f0c96bfa98fdf7f42ca8823b169add41fb7afc23
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
    version: 0.1.23
    sha: 8d8f1ea3f21fd3405dcaf6c9b5c1630af9afc422d9073ea39c5f6d6c772e08ed
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
    version: 0.4.34
    sha: f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6
  - kind: registry
    name: logind-zbus
    version: 5.3.2
    sha: 469c962578b549a82f3d0cc72d0f77d1123780fa7121e2b03d78b0780f6ccac6
  - kind: registry
    name: lru
    version: 0.16.4
    sha: 7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39
  - kind: registry
    name: lru-slab
    version: 0.1.2
    sha: 112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154
  - kind: registry
    name: lyon
    version: 1.0.19
    sha: bd0578bdecb7d6d88987b8b2b1e3a4e2f81df9d0ece1078623324a567904e7b7
  - kind: registry
    name: lyon_algorithms
    version: 1.0.21
    sha: cdfa8785f95e57914ddb35e3b59994aeba6f5e79e9cfd03da1c269f010f36009
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
    version: 1.0.21
    sha: dabea159dc6eea9171a541b458134b70ca95e3162d068132b2b3b9bc01aad06e
  - kind: registry
    name: mac-notification-sys
    version: 0.6.15
    sha: fd604973958ddcc11b561193c0fb96ba146506ef2f231ef2e7c35fd2cbc9beca
  - kind: registry
    name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
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
    version: 0.9.11
    sha: d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: metal
    version: 0.33.0
    sha: c7047791b5bc903b8cd963014b355f71dc9864a9a0b727057676c1dcae5cbc15
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
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: miniz_oxide
    version: 0.9.1
    sha: b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c
  - kind: registry
    name: mio
    version: 1.2.3
    sha: 4b18443e9c262bfe8fa82f51666e2642c53393f7e5c27b3e1aeab922cff5b9d8
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
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: notify
    version: 8.2.0
    sha: 4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3
  - kind: registry
    name: notify-rust
    version: 4.18.0
    sha: c5b4c1b4f2aa9f25f63a7a49d3dd0ed567b3670da15330a66b29434be899b891
  - kind: registry
    name: notify-types
    version: 2.1.0
    sha: 42b8cfee0e339a0337359f3c88165702ac6e600dc01c0cc9579a92d62b08477a
  - kind: registry
    name: num-conv
    version: 0.2.2
    sha: 521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441
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
    version: 5.4.3
    sha: 7c603ab8300cf18bc3b14146b19fe3dfcc4843ae5a400cd0e7a30b95aa366634
  - kind: registry
    name: openssl-probe
    version: 0.2.1
    sha: 7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe
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
    version: 5.5.0
    sha: 8c7c9e0d9b23589f26070720bac724174bfec1083e82f7854cdd0267518343c0
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
    name: packagekit-zbus
    version: 0.2.0
    sha: c3c68e70a6f481d7df68d5463a3cf5185d667cca7125e3f8db7b74253c9e7e62
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
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: phf
    version: 0.13.1
    sha: c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf
  - kind: registry
    name: phf_generator
    version: 0.13.1
    sha: 135ace3a761e564ec88c03a77317a7c6b80bb7f7135ef2544dbe054243b89737
  - kind: registry
    name: phf_macros
    version: 0.13.1
    sha: 812f032b54b1e759ccd5f8b6677695d5268c588701effba24601f6932f8269ef
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
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
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
  - kind: registry
    name: pollster
    version: 0.4.0
    sha: 2f3a9f18d041e6d0e102a0a46750538147e5e8992d3b4873aaafee2520b00ce3
  - kind: registry
    name: portable-atomic
    version: 1.15.0
    sha: 05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85
  - kind: registry
    name: portable-atomic-util
    version: 0.2.7
    sha: c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618
  - kind: registry
    name: potential_utf
    version: 0.1.6
    sha: d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661
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
    name: pxfm
    version: 0.1.30
    sha: d55d956fa96f5ec02be2e13af0e20391a5aa83d6a074e3ad368959d0fab299ea
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.41.0
    sha: e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1
  - kind: registry
    name: quinn
    version: 0.11.11
    sha: 0c1a41e437b6bbd489372cd4971de128e85c855f56c57f283d20ff016cf7c0a8
  - kind: registry
    name: quinn-proto
    version: 0.11.17
    sha: 04759210543be93709136e28212294a659ef5001836ff4eab4d663e4529bba83
  - kind: registry
    name: quinn-udp
    version: 0.5.15
    sha: 35a133f956daabe89a61a685c2649f13d82d5aa4bd5d12d1277e1072a21c0694
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
    version: 0.10.2
    sha: c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80
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
    name: rand_pcg
    version: 0.10.2
    sha: caa0f4137e1c0a72f4c651489402276c8e8e1cf081f3b0ba156d2cbeef09e86a
  - kind: registry
    name: range-alloc
    version: 0.1.5
    sha: ca45419789ae5a7899559e9512e58ca889e41f04f1f2445e9f4b290ceccd1d08
  - kind: registry
    name: rangemap
    version: 1.8.0
    sha: a611d15b50743feb4c76b7d03edcb0e64f399c26961e4efe6975bc398be6aa3d
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
    name: redox_event
    version: 0.4.8
    sha: c5018d583d6d2f5499352aea8d177e9067d1eb03ab17c78169d5ba7a30001b15
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_syscall
    version: 0.9.3
    sha: d678d17679829e73d371e96880897e98fee2ded7acc0a50bdf8af2affa4b2fe5
  - kind: registry
    name: redox_users
    version: 0.5.2
    sha: a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac
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
    name: reqwest
    version: 0.13.4
    sha: 219c5811de6525e5416c7d5d53bb656d3afdbc6c5af816e0802bcfa42dbdc1c3
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
    name: ring
    version: 0.17.14
    sha: a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  - kind: registry
    name: ron
    version: 0.11.0
    sha: db09040cc89e461f1a265139777a2bde7f8d8c67c4936f700c63ce3e2904d468
  - kind: registry
    name: ron
    version: 0.12.2
    sha: 81116b9531d61eabc41aeb228e4b6b2435bcca3233b98cf3b3077d4e6e9debb3
  - kind: registry
    name: roxmltree
    version: 0.20.0
    sha: 6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97
  - kind: registry
    name: rust-embed
    version: 8.12.0
    sha: e9e7760e252aaba7b09f4be00e36476cf585bdb68a53552ac954cdf504ab4bc9
  - kind: registry
    name: rust-embed-impl
    version: 8.12.0
    sha: 3bcfc4d6f53af43755f7a723e4b6b8794fcce052a178dd8c6c1dadc5f5343097
  - kind: registry
    name: rust-embed-utils
    version: 8.12.0
    sha: 42ffa149f6aa81b58a5b3011d01a857c4ed12c7a732d2c51947a4c7c692185f0
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
    version: 1.1.4
    sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
  - kind: registry
    name: rustls
    version: 0.23.43
    sha: 0283386ce02abc0151e1761d08802dfe86c173b0b494af5cbc086574e453da06
  - kind: registry
    name: rustls-native-certs
    version: 0.8.4
    sha: dab5152771c58876a2146916e53e35057e1a4dfa2b9df0f0305b07f611fdea4d
  - kind: registry
    name: rustls-pki-types
    version: 1.15.1
    sha: 2f4925028c7eb5d1fcdaf196971378ed9d2c1c4efc7dc5d011256f76c99c0a96
  - kind: registry
    name: rustls-platform-verifier
    version: 0.7.0
    sha: 26d1e2536ce4f35f4846aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0
  - kind: registry
    name: rustls-platform-verifier-android
    version: 0.1.1
    sha: f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f
  - kind: registry
    name: rustls-webpki
    version: 0.103.15
    sha: f3c3cf1d8b1e7d4927e2d154c3fcb02979afb9939629c62cd9048d4f07b60ac2
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
    name: schannel
    version: 0.1.29
    sha: 91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.2
    sha: 687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a
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
    name: security-framework
    version: 3.7.0
    sha: b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d
  - kind: registry
    name: security-framework-sys
    version: 2.17.0
    sha: 6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3
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
    name: serde_core
    version: 1.0.229
    sha: 67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48
  - kind: registry
    name: serde_derive
    version: 1.0.229
    sha: e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348
  - kind: registry
    name: serde_json
    version: 1.0.151
    sha: c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14
  - kind: registry
    name: serde_repr
    version: 0.1.21
    sha: 8d3b1629de253c70a0508c3899572da79ca359fdab27c7920ff00406df418906
  - kind: registry
    name: serde_spanned
    version: 1.1.1
    sha: 6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26
  - kind: registry
    name: serde_with
    version: 3.22.0
    sha: ee78f1fbe43ac4a0e47aadb3dbd357b69eb0d3793e948624cd03dd2750ab1c0a
  - kind: registry
    name: serde_with_macros
    version: 3.22.0
    sha: 8705578779c2b6bd90d84d66eb2e206b708b1a4d7b9f17641b293545bf1c7e46
  - kind: registry
    name: serde_yaml
    version: 0.9.34+deprecated
    sha: 6a8b1a1a2ebf674015cc02edccce75287f1a0130d394307b36743c2f5d504b47
  - kind: registry
    name: sha2
    version: 0.11.0
    sha: 446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
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
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: simplecss
    version: 0.2.2
    sha: 7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c
  - kind: registry
    name: siphasher
    version: 1.0.3
    sha: 8ee5873ec9cce0195efcb7a4e9507a04cd49aec9c83d0389df45b1ef7ba2e649
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
    version: 1.16.0
    sha: b9be42f50aa861c555654aa3a37f52f4b1074bacf4e48fe0ef7fa584e80f1f0f
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
    version: 0.6.5
    sha: c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4
  - kind: git
    commit: c2b2c19ddb38ff17495643699f97cb1f2064a1be
    repo: github:pop-os/softbuffer
    query:
      tag: cosmic-4.0
    name: softbuffer
    version: 0.4.1
  - kind: git
    commit: d4cb6cff41941fba97ae808187285f21bfce5fbf
    repo: github:jackpot51/spdx.git
    name: spdx
    version: 0.10.6
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
    name: strum
    version: 0.24.1
    sha: 063e6045c0e62079840579a7e47a355ae92f60eb74daaf156fb1e84ba164e63f
  - kind: registry
    name: strum_macros
    version: 0.24.3
    sha: 1e385be0d24f186b4ce2f9982191e7101bb737312ad61c1f2f984f34bcf85d59
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
    version: 0.2.10
    sha: 6c2499c2d826531388872b2268718aed907a39bd785ab0dcfe57fab26283f92e
  - kind: git
    commit: eed01dd3609e90e3c8cd043656734c500956c793
    repo: github:pop-os/dbus-settings-bindings
    name: switcheroo-control
    version: 0.1.0
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
    version: 3.0.4
    sha: e6275cddf4610d1775e6d1fe9469b2e77d0f39fd98fb7450901b821e0c53649f
  - kind: registry
    name: sync_wrapper
    version: 1.0.2
    sha: 0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: sys-locale
    version: 0.3.2
    sha: 8eab9a99a024a169fe8a903cf9d4a3b3601109bcc13bd9e3c6fff259138626c4
  - kind: registry
    name: system-configuration
    version: 0.7.0
    sha: a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b
  - kind: registry
    name: system-configuration-sys
    version: 0.6.0
    sha: 8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4
  - kind: registry
    name: system-deps
    version: 7.0.8
    sha: 396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7
  - kind: registry
    name: taffy
    version: 0.9.2
    sha: 41ba83ebaf2954d31d05d67340fd46cebe99da2b7133b0dd68d70c65473a437b
  - kind: registry
    name: target-lexicon
    version: 0.13.5
    sha: adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca
  - kind: registry
    name: tauri-winrt-notification
    version: 0.7.3
    sha: 9ed071c670382e85fc2f48ae706492d8c338f4f89bf72520d32f8abfe880aade
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
    version: 2.0.20
    sha: ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.20
    sha: bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af
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
    version: 0.8.4
    sha: b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643
  - kind: registry
    name: tinyvec
    version: 1.12.0
    sha: bb4ebadaa0af04fab11ae01eb5f9fdb5f9c5b875506e210e71c07873528baa7f
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.53.1
    sha: 202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed
  - kind: registry
    name: tokio-macros
    version: 2.7.2
    sha: 78773a2a397f451582ce068015985c33193cf6dea8b74d2a639fe457b2f07b0e
  - kind: registry
    name: tokio-rustls
    version: 0.26.4
    sha: 1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61
  - kind: registry
    name: tokio-stream
    version: 0.1.19
    sha: a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b
  - kind: registry
    name: tokio-util
    version: 0.7.19
    sha: 494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml
    version: 1.1.0+spec-1.1.0
    sha: f8195ca05e4eb728f4ba94f3e3291661320af739c4e43779cbdfae82ab239fcc
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.25.6+spec-1.1.0
    sha: 0db3bae107c9522f86d361697dee1d7386a2ddcf659d5aea5159819a21a3c4a7
  - kind: registry
    name: toml_parser
    version: 1.1.3+spec-1.1.0
    sha: 1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56
  - kind: registry
    name: toml_writer
    version: 1.1.2+spec-1.1.0
    sha: 7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2
  - kind: registry
    name: tower
    version: 0.5.3
    sha: ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4
  - kind: registry
    name: tower-http
    version: 0.6.11
    sha: 4cfcf7e2740e6fc6d4d688b4ef00650406bb94adf4731e43c096c3a19fe40840
  - kind: registry
    name: tower-layer
    version: 0.3.3
    sha: 121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e
  - kind: registry
    name: tower-service
    version: 0.3.3
    sha: 8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3
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
    name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
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
    version: 1.13.3
    sha: c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8
  - kind: registry
    name: unicode-vo
    version: 0.1.0
    sha: b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94
  - kind: registry
    name: unicode-width
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
  - kind: registry
    name: unsafe-libyaml
    version: 0.2.11
    sha: 673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861
  - kind: registry
    name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
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
    version: 1.26.0
    sha: b5772d71c9be8a8a6ac2117d949c5b224c1b72241bb611d9a3012edcf8af7812
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
    name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
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
    version: 0.2.127
    sha: 1b70935747edd64d89de3efa29d73789b806c15798f8e7dca4d8ac356b50ce70
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.77
    sha: 6b7777d5cc23d0e91404e53ce2d5e8ec7acae3026b16233dba62cd3246457950
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.127
    sha: 77775f8f3f7217702089053b94958f8f54061a3f663417df76e19cbdcca29bc1
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.127
    sha: e11d33f857dc2fb11b8bc75aee111aa9cbeb12cd9f25efd3d4c2a3dd4e235284
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.127
    sha: 7ef64dbcc55df09c7e5a46182d181c2cfa3e925f3da937ea764728b4bbb9dcbf
  - kind: registry
    name: wasmtimer
    version: 0.4.3
    sha: 1c598d6b99ea013e35844697fc4670d08339d5cda15588f193c6beedd12f644b
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
    version: 0.3.104
    sha: c435338968042f4f59a557f690a253676d47ce13ceb55d70100e7facf6620a30
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: webpki-root-certs
    version: 1.0.9
    sha: b96554aa2acc8ccdb7e1c9a58a7a68dd5d13bccc69cd124cb09406db612a1c9b
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
    name: windows-registry
    version: 0.6.1
    sha: 02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720
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
    version: 0.60.2
    sha: f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb
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
    name: windows-targets
    version: 0.53.5
    sha: 4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3
  - kind: registry
    name: windows-threading
    version: 0.1.0
    sha: b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6
  - kind: registry
    name: windows-threading
    version: 0.2.1
    sha: 3949bd5b99cafdf1c7ca86b43ca564028dfe27d66958f2470940f73d86d75b37
  - kind: registry
    name: windows-version
    version: 0.1.7
    sha: e4060a1da109b9d0326b7262c8e12c84df67cc0dbc9e33cf49e01ccc2eb63631
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
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-android
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-appkit
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-common
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-core
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-orbital
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-uikit
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-wayland
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-web
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-win32
    version: 0.31.0-beta.2
  - kind: git
    commit: 71ce08c043814514a8fd92d9d0599f115ae854e8
    repo: github:pop-os/winit.git
    query:
      tag: cosmic-0.14
    name: winit-x11
    version: 0.31.0-beta.2
  - kind: registry
    name: winnow
    version: 1.0.4
    sha: 23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81
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
    commit: 3c08c30c2d77afb5130bbc42a74f479979b372dd
    repo: github:pop-os/cosmic-panel
    name: xdg-shell-wrapper-config
    version: 0.1.0
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
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yazi
    version: 0.2.1
    sha: e01738255b5a16e78bbb83e7fbba0a1e7dd506905cfc53f4622d89015a03fbb5
  - kind: registry
    name: yoke
    version: 0.8.3
    sha: 709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5
  - kind: registry
    name: yoke-derive
    version: 0.8.2
    sha: de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e
  - kind: registry
    name: zbus
    version: 5.19.0
    sha: 5db4be7c075cb421e4b7ee645541604239bd243ba7c357511f4ff3a74b555907
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
    name: zbus_names
    version: 4.3.4
    sha: d8bf88b4a3ff53e883001e0e0115b297a9d53c31b9c1edd2bfdd853e3428624e
  - kind: registry
    name: zbus_xml
    version: 5.2.1
    sha: d1586c021a01ca0a9216dcd874e546382e156a5cbab5fab6cb5f10087e22682a
  - kind: registry
    name: zcheapstr
    version: 1.1.0
    sha: d1afec51604565183aeb5c54c20aeab286120d4e4460f7f76e3e8bb8c0d99473
  - kind: registry
    name: zeno
    version: 0.3.3
    sha: 6df3dc4292935e51816d896edcd52aa30bc297907c26167fec31e2b0c6a32524
  - kind: registry
    name: zerocopy
    version: 0.8.56
    sha: 556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb
  - kind: registry
    name: zerocopy-derive
    version: 0.8.56
    sha: f2ab42fc20575779bd240faa45f94a74256f755c0fa9e89f0ede20d91d0cdfc1
  - kind: registry
    name: zerofrom
    version: 0.1.8
    sha: 0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272
  - kind: registry
    name: zerofrom-derive
    version: 0.1.7
    sha: 11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1
  - kind: registry
    name: zeroize
    version: 1.9.0
    sha: e13c156562582aa81c60cb29407084cdb54c4164760106ab78e6c5b0858cf64e
  - kind: registry
    name: zerotrie
    version: 0.2.5
    sha: 4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f
  - kind: registry
    name: zerovec
    version: 0.11.8
    sha: bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8
  - kind: registry
    name: zerovec-derive
    version: 0.11.6
    sha: 34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da
  - kind: registry
    name: zlib-rs
    version: 0.6.7
    sha: 34b31d188d9d685a4f9c7b46d6e36631b07058d2cfe190267adce54dc230bf12
  - kind: registry
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
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
    version: 0.5.3
    sha: d56377fd46368984a170bc5aac5567e52ca5da874caa60bea39fcbca78fb658b
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
    version: 5.15.0
    sha: c1d34c27cc6cdd1f458427519dd6b8612f7b7e3f7b9a0b2355d041dda9869147
  - kind: registry
    name: zvariant_derive
    version: 5.15.0
    sha: 864155e69b4352db0c7f374917bf45d1e0c8d17659c8b3dbf9795f3673f8c497
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
