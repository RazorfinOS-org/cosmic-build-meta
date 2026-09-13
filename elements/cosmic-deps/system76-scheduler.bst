# system76-scheduler - CFS latency / process priority daemon; cosmic-comp
# boosts the foreground window via D-Bus. llvm = libclang for bindgen.
kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/llvm.bst
- freedesktop-sdk.bst:components/pipewire.bst
- core-deps/just.bst

depends:
- freedesktop-sdk.bst:components/pipewire.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/system76-scheduler.git
  track: master
  ref: 2.0.2-5-g8651bbf74bcfc8a46443b30199b380e12defa97e
- kind: cargo2
  url: "crates:"

  ref:
  - kind: registry
    name: aho-corasick
    version: 0.7.20
    sha: cc936419f96fa211c1b9166887b38e5e40b19958e5b895be7c1f93adec7071ac
  - kind: registry
    name: annotate-snippets
    version: 0.11.5
    sha: 710e8eae58854cdc1790fcb56cca04d712a17be849eeb81da2a724bf4bae2bc4
  - kind: registry
    name: anstream
    version: 0.3.0
    sha: 9e579a7752471abc2a8268df8b20005e3eadd975f585398f17efcfd8d4927371
  - kind: registry
    name: anstyle
    version: 1.0.14
    sha: 940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000
  - kind: registry
    name: anstyle-parse
    version: 0.2.0
    sha: e765fd216e48e067936442276d1d57399e37bce53c264d6fefbe298080cb57ee
  - kind: registry
    name: anstyle-query
    version: 1.0.0
    sha: 5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b
  - kind: registry
    name: anstyle-wincon
    version: 1.0.0
    sha: 4bcd8291a340dd8ac70e18878bc4501dd7b4ff970cfa21c207d36ece51ea88fd
  - kind: registry
    name: anyhow
    version: 1.0.70
    sha: 7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4
  - kind: registry
    name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
  - kind: registry
    name: async-channel
    version: 1.8.0
    sha: cf46fee83e5ccffc220104713af3292ff9bc7c64c7de289f66dae8e38d826833
  - kind: registry
    name: async-executor
    version: 1.5.0
    sha: 17adb73da160dfb475c183343c8cccd80721ea5a605d3eb57125f0a7b7a92d0b
  - kind: registry
    name: async-fs
    version: 1.6.0
    sha: 279cf904654eeebfa37ac9bb1598880884924aab82e290aa65c9e77a0e142e06
  - kind: registry
    name: async-io
    version: 1.13.0
    sha: 0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af
  - kind: registry
    name: async-lock
    version: 2.7.0
    sha: fa24f727524730b077666307f2734b4a1a1c57acb79193127dcc8914d5242dd7
  - kind: registry
    name: async-recursion
    version: 1.0.4
    sha: 0e97ce7de6cf12de5d7226c73f5ba9811622f4db3a5b91b55c53e987e5f91cba
  - kind: registry
    name: async-task
    version: 4.4.0
    sha: ecc7ab41815b3c653ccd2978ec3255c81349336702dfdf62ee6f7069b12a3aae
  - kind: registry
    name: async-trait
    version: 0.1.68
    sha: b9ccdd8f2a161be9bd5c023df56f1b2a0bd1d83872ae53b71a84a12c9bf6e842
  - kind: registry
    name: atoi
    version: 2.0.0
    sha: f28d99ec8bfea296261ca1af174f24225171fea9664ba9003cbebee704810528
  - kind: registry
    name: atomic-waker
    version: 1.1.0
    sha: debc29dde2e69f9e47506b525f639ed42300fc014a3e007832592448fa8e4599
  - kind: registry
    name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - kind: registry
    name: bindgen
    version: 0.72.1
    sha: 993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895
  - kind: registry
    name: bitflags
    version: 1.2.1
    sha: cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693
  - kind: registry
    name: bitflags
    version: 2.13.1
    sha: b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: blocking
    version: 1.3.0
    sha: 3c67b173a56acffd6d2326fb7ab938ba0b00a71480e14902b2591c87bc5741e8
  - kind: registry
    name: bstr
    version: 1.4.0
    sha: c3d4260bcc2e8fc9df1eac4919a720effeb63a3f0952f5bf4944adfa18897f09
  - kind: registry
    name: bytelines
    version: 2.4.0
    sha: 784face321c535fcd9a1456632fa720aa53ea0640b57341d961c8c09de2da59f
  - kind: registry
    name: byteorder
    version: 1.4.3
    sha: 14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610
  - kind: registry
    name: bytes
    version: 1.4.0
    sha: 89b2fd2a0dcf38d7971e2194b6b6eebab45ae01067456a7fd93d5547a61b70be
  - kind: registry
    name: castaway
    version: 0.2.2
    sha: 8a17ed5635fc8536268e5d4de1e22e81ac34419e5f052d4d51f4e01dcc263fcc
  - kind: registry
    name: cc
    version: 1.0.79
    sha: 50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f
  - kind: registry
    name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - kind: registry
    name: cfg-expr
    version: 0.18.0
    sha: 1a2b34126159980f92da2a08bdec0694fd80fb5eb9e48aff25d20a0d8dfa710d
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: clang-sys
    version: 1.6.1
    sha: c688fc74432808e3eb684cae8830a86be1d66a2bd58e1f248ed0960a590baf6f
  - kind: registry
    name: clap
    version: 4.2.2
    sha: 9b802d85aaf3a1cdb02b224ba472ebdea62014fccfcb269b95a4d76443b5ee5a
  - kind: registry
    name: clap_builder
    version: 4.2.2
    sha: 14a1a858f532119338887a4b8e1af9c60de8249cd7bafd68036a489e261e37b6
  - kind: registry
    name: clap_lex
    version: 0.4.1
    sha: 8a2dd5a6fe8c6e3502f568a6353e5273bbb15193ad9a89e457b9970798efbea1
  - kind: registry
    name: colorchoice
    version: 1.0.0
    sha: acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7
  - kind: registry
    name: compact_str
    version: 0.7.0
    sha: bff0805f79ecb1b35163f3957a6934ea8d04fcd36ef98b52e7316f63e72e73d1
  - kind: registry
    name: concat-in-place
    version: 1.1.0
    sha: c5b80dba65d26e0c4b692ad0312b837f1177e8175031af57fd1de4f3bc36b430
  - kind: registry
    name: concurrent-queue
    version: 2.1.0
    sha: c278839b831783b70278b14df4d45e1beb1aad306c07bb796637de9a0e323e8e
  - kind: registry
    name: const_format
    version: 0.2.30
    sha: 7309d9b4d3d2c0641e018d449232f2e28f1b22933c137f157d3dbc14228b8c0e
  - kind: registry
    name: const_format_proc_macros
    version: 0.2.29
    sha: d897f47bf7270cf70d370f8f98c1abb6d2d4cf60a6845d30e05bfb90c6568650
  - kind: registry
    name: cookie-factory
    version: 0.3.3
    sha: 9885fa71e26b8ab7855e2ec7cae6e9b380edff76cd052e07c683a0319d51b3a2
  - kind: registry
    name: cpufeatures
    version: 0.2.6
    sha: 280a9f2d8b3a38871a3c8a46fb80db65e5e5ed97da80c4d08bf27fb63e35e181
  - kind: registry
    name: crossbeam-utils
    version: 0.8.15
    sha: 3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b
  - kind: registry
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: derivative
    version: 2.2.0
    sha: fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b
  - kind: registry
    name: digest
    version: 0.10.6
    sha: 8168378f4e5023e7218c89c891c0fd8ecdb5e5e4f18cb78f38cf245dd021e76f
  - kind: registry
    name: dirs
    version: 4.0.0
    sha: ca3aa72a6f96ea37bbc5aa912f6788242832f75369bdfdadcb0e38423f100059
  - kind: registry
    name: dirs-sys
    version: 0.3.7
    sha: 1b1d1d91c932ef41c0f2663aa8b0ca0342d444d842c06914aa0a7e352d0bada6
  - kind: registry
    name: either
    version: 1.16.0
    sha: 91622ff5e7162018101f2fea40d6ebf4a78bbe5a49736a2020649edf9693679e
  - kind: registry
    name: enumflags2
    version: 0.7.6
    sha: 0044ebdf7fbb2a772e0c0233a9d3173c5cd8af8ae7078d4c5188af44ffffaa4b
  - kind: registry
    name: enumflags2_derive
    version: 0.7.6
    sha: 9d2c772ccdbdfd1967b4f5d79d17c98ebf92009fdcc838db7aa434462f600c26
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: event-listener
    version: 2.5.3
    sha: 0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0
  - kind: registry
    name: fastrand
    version: 1.9.0
    sha: e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be
  - kind: registry
    name: fomat-macros
    version: 0.3.2
    sha: 3f722aa875298d34a0ebb6004699f6f4ea830d36dec8ac2effdbbc840248a096
  - kind: registry
    name: futures
    version: 0.3.28
    sha: 23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40
  - kind: registry
    name: futures-channel
    version: 0.3.28
    sha: 955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2
  - kind: registry
    name: futures-core
    version: 0.3.28
    sha: 4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c
  - kind: registry
    name: futures-executor
    version: 0.3.28
    sha: ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0
  - kind: registry
    name: futures-io
    version: 0.3.28
    sha: 4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964
  - kind: registry
    name: futures-lite
    version: 1.13.0
    sha: 49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce
  - kind: registry
    name: futures-macro
    version: 0.3.28
    sha: 89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72
  - kind: registry
    name: futures-sink
    version: 0.3.28
    sha: f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e
  - kind: registry
    name: futures-task
    version: 0.3.28
    sha: 76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65
  - kind: registry
    name: futures-util
    version: 0.3.28
    sha: 26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533
  - kind: registry
    name: generator
    version: 0.8.3
    sha: dbb949699c3e4df3a183b1d2142cb24277057055ed23c68ed58894f76c517223
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: getrandom
    version: 0.2.8
    sha: c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31
  - kind: registry
    name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
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
    version: 0.2.6
    sha: ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7
  - kind: registry
    name: hermit-abi
    version: 0.3.1
    sha: fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.0
    sha: d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9
  - kind: registry
    name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - kind: registry
    name: io-lifetimes
    version: 1.0.9
    sha: 09270fd4fa1111bc614ed2246c7ef56239a3063d5be0d1ec3b589c505d400aeb
  - kind: registry
    name: ioprio
    version: 0.2.0
    sha: aed03c9a950f47958e5c6c4f974cf1b609aee1857ecc34bf68166dc6af782efc
  - kind: registry
    name: is-terminal
    version: 0.4.6
    sha: 256017f749ab3117e93acb91063009e1f1bb56d03965b14c2c8df4eb02c524d8
  - kind: registry
    name: itertools
    version: 0.13.0
    sha: 413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186
  - kind: registry
    name: itoa
    version: 1.0.6
    sha: 453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6
  - kind: registry
    name: kdl
    version: 4.6.0
    sha: 062c875482ccb676fd40c804a40e3824d4464c18c364547456d1c8e8e951ae47
  - kind: registry
    name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - kind: registry
    name: libc
    version: 0.2.186
    sha: 68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66
  - kind: registry
    name: libloading
    version: 0.7.4
    sha: b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f
  - kind: registry
    name: libspa
    version: 0.10.0
    sha: 2909f3be29d674e7f10604aff18d1bbe1bb03c4cd61c8a8ba19c0b1d162f7d4e
  - kind: registry
    name: libspa-sys
    version: 0.10.0
    sha: 69ad52764fca54818486f3cf75afec844d1f1a1568c24dcee25d41b1ab007dda
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.3.1
    sha: d59d8c75012853d2e872fb56bc8a2e53718e2cafe1a4c823143141c6d90c322f
  - kind: registry
    name: log
    version: 0.4.17
    sha: abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e
  - kind: registry
    name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
  - kind: registry
    name: memchr
    version: 2.5.0
    sha: 2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d
  - kind: registry
    name: memoffset
    version: 0.6.5
    sha: 5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce
  - kind: registry
    name: memoffset
    version: 0.7.1
    sha: 5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4
  - kind: registry
    name: miette
    version: 5.7.0
    sha: 7abdc09c381c9336b9f2e9bd6067a9a5290d20e2d2e2296f275456121c33ae89
  - kind: registry
    name: miette-derive
    version: 5.7.0
    sha: 8842972f23939443013dfd3720f46772b743e86f1a81d120d4b6fb090f87de1c
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: mio
    version: 0.8.6
    sha: 5b9d9a46eff5b4ff64b45a9e316a6d1e0bc719ef429cbec4dc630684212bfdf9
  - kind: registry
    name: nix
    version: 0.21.2
    sha: 77d9f3521ea8e0641a153b3cddaf008dcbf26acd4ed739a2517295e0760d12c7
  - kind: registry
    name: nix
    version: 0.26.2
    sha: bfdda3d196821d6af13126e40375cdf7da646a96114af134d5f417a9a1dc8e1a
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
  - kind: registry
    name: num-traits
    version: 0.2.15
    sha: 578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd
  - kind: registry
    name: num_cpus
    version: 1.15.0
    sha: 0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b
  - kind: registry
    name: once_cell
    version: 1.17.1
    sha: b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3
  - kind: registry
    name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - kind: registry
    name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - kind: registry
    name: parking
    version: 2.0.0
    sha: 427c3892f9e783d91cc128285287e70a59e206ca452770ece88a76f7a3eddd72
  - kind: registry
    name: pin-project-lite
    version: 0.2.9
    sha: e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pipewire
    version: 0.10.0
    sha: 8585aba8a52ad74ccc633b8e293c1dc4277976bd5d510b925533f34fd6685f38
  - kind: registry
    name: pipewire-sys
    version: 0.10.0
    sha: f2089f245b548723e60325773c27f586b7a2372c79ea941b246cd0d654706adc
  - kind: registry
    name: pkg-config
    version: 0.3.26
    sha: 6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160
  - kind: registry
    name: polling
    version: 2.5.2
    sha: 22122d5ec4f9fe1b3916419b76be1e80bcb93f618d071d2edf841b137b2a2bd6
  - kind: registry
    name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - kind: registry
    name: proc-macro-crate
    version: 1.3.1
    sha: 7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919
  - kind: registry
    name: proc-macro2
    version: 1.0.95
    sha: 02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778
  - kind: registry
    name: qcell
    version: 0.5.3
    sha: 76babcf954d92eee717a7c9bfc4921d91dfbf2124d9bfb6ed1b0b3d0c47361e3
  - kind: registry
    name: quote
    version: 1.0.46
    sha: dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - kind: registry
    name: redox_syscall
    version: 0.3.5
    sha: 567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29
  - kind: registry
    name: redox_users
    version: 0.4.3
    sha: b033d837a7cf162d7993aded9304e30a83213c648b6e389db233191f891e5c2b
  - kind: registry
    name: regex
    version: 1.7.3
    sha: 8b1f693b24f6ac912f4893ef08244d70b6067480d2f1a46e950c9691e6749d1d
  - kind: registry
    name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - kind: registry
    name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - kind: registry
    name: rustc-hash
    version: 2.1.3
    sha: 6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d
  - kind: registry
    name: rustix
    version: 0.37.6
    sha: d097081ed288dfe45699b72f5b5d648e5f15d64d900c7080273baa20c16a6849
  - kind: registry
    name: rustix
    version: 1.1.4
    sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
  - kind: registry
    name: rustversion
    version: 1.0.12
    sha: 4f3208ce4d8448b3f3e7d168a73f5e0c43a61e32930de3bceeccedb388b6bf06
  - kind: registry
    name: ryu
    version: 1.0.13
    sha: f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041
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
    name: serde_repr
    version: 0.1.12
    sha: bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab
  - kind: registry
    name: serde_spanned
    version: 1.1.1
    sha: 6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26
  - kind: registry
    name: sha1
    version: 0.10.5
    sha: f04293dc80c3993519f2d7f6f511707ee7094fe0c6d3406feb330cdb3540eba3
  - kind: registry
    name: sharded-slab
    version: 0.1.4
    sha: 900fba806f70c630b0a382d0d825e17a0f19fcd059a2ade1ff237bcddf446b31
  - kind: registry
    name: shlex
    version: 1.1.0
    sha: 43b2853a4d09f215c24cc5489c992ce46052d359b5109343cbafbf26bc62f8a3
  - kind: registry
    name: signal-hook-registry
    version: 1.4.1
    sha: d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1
  - kind: registry
    name: slab
    version: 0.4.8
    sha: 6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d
  - kind: registry
    name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - kind: registry
    name: socket2
    version: 0.4.9
    sha: 64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
  - kind: registry
    name: system-deps
    version: 7.0.8
    sha: 396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7
  - kind: registry
    name: target-lexicon
    version: 0.13.2
    sha: e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a
  - kind: registry
    name: tempfile
    version: 3.5.0
    sha: b9fbec84f381d5795b08656e4912bec604d162bff9291d6189a78f4c8ab87998
  - kind: registry
    name: thiserror
    version: 1.0.40
    sha: 978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac
  - kind: registry
    name: thiserror-impl
    version: 1.0.40
    sha: f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f
  - kind: registry
    name: thread_local
    version: 1.1.7
    sha: 3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152
  - kind: registry
    name: tokio
    version: 1.27.0
    sha: d0de47a4eecbe11f498978a9b29d792f0d2692d1dd003650c24c76510e3bc001
  - kind: registry
    name: tokio-macros
    version: 2.0.0
    sha: 61a573bdc87985e9d6ddeed1b3d864e8a302c847e40d647746df2f1de209d1ce
  - kind: registry
    name: toml
    version: 1.1.3+spec-1.1.0
    sha: 53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c
  - kind: registry
    name: toml_datetime
    version: 0.6.1
    sha: 3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.19.8
    sha: 239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13
  - kind: registry
    name: toml_parser
    version: 1.1.2+spec-1.1.0
    sha: a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526
  - kind: registry
    name: toml_writer
    version: 1.1.2+spec-1.1.0
    sha: 7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2
  - kind: registry
    name: tracing
    version: 0.1.37
    sha: 8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8
  - kind: registry
    name: tracing-attributes
    version: 0.1.23
    sha: 4017f8f45139870ca7e672686113917c71c7a6e02d4924eda67186083c03081a
  - kind: registry
    name: tracing-core
    version: 0.1.30
    sha: 24eb03ba0eab1fd845050058ce5e616558e8f8d8fca633e6b163fe25c797213a
  - kind: registry
    name: tracing-log
    version: 0.1.3
    sha: 78ddad33d2d10b1ed7eb9d1f518a5674713876e97e5bb9b7345a7984fbb4f922
  - kind: registry
    name: tracing-subscriber
    version: 0.3.16
    sha: a6176eae26dd70d0c919749377897b54a9276bd7061339665dd68777926b5a70
  - kind: registry
    name: typenum
    version: 1.16.0
    sha: 497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba
  - kind: registry
    name: uds_windows
    version: 1.0.2
    sha: ce65604324d3cce9b966701489fbd0cf318cb1f7bd9dd07ac9a4ee6fb791930d
  - kind: registry
    name: unicode-ident
    version: 1.0.8
    sha: e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4
  - kind: registry
    name: unicode-width
    version: 0.1.10
    sha: c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b
  - kind: registry
    name: unicode-width
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
  - kind: registry
    name: unicode-xid
    version: 0.2.4
    sha: f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c
  - kind: registry
    name: upower_dbus
    version: 0.3.2
    sha: b0b1d77de98ab2e5187f5fa2b045b8c4eecfc49e5ccd07f16f4c89f008116f8c
  - kind: registry
    name: utf8parse
    version: 0.2.1
    sha: 711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a
  - kind: registry
    name: valuable
    version: 0.1.0
    sha: 830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d
  - kind: registry
    name: version-compare
    version: 0.2.1
    sha: 03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e
  - kind: registry
    name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - kind: registry
    name: waker-fn
    version: 1.1.0
    sha: 9d5b2c62b4012a3e1eca5a7e077d13b3bf498c4073e33ccd58626607748ceeca
  - kind: registry
    name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - kind: registry
    name: wepoll-ffi
    version: 0.1.2
    sha: d743fdedc5c64377b5fc2bc036b01c7fd642205a0d96356034ae3404d49eb7fb
  - kind: registry
    name: wildmatch
    version: 2.1.1
    sha: ee583bdc5ff1cf9db20e9db5bb3ff4c3089a8f6b8b31aff265c9aba85812db86
  - kind: registry
    name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - kind: registry
    name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: registry
    name: windows
    version: 0.58.0
    sha: dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6
  - kind: registry
    name: windows-core
    version: 0.58.0
    sha: 6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99
  - kind: registry
    name: windows-implement
    version: 0.58.0
    sha: 2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b
  - kind: registry
    name: windows-interface
    version: 0.58.0
    sha: 053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-result
    version: 0.2.0
    sha: 1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e
  - kind: registry
    name: windows-strings
    version: 0.1.0
    sha: 4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10
  - kind: registry
    name: windows-sys
    version: 0.42.0
    sha: 5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7
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
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - kind: registry
    name: windows-targets
    version: 0.48.0
    sha: 7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.0
    sha: 91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.0
    sha: b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.0
    sha: 622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241
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
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.0
    sha: 4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.0
    sha: ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.0
    sha: 7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.0
    sha: 1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: winnow
    version: 0.4.1
    sha: ae8970b36c66498d8ff1d66685dc86b91b29db0c7739899012f63a63814b4b28
  - kind: registry
    name: winnow
    version: 1.0.4
    sha: 23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81
  - kind: registry
    name: zbus
    version: 3.11.1
    sha: 3dc29e76f558b2cb94190e8605ecfe77dd40f5df8c072951714b4b71a97f5848
  - kind: registry
    name: zbus_macros
    version: 3.11.1
    sha: 62a80fd82c011cd08459eaaf1fd83d3090c1b61e6d5284360074a7475af3a85d
  - kind: registry
    name: zbus_names
    version: 2.5.0
    sha: f34f314916bd89bdb9934154627fab152f4f28acdda03e7c4c68181b214fe7e3
  - kind: registry
    name: zvariant
    version: 3.12.0
    sha: 46fe4914a985446d6fd287019b5fceccce38303d71407d9e6e711d44954a05d8
  - kind: registry
    name: zvariant_derive
    version: 3.12.0
    sha: 34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a
  - kind: registry
    name: zvariant_utils
    version: 1.0.0
    sha: 53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b
config:
  build-commands:
  - |
    just build-release
  install-commands:
  - |
    just rootdir="%{install-root}" install
  strip-commands:
  - |
    %{strip-binaries}
