kind: manual

build-depends:
- core-deps/sandbox-tools.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/_private/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- core-deps/just.bst
- core/libcosmic.bst
- freedesktop-sdk.bst:components/wayland.bst

depends:
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-idle.git
  track: master
  ref: epoch-1.10.0-0-g21e983c63e75640ab0055495e768a5c616742c19
- kind: cargo2
  url: "crates:"
  ref:
  - kind: registry
    name: aho-corasick
    version: 1.1.5
    sha: c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba
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
    name: approx
    version: 0.5.1
    sha: cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6
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
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: base64
    version: 0.23.1
    sha: ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.13.2
    sha: 3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
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
  - kind: git
    commit: 5a8bd9482a35ae94c1e54edf77b331c6b970f170
    repo: github:pop-os/libcosmic
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
    name: bytes
    version: 1.12.1
    sha: fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04
  - kind: registry
    name: calloop
    version: 0.14.5
    sha: 43b32313e937c8721c9d17ee9bf60699a6402b4b7c2cb6ac1bee0ffcaa4b4e5e
  - kind: registry
    name: calloop-wayland-source
    version: 0.4.1
    sha: 138efcf0940a02ebf0cc8d1eff41a1682a46b431630f4c52450d6265876021fa
  - kind: registry
    name: cc
    version: 1.6.0
    sha: f74872d07caf508b30a21f6836e7d7016a2eaf7d9ff4f48deaa58cd8a0407630
  - kind: registry
    name: cfg-if
    version: 1.0.5
    sha: 4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600
  - kind: registry
    name: cfg_aliases
    version: 0.2.2
    sha: f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527
  - kind: registry
    name: chrono
    version: 0.4.45
    sha: 1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327
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
    name: colorchoice
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: git
    commit: 5a8bd9482a35ae94c1e54edf77b331c6b970f170
    repo: github:pop-os/libcosmic
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: 5a8bd9482a35ae94c1e54edf77b331c6b970f170
    repo: github:pop-os/libcosmic
    name: cosmic-config-derive
    version: 1.0.0
  - kind: git
    commit: 30aecb52621a1e0b8dc1cf5ccaf0555736d6bec4
    repo: github:pop-os/cosmic-settings-daemon
    name: cosmic-settings-config
    version: 1.9.0
  - kind: registry
    name: crossbeam-utils
    version: 0.8.23
    sha: a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6
  - kind: registry
    name: cursor-icon
    version: 1.2.0
    sha: f27ae1dd37df86211c42e150270f82743308803d90a6f6e6651cd730d5e1732f
  - kind: registry
    name: darling
    version: 0.24.1
    sha: ed17f5901b6630b993ca003def43f2f8ef4014fc13b047b57aad617ff32bc2ec
  - kind: registry
    name: darling_core
    version: 0.24.1
    sha: 6837e2cf7485aaae18f86181d2f0e9a7ed297a025e220aeabf63fdebd3a2ddff
  - kind: registry
    name: darling_macro
    version: 0.24.1
    sha: 2ac7135c3ef02b2f7833bbeb1be5ba7f966dcde8a87c6b87f65a778d71a02785
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
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
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
    name: downcast-rs
    version: 1.2.1
    sha: 75b325c5dbd37f80359721ad39aca5a29fb04c89279657cffdda8736d0c0b9d2
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
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
    name: find-msvc-tools
    version: 0.1.14
    sha: aedcfb3409746eddb02b9e19ebda1c3394f759a152e48ee875a0844d1b955484
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
    version: 0.4.3
    sha: 300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099
  - kind: registry
    name: glam
    version: 0.25.0
    sha: 151665d9be52f9bb40fc7966565d39666f2d1e69233571b71b87791c7e0528b3
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.17.1
    sha: ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
  - kind: registry
    name: hermit-abi
    version: 0.5.3
    sha: e17592d60ebacc7d5e169f4663c5f84f9161cc90328abcfe8456f41e4dfcb284
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: iana-time-zone
    version: 0.1.65
    sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: git
    commit: 5a8bd9482a35ae94c1e54edf77b331c6b970f170
    repo: github:pop-os/libcosmic
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: 5a8bd9482a35ae94c1e54edf77b331c6b970f170
    repo: github:pop-os/libcosmic
    name: iced_futures
    version: 0.14.0
  - kind: registry
    name: ident_case
    version: 1.0.1
    sha: b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.2
    sha: cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855
  - kind: registry
    name: inotify
    version: 0.11.5
    sha: 4cc00ea907cab49550b7da656f80ebb97be1b997d931fbcd28d39734e17ce592
  - kind: registry
    name: inotify-sys
    version: 0.1.8
    sha: c033f80b2c113cdf91ab7a33faa9cbc014726dcad99880c8609af2a370edf37d
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
    version: 0.2.37
    sha: 0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb
  - kind: registry
    name: jiff-core
    version: 0.1.1
    sha: 5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c
  - kind: registry
    name: jiff-static
    version: 0.2.37
    sha: 378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212
  - kind: registry
    name: jiff-tzdb
    version: 0.1.8
    sha: 142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e
  - kind: registry
    name: jiff-tzdb-platform
    version: 0.1.3
    sha: 875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8
  - kind: registry
    name: js-sys
    version: 0.3.106
    sha: 7883d941dae510fb2d978fc3fe018c71c9e2892fd38854de3e8b92c2e5ad9cc5
  - kind: registry
    name: keyframe
    version: 1.1.1
    sha: 60708bf7981518d09095d6f5673ce5cf6a64f1e0d9708b554f670e6d9d2bd9a9
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
    name: libc
    version: 0.2.190
    sha: ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78
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
    name: lilt
    version: 0.8.2
    sha: 337d4c256f7d9f2dbd633891d48ace853efa5b1554122d9220b172ad9c03c3a9
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.34
    sha: f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6
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
    version: 0.9.11
    sha: d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: git
    commit: f68595ee0e62fbd6589f4709b5aaa5c3c7ea5f6c
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: mime
    version: 0.1.0
  - kind: registry
    name: mint
    version: 0.5.9
    sha: e53debba6bda7a793e5f99b8dacf19e626084f525f7829104ba9898f367d85ff
  - kind: registry
    name: mio
    version: 1.2.4
    sha: 1788edb87fdc09c7e26304471e2f5be8cdefb1b6930d6e3985fc02ff53bf86ee
  - kind: registry
    name: notify
    version: 8.2.0
    sha: 4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3
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
    name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - kind: registry
    name: objc-foundation
    version: 0.1.1
    sha: 1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9
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
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
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
    name: phf
    version: 0.13.1
    sha: c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf
  - kind: registry
    name: phf_shared
    version: 0.13.1
    sha: e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: pin-utils
    version: 0.1.1
    sha: 13bee6c73da26345c729282832b60b0363cf3dd9f4bfd81d8551b7a1c889a113
  - kind: registry
    name: piper
    version: 0.2.5
    sha: c835479a4443ded371d6c535cbfd8d31ad92c5d23ae9770a61bc155e4992a3c1
  - kind: registry
    name: pkg-config
    version: 0.3.34
    sha: f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548
  - kind: registry
    name: polling
    version: 3.11.0
    sha: 5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218
  - kind: registry
    name: portable-atomic
    version: 1.15.0
    sha: 05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85
  - kind: registry
    name: portable-atomic-util
    version: 0.2.8
    sha: 10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715
  - kind: registry
    name: powerfmt
    version: 0.2.1
    sha: 4a6394b9e965e73d0a289ee54f589087e2c676aedf60885baf52c76b771e4958
  - kind: registry
    name: proc-macro-crate
    version: 3.5.0
    sha: e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
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
    version: 6.0.0
    sha: f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
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
    name: ron
    version: 0.11.0
    sha: db09040cc89e461f1a265139777a2bde7f8d8c67c4936f700c63ce3e2904d468
  - kind: registry
    name: ron
    version: 0.12.2
    sha: 81116b9531d61eabc41aeb228e4b6b2435bcca3233b98cf3b3077d4e6e9debb3
  - kind: registry
    name: rustc-hash
    version: 2.1.3
    sha: 6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.5
    sha: 891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d
  - kind: registry
    name: rustversion
    version: 1.0.23
    sha: cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f
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
    name: serde_with
    version: 3.24.0
    sha: df9adc193c780ef8f159aee8b61e2d5801aaa555e6eb0947fe45530ec506296f
  - kind: registry
    name: serde_with_macros
    version: 3.24.0
    sha: 3e17bbc68e28663bbbb90df47e058aa7eda4fb445b89fe70457bb94fbccf6e49
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: siphasher
    version: 1.0.4
    sha: 33f4fe9184a62d842c9ef383018f3306d8ba224fd9d836f56d7288308847c256
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
  - kind: registry
    name: smallvec
    version: 1.16.2
    sha: f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e
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
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
  - kind: registry
    name: syn
    version: 3.0.6
    sha: 8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee
  - kind: registry
    name: tempfile
    version: 3.27.0
    sha: 32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd
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
    name: tinyvec
    version: 1.13.3
    sha: fd3ca314f692efd6c868f8408f53fe444634a845f96c028b97d35f6a1f79f0ee
  - kind: registry
    name: tokio
    version: 1.53.2
    sha: e95f91fcc7a621e8b030f6aa23c71fe9838ae2fb4d8118b75602a328f5144044
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.25.15+spec-1.1.0
    sha: 1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614
  - kind: registry
    name: toml_parser
    version: 1.1.3+spec-1.1.0
    sha: 1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56
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
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: uds_windows
    version: 1.2.1
    sha: f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e
  - kind: registry
    name: unicode-ident
    version: 1.0.26
    sha: d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954
  - kind: registry
    name: unicode-segmentation
    version: 1.13.3
    sha: c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8
  - kind: git
    commit: eed01dd3609e90e3c8cd043656734c500956c793
    repo: github:pop-os/dbus-settings-bindings
    name: upower_dbus
    version: 0.3.2
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.27.0
    sha: 97277d36b9c3ace13e58fa6e753f8b0bbbf302a18dd193240d70f9e29681059a
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasm-bindgen
    version: 0.2.129
    sha: 9bb54f33acc68fd454578d9820b0bde1a1a3d17aa17bb7b6595806d02886d409
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.79
    sha: 3cbab34de2d982e9b48e18d216d04c4a6f641066ff19ffb699980f591ee3610e
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.129
    sha: 2e29d0c35b16e224a7eeb5cd2d25e3e1968fbd65604117b44d3b789d00ee8535
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.129
    sha: 6f501a8bc3719dba86ef8ae4728879c08001bea749eb1333ac5b91e040e2a6b7
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.129
    sha: 23f0c9c52aa7cd7d77769a4cfe2a9adb1b331f489a41d912ce14513d5ab995c6
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
    name: wayland-protocols-wlr
    version: 0.3.12
    sha: eb04e52f7836d7c7976c78ca0250d61e33873c34156a2a1fc9474828ec268234
  - kind: registry
    name: wayland-scanner
    version: 0.31.11
    sha: 338e30461b3a2b67d70eb30a6d89f8e0c93a833e07d2ae89085cd070c4a00ac0
  - kind: registry
    name: wayland-sys
    version: 0.31.11
    sha: d8eab23fefc9e41f8e841df4a9c707e8a8c4ed26e944ef69297184de2785e3be
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
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
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
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
  - kind: registry
    name: winnow
    version: 1.0.4
    sha: 23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81
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
  - kind: registry
    name: xkbcommon
    version: 0.9.0
    sha: a7a974f48060a14e95705c01f24ad9c3345022f4d97441b8a36beb7ed5c4a02d
  - kind: registry
    name: xkeysym
    version: 0.2.1
    sha: b9cc00251562a284751c9973bace760d86c0276c471b4be569fe6b068ee97a56
  - kind: registry
    name: zbus
    version: 5.19.0
    sha: 5db4be7c075cb421e4b7ee645541604239bd243ba7c357511f4ff3a74b555907
  - kind: registry
    name: zbus_macros
    version: 5.19.0
    sha: 2990635d09ade6df1868f72f8cac69a876a90981e8bd3c40b1be413f8dc88f40
  - kind: registry
    name: zbus_names
    version: 4.3.4
    sha: d8bf88b4a3ff53e883001e0e0115b297a9d53c31b9c1edd2bfdd853e3428624e
  - kind: registry
    name: zcheapstr
    version: 1.1.0
    sha: d1afec51604565183aeb5c54c20aeab286120d4e4460f7f76e3e8bb8c0d99473
  - kind: registry
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
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
