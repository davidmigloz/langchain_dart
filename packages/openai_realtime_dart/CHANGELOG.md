## 0.1.0

> Note: This release has breaking changes.

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

## 0.0.6

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

## 0.0.5

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.0.4+1

 - **FIX**: toolChoice required infinite loop in openai_realtime_dart ([#723](https://github.com/davidmigloz/langchain_dart/issues/723)). ([f52211cc](https://github.com/davidmigloz/langchain_dart/commit/f52211cca063d64e346a4ed023c337a351ca3e33))

## 0.0.4

 - **FEAT**: Align latest OpenAI Realtime API changes ([#707](https://github.com/davidmigloz/langchain_dart/issues/707)). ([c2fc4f53](https://github.com/davidmigloz/langchain_dart/commit/c2fc4f53492726ec78639d4a9ef55dfc054c2fae))
 - **FEAT**: Add language and prompt properties to InputAudioTranscriptionConfig ([#698](https://github.com/davidmigloz/langchain_dart/issues/698)). ([5daf6e60](https://github.com/davidmigloz/langchain_dart/commit/5daf6e603f18be7e330155d32648356ae05872bd))
 - **FEAT**: Add RealtimeEvent for input audio transcription delta updates ([#710](https://github.com/davidmigloz/langchain_dart/issues/710)). ([0848a253](https://github.com/davidmigloz/langchain_dart/commit/0848a253c36c0ab9f7e9b2bc0db5f000c6952ef5))
 - **FEAT**: Add support for custom headers in WebSocket connections ([#693](https://github.com/davidmigloz/langchain_dart/issues/693)). ([de81ef89](https://github.com/davidmigloz/langchain_dart/commit/de81ef89b33e54f1671ccf244fe1d088b203f76a))
 - **FEAT**: Allow to pass a custom model in OpenAI RealtimeClient ([#654](https://github.com/davidmigloz/langchain_dart/issues/654)). ([60feae46](https://github.com/davidmigloz/langchain_dart/commit/60feae46a6dc6bcaf1779d512d0d599fdcd0e1a4))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **FIX**: Server VAD is enabled after setting turnDetection to null ([#668](https://github.com/davidmigloz/langchain_dart/issues/668)). ([39c21ba4](https://github.com/davidmigloz/langchain_dart/commit/39c21ba4b2f40d3622ab492d1661a0a09424f393))
 - **FIX**: previous_item_id should be nullable in openai_realtime_dart ([#639](https://github.com/davidmigloz/langchain_dart/issues/639)). ([0f84850f](https://github.com/davidmigloz/langchain_dart/commit/0f84850f822b0872ad9c2b0abf87d14e2a5b29dd))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **REFACTOR**: Remove unused property in openai_realtime_dart ([#625](https://github.com/davidmigloz/langchain_dart/issues/625)). ([231ccab2](https://github.com/davidmigloz/langchain_dart/commit/231ccab2d3f3cef3487d214b88c4ee983a62f362))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))

## 0.0.3+1

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))
 - **DOCS**: Update openai_spec_official.yaml. ([ee2eb35b](https://github.com/davidmigloz/langchain_dart/commit/ee2eb35b983afdb504ae52d3dfca5fea11a1dadb))
 - **DOCS**: Update README.md. ([44291a06](https://github.com/davidmigloz/langchain_dart/commit/44291a06af7ae26f0a5beadfec23f2128f5e2415))

## 0.0.3

 - **FEAT**: Add five new voice types in openai_realtime_dart and minor improvements ([#593](https://github.com/davidmigloz/langchain_dart/issues/593)). ([6d0c8d3f](https://github.com/davidmigloz/langchain_dart/commit/6d0c8d3fceaab9d3eac7c5265b1e8b50deef9cc4))
 - **DOCS**: Update openai_realtime_dart README.md. ([7e9e1393](https://github.com/davidmigloz/langchain_dart/commit/7e9e139315b31308817fc71439feceb705d06ec2))

## 0.0.2

 - **FEAT**: Make openai_realtime_dart client to strong-typed ([#590](https://github.com/davidmigloz/langchain_dart/issues/590)). ([d84e88bf](https://github.com/davidmigloz/langchain_dart/commit/d84e88bf04956df2ab6a4606aa812ae4f3b6cd31))

## 0.0.1+2

 - **FIX**: Tool calling not working ([#572](https://github.com/davidmigloz/langchain_dart/issues/572)). ([f6b14919](https://github.com/davidmigloz/langchain_dart/commit/f6b14919463353a3d1a8eb2f1b8eb83c45340fa1))

## 0.0.1+1

 - **DOCS**: Add note about the openai_dart client. ([26de8d97](https://github.com/davidmigloz/langchain_dart/commit/26de8d974fcd27fec857b93cc309e76860777dea))

## 0.0.1

 - **FEAT**: Implement openai_realtime_dart, a Dart client for OpenAI Realtime API ([#562](https://github.com/davidmigloz/langchain_dart/issues/562)). ([9f7406f7](https://github.com/davidmigloz/langchain_dart/commit/9f7406f7014624bf5086c60fb902bff70224ee15))

## 0.0.1-dev.1

- Bootstrap project
