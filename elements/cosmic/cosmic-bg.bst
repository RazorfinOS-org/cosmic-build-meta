kind: manual

build-depends:
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/gcc-base.bst
- freedesktop-sdk.bst:bootstrap/binutils.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/findutils.bst
- cosmic/just.bst
- cosmic/libcosmic.bst
- freedesktop-sdk.bst:components/wayland.bst

depends:
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pop-os/cosmic-bg.git
  track: master
  ref: epoch-1.0.11-0-g06970d5945b45a634b9ed314f5ca3a86a8502fd8
- kind: cargo2
  url: "crates:"
  ref:
  - kind: registry
    name: addr2line
    version: 0.25.1
    sha: 1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
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
    name: anyhow
    version: 1.0.102
    sha: 7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c
  - kind: registry
    name: approx
    version: 0.5.1
    sha: cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6
  - kind: registry
    name: arbitrary
    version: 1.4.2
    sha: c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1
  - kind: registry
    name: arg_enum_proc_macro
    version: 0.3.4
    sha: 0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea
  - kind: registry
    name: arrayvec
    version: 0.7.6
    sha: 7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50
  - kind: registry
    name: as-slice
    version: 0.2.1
    sha: 516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516
  - kind: git
    commit: 043ab4859d53ffd3d55334685303d8df39c9f768
    repo: https://github.com/jackpot51/rust-atomicwrites
    name: atomicwrites
    version: 0.4.2
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
    name: backtrace
    version: 0.3.76
    sha: bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6
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
    name: borsh
    version: 1.6.0
    sha: d1da5ab77c1437701eeff7c88d968729e7766172279eab0676857b3d63af7a6f
  - kind: registry
    name: brotli-decompressor
    version: 5.0.0
    sha: 874bb8112abecc98cbd6d81ea4fa7e94fb9449648c93cc89aa40c81c24d7de03
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
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.11.1
    sha: 1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33
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
    version: 1.2.56
    sha: aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: clipboard-win
    version: 5.4.1
    sha: bde03770d3df201d4fb868f2c9c59e66a3e4e2bd06692a0fe701e7103c7e84d4
  - kind: git
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_macos
    version: 0.1.0
  - kind: git
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_wayland
    version: 0.2.2
  - kind: git
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: clipboard_x11
    version: 0.4.2
  - kind: registry
    name: color-eyre
    version: 0.6.5
    sha: e5920befb47832a6d61ee3a3a846565cfa39b331331e68a3b1d1116630f2f26d
  - kind: registry
    name: color-spantrace
    version: 0.3.0
    sha: b8b88ea9df13354b55bc7234ebcce36e6ef896aca2e42a15de9e10edce01b427
  - kind: registry
    name: colorgrad
    version: 0.8.0
    sha: aee94de557db6ddae3ca7b37b5fbe77ed6f159219f1815a8c2c1a9854c73087e
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: core2
    version: 0.4.0
    sha: b49ba7ef1ad6107f8824dbe97de947cbaac53c44e7f9756a1fba0d37c1eec505
  - kind: git
    commit: ad65416551975cded91007b491b46556a45e059a
    repo: github:pop-os/libcosmic
    name: cosmic-config
    version: 1.0.0
  - kind: git
    commit: ad65416551975cded91007b491b46556a45e059a
    repo: github:pop-os/libcosmic
    name: cosmic-config-derive
    version: 1.0.0
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
    name: csscolorparser
    version: 0.8.2
    sha: 64a878cfd6075649977f548ed439564cfdbe1f190a6656a00b48af7740f2f148
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
    name: derive_setters
    version: 0.1.9
    sha: b7e6f6fa1f03c14ae082120b84b3c7fbd7b8588d924cf2d7c3daf9afd49df8b9
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
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
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
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
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
    name: exr
    version: 1.74.0
    sha: 4300e043a56aa2cb633c01af81ca8f699a321879a7854d3896a0ba89056363be
  - kind: registry
    name: eyre
    version: 0.6.12
    sha: 7cd915d99f24784cdc19fd37ef22b97e3ff0ae756c7e492e9fbfe897d61e2aec
  - kind: registry
    name: fast-srgb8
    version: 1.0.0
    sha: dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1
  - kind: registry
    name: fast_image_resize
    version: 6.0.0
    sha: 12dd43e5011e8d8411a3215a0d57a2ec5c68282fb90eb5d7221fab0113442174
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: flate2
    version: 1.1.9
    sha: 843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: foldhash
    version: 0.1.5
    sha: d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2
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
    name: gimli
    version: 0.32.3
    sha: e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7
  - kind: registry
    name: glam
    version: 0.25.0
    sha: 151665d9be52f9bb40fc7966565d39666f2d1e69233571b71b87791c7e0528b3
  - kind: registry
    name: half
    version: 2.7.1
    sha: 6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b
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
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hermit-abi
    version: 0.5.2
    sha: fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c
  - kind: git
    commit: ad65416551975cded91007b491b46556a45e059a
    repo: github:pop-os/libcosmic
    name: iced_core
    version: 0.14.0
  - kind: git
    commit: ad65416551975cded91007b491b46556a45e059a
    repo: github:pop-os/libcosmic
    name: iced_futures
    version: 0.14.0
  - kind: registry
    name: id-arena
    version: 2.3.0
    sha: 3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954
  - kind: registry
    name: ident_case
    version: 1.0.1
    sha: b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39
  - kind: registry
    name: image
    version: 0.25.9
    sha: e6506c6c10786659413faa717ceebcb8f70731c0a60cbae39795fdf114519c1a
  - kind: registry
    name: image-webp
    version: 0.2.4
    sha: 525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3
  - kind: registry
    name: imgref
    version: 1.12.0
    sha: e7c5cedc30da3a610cac6b4ba17597bdf7152cf974e8aab3afb3d54455e371c8
  - kind: registry
    name: indenter
    version: 0.3.4
    sha: 964de6e86d545b246d84badc0fef527924ace5134f30641c203ef52ba83f58d5
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
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itoa
    version: 1.0.17
    sha: 92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2
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
    name: libc
    version: 0.2.182
    sha: 6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112
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
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
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
    name: loop9
    version: 0.1.5
    sha: 0fae87c125b03c1d2c0150c90365d7d6bcc53fb73a9acaef207d2d065860f062
  - kind: registry
    name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - kind: registry
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: memchr
    version: 2.8.0
    sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
  - kind: registry
    name: memmap2
    version: 0.9.10
    sha: 714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3
  - kind: git
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: mime
    version: 0.1.0
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: mio
    version: 1.1.1
    sha: a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc
  - kind: registry
    name: moxcms
    version: 0.7.11
    sha: ac9557c559cd6fc9867e122e20d2cbefc9ca29d80d027a8e39310920ed2f0a97
  - kind: registry
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
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
    name: notify-types
    version: 2.1.0
    sha: 42b8cfee0e339a0337359f3c88165702ac6e600dc01c0cc9579a92d62b08477a
  - kind: registry
    name: nu-ansi-term
    version: 0.50.3
    sha: 7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5
  - kind: registry
    name: num-bigint
    version: 0.4.6
    sha: a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9
  - kind: registry
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
  - kind: registry
    name: num-integer
    version: 0.1.46
    sha: 7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f
  - kind: registry
    name: num-rational
    version: 0.4.2
    sha: f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824
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
    name: owo-colors
    version: 4.3.0
    sha: d211803b9b6b570f68772237e415a029d5a50c65d382910b879fb19d3271f94d
  - kind: registry
    name: palette
    version: 0.7.6
    sha: 4cbf71184cc5ecc2e4e1baccdb21026c20e5fc3dcf63028a086131b3ab00b6e6
  - kind: registry
    name: palette_derive
    version: 0.7.6
    sha: f5030daf005bface118c096f510ffb781fc28f9ab6a32ab224d8631be6851d30
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
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: png
    version: 0.18.1
    sha: 60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61
  - kind: registry
    name: polling
    version: 3.11.0
    sha: 5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: prettyplease
    version: 0.2.37
    sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
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
    version: 0.1.28
    sha: b5a041e753da8b807c9255f28de81879c78c876392ff2469cde94799b2896b9d
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
    name: rav1e
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
  - kind: registry
    name: ravif
    version: 0.12.0
    sha: ef69c1990ceef18a116855938e74793a5f7496ee907562bd0857b6ac734ab285
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
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_users
    version: 0.5.2
    sha: a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac
  - kind: registry
    name: rgb
    version: 0.8.53
    sha: 47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4
  - kind: registry
    name: ron
    version: 0.12.0
    sha: fd490c5b18261893f14449cbd28cb9c0b637aebf161cd77900bfdedaff21ec32
  - kind: registry
    name: rustc-demangle
    version: 0.1.27
    sha: b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d
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
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: scoped-tls
    version: 1.0.1
    sha: e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
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
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: simd-adler32
    version: 0.3.8
    sha: e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: siphasher
    version: 1.0.2
    sha: b2aa850e253778c88a04c3d7323b043aeda9d3e30d5971937c1855769763678e
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
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
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: syn
    version: 2.0.117
    sha: e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99
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
    version: 0.3.22
    sha: 2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: uncased
    version: 0.9.10
    sha: e1b88fcfe09e89d3866a5c11019378088af2d24c3fbd4f0543f96b479ec90697
  - kind: registry
    name: unicode-ident
    version: 1.0.24
    sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
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
    name: wayland-protocols-wlr
    version: 0.3.10
    sha: e9597cdf02cf0c34cd5823786dce6b5ae8598f05c2daf5621b6e178d4f7345f3
  - kind: registry
    name: wayland-scanner
    version: 0.31.8
    sha: 5423e94b6a63e68e439803a3e153a9252d5ead12fd853334e2ad33997e3889e3
  - kind: registry
    name: wayland-sys
    version: 0.31.8
    sha: 1e6dbfc3ac5ef974c92a2235805cc0114033018ae1290a72e474aa8b28cbbdfd
  - kind: registry
    name: web-sys
    version: 0.3.91
    sha: 854ba17bb104abfb26ba36da9729addc7ce7f06f5c0f90f3c391f8461cca21f9
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: git
    commit: 3a7af79e54db6854d8aa9d9e2866a9288d0f95d5
    repo: github:pop-os/window_clipboard.git
    query:
      tag: sctk-0.20
    name: window_clipboard
    version: 0.4.1
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
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
    name: xkbcommon
    version: 0.8.0
    sha: 8d66ca9352cbd4eecbbc40871d8a11b4ac8107cfc528a6e14d7c19c69d0e1ac9
  - kind: registry
    name: xkeysym
    version: 0.2.1
    sha: b9cc00251562a284751c9973bace760d86c0276c471b4be569fe6b068ee97a56
  - kind: registry
    name: y4m
    version: 0.8.0
    sha: 7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448
  - kind: registry
    name: zerocopy
    version: 0.8.40
    sha: a789c6e490b576db9f7e6b6d661bcc9799f7c0ac8352f56ea20193b2681532e5
  - kind: registry
    name: zerocopy-derive
    version: 0.8.40
    sha: f65c489a7071a749c849713807783f70672b28094011623e200cb86dcb835953
  - kind: registry
    name: zmij
    version: 1.0.21
    sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
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
    version: 0.5.12
    sha: 410e9ecef634c709e3831c2cfdb8d9c32164fae1c67496d5b68fff728eec37fe
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
