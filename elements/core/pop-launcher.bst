kind: manual

build-depends:
- core-deps/sandbox-tools.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/_private/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/sed.bst
- core-deps/just.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/launcher.git
  track: master
  ref: epoch-1.11.0-2-g4111617b7345134abe67332a7baa5ef12538f412
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
    name: anyhow
    version: 1.0.104
    sha: 330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470
  - kind: registry
    name: async-io
    version: 2.6.0
    sha: 456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc
  - kind: registry
    name: async-oneshot
    version: 0.5.9
    sha: ae47de2a02d543205f3f5457a90b6ecbc9494db70557bd29590ec8f1ddff5463
  - kind: registry
    name: async-pidfd
    version: 0.1.5
    sha: 958321a23896f573a3f1809437af5816f3bc90dd2d5ffe8b1cd5645f42230c17
  - kind: registry
    name: async-trait
    version: 0.1.92
    sha: 82f6aeea286b8eb4dd3431a1be1b59d290ace00f5bfd8e2a159bc2a05e2c1667
  - kind: registry
    name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: aws-lc-rs
    version: 1.19.0
    sha: 048006790404103c488e6c5616b3e7e702a71292aadda08e8f7698a9e0d2eb53
  - kind: registry
    name: aws-lc-sys
    version: 0.47.0
    sha: 8bfbe32ac36b3c428696ce315464181bc4029d689fd58e3f2a4e58c252242f52
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
    name: bs58
    version: 0.5.1
    sha: bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4
  - kind: registry
    name: bstr
    version: 1.13.1
    sha: 6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f
  - kind: registry
    name: bumpalo
    version: 3.20.3
    sha: 72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649
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
    version: 1.11.1
    sha: 4ff2a8126fff0f8c839080d619675a585e61720bb12d2baceae45769fd66f155
  - kind: registry
    name: cfb
    version: 0.7.3
    sha: d38f2da7a0a2c4ccf0065be06397cc26a81f4e528be095826eee9d4adbb8c60f
  - kind: registry
    name: cfg-if
    version: 1.0.5
    sha: 4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600
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
    name: cmake
    version: 0.1.58
    sha: c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678
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
    name: const_format
    version: 0.2.37
    sha: a3decb4d6965448659923544a634a0571ba44cede4e11ef15a5a317126840454
  - kind: registry
    name: const_format_proc_macros
    version: 0.2.37
    sha: 941b570269a642506f08cb5b688c04bfa6cfd41a26f8bcdc49db8fd00c0ab659
  - kind: registry
    name: core-foundation
    version: 0.10.1
    sha: b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: git
    commit: c0cff4db14c37ed954983158e4055aa94c7741d9
    repo: github:pop-os//cosmic-protocols
    name: cosmic-client-toolkit
    version: 0.2.0
  - kind: git
    commit: c0cff4db14c37ed954983158e4055aa94c7741d9
    repo: github:pop-os//cosmic-protocols
    name: cosmic-protocols
    version: 0.2.0
  - kind: registry
    name: cpufeatures
    version: 0.3.1
    sha: 5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566
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
    name: dirs
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - kind: registry
    name: dirs
    version: 7.0.0
    sha: 8d57d423b3c82e89b9a24ca3091fee61f456a26edbd28d26c65906f4bc1dcd8f
  - kind: registry
    name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: displaydoc
    version: 0.2.7
    sha: c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8
  - kind: registry
    name: downcast-rs
    version: 1.2.1
    sha: 75b325c5dbd37f80359721ad39aca5a29fb04c89279657cffdda8736d0c0b9d2
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: endi
    version: 1.1.1
    sha: 66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099
  - kind: registry
    name: equivalent
    version: 1.0.3
    sha: 00d174d5400e5e8fd687ad1049e2f578285fa914201b1af7e8b112a4546bd826
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: fastrand
    version: 2.5.0
    sha: da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223
  - kind: registry
    name: find-msvc-tools
    version: 0.1.15
    sha: 1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48
  - kind: registry
    name: flume
    version: 0.12.0
    sha: 5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: fork
    version: 0.11.0
    sha: 9b8b9dc1312e1668be5ffa350e3c0adc9b501b2eeebb1b31206477240cc96554
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: freedesktop-desktop-entry
    version: 0.8.4
    sha: 42a69ad6111a2b572cb41e0f3542d546386e841013cee7c45d705b61a15a87dd
  - kind: registry
    name: fs_extra
    version: 1.3.0
    sha: 42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c
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
    name: futures-micro
    version: 0.5.0
    sha: b460264b3593d68b16a7bc35f7bc226ddfebdf9a1c8db1ed95d5cc6b7168c826
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
    name: gen-z
    version: 0.1.0
    sha: 0e87038e64f38cb7fcd57f54c8d6654ad65712babbf70f38d1834d3150ad2415
  - kind: registry
    name: getrandom
    version: 0.2.17
    sha: ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0
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
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.17.1
    sha: ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
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
    name: human-sort
    version: 0.2.2
    sha: 140a09c9305e6d5e557e2ed7cbc68e05765a7d4213975b87cb04920689cc6219
  - kind: registry
    name: human_format
    version: 1.2.1
    sha: eaec953f16e5bcf6b8a3cb3aa959b17e5577dbd2693e94554c462c08be22624b
  - kind: registry
    name: hyper
    version: 1.12.0
    sha: 2c3e324da4c95177d6291d4c8730197c0d1822f8a9766814a4a44fa5ab797c9c
  - kind: registry
    name: hyper-rustls
    version: 0.27.10
    sha: dfa8e654703247911e29c23fbeaa261834bd9bb74efba2f9acddc37bfb127f53
  - kind: registry
    name: hyper-util
    version: 0.1.21
    sha: ddc03d96684f9226b8a787cdb71488417b53ab5ea8fdb1dac946cb9431cc8bff
  - kind: registry
    name: iana-time-zone
    version: 0.1.65
    sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: registry
    name: icu_collections
    version: 2.4.0
    sha: fe090a42a0d3140fed8c63263ed1fecc02422cb2f4bfe55cd8de2de1b8e105dd
  - kind: registry
    name: icu_locale_core
    version: 2.4.0
    sha: 25d29b57c17c6528d0dc4c2141cfa2d08200465acb537a3909c8b9b8a4a984c0
  - kind: registry
    name: icu_normalizer
    version: 2.4.0
    sha: 404a3b8c486f205c87fe7f23ab6894d84a4ad76d6e4671ae1981ba7def87c599
  - kind: registry
    name: icu_normalizer_data
    version: 2.4.0
    sha: 20f0088bfb7441f7a37fa0c9e20cb1e9cba1cac6b9ce8cd2a6dc44294f8e8cbc
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
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.2
    sha: cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855
  - kind: registry
    name: infer
    version: 0.16.0
    sha: bc150e5ce2330295b8616ce0e3f53250e53af31759a9dbedad1621ba29151847
  - kind: registry
    name: ipnet
    version: 2.12.2
    sha: 791930b43c0d5973160d90a8f3894509f2b273430f5c5c73b668636d0287c5c0
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
    name: konst
    version: 0.2.20
    sha: 128133ed7824fcd73d6e7b17957c5eb7bacb885649bd8c69708b2331a10bcefb
  - kind: registry
    name: konst_macro_rules
    version: 0.2.19
    sha: a4933f3f57a8e9d9da04db23fb153356ecaf00cbd14aee46279c33dc80925c37
  - kind: registry
    name: lazy_static
    version: 1.5.1
    sha: 20870f649af7073d53e38067b2a84312175d56ea15217e1b15bc83506ec50afb
  - kind: registry
    name: libc
    version: 0.2.191
    sha: 65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a
  - kind: registry
    name: libmimalloc-sys
    version: 0.1.49
    sha: 6a45a52f43e1c16f667ccfe4dd8c85b7f7c204fd5e3bf46c5b0db9a5c3c0b8e9
  - kind: registry
    name: libredox
    version: 0.1.25
    sha: 61ff90caf6077a803a240f62fdbe88645a890bbca49ef8174c3cb0404362171d
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: litemap
    version: 0.8.3
    sha: 47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae
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
    version: 0.4.35
    sha: 5d15f86d12da44cd8d4ec3c73984537eb7f4cadcb9776a575a0a8a05ca11005c
  - kind: registry
    name: lru-slab
    version: 0.1.3
    sha: 4050469837a6ff301cd14c1f8f24f88549e6d548f24f64e2148eb0f72cebc51f
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
    version: 2.8.3
    sha: cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98
  - kind: registry
    name: memmap2
    version: 0.9.12
    sha: 6b0ca1155a9ecc25aa12e8313a119f32edf0255fea2f44839c4ac0a12b2ac157
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: mimalloc
    version: 0.1.52
    sha: 2d4139bb28d14ad1facf21d5eb8825051b326e172d216b39f6d31df53cc97862
  - kind: registry
    name: mime
    version: 0.3.18
    sha: d5848f5a9e8117cf94f2f90faac24a87ff81600ff8628c1e3deaab572e76bfa1
  - kind: registry
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: mio
    version: 1.2.4
    sha: 1788edb87fdc09c7e26304471e2f5be8cdefb1b6930d6e3985fc02ff53bf86ee
  - kind: registry
    name: new_mime_guess
    version: 4.0.4
    sha: 02a2dfb3559d53e90b709376af1c379462f7fb3085a0177deb73e6ea0d99eff4
  - kind: registry
    name: num-conv
    version: 0.2.2
    sha: 521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: num_cpus
    version: 1.17.0
    sha: 91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b
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
    name: openssl-probe
    version: 0.2.2
    sha: 7e036b411754132fd6b74e94b74e9a13c5cf606fa93d1885c35860d3060820b1
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
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
    name: potential_utf
    version: 0.1.6
    sha: d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661
  - kind: registry
    name: powerfmt
    version: 0.2.1
    sha: 4a6394b9e965e73d0a289ee54f589087e2c676aedf60885baf52c76b771e4958
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
  - kind: registry
    name: quick-xml
    version: 0.36.2
    sha: f7649a7b4df05aed9ea7ec6f628c67c9953a43869b8bc50929569b2999d443fe
  - kind: registry
    name: quick-xml
    version: 0.41.0
    sha: e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1
  - kind: registry
    name: quinn
    version: 0.11.12
    sha: 4051e23e9185c255a7e33ef59cdbca87a22d359052eecd22fc6b901fb37d9d11
  - kind: registry
    name: quinn-proto
    version: 0.11.19
    sha: 0e750cca55fe4f0439a15d0bb529da9651e79993e8e72c61a899a36d462befbe
  - kind: registry
    name: quinn-udp
    version: 0.5.16
    sha: af66907df18639dcf4db56ca65490cabc4b27a97dbadd96f2926cca73298f016
  - kind: registry
    name: quote
    version: 1.0.47
    sha: 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
  - kind: registry
    name: r-efi
    version: 6.0.0
    sha: f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf
  - kind: registry
    name: rand
    version: 0.10.3
    sha: 65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af
  - kind: registry
    name: rand_core
    version: 0.10.1
    sha: 63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69
  - kind: registry
    name: rand_pcg
    version: 0.10.2
    sha: caa0f4137e1c0a72f4c651489402276c8e8e1cf081f3b0ba156d2cbeef09e86a
  - kind: registry
    name: recently-used-xbel
    version: 1.2.0
    sha: 63ab2febcd4f0245fbadd0b44f7cd35207128a7b210a089e65740625a45399b5
  - kind: registry
    name: redox_users
    version: 0.4.6
    sha: ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43
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
    name: reqwest
    version: 0.13.5
    sha: 16a1cfa75cc186dd73d5818e510e042e40927bccc9c236b061cea97e1eb08029
  - kind: registry
    name: ring
    version: 0.17.14
    sha: a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  - kind: registry
    name: ron
    version: 0.12.3
    sha: 97b3fe97c18ff24299ea56f802c5693eb34266fb0bc8317f4e101debc8a3ceaf
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
    version: 1.1.6
    sha: e5e76742e5294153d4dde1207dbec5bdd81eef6fabdc0d2118babadabfd858aa
  - kind: registry
    name: rustls
    version: 0.23.46
    sha: 48e13bd8c0e9365c43cfa5c9e8f9ad49d3c8444926c9aac819e0e4dc503c8fdf
  - kind: registry
    name: rustls-native-certs
    version: 0.8.5
    sha: 4a073f5dc7469f984c52ad2752b63b0807745133b6de880b7b64c1ac4c48aec4
  - kind: registry
    name: rustls-pki-types
    version: 1.15.1
    sha: 2f4925028c7eb5d1fcdaf196971378ed9d2c1c4efc7dc5d011256f76c99c0a96
  - kind: registry
    name: rustls-platform-verifier
    version: 0.7.1
    sha: 1167586491e2b18b8bfbb293e8180ec17c201c4f076d7cb3070ca964e7598f98
  - kind: registry
    name: rustls-platform-verifier-android
    version: 0.2.0
    sha: eec689c0bc40ff2458a5977b6619cb718087084a18e02a131c599b62d05e1a5f
  - kind: registry
    name: rustls-webpki
    version: 0.103.16
    sha: 4443b1b6d39d7c663139942cc4558262562d2c84123bb6282ef177009ca8b281
  - kind: registry
    name: rustversion
    version: 1.0.23
    sha: cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: schannel
    version: 0.1.30
    sha: 9cb23c424d8ee841bb4d813677ca237e2a610067d594fec130f87d6093495ab5
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.3
    sha: ab508826f74a77ca9d5aba6ff19b522583ee3eaf28a19384ff3d0e5835fadf6e
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: security-framework
    version: 3.7.0
    sha: b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d
  - kind: registry
    name: security-framework-sys
    version: 2.17.0
    sha: 6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3
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
    version: 1.0.154
    sha: e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6
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
    name: simd_cesu8
    version: 1.2.0
    sha: 11031e251abf8611c80f460e19dbdeb54a66db918e49c65a7065b46ac7aec520
  - kind: registry
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
  - kind: registry
    name: smallvec
    version: 1.16.4
    sha: d0d5d4b1981b8bbbb7aed204cae5726d683d5d6ac7e74ec54122ea28f315e7c8
  - kind: registry
    name: smithay-client-toolkit
    version: 0.20.0
    sha: 0512da38f5e2b31201a93524adb8d3136276fa4fe4aafab4e1f727a82b534cc0
  - kind: registry
    name: socket2
    version: 0.6.5
    sha: c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4
  - kind: registry
    name: spin
    version: 0.9.9
    sha: 3763264f6b73151db08c50ff20d7d8a0b8796e021cdea7ceedad07b80155fa0e
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: git
    commit: 6ccc9fbf034220f0142bc907a7d7513b49aba0e1
    repo: github:pop-os/dbus-settings-bindings
    name: switcheroo-control-zbus
    version: 1.0.0
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
  - kind: registry
    name: syn
    version: 3.0.9
    sha: d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b
  - kind: registry
    name: sync_wrapper
    version: 1.0.2
    sha: 0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263
  - kind: registry
    name: synstructure
    version: 0.14.0
    sha: 901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02
  - kind: registry
    name: temp-dir
    version: 0.1.16
    sha: 83176759e9416cf81ee66cb6508dbfe9c96f20b8b56265a39917551c23c70964
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
    name: tokio-rustls
    version: 0.26.6
    sha: c9cc2678c2cdd569ef8215e2afd7954ada2ae20b4fdd2c5fe6139a3b02d105db
  - kind: registry
    name: tokio-stream
    version: 0.1.19
    sha: a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b
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
    name: tracing-journald
    version: 0.3.2
    sha: 2d3a81ed245bfb62592b1e2bc153e77656d94ee6a0497683a65a12ccaf2438d0
  - kind: registry
    name: tracing-subscriber
    version: 0.3.23
    sha: cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319
  - kind: registry
    name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: uds_windows
    version: 1.2.1
    sha: f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e
  - kind: registry
    name: unicase
    version: 2.10.0
    sha: 357cc3acc6a036009fd6c973ed009037c732d60d0b4f6c673e9041497482a28f
  - kind: registry
    name: unicode-ident
    version: 1.0.27
    sha: a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
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
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: want
    version: 0.3.2
    sha: ec4cdd0dd910afe868b7ef477227d8d538b46b3075031afee8a9f2acb0a2ed0b
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
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
    name: webpki-root-certs
    version: 1.0.11
    sha: e49d0e65abc00c142e8f9428da991da9f1a250c39be97459901eb12b9b49f62a
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
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
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
  - kind: registry
    name: winnow
    version: 1.0.5
    sha: 8c3b93199df0ab874cdf0c6a94f0a0dc3423fe41f1cafb62b8bd7b1deb277aef
  - kind: registry
    name: writeable
    version: 0.6.4
    sha: 3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc
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
    version: 0.8.0
    sha: 8d66ca9352cbd4eecbbc40871d8a11b4ac8107cfc528a6e14d7c19c69d0e1ac9
  - kind: registry
    name: xkeysym
    version: 0.2.1
    sha: b9cc00251562a284751c9973bace760d86c0276c471b4be569fe6b068ee97a56
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
    version: 6.2.1
    sha: 0ddb2961d9587ef9f24ad14cde1c3bc4c5edc9f1525932a8cffdd5bd98886eb9
  - kind: registry
    name: zbus_macros
    version: 6.2.1
    sha: 083b38add47c340fc12ec560124fb1d9c23acb584f7021099f85ec6587a03c54
  - kind: registry
    name: zbus_utils
    version: 6.1.0
    sha: af55e52da295311b368c45bcae221f020e28e97a2420360170ce389218e76ec7
  - kind: registry
    name: zcheapstr
    version: 1.2.0
    sha: 939f186d9ecebe044315a5cb6d6f78568bbc21152adc954d5a0c2f58bdbc9920
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
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
  - kind: registry
    name: zruntime
    version: 0.2.2
    sha: 23ef5ed7d628cdf0af82f93dfe03330a8e37383bf7422a1d3d6eb72326680be5
config:
  configure-commands: []
  build-commands:
  - |
    just build-release
  install-commands:
  - |
    just rootdir="%{install-root}" install
  strip-commands:
  - |
    %{strip-binaries}
