# Change Log

📣 Check out the [releases page](https://github.com/davidmigloz/langchain_dart/releases) or the [#announcements](https://discord.com/channels/1123158322812555295/1123250594644242534) channel on the [LangChain.dart Discord](https://discord.gg/x4qbhqecVR) server for more details.

## 2025-12-20

### Changes

---

Packages with breaking changes:

 - [`googleai_dart` - `v2.0.0`](#googleai_dart---v200)

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.3.1`](#anthropic_sdk_dart---v031)
 - [`langchain` - `v0.8.1`](#langchain---v081)
 - [`langchain_anthropic` - `v0.3.1`](#langchain_anthropic---v031)
 - [`langchain_core` - `v0.4.1`](#langchain_core---v041)
 - [`langchain_firebase` - `v0.3.1`](#langchain_firebase---v031)
 - [`langchain_google` - `v0.7.1`](#langchain_google---v071)
 - [`langchain_mistralai` - `v0.3.1`](#langchain_mistralai---v031)
 - [`langchain_ollama` - `v0.4.1`](#langchain_ollama---v041)
 - [`langchain_openai` - `v0.8.1`](#langchain_openai---v081)
 - [`mistralai_dart` - `v0.1.1`](#mistralai_dart---v011)
 - [`openai_dart` - `v0.6.1`](#openai_dart---v061)
 - [`langchain_chroma` - `v0.3.0+2`](#langchain_chroma---v0302)
 - [`langchain_community` - `v0.4.0+2`](#langchain_community---v0402)
 - [`langchain_supabase` - `v0.2.0+2`](#langchain_supabase---v0202)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_chroma` - `v0.3.0+2`
 - `langchain_community` - `v0.4.0+2`
 - `langchain_supabase` - `v0.2.0+2`

---

#### `googleai_dart` - `v2.0.0`

 - **BREAKING** **FEAT**(googleai_dart): Remove deprecated schema fields ([#848](https://github.com/davidmigloz/langchain_dart/issues/848)). ([e6d07ec4](https://github.com/davidmigloz/langchain_dart/commit/e6d07ec4a94d1b09e9dbd71f30904d510fb749c6))
 - **BREAKING** **FEAT**(googleai_dart): Remove deprecated Chunks and query APIs ([#847](https://github.com/davidmigloz/langchain_dart/issues/847)). ([9cae76d5](https://github.com/davidmigloz/langchain_dart/commit/9cae76d534d45bcd36622216a0926bfbc8800d86))
 - **BREAKING** **FEAT**(googleai_dart): Remove deprecated RagStores resource ([#846](https://github.com/davidmigloz/langchain_dart/issues/846)). ([1ab553f1](https://github.com/davidmigloz/langchain_dart/commit/1ab553f1da173dbed72a1d9089e56ce11b78eac6))
 - **FEAT**(googleai_dart): Add InteractionsResource and client integration ([#905](https://github.com/davidmigloz/langchain_dart/issues/905)). ([af6b13ea](https://github.com/davidmigloz/langchain_dart/commit/af6b13ea3c91ca4f05196940505d3eddb5c55831))
 - **FEAT**(googleai_dart): Add Interactions API tool types ([#904](https://github.com/davidmigloz/langchain_dart/issues/904)). ([2258cfa1](https://github.com/davidmigloz/langchain_dart/commit/2258cfa187cb011eddfa204d7f2a68a2ab329a37))
 - **FEAT**(googleai_dart): Add Interactions API events and deltas ([#903](https://github.com/davidmigloz/langchain_dart/issues/903)). ([826d3f64](https://github.com/davidmigloz/langchain_dart/commit/826d3f64845eb7178b9567f5193951796f476ea1))
 - **FEAT**(googleai_dart): Add Interactions API content types ([#902](https://github.com/davidmigloz/langchain_dart/issues/902)). ([b8c61743](https://github.com/davidmigloz/langchain_dart/commit/b8c61743e2e6ffa9cd6cd44df289135f6250b30d))
 - **FEAT**(googleai_dart): Add Interactions API core models ([#901](https://github.com/davidmigloz/langchain_dart/issues/901)). ([65f5db17](https://github.com/davidmigloz/langchain_dart/commit/65f5db17d91282bfc7edaca7e9fcb97b505631c6))
 - **FEAT**(googleai_dart): Update existing models with new properties ([#856](https://github.com/davidmigloz/langchain_dart/issues/856)). ([dd3893e0](https://github.com/davidmigloz/langchain_dart/commit/dd3893e07e78f2ce852ba26fd7e67744402ec11a))
 - **FEAT**(googleai_dart): Add RetrievalConfig to ToolConfig ([#855](https://github.com/davidmigloz/langchain_dart/issues/855)). ([5e11aa70](https://github.com/davidmigloz/langchain_dart/commit/5e11aa7000d74dfc09201620e38670c505cc525b))
 - **FEAT**(googleai_dart): Add MediaResolution to Part ([#854](https://github.com/davidmigloz/langchain_dart/issues/854)). ([df76f8c5](https://github.com/davidmigloz/langchain_dart/commit/df76f8c5b967efd5ac11aa83760459b71e55a000))
 - **FEAT**(googleai_dart): Add GoogleMaps tool ([#853](https://github.com/davidmigloz/langchain_dart/issues/853)). ([54814614](https://github.com/davidmigloz/langchain_dart/commit/548146143cfe48c4f24c9644d27b88550b816904))
 - **FEAT**(googleai_dart): Add McpServers tool ([#852](https://github.com/davidmigloz/langchain_dart/issues/852)). ([97970687](https://github.com/davidmigloz/langchain_dart/commit/97970687d43ff8dea4c6a87633d0e82287eedc30))
 - **FEAT**(googleai_dart): Add FileSearch tool ([#851](https://github.com/davidmigloz/langchain_dart/issues/851)). ([a00895b1](https://github.com/davidmigloz/langchain_dart/commit/a00895b1e264164894b56f6cf7dccea5f3c6c5b6))
 - **FEAT**(googleai_dart): Add grounding models ([#850](https://github.com/davidmigloz/langchain_dart/issues/850)). ([bb1a6228](https://github.com/davidmigloz/langchain_dart/commit/bb1a62286d5e04b612e148a4e55bceacf289e57c))
 - **FEAT**(googleai_dart): Add FileSearchStores resource ([#849](https://github.com/davidmigloz/langchain_dart/issues/849)). ([acb63d72](https://github.com/davidmigloz/langchain_dart/commit/acb63d72f03af13c1e1d4ff62f3f5e43a3ec34fd))
 - **FEAT**(googleai_dart): Add ThinkingConfig support to GenerationConfig ([#817](https://github.com/davidmigloz/langchain_dart/issues/817)). ([36de62a9](https://github.com/davidmigloz/langchain_dart/commit/36de62a9c65b24d9db35589772e053bb9c090035))
 - **FIX**(googleai_dart): Complete alignment with target implementation ([#884](https://github.com/davidmigloz/langchain_dart/issues/884)). ([60476e8d](https://github.com/davidmigloz/langchain_dart/commit/60476e8db17ca9badba217269169f3f8eb11a318))
 - **DOCS**(googleai_dart): Add Interactions API docs and example ([#897](https://github.com/davidmigloz/langchain_dart/issues/897)). ([f4a04677](https://github.com/davidmigloz/langchain_dart/commit/f4a04677e1e0743f85ca7f06756ba148c49cad01))

#### `anthropic_sdk_dart` - `v0.3.1`

 - **FIX**(anthropic_sdk_dart): Add signature_delta support to BlockDelta (fixes [#811](https://github.com/davidmigloz/langchain_dart/issues/811)) ([#878](https://github.com/davidmigloz/langchain_dart/issues/878)). ([1d281837](https://github.com/davidmigloz/langchain_dart/commit/1d281837f64ec8d5ce6cdf3d00bcdbdba6451ebe))
 - **FIX**(anthropic_sdk_dart): Update tool types and fix analyzer warnings ([#876](https://github.com/davidmigloz/langchain_dart/issues/876)). ([17613b1e](https://github.com/davidmigloz/langchain_dart/commit/17613b1e6dd6dcf420e914fe0e56ca972ec303ce))
 - **FEAT**(anthropic_sdk_dart): Add citations_delta support to BlockDelta ([#880](https://github.com/davidmigloz/langchain_dart/issues/880)). ([4da916bf](https://github.com/davidmigloz/langchain_dart/commit/4da916bf81094799d1b28fb7cfce5b5ade72cea0))
 - **FEAT**(anthropic_sdk_dart): Add beta features support ([#874](https://github.com/davidmigloz/langchain_dart/issues/874)). ([28e4a23a](https://github.com/davidmigloz/langchain_dart/commit/28e4a23ae996d9828f2b6e7b404e6d942613bb34))
 - **FEAT**(anthropic_sdk_dart): Add schema enhancements ([#873](https://github.com/davidmigloz/langchain_dart/issues/873)). ([424d3225](https://github.com/davidmigloz/langchain_dart/commit/424d32253c15d57752f9a75423d69dddec05642e))
 - **FEAT**(anthropic_sdk_dart): Add Models API ([#872](https://github.com/davidmigloz/langchain_dart/issues/872)). ([7962a867](https://github.com/davidmigloz/langchain_dart/commit/7962a867b5cca399364a65960fcb4b16c79e3dbb))
 - **FEAT**(anthropic_sdk_dart): Add get message batch results endpoint ([#871](https://github.com/davidmigloz/langchain_dart/issues/871)). ([46fb2a5d](https://github.com/davidmigloz/langchain_dart/commit/46fb2a5d1bd6efd53bd6dc73d21d82ecd5ff7a1f))
 - **FEAT**(anthropic_sdk_dart): Add delete message batch endpoint ([#870](https://github.com/davidmigloz/langchain_dart/issues/870)). ([6611e175](https://github.com/davidmigloz/langchain_dart/commit/6611e1758781e568442a9dec41a5e0b1eaeb13f4))
 - **FEAT**(anthropic_sdk_dart): Add cancel message batch endpoint ([#869](https://github.com/davidmigloz/langchain_dart/issues/869)). ([b7aa8602](https://github.com/davidmigloz/langchain_dart/commit/b7aa8602f5474c6a32ef39ce3a52c3568081dc13))
 - **FEAT**(anthropic_sdk_dart): Add list message batches endpoint ([#868](https://github.com/davidmigloz/langchain_dart/issues/868)). ([745e369d](https://github.com/davidmigloz/langchain_dart/commit/745e369d07a71d66de508ab5b7933f18693eee9c))
 - **FEAT**(anthropic_sdk_dart): Add token counting API ([#858](https://github.com/davidmigloz/langchain_dart/issues/858)). ([b0d61c92](https://github.com/davidmigloz/langchain_dart/commit/b0d61c9204fe959bd16eca842ab98292e723822a))

#### `langchain` - `v0.8.1`

 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))
 - **FIX**(langchain): Properly serialize non-String tool outputs in AgentExecutor ([#821](https://github.com/davidmigloz/langchain_dart/issues/821)). ([3891164c](https://github.com/davidmigloz/langchain_dart/commit/3891164c11d0e7dd809b179d15444dd2da71aca0))

#### `langchain_anthropic` - `v0.3.1`

 - **FIX**(langchain_anthropic): Handle CitationsBlockDelta in streaming responses ([#881](https://github.com/davidmigloz/langchain_dart/issues/881)). ([445ddda1](https://github.com/davidmigloz/langchain_dart/commit/445ddda1fa7a61f6a34e4faae3e024c7e625b86b))
 - **FIX**(langchain_anthropic): Handle SignatureBlockDelta in streaming responses ([#879](https://github.com/davidmigloz/langchain_dart/issues/879)). ([a9fe5285](https://github.com/davidmigloz/langchain_dart/commit/a9fe5285ef00df5f80e934a480b1b79caeb0e1f0))
 - **FIX**(langchain_anthropic): Update mappers for anthropic_sdk_dart schema changes ([#877](https://github.com/davidmigloz/langchain_dart/issues/877)). ([c77d454d](https://github.com/davidmigloz/langchain_dart/commit/c77d454d8effd26aaff59a39c438e4731f7ad773))
 - **FEAT**(langchain_anthropic): Add listModels() support ([#882](https://github.com/davidmigloz/langchain_dart/issues/882)). ([c1ba2592](https://github.com/davidmigloz/langchain_dart/commit/c1ba25920277f625fb6b3629f3d0c312ebd75240))

#### `langchain_core` - `v0.4.1`

 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))

#### `langchain_firebase` - `v0.3.1`

 - **FIX**(langchain_firebase): Handle malformedFunctionCall finish reason ([#842](https://github.com/davidmigloz/langchain_dart/issues/842)). ([d6eef0dd](https://github.com/davidmigloz/langchain_dart/commit/d6eef0ddb0c8a5436d830e0487218373ff6dbbce))
 - **FEAT**(langchain_firebase): Migrate to firebase_ai and add Google AI backend support ([#909](https://github.com/davidmigloz/langchain_dart/issues/909)). ([3be47d26](https://github.com/davidmigloz/langchain_dart/commit/3be47d261d1fd5c45c58bf84420d6fa37dc0c9c7))

#### `langchain_google` - `v0.7.1`

 - **FIX**(langchain_google): Remove ServiceAccountCredentials stub export ([#838](https://github.com/davidmigloz/langchain_dart/issues/838)). ([d0a058b3](https://github.com/davidmigloz/langchain_dart/commit/d0a058b3f5488470362564fa84c350bdb7b41b14))
 - **FIX**(langchain_google): Add web platform compatibility for HttpClientAuthProvider ([#832](https://github.com/davidmigloz/langchain_dart/issues/832)). ([3a9e995b](https://github.com/davidmigloz/langchain_dart/commit/3a9e995b6dc75fe403175f6183c04387b6aa4e03))
 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))

#### `langchain_mistralai` - `v0.3.1`

 - **FEAT**(langchain_mistralai): Add tool/function calling support ([#888](https://github.com/davidmigloz/langchain_dart/issues/888)). ([f4a1480c](https://github.com/davidmigloz/langchain_dart/commit/f4a1480c787f53668569896933d0d9321600c20e))
 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))
 - **FEAT**(mistralai_dart): Align embeddings API with latest Mistral spec ([#886](https://github.com/davidmigloz/langchain_dart/issues/886)). ([769edc49](https://github.com/davidmigloz/langchain_dart/commit/769edc4937ac611b9c8d4b65421e403012f565a1))

#### `langchain_ollama` - `v0.4.1`

 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))

#### `langchain_openai` - `v0.8.1`

 - **FEAT**: Add listModels() API for LLMs and Embeddings ([#371](https://github.com/davidmigloz/langchain_dart/issues/371)) ([#844](https://github.com/davidmigloz/langchain_dart/issues/844)). ([4b737389](https://github.com/davidmigloz/langchain_dart/commit/4b7373894d5b8701b6d00d153c1741931a49b3a1))

#### `mistralai_dart` - `v0.1.1`

 - **FEAT**(mistralai_dart): Align Chat API with latest Mistral spec ([#887](https://github.com/davidmigloz/langchain_dart/issues/887)). ([b5a12301](https://github.com/davidmigloz/langchain_dart/commit/b5a1230184e79df5cef1256527eebd352d1a3f6a))
 - **FEAT**(mistralai_dart): Align embeddings API with latest Mistral spec ([#886](https://github.com/davidmigloz/langchain_dart/issues/886)). ([769edc49](https://github.com/davidmigloz/langchain_dart/commit/769edc4937ac611b9c8d4b65421e403012f565a1))

#### `openai_dart` - `v0.6.1`

 - **FEAT**(openai_dart): Add image streaming and new GPT image models ([#827](https://github.com/davidmigloz/langchain_dart/issues/827)). ([1218d8c3](https://github.com/davidmigloz/langchain_dart/commit/1218d8c3d67531066ba9b1e9320699461a7e172d))
 - **FEAT**(openai_dart): Add ImageGenStreamEvent schema for streaming ([#834](https://github.com/davidmigloz/langchain_dart/issues/834)). ([eb640052](https://github.com/davidmigloz/langchain_dart/commit/eb64005217cc632e6da7d222d257273dbf95cb41))
 - **FEAT**(openai_dart): Add ImageGenUsage schema for image generation ([#833](https://github.com/davidmigloz/langchain_dart/issues/833)). ([aecf79a9](https://github.com/davidmigloz/langchain_dart/commit/aecf79a93de2f74d051cb4fde7a0363a06375e96))
 - **FEAT**(openai_dart): Add metadata fields to ImagesResponse ([#831](https://github.com/davidmigloz/langchain_dart/issues/831)). ([bd94b4c6](https://github.com/davidmigloz/langchain_dart/commit/bd94b4c617555b3bbd7a3e97f4643a88ba128daa))
 - **FEAT**(openai_dart): Add prompt_tokens_details to CompletionUsage ([#830](https://github.com/davidmigloz/langchain_dart/issues/830)). ([ede649d1](https://github.com/davidmigloz/langchain_dart/commit/ede649d1d70816ef172f32837f311ff0955a26d3))
 - **FEAT**(openai_dart): Add fine-tuning method parameter and schemas ([#828](https://github.com/davidmigloz/langchain_dart/issues/828)). ([99d77425](https://github.com/davidmigloz/langchain_dart/commit/99d774252bf55e054602ee9b306cc32cb86e57eb))
 - **FEAT**(openai_dart): Add Batch model and usage fields ([#826](https://github.com/davidmigloz/langchain_dart/issues/826)). ([b2933f50](https://github.com/davidmigloz/langchain_dart/commit/b2933f50045180500874241d1b7177488d0282bc))
 - **FEAT**(openai_dart): Add OpenRouter-specific sampling parameters ([#825](https://github.com/davidmigloz/langchain_dart/issues/825)). ([3dd9075c](https://github.com/davidmigloz/langchain_dart/commit/3dd9075c7501dbf84713ca72d7506fd53c5bf1a4))
 - **FIX**(openai_dart): Remove default value from image stream parameter ([#829](https://github.com/davidmigloz/langchain_dart/issues/829)). ([d94c7063](https://github.com/davidmigloz/langchain_dart/commit/d94c70631e818057299eaa75fa7f807a7ec121fe))
 - **FIX**(openai_dart): Fix OpenRouter reasoning type enum parsing ([#810](https://github.com/davidmigloz/langchain_dart/issues/810)) ([#824](https://github.com/davidmigloz/langchain_dart/issues/824)). ([44ab2841](https://github.com/davidmigloz/langchain_dart/commit/44ab28414280c94e2599863770756ca8622650de))


## 2025-10-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.3.0+1`](#anthropic_sdk_dart---v0301)
 - [`chromadb` - `v0.3.0+1`](#chromadb---v0301)
 - [`googleai_dart` - `v1.1.0`](#googleai_dart---v110)
 - [`langchain` - `v0.8.0+1`](#langchain---v0801)
 - [`langchain_anthropic` - `v0.3.0+1`](#langchain_anthropic---v0301)
 - [`langchain_chroma` - `v0.3.0+1`](#langchain_chroma---v0301)
 - [`langchain_community` - `v0.4.0+1`](#langchain_community---v0401)
 - [`langchain_core` - `v0.4.0+1`](#langchain_core---v0401)
 - [`langchain_firebase` - `v0.3.0+1`](#langchain_firebase---v0301)
 - [`langchain_google` - `v0.7.0+1`](#langchain_google---v0701)
 - [`langchain_mistralai` - `v0.3.0+1`](#langchain_mistralai---v0301)
 - [`langchain_ollama` - `v0.4.0+1`](#langchain_ollama---v0401)
 - [`langchain_openai` - `v0.8.0+1`](#langchain_openai---v0801)
 - [`langchain_supabase` - `v0.2.0+1`](#langchain_supabase---v0201)
 - [`mistralai_dart` - `v0.1.0+1`](#mistralai_dart---v0101)
 - [`ollama_dart` - `v0.3.0+1`](#ollama_dart---v0301)
 - [`openai_dart` - `v0.6.0+1`](#openai_dart---v0601)
 - [`openai_realtime_dart` - `v0.1.0+1`](#openai_realtime_dart---v0101)
 - [`tavily_dart` - `v0.2.0+1`](#tavily_dart---v0201)
 - [`vertex_ai` - `v0.2.0+1`](#vertex_ai---v0201)

---

#### `googleai_dart` - `v1.1.0`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))
 - **FEAT**: Make googleai_dart fully WASM compatible ([#808](https://github.com/davidmigloz/langchain_dart/issues/808)). ([07e597f3](https://github.com/davidmigloz/langchain_dart/commit/07e597f3984b2c0396ebfb5ae7e981bb52872368))

#### `anthropic_sdk_dart` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `chromadb` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain` - `v0.8.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_anthropic` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_chroma` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_community` - `v0.4.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_core` - `v0.4.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_firebase` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_google` - `v0.7.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_mistralai` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_ollama` - `v0.4.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_openai` - `v0.8.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `langchain_supabase` - `v0.2.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `mistralai_dart` - `v0.1.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `ollama_dart` - `v0.3.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `openai_dart` - `v0.6.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `openai_realtime_dart` - `v0.1.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `tavily_dart` - `v0.2.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

#### `vertex_ai` - `v0.2.0+1`

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))


## 2025-10-15

### Changes

---

Packages with breaking changes:

 - [`anthropic_sdk_dart` - `v0.3.0`](#anthropic_sdk_dart---v030)
 - [`chromadb` - `v0.3.0`](#chromadb---v030)
 - [`googleai_dart` - `v1.0.0`](#googleai_dart---v100)
 - [`langchain` - `v0.8.0`](#langchain---v080)
 - [`langchain_anthropic` - `v0.3.0`](#langchain_anthropic---v030)
 - [`langchain_chroma` - `v0.3.0`](#langchain_chroma---v030)
 - [`langchain_community` - `v0.4.0`](#langchain_community---v040)
 - [`langchain_core` - `v0.4.0`](#langchain_core---v040)
 - [`langchain_firebase` - `v0.3.0`](#langchain_firebase---v030)
 - [`langchain_google` - `v0.7.0`](#langchain_google---v070)
 - [`langchain_mistralai` - `v0.3.0`](#langchain_mistralai---v030)
 - [`langchain_ollama` - `v0.4.0`](#langchain_ollama---v040)
 - [`langchain_openai` - `v0.8.0`](#langchain_openai---v080)
 - [`langchain_supabase` - `v0.2.0`](#langchain_supabase---v020)
 - [`langgraph` - `v0.0.1-dev.3`](#langgraph---v001-dev3)
 - [`mistralai_dart` - `v0.1.0`](#mistralai_dart---v010)
 - [`ollama_dart` - `v0.3.0`](#ollama_dart---v030)
 - [`openai_dart` - `v0.6.0`](#openai_dart---v060)
 - [`openai_realtime_dart` - `v0.1.0`](#openai_realtime_dart---v010)
 - [`tavily_dart` - `v0.2.0`](#tavily_dart---v020)
 - [`vertex_ai` - `v0.2.0`](#vertex_ai---v020)

Packages with other changes:

 - There are no other changes in this release.

---

#### `googleai_dart` - `v1.0.0`

**TL;DR**: Complete reimplementation with a new architecture, minimal dependencies, unified resource-based API, and full Gemini API coverage. Includes new Files, Batches, Caching, Corpora/RAG, RAG Stores, Dynamic Content, Permissions, Tuned Models, and Prediction (Veo) support.

### What's new

- **Unified client for both**:
  - Google AI Gemini Developer API
  - Vertex AI Gemini API
- **Complete API coverage**: 78 endpoints.
  - **Files API**: upload, list, get, delete, download.
  - **Generated Files API**: list, get, getOperation (video outputs).
  - **Cached Contents**: full CRUD.
  - **Batch operations**: batchGenerateContent, batchEmbedContents, asyncBatchEmbedContent with LRO polling.
  - **Corpora & RAG**: corpus CRUD (Google AI); documents/chunks/query, metadata filters, batch chunk ops (Vertex AI only).
  - **RAG Stores**: documents list/create/get/delete/query + operations.
  - **Dynamic Content**: generate/stream content with dynamic model IDs.
  - **Permissions**: create/list/get/update/delete/transferOwnership for eligible resources.
  - **Tuned Models**: list, get, listOperations, generation APIs.
  - **Prediction (Veo)**: predict, predictLongRunning, operation polling, RAI filtering.
- **Architecture**:
  - Interceptor chain (Auth → Logging → Error).
  - **Authentication**: API key, Bearer token, custom OAuth via `AuthProvider`.
  - **Retry** with exponential backoff + jitter.
  - **Abortable** requests via `abortTrigger` (streaming and non-streaming).
  - **SSE** streaming parser.
  - Central `GoogleAIConfig` (timeouts, retry policy, log level, baseUrl).
- **Testing**:
  - **560+ tests** covering all endpoints, error branches, streaming/abort flows.

#### `anthropic_sdk_dart` - `v0.3.0`

 - **FIX**: Handle optional space after colon in SSE parser in anthropic_sdk_dart ([#790](https://github.com/davidmigloz/langchain_dart/issues/790)). ([b31fbead](https://github.com/davidmigloz/langchain_dart/commit/b31fbead3ad4cb3ca9aabd6d8fee5e523df82d65))
 - **FEAT**: Add extended thinking support to anthropic_sdk_dart ([#803](https://github.com/davidmigloz/langchain_dart/issues/803)). ([1ccb74a6](https://github.com/davidmigloz/langchain_dart/commit/1ccb74a639d63325a7fcac8474ed0500dedd657e))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `ollama_dart` - `v0.3.0`

 - **FEAT**: Enhance CreateModelRequest with new fields in ollama_dart ([#802](https://github.com/davidmigloz/langchain_dart/issues/802)). ([c5c73549](https://github.com/davidmigloz/langchain_dart/commit/c5c73549c51354996b2ca6bbce9d4c4c721fc159))
 - **FEAT**: Add tool_name and index support in ollama_dart ([#800](https://github.com/davidmigloz/langchain_dart/issues/800)). ([f0f77286](https://github.com/davidmigloz/langchain_dart/commit/f0f77286c02c64ea7b75a011761e677fc168ffff))
 - **FEAT**: Add remote_model and remote_host support in ollama_dart ([#799](https://github.com/davidmigloz/langchain_dart/issues/799)). ([36b9d5f2](https://github.com/davidmigloz/langchain_dart/commit/36b9d5f2ba26df6dd79f7105903cdbdd25711ebe))
 - **FEAT**: Add truncate and shift support in ollama_dart ([#798](https://github.com/davidmigloz/langchain_dart/issues/798)). ([098a0815](https://github.com/davidmigloz/langchain_dart/commit/098a08150f2607bf283bb5d2aef82593c91cf221))
 - **FEAT**: Support high, medium, low for think in ollama_dart ([#797](https://github.com/davidmigloz/langchain_dart/issues/797)). ([1cbe3fcf](https://github.com/davidmigloz/langchain_dart/commit/1cbe3fcf96926eb2e81b9f9a7aec8f37797c76d3))
 - **FEAT**: Support JSON schema in ResponseFormat in ollama_dart ([#796](https://github.com/davidmigloz/langchain_dart/issues/796)). ([2f399465](https://github.com/davidmigloz/langchain_dart/commit/2f3994656c32f32a79bb0b613bf38b9fd2e83b3d))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **REFACTOR**: Improve factory names in ollama_dart ([#806](https://github.com/davidmigloz/langchain_dart/issues/806)). ([fbfa7acb](https://github.com/davidmigloz/langchain_dart/commit/fbfa7acb071a8c2271a6cfb6506e9f6d8b863ca4))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `openai_dart` - `v0.6.0`

 - **FIX**: Correct text content serialization in CreateMessageRequest in openai_dart ([#805](https://github.com/davidmigloz/langchain_dart/issues/805)). ([e4569c96](https://github.com/davidmigloz/langchain_dart/commit/e4569c96ede23223ca23711579d2415bd05b4e27))
 - **FIX**: Handle optional space after colon in SSE parser in openai_dart ([#779](https://github.com/davidmigloz/langchain_dart/issues/779)). ([9defa827](https://github.com/davidmigloz/langchain_dart/commit/9defa827ce145533a85ead2bccfc25f5fa069358))
 - **FEAT**: Add OpenRouter provider routing support in openai_dart ([#794](https://github.com/davidmigloz/langchain_dart/issues/794)). ([6d306bc1](https://github.com/davidmigloz/langchain_dart/commit/6d306bc1f8e8fda8dcf581ec993eea0c755f9433))
 - **FEAT**: Add OpenAI-compatible vendor reasoning content support ([#793](https://github.com/davidmigloz/langchain_dart/issues/793)). ([e0712c38](https://github.com/davidmigloz/langchain_dart/commit/e0712c3851377fae10a0b35606e1b5098abc575b))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `chromadb` - `v0.3.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain` - `v0.8.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_anthropic` - `v0.3.0`

 - **FEAT**: Add extended thinking support to langchain_anthropic ([#804](https://github.com/davidmigloz/langchain_dart/issues/804)). ([0e58fd31](https://github.com/davidmigloz/langchain_dart/commit/0e58fd316191091fb014287b24063fca61b4a2e5))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_chroma` - `v0.3.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_community` - `v0.4.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_core` - `v0.4.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_firebase` - `v0.3.0`

 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_google` - `v0.7.0`

 - **REFACTOR**: Migrate langchain_google to the new googleai_dart client ([#788](https://github.com/davidmigloz/langchain_dart/issues/788)). ([f28edec9](https://github.com/davidmigloz/langchain_dart/commit/f28edec9206450d753db181f8af254df339d8290))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_mistralai` - `v0.3.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_ollama` - `v0.4.0`

 - **FEAT**: Add think support to Ollama and ChatOllama ([#801](https://github.com/davidmigloz/langchain_dart/issues/801)). ([553c7282](https://github.com/davidmigloz/langchain_dart/commit/553c72829073584b428770139939bd790da5c6aa))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **REFACTOR**: Improve factory names in ollama_dart ([#806](https://github.com/davidmigloz/langchain_dart/issues/806)). ([fbfa7acb](https://github.com/davidmigloz/langchain_dart/commit/fbfa7acb071a8c2271a6cfb6506e9f6d8b863ca4))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_openai` - `v0.8.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langchain_supabase` - `v0.2.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `langgraph` - `v0.0.1-dev.3`

 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `mistralai_dart` - `v0.1.0`

 - **FIX**: Add missing usage field to ChatCompletionStreamResponse in mistralai_dart ([#795](https://github.com/davidmigloz/langchain_dart/issues/795)). ([4da75561](https://github.com/davidmigloz/langchain_dart/commit/4da75561b173313479f50441bf318bd4b948032d))
 - **FIX**: Handle optional space after colon in SSE parser in mistralai_dart ([#791](https://github.com/davidmigloz/langchain_dart/issues/791)). ([cefb1d2f](https://github.com/davidmigloz/langchain_dart/commit/cefb1d2f124ba64da60e3f33ec16672542cae28c))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `openai_realtime_dart` - `v0.1.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `tavily_dart` - `v0.2.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

#### `vertex_ai` - `v0.2.0`

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))


## 2025-08-31

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.2.3`](#anthropic_sdk_dart---v023)
 - [`chromadb` - `v0.2.3`](#chromadb---v023)
 - [`googleai_dart` - `v0.1.3`](#googleai_dart---v013)
 - [`mistralai_dart` - `v0.0.6`](#mistralai_dart---v006)
 - [`ollama_dart` - `v0.2.5`](#ollama_dart---v025)
 - [`openai_dart` - `v0.5.5`](#openai_dart---v055)
 - [`openai_realtime_dart` - `v0.0.6`](#openai_realtime_dart---v006)
 - [`tavily_dart` - `v0.1.3`](#tavily_dart---v013)
 - [`langchain_anthropic` - `v0.2.1+3`](#langchain_anthropic---v0213)
 - [`langchain_chroma` - `v0.2.2+3`](#langchain_chroma---v0223)
 - [`langchain_mistralai` - `v0.2.4+3`](#langchain_mistralai---v0243)
 - [`langchain_ollama` - `v0.3.3+3`](#langchain_ollama---v0333)
 - [`langchain_openai` - `v0.7.6+2`](#langchain_openai---v0762)
 - [`langchain_community` - `v0.3.4+3`](#langchain_community---v0343)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_anthropic` - `v0.2.1+3`
 - `langchain_chroma` - `v0.2.2+3`
 - `langchain_mistralai` - `v0.2.4+3`
 - `langchain_ollama` - `v0.3.3+3`
 - `langchain_openai` - `v0.7.6+2`
 - `langchain_community` - `v0.3.4+3`

---

#### `anthropic_sdk_dart` - `v0.2.3`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `chromadb` - `v0.2.3`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `googleai_dart` - `v0.1.3`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `mistralai_dart` - `v0.0.6`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `ollama_dart` - `v0.2.5`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `openai_dart` - `v0.5.5`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `openai_realtime_dart` - `v0.0.6`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

#### `tavily_dart` - `v0.1.3`

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))


## 2025-08-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_firebase` - `v0.2.2+4`](#langchain_firebase---v0224)

---

#### `langchain_firebase` - `v0.2.2+4`

 - **FIX**: depend_on_referenced_packages error ([#772](https://github.com/davidmigloz/langchain_dart/issues/772)). ([ef57d530](https://github.com/davidmigloz/langchain_dart/commit/ef57d5303331c7cb85fdb077a50e040a819ec94e))


## 2025-08-25

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_firebase` - `v0.2.2+3`](#langchain_firebase---v0223)
 - [`openai_dart` - `v0.5.4+1`](#openai_dart---v0541)
 - [`langchain_openai` - `v0.7.6+1`](#langchain_openai---v0761)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.6+1`

---

#### `langchain_firebase` - `v0.2.2+3`

 - **FIX**: Breaking change in firebase_vertexai package ([#770](https://github.com/davidmigloz/langchain_dart/issues/770)). ([6a21546e](https://github.com/davidmigloz/langchain_dart/commit/6a21546e889956cc8e0f9282073757e8aa2abeb3))

#### `openai_dart` - `v0.5.4+1`

 - **FIX**: Change CreateChatCompletionRequest.verbosity default value to null ([#771](https://github.com/davidmigloz/langchain_dart/issues/771)). ([46d22905](https://github.com/davidmigloz/langchain_dart/commit/46d22905fee42dd7f1b149d676323d8bce57630f))


## 2025-08-10

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.7.9`](#langchain---v079)
 - [`langchain_core` - `v0.3.9`](#langchain_core---v039)
 - [`langchain_firebase` - `v0.2.2+2`](#langchain_firebase---v0222)
 - [`langchain_google` - `v0.6.5+2`](#langchain_google---v0652)
 - [`langchain_openai` - `v0.7.6`](#langchain_openai---v076)
 - [`openai_dart` - `v0.5.4`](#openai_dart---v054)
 - [`langchain_anthropic` - `v0.2.1+2`](#langchain_anthropic---v0212)
 - [`langchain_chroma` - `v0.2.2+2`](#langchain_chroma---v0222)
 - [`langchain_community` - `v0.3.4+2`](#langchain_community---v0342)
 - [`langchain_mistralai` - `v0.2.4+2`](#langchain_mistralai---v0242)
 - [`langchain_ollama` - `v0.3.3+2`](#langchain_ollama---v0332)
 - [`langchain_pinecone` - `v0.1.1+2`](#langchain_pinecone---v0112)
 - [`langchain_supabase` - `v0.1.2+2`](#langchain_supabase---v0122)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_anthropic` - `v0.2.1+2`
 - `langchain_chroma` - `v0.2.2+2`
 - `langchain_community` - `v0.3.4+2`
 - `langchain_mistralai` - `v0.2.4+2`
 - `langchain_ollama` - `v0.3.3+2`
 - `langchain_pinecone` - `v0.1.1+2`
 - `langchain_supabase` - `v0.1.2+2`

---

#### `langchain` - `v0.7.9`

 - **DOCS**: Remove Code Assist AI badge ([#752](https://github.com/davidmigloz/langchain_dart/issues/752)). ([dc0e70df](https://github.com/davidmigloz/langchain_dart/commit/dc0e70dfd9866267456b6caf0b76bf0cc646a425))

#### `langchain_openai` - `v0.7.6`

 - **FEAT**: Support reasoningEffort, verbosity and other new fields in ChatOpenAI ([#762](https://github.com/davidmigloz/langchain_dart/issues/762)). ([9cc5d591](https://github.com/davidmigloz/langchain_dart/commit/9cc5d591e868bd5dd3e0a926e564d797dd602dab))
 - **FEAT**: Update ChatOpenAI default model to gpt-5-mini ([#761](https://github.com/davidmigloz/langchain_dart/issues/761)). ([b38ce320](https://github.com/davidmigloz/langchain_dart/commit/b38ce320971373454e10506e79ff75479b0391cd))

#### `langchain_firebase` - `v0.2.2+2`

 - **FIX**: Batch sequential tool responses in GoogleAI & Firebase VertexAI ([#757](https://github.com/davidmigloz/langchain_dart/issues/757)). ([8ff44486](https://github.com/davidmigloz/langchain_dart/commit/8ff4448665d26b49c1e1077d0822703e7d853d39))

#### `langchain_google` - `v0.6.5+2`

 - **FIX**: Batch sequential tool responses in GoogleAI & Firebase VertexAI ([#757](https://github.com/davidmigloz/langchain_dart/issues/757)). ([8ff44486](https://github.com/davidmigloz/langchain_dart/commit/8ff4448665d26b49c1e1077d0822703e7d853d39))

#### `openai_dart` - `v0.5.4`

 - **FEAT**: Add gpt-5 to model catalog in openai_dart ([#758](https://github.com/davidmigloz/langchain_dart/issues/758)). ([f92c94ed](https://github.com/davidmigloz/langchain_dart/commit/f92c94ed799ab49e988f97880017f041522216a6))
 - **FEAT**: Add support for minimal reasoning effort in openai_dart ([#760](https://github.com/davidmigloz/langchain_dart/issues/760)). ([2ebc5506](https://github.com/davidmigloz/langchain_dart/commit/2ebc5506505e07f3d9b85ef60e1c54ed171a7480))
 - **FEAT**: Add Verbosity support in openai_dart ([#759](https://github.com/davidmigloz/langchain_dart/issues/759)). ([3894da76](https://github.com/davidmigloz/langchain_dart/commit/3894da76229bb0fd4a5124b68cd02e2996a6854a))


## 2025-07-30

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.2.2`](#anthropic_sdk_dart---v022)
 - [`chromadb` - `v0.2.2`](#chromadb---v022)
 - [`googleai_dart` - `v0.1.2`](#googleai_dart---v012)
 - [`langchain` - `v0.7.8+1`](#langchain---v0781)
 - [`langchain_anthropic` - `v0.2.1+1`](#langchain_anthropic---v0211)
 - [`langchain_chroma` - `v0.2.2+1`](#langchain_chroma---v0221)
 - [`langchain_community` - `v0.3.4+1`](#langchain_community---v0341)
 - [`langchain_core` - `v0.3.8`](#langchain_core---v038)
 - [`langchain_firebase` - `v0.2.2+1`](#langchain_firebase---v0221)
 - [`langchain_google` - `v0.6.5+1`](#langchain_google---v0651)
 - [`langchain_mistralai` - `v0.2.4+1`](#langchain_mistralai---v0241)
 - [`langchain_ollama` - `v0.3.3+1`](#langchain_ollama---v0331)
 - [`langchain_openai` - `v0.7.5`](#langchain_openai---v075)
 - [`langchain_pinecone` - `v0.1.1+1`](#langchain_pinecone---v0111)
 - [`langchain_supabase` - `v0.1.2+1`](#langchain_supabase---v0121)
 - [`mistralai_dart` - `v0.0.5`](#mistralai_dart---v005)
 - [`ollama_dart` - `v0.2.4`](#ollama_dart---v024)
 - [`openai_dart` - `v0.5.3`](#openai_dart---v053)
 - [`openai_realtime_dart` - `v0.0.5`](#openai_realtime_dart---v005)
 - [`tavily_dart` - `v0.1.2`](#tavily_dart---v012)
 - [`vertex_ai` - `v0.1.2`](#vertex_ai---v012)

---

#### `anthropic_sdk_dart` - `v0.2.2`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `chromadb` - `v0.2.2`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015)

#### `googleai_dart` - `v0.1.2`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain` - `v0.7.8+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_anthropic` - `v0.2.1+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_chroma` - `v0.2.2+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_community` - `v0.3.4+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_core` - `v0.3.8`

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **FIX**: Add multi-LLM compatibility for Tool.fromFunction getInputFromJson ([#738](https://github.com/davidmigloz/langchain_dart/issues/738)). ([291a0efc](https://github.com/davidmigloz/langchain_dart/commit/291a0efcebe1696f609ecbd0b803cc9324474db5))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_firebase` - `v0.2.2+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_google` - `v0.6.5+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_mistralai` - `v0.2.4+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_ollama` - `v0.3.3+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_openai` - `v0.7.5`

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_pinecone` - `v0.1.1+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `langchain_supabase` - `v0.1.2+1`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `mistralai_dart` - `v0.0.5`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `ollama_dart` - `v0.2.4`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `openai_dart` - `v0.5.3`

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `openai_realtime_dart` - `v0.0.5`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `tavily_dart` - `v0.1.2`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

#### `vertex_ai` - `v0.1.2`

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))


## 2025-06-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.5.2`](#openai_dart---v052)
 - [`langchain_openai` - `v0.7.4+2`](#langchain_openai---v0742)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.4+2`

---

#### `openai_dart` - `v0.5.2`

 - **FEAT**: Make Model.object/owned_by  fields nullable to support OpenRouter's OpenAI-compatible API ([#736](https://github.com/davidmigloz/langchain_dart/issues/736)). ([afa98b8c](https://github.com/davidmigloz/langchain_dart/commit/afa98b8c44c612126f2f6ee32d6aecdad41663b4))
 - **FEAT**: Make Model.created field nullable to support Google's OpenAI-compatible API ([#735](https://github.com/davidmigloz/langchain_dart/issues/735)). ([d617e49f](https://github.com/davidmigloz/langchain_dart/commit/d617e49f9d5760e2714d27d76cf699364e9cfe51))


## 2025-06-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.5.1`](#openai_dart---v051)
 - [`openai_realtime_dart` - `v0.0.4+1`](#openai_realtime_dart---v0041)
 - [`langchain_openai` - `v0.7.4+1`](#langchain_openai---v0741)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.4+1`

---

#### `openai_dart` - `v0.5.1`

 - **FEAT**: Make ToolCallChunk.index field nullable to support Gemini OpenAI-compatible API ([#733](https://github.com/davidmigloz/langchain_dart/issues/733)). ([19cb49c0](https://github.com/davidmigloz/langchain_dart/commit/19cb49c09e42204cc523fbbdd3941b3070146063))
 - **FEAT**: Make Embedding.index field nullable to support Gemini OpenAI-compatible API ([#729](https://github.com/davidmigloz/langchain_dart/issues/729)). ([9d22f197](https://github.com/davidmigloz/langchain_dart/commit/9d22f1972d99b8b1f6dbcfcb3f7bfba2257fca5b))

#### `openai_realtime_dart` - `v0.0.4+1`

 - **FIX**: toolChoice required infinite loop in openai_realtime_dart ([#723](https://github.com/davidmigloz/langchain_dart/issues/723)). ([f52211cc](https://github.com/davidmigloz/langchain_dart/commit/f52211cca063d64e346a4ed023c337a351ca3e33))


## 2025-06-12

### Changes

---

Packages with breaking changes:

 - [`openai_dart` - `v0.5.0`](#openai_dart---v050)

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.2.1`](#anthropic_sdk_dart---v021)
 - [`chromadb` - `v0.2.1`](#chromadb---v021)
 - [`googleai_dart` - `v0.1.1`](#googleai_dart---v011)
 - [`langchain` - `v0.7.8`](#langchain---v078)
 - [`langchain_anthropic` - `v0.2.1`](#langchain_anthropic---v021)
 - [`langchain_chroma` - `v0.2.2`](#langchain_chroma---v022)
 - [`langchain_community` - `v0.3.4`](#langchain_community---v034)
 - [`langchain_core` - `v0.3.7`](#langchain_core---v037)
 - [`langchain_firebase` - `v0.2.2`](#langchain_firebase---v022)
 - [`langchain_google` - `v0.6.5`](#langchain_google---v065)
 - [`langchain_mistralai` - `v0.2.4`](#langchain_mistralai---v024)
 - [`langchain_ollama` - `v0.3.3`](#langchain_ollama---v033)
 - [`langchain_openai` - `v0.7.4`](#langchain_openai---v074)
 - [`langchain_pinecone` - `v0.1.1`](#langchain_pinecone---v011)
 - [`langchain_supabase` - `v0.1.2`](#langchain_supabase---v012)
 - [`langgraph` - `v0.0.1-dev.2`](#langgraph---v001-dev2)
 - [`mistralai_dart` - `v0.0.4`](#mistralai_dart---v004)
 - [`ollama_dart` - `v0.2.3`](#ollama_dart---v023)
 - [`openai_realtime_dart` - `v0.0.4`](#openai_realtime_dart---v004)
 - [`tavily_dart` - `v0.1.1`](#tavily_dart---v011)
 - [`vertex_ai` - `v0.1.1`](#vertex_ai---v011)

---

#### `openai_dart` - `v0.5.0`

 - **BREAKING** **FEAT**: Align OpenAI API changes ([#706](https://github.com/davidmigloz/langchain_dart/issues/706)). ([b8b04ca6](https://github.com/davidmigloz/langchain_dart/commit/b8b04ca618ffbc6f84b935a89852767479da1611))
 - **FEAT**: Add support for web search, gpt-image-1 and list chat completions ([#716](https://github.com/davidmigloz/langchain_dart/issues/716)). ([269dea03](https://github.com/davidmigloz/langchain_dart/commit/269dea035be679c8d2fcc03f526703c76c72c5d4))
 - **FEAT**: Update OpenAI model catalog ([#714](https://github.com/davidmigloz/langchain_dart/issues/714)). ([68df4558](https://github.com/davidmigloz/langchain_dart/commit/68df4558a01e872c73ad465f4b85f1b5c61ddd50))
 - **FEAT**: Change the default value of 'reasoning_effort' from medium to null ([#713](https://github.com/davidmigloz/langchain_dart/issues/713)). ([f224572e](https://github.com/davidmigloz/langchain_dart/commit/f224572eff249daa1971a7f287c150ee3779a6b2))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **DOCS**: Fix TruncationObject docs typo in openai_dart. ([ee5ed4fd](https://github.com/davidmigloz/langchain_dart/commit/ee5ed4fdfdf4213ceec05d7a5a2b24cca95ae386))
 - **DOCS**: Document Azure Assistants API base url ([#626](https://github.com/davidmigloz/langchain_dart/issues/626)). ([c3459eea](https://github.com/davidmigloz/langchain_dart/commit/c3459eea354f36a11f69145a7313b3feda7a15eb))

#### `anthropic_sdk_dart` - `v0.2.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `chromadb` - `v0.2.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `googleai_dart` - `v0.1.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain` - `v0.7.8`

 - **FEAT**: Implement Markdown text splitter ([#635](https://github.com/davidmigloz/langchain_dart/issues/635)). ([242e4be2](https://github.com/davidmigloz/langchain_dart/commit/242e4be227503f93120b209bca350ed6a055f362))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **FEAT**: Add to/fromMap serialization to ChatMessage, PromptValue & ChatHistory ([#681](https://github.com/davidmigloz/langchain_dart/issues/681)). ([d239c7c7](https://github.com/davidmigloz/langchain_dart/commit/d239c7c7b4a1504559e475466be7f176521a0473))
 - **FIX**: Correctly calculate start_index when using chunkOverlap in TextSplitter ([#640](https://github.com/davidmigloz/langchain_dart/issues/640)). ([71dd5ac3](https://github.com/davidmigloz/langchain_dart/commit/71dd5ac31351d0ea45989c43a250a35668cb01b6))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **FIX**: Made apiKey optional for `TavilyAnswerTool` and `TavilySearchResultsTool` ([#646](https://github.com/davidmigloz/langchain_dart/issues/646)). ([5085ea4a](https://github.com/davidmigloz/langchain_dart/commit/5085ea4ad8b5cd072832e73afcbb7075a6375307))

#### `langchain_anthropic` - `v0.2.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_chroma` - `v0.2.2`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_community` - `v0.3.4`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix static instance of ObjectBoxVectorStore ([#684](https://github.com/davidmigloz/langchain_dart/issues/684)). ([719ead93](https://github.com/davidmigloz/langchain_dart/commit/719ead93c6e91d42bb8e45910ccf0da4e3e51afd))
 - **FIX**: Fix langchain_community  WASM compatibility ([#660](https://github.com/davidmigloz/langchain_dart/issues/660)). ([0be8aae4](https://github.com/davidmigloz/langchain_dart/commit/0be8aae44950fddd9ac9538ccfa5d017e6f585a0))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **FIX**: Made apiKey optional for `TavilyAnswerTool` and `TavilySearchResultsTool` ([#646](https://github.com/davidmigloz/langchain_dart/issues/646)). ([5085ea4a](https://github.com/davidmigloz/langchain_dart/commit/5085ea4ad8b5cd072832e73afcbb7075a6375307))

#### `langchain_core` - `v0.3.7`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **FEAT**: Add to/fromMap serialization to ChatMessage, PromptValue & ChatHistory ([#681](https://github.com/davidmigloz/langchain_dart/issues/681)). ([d239c7c7](https://github.com/davidmigloz/langchain_dart/commit/d239c7c7b4a1504559e475466be7f176521a0473))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **FIX**: RunnableMap doesn't invoke multiple Runnables in parallel ([#649](https://github.com/davidmigloz/langchain_dart/issues/649)). ([fc722d85](https://github.com/davidmigloz/langchain_dart/commit/fc722d85eef6644f7593dd26c7fd55a56615595b))

#### `langchain_firebase` - `v0.2.2`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **REFACTOR**: Migrate firebase_vertexai dep to 1.4.0 ([#663](https://github.com/davidmigloz/langchain_dart/issues/663)). ([4fca38c5](https://github.com/davidmigloz/langchain_dart/commit/4fca38c5599c4c5a058ece1a7d9c4e276b716432))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_google` - `v0.6.5`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_mistralai` - `v0.2.4`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **DOCS**: Add langchain_mistralai example ([#662](https://github.com/davidmigloz/langchain_dart/issues/662)). ([eca7a24d](https://github.com/davidmigloz/langchain_dart/commit/eca7a24d50629b9ce7d61a197bfd9acfb74a1261))

#### `langchain_ollama` - `v0.3.3`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **DOCS**: Add langchain_ollama example ([#661](https://github.com/davidmigloz/langchain_dart/issues/661)). ([0bba6cb4](https://github.com/davidmigloz/langchain_dart/commit/0bba6cb4ebe4386ad53b1aa02836d375d5f59cbe))

#### `langchain_openai` - `v0.7.4`

 - **FEAT**: Update OpenAI model catalog ([#714](https://github.com/davidmigloz/langchain_dart/issues/714)). ([68df4558](https://github.com/davidmigloz/langchain_dart/commit/68df4558a01e872c73ad465f4b85f1b5c61ddd50))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_pinecone` - `v0.1.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langchain_supabase` - `v0.1.2`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `langgraph` - `v0.0.1-dev.2`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))

#### `mistralai_dart` - `v0.0.4`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `ollama_dart` - `v0.2.3`

 - **FEAT**: Add think/thinking params to ollama_dart ([#721](https://github.com/davidmigloz/langchain_dart/issues/721)). ([701d7968](https://github.com/davidmigloz/langchain_dart/commit/701d7968baaa07f5612a25d74a1d19c2c24e7077))
 - **FEAT**: Add capabilities, projector_info, tensors and modified_at to Ollama's ModelInfo ([#690](https://github.com/davidmigloz/langchain_dart/issues/690)). ([c5e247db](https://github.com/davidmigloz/langchain_dart/commit/c5e247db6aadedaa6ec668652e416477a6c03b51))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

#### `openai_realtime_dart` - `v0.0.4`

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

#### `tavily_dart` - `v0.1.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **FIX**: Made apiKey optional for `TavilyAnswerTool` and `TavilySearchResultsTool` ([#646](https://github.com/davidmigloz/langchain_dart/issues/646)). ([5085ea4a](https://github.com/davidmigloz/langchain_dart/commit/5085ea4ad8b5cd072832e73afcbb7075a6375307))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))

#### `vertex_ai` - `v0.1.1`

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))


## 2024-12-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`anthropic_sdk_dart` - `v0.2.0+1`](#anthropic_sdk_dart---v0201)
 - [`chromadb` - `v0.2.0+2`](#chromadb---v0202)
 - [`googleai_dart` - `v0.1.0+3`](#googleai_dart---v0103)
 - [`langchain` - `v0.7.7+2`](#langchain---v0772)
 - [`langchain_anthropic` - `v0.2.0+1`](#langchain_anthropic---v0201)
 - [`langchain_community` - `v0.3.3`](#langchain_community---v033)
 - [`langchain_core` - `v0.3.6+1`](#langchain_core---v0361)
 - [`langchain_firebase` - `v0.2.1+4`](#langchain_firebase---v0214)
 - [`langchain_google` - `v0.6.4+2`](#langchain_google---v0642)
 - [`langchain_mistralai` - `v0.2.3+2`](#langchain_mistralai---v0232)
 - [`langchain_ollama` - `v0.3.2+2`](#langchain_ollama---v0322)
 - [`langchain_openai` - `v0.7.3`](#langchain_openai---v073)
 - [`mistralai_dart` - `v0.0.3+4`](#mistralai_dart---v0034)
 - [`ollama_dart` - `v0.2.2+1`](#ollama_dart---v0221)
 - [`openai_dart` - `v0.4.5`](#openai_dart---v045)
 - [`openai_realtime_dart` - `v0.0.3+1`](#openai_realtime_dart---v0031)
 - [`tavily_dart` - `v0.1.0+1`](#tavily_dart---v0101)
 - [`vertex_ai` - `v0.1.0+3`](#vertex_ai---v0103)
 - [`langchain_chroma` - `v0.2.1+5`](#langchain_chroma---v0215)
 - [`langchain_pinecone` - `v0.1.0+11`](#langchain_pinecone---v01011)
 - [`langchain_supabase` - `v0.1.1+4`](#langchain_supabase---v0114)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_chroma` - `v0.2.1+5`
 - `langchain_pinecone` - `v0.1.0+11`
 - `langchain_supabase` - `v0.1.1+4`

---

#### `langchain` - `v0.7.7+2`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_core` - `v0.3.6+1`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_community` - `v0.3.3`

 - **FEAT**: Add support for DirectoryLoader ([#620](https://github.com/davidmigloz/langchain_dart/issues/620)). ([4730f2a3](https://github.com/davidmigloz/langchain_dart/commit/4730f2a376b152ea38e5204125209ef01f29cab9))
 - **FEAT**: Expose internal store in ObjectBoxVectorStore ([#611](https://github.com/davidmigloz/langchain_dart/issues/611)). ([c33f2e07](https://github.com/davidmigloz/langchain_dart/commit/c33f2e07c31ddd91dae16856df3b6c8ffddc45e9))
 - **FIX**: Chinese character support on web loader ([#600](https://github.com/davidmigloz/langchain_dart/issues/600)). ([48e64d5b](https://github.com/davidmigloz/langchain_dart/commit/48e64d5b01aa8469dbf7a973350eeac26b43df8f))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `langchain_openai` - `v0.7.3`

 - **FEAT**: Add gpt-4o-2024-11-20 to model catalog in openai_dart ([#614](https://github.com/davidmigloz/langchain_dart/issues/614)). ([bf333081](https://github.com/davidmigloz/langchain_dart/commit/bf33308165869792446c3897db95e6ad7a7cb519))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_anthropic` - `v0.2.0+1`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_firebase` - `v0.2.1+4`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_google` - `v0.6.4+2`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_mistralai` - `v0.2.3+2`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `langchain_ollama` - `v0.3.2+2`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

#### `openai_dart` - `v0.4.5`

 - **FEAT**: Support Predicted Outputs in openai_dart ([#613](https://github.com/davidmigloz/langchain_dart/issues/613)). ([315fe0fd](https://github.com/davidmigloz/langchain_dart/commit/315fe0fd3227e2c5a1a874be7fd01e25dcd7b33c))
 - **FEAT**: Support streaming audio responses in chat completions in openai_dart ([#615](https://github.com/davidmigloz/langchain_dart/issues/615)). ([6da756a8](https://github.com/davidmigloz/langchain_dart/commit/6da756a87be35a34048c6671f7629b553bf0699e))
 - **FEAT**: Add gpt-4o-2024-11-20 to model catalog in openai_dart ([#614](https://github.com/davidmigloz/langchain_dart/issues/614)). ([bf333081](https://github.com/davidmigloz/langchain_dart/commit/bf33308165869792446c3897db95e6ad7a7cb519))
 - **FIX**: Default store field to null in openai_dart to support Azure and Groq APIs ([#608](https://github.com/davidmigloz/langchain_dart/issues/608)). ([21332960](https://github.com/davidmigloz/langchain_dart/commit/21332960c2c9928873b5b2948b86af31245f9312))
 - **FIX**: Make first_id and last_id nullable in list endpoints in openai_dart ([#607](https://github.com/davidmigloz/langchain_dart/issues/607)). ([7cfc4ddf](https://github.com/davidmigloz/langchain_dart/commit/7cfc4ddf469846624d3dd6f3f86cab54c5333395))
 - **DOCS**: Update OpenAI endpoints descriptions ([#612](https://github.com/davidmigloz/langchain_dart/issues/612)). ([10c66888](https://github.com/davidmigloz/langchain_dart/commit/10c6688884f8bc42ddaa771996030a42125333de))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `openai_realtime_dart` - `v0.0.3+1`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))
 - **DOCS**: Update openai_spec_official.yaml. ([ee2eb35b](https://github.com/davidmigloz/langchain_dart/commit/ee2eb35b983afdb504ae52d3dfca5fea11a1dadb))
 - **DOCS**: Update README.md. ([44291a06](https://github.com/davidmigloz/langchain_dart/commit/44291a06af7ae26f0a5beadfec23f2128f5e2415))

#### `anthropic_sdk_dart` - `v0.2.0+1`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `chromadb` - `v0.2.0+2`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `googleai_dart` - `v0.1.0+3`

 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `mistralai_dart` - `v0.0.3+4`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `ollama_dart` - `v0.2.2+1`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `tavily_dart` - `v0.1.0+1`

 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

#### `vertex_ai` - `v0.1.0+3`

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))


## 2024-10-31

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.4.4`](#openai_dart---v044)
 - [`openai_realtime_dart` - `v0.0.3`](#openai_realtime_dart---v003)
 - [`langchain_openai` - `v0.7.2+5`](#langchain_openai---v0725)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.2+5`

---

#### `openai_dart` - `v0.4.4`

 - **FEAT**: Add five new voice types to Chat Completions API in openai_dart ([#594](https://github.com/davidmigloz/langchain_dart/issues/594)). ([543f2977](https://github.com/davidmigloz/langchain_dart/commit/543f2977ea1e6dd6e49fa4a2ae9a084ae525003e))

#### `openai_realtime_dart` - `v0.0.3`

 - **FEAT**: Add five new voice types in openai_realtime_dart and minor improvements ([#593](https://github.com/davidmigloz/langchain_dart/issues/593)). ([6d0c8d3f](https://github.com/davidmigloz/langchain_dart/commit/6d0c8d3fceaab9d3eac7c5265b1e8b50deef9cc4))
 - **DOCS**: Update openai_realtime_dart README.md. ([7e9e1393](https://github.com/davidmigloz/langchain_dart/commit/7e9e139315b31308817fc71439feceb705d06ec2))


## 2024-10-29

### Changes

---

Packages with breaking changes:

 - [`anthropic_sdk_dart` - `v0.2.0`](#anthropic_sdk_dart---v020)
 - [`langchain_anthropic` - `v0.2.0`](#langchain_anthropic---v020)

Packages with other changes:

 - [`langchain_community` - `v0.3.2+2`](#langchain_community---v0322)
 - [`openai_dart` - `v0.4.3`](#openai_dart---v043)
 - [`openai_realtime_dart` - `v0.0.2`](#openai_realtime_dart---v002)
 - [`langchain_openai` - `v0.7.2+4`](#langchain_openai---v0724)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.2+4`

---

#### `langchain_anthropic` - `v0.2.0`

 - **FEAT**: Update ChatAnthropic default model to claude-3-5-sonnet-20241022 ([#584](https://github.com/davidmigloz/langchain_dart/issues/584)). ([4f0d9cfb](https://github.com/davidmigloz/langchain_dart/commit/4f0d9cfb0a71c567d1b37842cd44dac1f7308001))

#### `langchain_community` - `v0.3.2+2`

 - **FIX**: Update ObjectBox SDK to v4.0.3 to fix StorageException in iOS ([#581](https://github.com/davidmigloz/langchain_dart/issues/581)). ([943811a5](https://github.com/davidmigloz/langchain_dart/commit/943811a5d5ab1c7ef3e83db0c45082a0d4d1fc4a))

#### `anthropic_sdk_dart` - `v0.2.0`

- **FEAT**: Add support for Message Batches in anthropic_sdk_dart ([#585](https://github.com/davidmigloz/langchain_dart/issues/585)). ([a41270a0](https://github.com/davidmigloz/langchain_dart/commit/a41270a06135112afce0fa4da985c92e2282ba08))
- **FEAT**: Add claude-3-5-sonnet-20241022 to model catalog in anthropic_sdk_dart ([#583](https://github.com/davidmigloz/langchain_dart/issues/583)). ([0cc59e13](https://github.com/davidmigloz/langchain_dart/commit/0cc59e137b69b19c31eeefdad28e5cf757abe8d3))
- **BREAKING** **FEAT**: Add support for prompt caching in anthropic_sdk_dart ([#587](https://github.com/davidmigloz/langchain_dart/issues/587)). ([79dabaa5](https://github.com/davidmigloz/langchain_dart/commit/79dabaa509fd37188999a2ee7282b8b334cce322))
- **BREAKING** **FEAT**: Add computer use support in anthropic_sdk_dart ([#586](https://github.com/davidmigloz/langchain_dart/issues/586)). ([36c4a3e3](https://github.com/davidmigloz/langchain_dart/commit/36c4a3e39728398e885fe229c60aed33e645fa9a))
- **DOCS**: Update anthropic_sdk_dart readme. ([78b7bccf](https://github.com/davidmigloz/langchain_dart/commit/78b7bccf277b147a230f9ec5eea61965baab0323))
- 
#### `openai_dart` - `v0.4.3`

 - **FEAT**: Add support for audio in chat completions in openai_dart ([#577](https://github.com/davidmigloz/langchain_dart/issues/577)). ([0fb058cd](https://github.com/davidmigloz/langchain_dart/commit/0fb058cd9215c83b0ec5a10c84b125bb44845bf5))
 - **FEAT**: Add support for storing outputs for model distillation and metadata in openai_dart ([#578](https://github.com/davidmigloz/langchain_dart/issues/578)). ([c9b8bdf4](https://github.com/davidmigloz/langchain_dart/commit/c9b8bdf425b809a5b94a314173b57a43cc3fbc88))
 - **FEAT**: Support multi-modal moderations in openai_dart ([#576](https://github.com/davidmigloz/langchain_dart/issues/576)). ([45b9f423](https://github.com/davidmigloz/langchain_dart/commit/45b9f423a0aef2a1f8cad4ddac73a6a7d8cd89d2))
 - **FIX**: submitThreadToolOutputsToRunStream not returning any events ([#574](https://github.com/davidmigloz/langchain_dart/issues/574)). ([00803ac7](https://github.com/davidmigloz/langchain_dart/commit/00803ac7aedabcbca4c75e3918a4cb441f9e7b84))
 - **DOCS**: Add xAI to list of OpenAI-compatible APIs in openai_dart ([#582](https://github.com/davidmigloz/langchain_dart/issues/582)). ([017cb74f](https://github.com/davidmigloz/langchain_dart/commit/017cb74fc0ca3510d07f9f02c1efade8d37aecac))
 - **DOCS**: Fix openai_dart assistants API outdated documentation ([#579](https://github.com/davidmigloz/langchain_dart/issues/579)). ([624c4128](https://github.com/davidmigloz/langchain_dart/commit/624c41287a65904db5c91d19c4305bf377b6b339))

#### `openai_realtime_dart` - `v0.0.2`

- **FEAT**: Make openai_realtime_dart client to strong-typed ([#590](https://github.com/davidmigloz/langchain_dart/issues/590)). ([d84e88bf](https://github.com/davidmigloz/langchain_dart/commit/d84e88bf04956df2ab6a4606aa812ae4f3b6cd31))

## 2024-10-14

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.4.2+2`](#openai_dart---v0422)
 - [`openai_realtime_dart` - `v0.0.1+2`](#openai_realtime_dart---v0012)
 - [`langchain_openai` - `v0.7.2+3`](#langchain_openai---v0723)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.7.2+3`

---

#### `openai_realtime_dart` - `v0.0.1+2`

 - **FIX**: Tool calling not working in openai_realtime_dart ([#572](https://github.com/davidmigloz/langchain_dart/issues/572)). ([f6b14919](https://github.com/davidmigloz/langchain_dart/commit/f6b14919463353a3d1a8eb2f1b8eb83c45340fa1))

#### `openai_dart` - `v0.4.2+2`

 - **DOCS**: Fix typo in openai_dart. ([e7ddd558](https://github.com/davidmigloz/langchain_dart/commit/e7ddd558da643e3cc59581b8b0e69473c7cb9779))


## 2024-10-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.7.7+1`](#langchain---v0771)
 - [`langchain_chroma` - `v0.2.1+4`](#langchain_chroma---v0214)
 - [`langchain_community` - `v0.3.2+1`](#langchain_community---v0321)
 - [`langchain_firebase` - `v0.2.1+3`](#langchain_firebase---v0213)
 - [`langchain_google` - `v0.6.4+1`](#langchain_google---v0641)
 - [`langchain_ollama` - `v0.3.2+1`](#langchain_ollama---v0321)
 - [`langchain_openai` - `v0.7.2+2`](#langchain_openai---v0722)
 - [`langchain_pinecone` - `v0.1.0+10`](#langchain_pinecone---v01010)
 - [`openai_realtime_dart` - `v0.0.1+1`](#openai_realtime_dart---v0011)

---

#### `langchain` - `v0.7.7+1`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_chroma` - `v0.2.1+4`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_community` - `v0.3.2+1`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_firebase` - `v0.2.1+3`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_google` - `v0.6.4+1`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_ollama` - `v0.3.2+1`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_openai` - `v0.7.2+2`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `langchain_pinecone` - `v0.1.0+10`

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

#### `openai_realtime_dart` - `v0.0.1+1`

 - **DOCS**: Add note about the openai_dart client. ([26de8d97](https://github.com/davidmigloz/langchain_dart/commit/26de8d974fcd27fec857b93cc309e76860777dea))


## 2024-10-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

New packages:

 - [`openai_realtime_dart` - `v0.0.1`](#openai_realtime_dart---v001)

Packages with other changes:

 - [`langchain` - `v0.7.7`](#langchain---v077)
 - [`langchain_google` - `v0.6.4`](#langchain_google---v064)
 - [`openai_dart` - `v0.4.2+1`](#openai_dart---v0421)

---

#### `langchain` - `v0.7.7`

 - **REFACTOR**: Update deprecated UUID constant ([#558](https://github.com/davidmigloz/langchain_dart/issues/558)). ([8d9f14b4](https://github.com/davidmigloz/langchain_dart/commit/8d9f14b4c394f4652727eadf5849355cd9fa2f19))

#### `langchain_google` - `v0.6.4`

 - **FEAT**: Add support for code execution in ChatGoogleGenerativeAI ([#564](https://github.com/davidmigloz/langchain_dart/issues/564)). ([020bc096](https://github.com/davidmigloz/langchain_dart/commit/020bc096e2bb83bd372d0568a111481df188a7f2))

#### `openai_realtime_dart` - `v0.0.1`

 - **FEAT**: Implement openai_realtime_dart, a Dart client for OpenAI Realtime API ([#562](https://github.com/davidmigloz/langchain_dart/issues/562)). ([9f7406f7](https://github.com/davidmigloz/langchain_dart/commit/9f7406f7014624bf5086c60fb902bff70224ee15))

#### `openai_dart` - `v0.4.2+1`

 - **DOCS**: Add note about the new [openai_realtime_dart](https://pub.dev/packages/openai_realtime_dart) client. ([44672f0a](https://github.com/davidmigloz/langchain_dart/commit/44672f0a453a1b2e1b31bc5ef400f4c8ac7a4e76))

## 2024-09-25

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`langchain` - `v0.7.6`](#langchain---v076)
- [`langchain_core` - `v0.3.6`](#langchain_core---v036)
- [`langchain_community` - `v0.3.2`](#langchain_community---v032)
- [`langchain_firebase` - `v0.2.1+2`](#langchain_firebase---v0212)
- [`langchain_google` - `v0.6.3+1`](#langchain_google---v0631)
- [`langchain_ollama` - `v0.3.2`](#langchain_ollama---v032)
- [`langchain_openai` - `v0.7.2`](#langchain_openai---v072)
- [`ollama_dart` - `v0.2.2`](#ollama_dart---v022)
- [`openai_dart` - `v0.4.2`](#openai_dart---v042)
- [`langchain_supabase` - `v0.1.1+3`](#langchain_supabase---v0113)
- [`langchain_pinecone` - `v0.1.0+9`](#langchain_pinecone---v0109)
- [`langchain_anthropic` - `v0.1.1+2`](#langchain_anthropic---v0112)
- [`langchain_chroma` - `v0.2.1+3`](#langchain_chroma---v0213)
- [`langchain_mistralai` - `v0.2.3+1`](#langchain_mistralai---v0231)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_supabase` - `v0.1.1+3`
- `langchain_pinecone` - `v0.1.0+9`
- `langchain_anthropic` - `v0.1.1+2`
- `langchain_chroma` - `v0.2.1+3`
- `langchain_mistralai` - `v0.2.3+1`
- `vertex_ai` - `v0.1.0+2`

---

#### `langchain` - `v0.7.6`

- **FEAT**: Add retry support for Runnables ([#540](https://github.com/davidmigloz/langchain_dart/issues/540)). ([1099725d](https://github.com/davidmigloz/langchain_dart/commit/1099725d88de4103381edad533209a9a098bdb7f))

#### `langchain_core` - `v0.3.6`

- **FEAT**: Add retry support for Runnables ([#540](https://github.com/davidmigloz/langchain_dart/issues/540)). ([1099725d](https://github.com/davidmigloz/langchain_dart/commit/1099725d88de4103381edad533209a9a098bdb7f))

#### `langchain_community` - `v0.3.2`

- **FEAT**: Add support for deleteWhere in ObjectBoxVectorStore ([#552](https://github.com/davidmigloz/langchain_dart/issues/552)). ([90918bba](https://github.com/davidmigloz/langchain_dart/commit/90918bbac411ccfe4823ae195de6a50a46575573))
- **REFACTOR**: Add stubs for ObjectBox on web platform ([#553](https://github.com/davidmigloz/langchain_dart/issues/553)). ([41caed92](https://github.com/davidmigloz/langchain_dart/commit/41caed924bf24382567758be4590d5ddff31e839))

#### `langchain_firebase` - `v0.2.1+2`

- **DOCS**: Update Google's models in documentation ([#551](https://github.com/davidmigloz/langchain_dart/issues/551)). ([1da543f7](https://github.com/davidmigloz/langchain_dart/commit/1da543f7ab90eb39b599a6fdd0cc52e2cbc1460d))

#### `langchain_google` - `v0.6.3+1`

- **FEAT**: Add support for reduced output dimensionality in GoogleGenerativeAIEmbeddings ([#544](https://github.com/davidmigloz/langchain_dart/issues/544)). ([d5880704](https://github.com/davidmigloz/langchain_dart/commit/d5880704c492889144738acffd49674b91e63981))
- **DOCS**: Update Google's models in documentation ([#551](https://github.com/davidmigloz/langchain_dart/issues/551)). ([1da543f7](https://github.com/davidmigloz/langchain_dart/commit/1da543f7ab90eb39b599a6fdd0cc52e2cbc1460d))

#### `langchain_ollama` - `v0.3.2`

- **FEAT**: Update Ollama default model to llama-3.2 ([#554](https://github.com/davidmigloz/langchain_dart/issues/554)). ([f42ed0f0](https://github.com/davidmigloz/langchain_dart/commit/f42ed0f04136021b30556787cfdea13a14ca5768))

#### `langchain_openai` - `v0.7.2`

- **FEAT**: Add OpenAI o1-preview and o1-mini to model catalog ([#555](https://github.com/davidmigloz/langchain_dart/issues/555)). ([9ceb5ff9](https://github.com/davidmigloz/langchain_dart/commit/9ceb5ff9029cf1ae1967a32189f88c7a8215248e))
- **REFACTOR**: Migrate ChatOpenAI to maxCompletionTokens ([#557](https://github.com/davidmigloz/langchain_dart/issues/557)). ([08057a5b](https://github.com/davidmigloz/langchain_dart/commit/08057a5b6e08ee2633c6be6144be1619e902bbc5))

#### `ollama_dart` - `v0.2.2`

- **FEAT**: Update Ollama default model to llama-3.2 ([#554](https://github.com/davidmigloz/langchain_dart/issues/554)). ([f42ed0f0](https://github.com/davidmigloz/langchain_dart/commit/f42ed0f04136021b30556787cfdea13a14ca5768))

#### `openai_dart` - `v0.4.2`

- **FEAT**: Add OpenAI o1-preview and o1-mini to model catalog ([#555](https://github.com/davidmigloz/langchain_dart/issues/555)). ([9ceb5ff9](https://github.com/davidmigloz/langchain_dart/commit/9ceb5ff9029cf1ae1967a32189f88c7a8215248e))
- **FEAT**: Add support for maxCompletionTokens and reasoningTokens in openai_dart ([#556](https://github.com/davidmigloz/langchain_dart/issues/556)). ([37d75b61](https://github.com/davidmigloz/langchain_dart/commit/37d75b612b0f42bbf8d092bdd81c554278716582))
- **FEAT**: Option to include file search results in assistants API ([#543](https://github.com/davidmigloz/langchain_dart/issues/543)). ([e916ad3c](https://github.com/davidmigloz/langchain_dart/commit/e916ad3c0c4e322319cedac8b06b5908f1c31935))


## 2024-08-22

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.7.5`](#langchain---v075)
 - [`langchain_core` - `v0.3.5`](#langchain_core---v035)
 - [`langchain_community` - `v0.3.1`](#langchain_community---v031)
 - [`langchain_openai` - `v0.7.1`](#langchain_openai---v071)
 - [`langchain_ollama` - `v0.3.1`](#langchain_ollama---v031)
 - [`langchain_google` - `v0.6.2`](#langchain_google---v062)
 - [`langchain_mistralai` - `v0.2.3`](#langchain_mistralai---v023)
 - [`ollama_dart` - `v0.2.1`](#ollama_dart---v021)
 - [`openai_dart` - `v0.4.1`](#openai_dart---v041)
 - [`langchain_firebase` - `v0.2.1+1`](#langchain_firebase---v0211)
 - [`langchain_supabase` - `v0.1.1+2`](#langchain_supabase---v0112)
 - [`langchain_pinecone` - `v0.1.0+8`](#langchain_pinecone---v0108)
 - [`langchain_anthropic` - `v0.1.1+1`](#langchain_anthropic---v0111)
 - [`langchain_chroma` - `v0.2.1+2`](#langchain_chroma---v0212)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_firebase` - `v0.2.1+1`
 - `langchain_supabase` - `v0.1.1+2`
 - `langchain_pinecone` - `v0.1.0+8`
 - `langchain_anthropic` - `v0.1.1+1`
 - `langchain_chroma` - `v0.2.1+2`

---

#### `langchain` - `v0.7.5`

 - **FEAT**: Add ToolsAgent for models with tool-calling support ([#530](https://github.com/davidmigloz/langchain_dart/issues/530)). ([f3ee5b44](https://github.com/davidmigloz/langchain_dart/commit/f3ee5b44c4ffa378343ec4ee1e08d8e594a6cb36))
 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))
 - **DOCS**: Add Code Assist AI in README and documentation ([#538](https://github.com/davidmigloz/langchain_dart/issues/538)). ([e752464c](https://github.com/davidmigloz/langchain_dart/commit/e752464c0d2fc7e0ccc878933b0ef934c9527567))

#### `langchain_core` - `v0.3.5`

 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))
 - **FEAT**: Support OpenAI's strict mode for tool calling in ChatOpenAI ([#536](https://github.com/davidmigloz/langchain_dart/issues/536)). ([71623f49](https://github.com/davidmigloz/langchain_dart/commit/71623f490289e63252165167305e00038d800be1))
 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))

#### `langchain_community` - `v0.3.1`

 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))

#### `langchain_openai` - `v0.7.1`

 - **FEAT**: Add support for Structured Outputs in ChatOpenAI ([#526](https://github.com/davidmigloz/langchain_dart/issues/526)). ([c5387b5d](https://github.com/davidmigloz/langchain_dart/commit/c5387b5dd87fe2aac511c4eca2d4a497065db61f))
 - **FEAT**: Handle refusal in OpenAI's Structured Outputs API ([#533](https://github.com/davidmigloz/langchain_dart/issues/533)). ([f4c4ed99](https://github.com/davidmigloz/langchain_dart/commit/f4c4ed9902177560f13fa9f44b07f0a49c3fdf0a))
 - **FEAT**: Include logprobs in result metadata from ChatOpenAI ([#535](https://github.com/davidmigloz/langchain_dart/issues/535)). ([1834b3ad](https://github.com/davidmigloz/langchain_dart/commit/1834b3adb210b7d190a7e0574a304f069813486b))
 - **FEAT**: Add chatgpt-4o-latest to model catalog ([#527](https://github.com/davidmigloz/langchain_dart/issues/527)). ([ec82c760](https://github.com/davidmigloz/langchain_dart/commit/ec82c760582eed123d6e5d3287c24f82ac251df7))
 - **FEAT**: Add gpt-4o-2024-08-06 to model catalog ([#522](https://github.com/davidmigloz/langchain_dart/issues/522)). ([563200e0](https://github.com/davidmigloz/langchain_dart/commit/563200e0bb9d021d9cb3e46e7a77d96cf3860b1c))
 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))
 - **REFACTOR**: Don't send OpenAI-Beta header in ChatOpenAI ([#511](https://github.com/davidmigloz/langchain_dart/issues/511)). ([0e532bab](https://github.com/davidmigloz/langchain_dart/commit/0e532bab84483bf9d77a0d745f1a591eea2ff7c8))

#### `langchain_ollama` - `v0.3.1`

 - **FEAT**: Add support for min_p in Ollama ([#512](https://github.com/davidmigloz/langchain_dart/issues/512)). ([e40d54b2](https://github.com/davidmigloz/langchain_dart/commit/e40d54b2e729d8fb6bf14bb4ea97820121bc85c7))
 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))

#### `langchain_google` - `v0.6.2`

 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))

#### `langchain_mistralai` - `v0.2.3`

 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))

#### `openai_dart` - `v0.4.1`

 - **FEAT**: Add support for Structured Outputs ([#525](https://github.com/davidmigloz/langchain_dart/issues/525)). ([c7574077](https://github.com/davidmigloz/langchain_dart/commit/c7574077195acfc96e9ca9d526cc050788c23c1d))
 - **FEAT**: Add log probabilities for refusal tokens ([#534](https://github.com/davidmigloz/langchain_dart/issues/534)). ([8470a24c](https://github.com/davidmigloz/langchain_dart/commit/8470a24cc42042e20ffffa4b67bc831e03efbc6c))
 - **FEAT**: Add gpt-4o-2024-08-06 to model catalog ([#522](https://github.com/davidmigloz/langchain_dart/issues/522)). ([563200e0](https://github.com/davidmigloz/langchain_dart/commit/563200e0bb9d021d9cb3e46e7a77d96cf3860b1c))
 - **FEAT**: Add chatgpt-4o-latest to model catalog ([#527](https://github.com/davidmigloz/langchain_dart/issues/527)). ([ec82c760](https://github.com/davidmigloz/langchain_dart/commit/ec82c760582eed123d6e5d3287c24f82ac251df7))

#### `ollama_dart` - `v0.2.1`

 - **FEAT**: Add support for min_p in Ollama ([#512](https://github.com/davidmigloz/langchain_dart/issues/512)). ([e40d54b2](https://github.com/davidmigloz/langchain_dart/commit/e40d54b2e729d8fb6bf14bb4ea97820121bc85c7))


## 2024-07-26

### Changes

---

Packages with breaking changes:

 - [`langchain_community` - `v0.3.0`](#langchain_community---v030)
 - [`langchain_ollama` - `v0.3.0`](#langchain_ollama---v030)
 - [`langchain_openai` - `v0.7.0`](#langchain_openai---v070)
 - [`ollama_dart` - `v0.2.0`](#ollama_dart---v020)
 - [`openai_dart` - `v0.4.0`](#openai_dart---v040)

Packages with other changes:

 - [`langchain` - `v0.7.4`](#langchain---v074)
 - [`langchain_anthropic` - `v0.1.1`](#langchain_anthropic---v011)
 - [`langchain_chroma` - `v0.2.1+1`](#langchain_chroma---v0211)
 - [`langchain_core` - `v0.3.4`](#langchain_core---v034)
 - [`langchain_firebase` - `v0.2.1`](#langchain_firebase---v021)
 - [`langchain_google` - `v0.6.1`](#langchain_google---v061)
 - [`langchain_mistralai` - `v0.2.2`](#langchain_mistralai---v022)
 - [`langchain_pinecone` - `v0.1.0+7`](#langchain_pinecone---v0107)
 - [`langchain_supabase` - `v0.1.1+1`](#langchain_supabase---v0111)

---

#### `langchain` - `v0.7.4`

 - **FEAT**: Add Fallback support for Runnables ([#501](https://github.com/davidmigloz/langchain_dart/issues/501)). ([5887858d](https://github.com/davidmigloz/langchain_dart/commit/5887858d667d43c49978291ea98a92cab0069971))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))
 - **DOCS**: Update README.md with Ollama tool call support. ([e016b0bd](https://github.com/davidmigloz/langchain_dart/commit/e016b0bd02065971faab2a3a48be625ff33a08cf))

#### `langchain_core` - `v0.3.4`

 - **FEAT**: Add Fallback support for Runnables ([#501](https://github.com/davidmigloz/langchain_dart/issues/501)). ([5887858d](https://github.com/davidmigloz/langchain_dart/commit/5887858d667d43c49978291ea98a92cab0069971))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))

#### `langchain_community` - `v0.3.0`

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_ollama` - `v0.3.0`

 - **FEAT**: Add tool calling support in ChatOllama ([#505](https://github.com/davidmigloz/langchain_dart/issues/505)). ([6ffde204](https://github.com/davidmigloz/langchain_dart/commit/6ffde2043c1e865411c8b1096063619d6bcd80aa))
 - **BREAKING** **FEAT**: Update Ollama default model to llama-3.1 ([#506](https://github.com/davidmigloz/langchain_dart/issues/506)). ([b1134bf1](https://github.com/davidmigloz/langchain_dart/commit/b1134bf1163cdcea26a9f1e65fee5c515be3857c))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))
 - **DOCS**: Update Ollama request options default values in API docs ([#479](https://github.com/davidmigloz/langchain_dart/issues/479)). ([e1f93366](https://github.com/davidmigloz/langchain_dart/commit/e1f9336619ee12624a7b045ca18a3118ead0158f))

#### `langchain_openai` - `v0.7.0`

 - **BREAKING** **FEAT**: Update ChatOpenAI default model to gpt-4o-mini ([#507](https://github.com/davidmigloz/langchain_dart/issues/507)). ([c7b8ce91](https://github.com/davidmigloz/langchain_dart/commit/c7b8ce91ac5b4dbe6bed563fae124a9f5ad76a84))
 - **FEAT**: Add support for disabling parallel tool calls in ChatOpenAI ([#493](https://github.com/davidmigloz/langchain_dart/issues/493)). ([c46d676d](https://github.com/davidmigloz/langchain_dart/commit/c46d676dee836f1d17e0d1fd61a8f1f0ba5c2881))
 - **FEAT**: Add GPT-4o-mini to model catalog ([#497](https://github.com/davidmigloz/langchain_dart/issues/497)). ([faa23aee](https://github.com/davidmigloz/langchain_dart/commit/faa23aeeecfb64dc7d018e642952e41cc7f9eeaf))
 - **FEAT**: Add support for service tier in ChatOpenAI ([#495](https://github.com/davidmigloz/langchain_dart/issues/495)). ([af79a4ff](https://github.com/davidmigloz/langchain_dart/commit/af79a4ffcadb207bfc704365462edebfca1ed6c7))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_anthropic` - `v0.1.1`

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_firebase` - `v0.2.1`

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_google` - `v0.6.1`

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_mistralai` - `v0.2.2`

 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_chroma` - `v0.2.1+1`

 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_pinecone` - `v0.1.0+7`

 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `langchain_supabase` - `v0.1.1+1`

 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

#### `ollama_dart` - `v0.2.0`

 - **FEAT**: Add tool calling support in ollama_dart ([#504](https://github.com/davidmigloz/langchain_dart/issues/504)). ([1ffdb41b](https://github.com/davidmigloz/langchain_dart/commit/1ffdb41b8f19941336c1cd911c73f0b3d46af975))
 - **BREAKING** **FEAT**: Update Ollama default model to llama-3.1 ([#506](https://github.com/davidmigloz/langchain_dart/issues/506)). ([b1134bf1](https://github.com/davidmigloz/langchain_dart/commit/b1134bf1163cdcea26a9f1e65fee5c515be3857c))
 - **FEAT**: Add support for Ollama version and model info ([#488](https://github.com/davidmigloz/langchain_dart/issues/488)). ([a110ecb7](https://github.com/davidmigloz/langchain_dart/commit/a110ecb7f10e7975bd2416aa65add98984c6efb8))
 - **FEAT**: Add suffix support in Ollama completions API in ollama_dart ([#503](https://github.com/davidmigloz/langchain_dart/issues/503)). ([30d05a69](https://github.com/davidmigloz/langchain_dart/commit/30d05a69b07f88f803b9abfdf2fded9348a73490))
 - **BREAKING** **REFACTOR**: Change Ollama push model status type from enum to String ([#489](https://github.com/davidmigloz/langchain_dart/issues/489)). ([90c9ccd9](https://github.com/davidmigloz/langchain_dart/commit/90c9ccd986c7b679ed30225d2380120e17dfec41))
 - **DOCS**: Update Ollama request options default values in API docs ([#479](https://github.com/davidmigloz/langchain_dart/issues/479)). ([e1f93366](https://github.com/davidmigloz/langchain_dart/commit/e1f9336619ee12624a7b045ca18a3118ead0158f))

#### `openai_dart` - `v0.4.0`

 - **FEAT**: Add support for disabling parallel tool calls in openai_dart ([#492](https://github.com/davidmigloz/langchain_dart/issues/492)). ([a91e0719](https://github.com/davidmigloz/langchain_dart/commit/a91e07196278ae4da5917d52395f3c246fc35bf2))
 - **FEAT**: Add GPT-4o-mini to model catalog ([#497](https://github.com/davidmigloz/langchain_dart/issues/497)). ([faa23aee](https://github.com/davidmigloz/langchain_dart/commit/faa23aeeecfb64dc7d018e642952e41cc7f9eeaf))
 - **FEAT**: Support chunking strategy in file_search tool in openai_dart ([#496](https://github.com/davidmigloz/langchain_dart/issues/496)). ([cfa974a9](https://github.com/davidmigloz/langchain_dart/commit/cfa974a9e2fc4b79e5b66765b22d76710575d5bc))
 - **FEAT**: Add support for overrides in the file search tool in openai_dart ([#491](https://github.com/davidmigloz/langchain_dart/issues/491)). ([89605638](https://github.com/davidmigloz/langchain_dart/commit/89605638c465be37c2738258d840c21d32fe9554))
 - **FEAT**: Allow to customize OpenAI-Beta header in openai_dart ([#502](https://github.com/davidmigloz/langchain_dart/issues/502)). ([5fed8dbb](https://github.com/davidmigloz/langchain_dart/commit/5fed8dbb8205ba7925ca59d6f07a4f5e052b52b1))
 - **FEAT**: Add support for service tier in openai_dart ([#494](https://github.com/davidmigloz/langchain_dart/issues/494)). ([0838e4b9](https://github.com/davidmigloz/langchain_dart/commit/0838e4b9f5bb25e29fbc163a0ff5cf3e64409d40))

## 2024-07-02

### Changes

---

New packages:

- [`langchain_anthropic` - `v0.1.0`](#langchain_anthropic---v010)
- [`tavily_dart` - `v0.1.0`](#tavily_dart---v010)

Packages with breaking changes:

- [`langchain_firebase` - `v0.2.0`](#langchain_firebase---v020)
- [`langchain_google` - `v0.6.0`](#langchain_google---v060)

Packages with other changes:

- [`langchain` - `v0.7.3`](#langchain---v073)
- [`langchain_core` - `v0.3.3`](#langchain_core---v033)
- [`langchain_community` - `v0.2.2`](#langchain_community---v022)
- [`langchain_chroma` - `v0.2.1`](#langchain_chroma---v021)
- [`langchain_mistralai` - `v0.2.1`](#langchain_mistralai---v021)
- [`langchain_ollama` - `v0.2.2+1`](#langchain_ollama---v0221)
- [`langchain_openai` - `v0.6.3`](#langchain_openai---v063)
- [`langchain_pinecone` - `v0.1.0+6`](#langchain_pinecone---v0106)
- [`langchain_supabase` - `v0.1.1`](#langchain_supabase---v011)
- [`anthropic_sdk_dart` - `v0.1.0`](#anthropic_sdk_dart---v010)
- [`googleai_dart` - `v0.1.0+2`](#googleai_dart---v0102)
- [`mistralai_dart` - `v0.0.3+3`](#mistralai_dart---v0033)
- [`ollama_dart` - `v0.1.2`](#ollama_dart---v012)
- [`openai_dart` - `v0.3.3+1`](#openai_dart---v0331)

---

#### `langchain` - `v0.7.3`

> Note: Anthropic integration (`ChatAnthropic`) is available in the new [`langchain_anthropic`](https://pub.dev/packages/langchain_anthropic) package.

- **FEAT**: Add support for TavilySearchResultsTool and TavilyAnswerTool ([#467](https://github.com/davidmigloz/langchain_dart/issues/467)). ([a9f35755](https://github.com/davidmigloz/langchain_dart/commit/a9f35755dfac9d257efb251c4a6c5948673c2f6c))
- **DOCS**: Document existing integrations in README.md. ([cc4246c8](https://github.com/davidmigloz/langchain_dart/commit/cc4246c8ab907de2c82843bff145edfffe32d302))

#### `langchain_core` - `v0.3.3`

- **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))
- **FEAT**: Update ChatResult.id concat logic ([#477](https://github.com/davidmigloz/langchain_dart/issues/477)). ([44c7fafd](https://github.com/davidmigloz/langchain_dart/commit/44c7fafd934bf6517e285830b1ca98282127cb7d))

#### `langchain_community` - `v0.2.2`

- **FEAT**: Add support for TavilySearchResultsTool and TavilyAnswerTool ([#467](https://github.com/davidmigloz/langchain_dart/issues/467)). ([a9f35755](https://github.com/davidmigloz/langchain_dart/commit/a9f35755dfac9d257efb251c4a6c5948673c2f6c))

#### `langchain_anthropic` - `v0.1.0`

- **FEAT**: Add ChatAnthropic integration ([#477](https://github.com/davidmigloz/langchain_dart/issues/477)). ([44c7fafd](https://github.com/davidmigloz/langchain_dart/commit/44c7fafd934bf6517e285830b1ca98282127cb7d))

#### `langchain_firebase` - `v0.2.0`

> Note: `ChatFirebaseVertexAI` now uses `gemini-1.5-flash` model by default.

- **BREAKING** **FEAT**: Update ChatFirebaseVertexAI default model to  gemini-1.5-flash ([#458](https://github.com/davidmigloz/langchain_dart/issues/458)). ([d3c96c52](https://github.com/davidmigloz/langchain_dart/commit/d3c96c52e95e889ba6955e3de80a83978b27618b))
- **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))
- **FEAT**: Support response MIME type in ChatFirebaseVertexAI ([#461](https://github.com/davidmigloz/langchain_dart/issues/461)) ([#463](https://github.com/davidmigloz/langchain_dart/issues/463)). ([c3452721](https://github.com/davidmigloz/langchain_dart/commit/c3452721c78ba3071ed2510a243f9c824a291c34))
- **FEAT**: Add support for Firebase Auth in ChatFirebaseVertexAI ([#460](https://github.com/davidmigloz/langchain_dart/issues/460)). ([6d137290](https://github.com/davidmigloz/langchain_dart/commit/6d137290ca0f56c9fcc725e6211e838a3e3c6d16))
- **FEAT**: Add support for usage metadata in ChatFirebaseVertexAI ([#457](https://github.com/davidmigloz/langchain_dart/issues/457)). ([2587f9e2](https://github.com/davidmigloz/langchain_dart/commit/2587f9e2bcbcc2bf5e2295dce409e92a89bf3c44))
- **REFACTOR**: Simplify how tools are passed to the internal Firebase client ([#459](https://github.com/davidmigloz/langchain_dart/issues/459)). ([7f772396](https://github.com/davidmigloz/langchain_dart/commit/7f77239601fb216a01ec9d25680ec4d3dc4b97c7))

#### `langchain_google` - `v0.6.0`

> Note: `ChatGoogleGenerativeAI` now uses `gemini-1.5-flash` model by default.

- **BREAKING** **FEAT**: Update ChatGoogleGenerativeAI default model to  gemini-1.5-flash ([#462](https://github.com/davidmigloz/langchain_dart/issues/462)). ([c8b30c90](https://github.com/davidmigloz/langchain_dart/commit/c8b30c906a17751547cc340f987b6670fbd67e69))
- **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))
- **FEAT**: Support response MIME type and schema in ChatGoogleGenerativeAI ([#461](https://github.com/davidmigloz/langchain_dart/issues/461)). ([e258399e](https://github.com/davidmigloz/langchain_dart/commit/e258399e03437e8abe25417a14671dfb719cb273))
- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

#### `langchain_openai` - `v0.6.3`

- **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))

#### `langchain_ollama` - `v0.2.2+1`

- **DOCS**: Update ChatOllama API docs. ([cc4246c8](https://github.com/davidmigloz/langchain_dart/commit/cc4246c8ab907de2c82843bff145edfffe32d302))

#### `langchain_chroma` - `v0.2.1`

- Update a dependency to the latest release.

#### `langchain_mistralai` - `v0.2.1`

- Update a dependency to the latest release.

#### `langchain_pinecone` - `v0.1.0+6`

- Update a dependency to the latest release.

#### `langchain_supabase` - `v0.1.1`

- Update a dependency to the latest release.

#### `anthropic_sdk_dart` - `v0.1.0`

- **FEAT**: Add support for tool use in anthropic_sdk_dart client ([#469](https://github.com/davidmigloz/langchain_dart/issues/469)). ([81896cfd](https://github.com/davidmigloz/langchain_dart/commit/81896cfdfce116b010dd51391994251d2a836333))
- **FEAT**: Add extensions on ToolResultBlockContent in anthropic_sdk_dart ([#476](https://github.com/davidmigloz/langchain_dart/issues/476)). ([8d92d9b0](https://github.com/davidmigloz/langchain_dart/commit/8d92d9b008755ff9b9ca3545eb26fc49a296a909))
- **REFACTOR**: Improve schemas names in anthropic_sdk_dart ([#475](https://github.com/davidmigloz/langchain_dart/issues/475)). ([8ebeacde](https://github.com/davidmigloz/langchain_dart/commit/8ebeacded02ab92885354c9447b1a55e024b56d1))
- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

#### `ollama_dart` - `v0.1.2`

- **FEAT**: Add support for listing running Ollama models ([#451](https://github.com/davidmigloz/langchain_dart/issues/451)). ([cfaa31fb](https://github.com/davidmigloz/langchain_dart/commit/cfaa31fb8ce1dc128570c95d403809f71e0199d9))
- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

#### `tavily_dart` - `v0.1.0`

- **FEAT**: Implement tavily_dart, a Dart client for Tavily API ([#456](https://github.com/davidmigloz/langchain_dart/issues/456)). ([fbfb79ba](https://github.com/davidmigloz/langchain_dart/commit/fbfb79bad81dbbd5844a90938fda79b201f20047))

#### `googleai_dart` - `v0.1.0+2`

- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

#### `mistralai_dart` - `v0.0.3+3`

- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

#### `openai_dart` - `v0.3.3+1`

- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

## 2024-06-01

### Changes

---

New packages:

 - [`anthropic_sdk_dart` - `v0.0.1`](#anthropic_sdk_dart---v001)

Packages with other changes:

 - [`langchain` - `v0.7.2`](#langchain---v072)
 - [`langchain_core` - `v0.3.2`](#langchain_core---v032)
 - [`langchain_community` - `v0.2.1`](#langchain_community---v021)
 - [`langchain_chroma` - `v0.2.0+5`](#langchain_chroma---v0205)
 - [`langchain_firebase` - `v0.1.0+2`](#langchain_firebase---v0102)
 - [`langchain_google` - `v0.5.1`](#langchain_google---v051)
 - [`langchain_mistralai` - `v0.2.1`](#langchain_mistralai---v021)
 - [`langchain_ollama` - `v0.2.2`](#langchain_ollama---v022)
 - [`langchain_openai` - `v0.6.2`](#langchain_openai---v062)
 - [`langchain_pinecone` - `v0.1.0+5`](#langchain_pinecone---v0105)
 - [`langchain_supabase` - `v0.1.0+5`](#langchain_supabase---v0105)
 - [`chromadb` - `v0.2.0+1`](#chromadb---v0201)
 - [`googleai_dart` - `v0.1.0+1`](#googleai_dart---v0101)
 - [`mistralai_dart` - `v0.0.3+2`](#mistralai_dart---v0032)
 - [`ollama_dart` - `v0.1.1`](#ollama_dart---v011)
 - [`openai_dart` - `v0.3.3`](#openai_dart---v033)
 - [`vertex_ai` - `v0.1.0+1`](#vertex_ai---v0101)

---

#### `langchain` - `v0.7.2`

 - **FEAT**: Add support for ObjectBoxVectorStore ([#438](https://github.com/davidmigloz/langchain_dart/issues/438)). ([81e167a6](https://github.com/davidmigloz/langchain_dart/commit/81e167a6888fff9f8db381caaef6ee788acef3a8))
   + Check out the [ObjectBoxVectorStore documentation](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/objectbox?id=objectbox)
 - **REFACTOR**: Migrate to langchaindart.dev domain ([#434](https://github.com/davidmigloz/langchain_dart/issues/434)). ([358f79d6](https://github.com/davidmigloz/langchain_dart/commit/358f79d6e0bae2ecd657aeed2eae7fad16d97c18))

#### `langchain_core` - `v0.3.2`

 - **FEAT**: Add Runnable.close() to close any resources associated with it ([#439](https://github.com/davidmigloz/langchain_dart/issues/439)). ([4e08cced](https://github.com/davidmigloz/langchain_dart/commit/4e08cceda964921178061e9721618a1505198ff5))
 - **FIX**: Stream errors are not propagated by StringOutputParser ([#440](https://github.com/davidmigloz/langchain_dart/issues/440)). ([496b11cc](https://github.com/davidmigloz/langchain_dart/commit/496b11cca9bbf9892c425e49138562537398bc70))

#### `langchain_community` - `v0.2.1`

 - **FEAT**: Add support for ObjectBoxVectorStore ([#438](https://github.com/davidmigloz/langchain_dart/issues/438)). ([81e167a6](https://github.com/davidmigloz/langchain_dart/commit/81e167a6888fff9f8db381caaef6ee788acef3a8))
   + Check out the [ObjectBoxVectorStore documentation](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/objectbox?id=objectbox)

#### `langchain_openai` - `v0.6.2`

 - **DOCS**: Document tool calling with OpenRouter ([#437](https://github.com/davidmigloz/langchain_dart/issues/437)). ([47986592](https://github.com/davidmigloz/langchain_dart/commit/47986592a674322fe2f69aff7166a3e594756ace))

#### `anthropic_sdk_dart` - `v0.0.1`

 - **FEAT**: Implement anthropic_sdk_dart, a Dart client for Anthropic API ([#433](https://github.com/davidmigloz/langchain_dart/issues/433)). ([e5412b](https://github.com/davidmigloz/langchain_dart/commit/e5412bdedc7de911f7de88eb51e9d41cd85ab4ae))

#### `ollama_dart` - `v0.1.1`

 - **FEAT**: Support buffered stream responses ([#445](https://github.com/davidmigloz/langchain_dart/issues/445)). ([ce2ef30c](https://github.com/davidmigloz/langchain_dart/commit/ce2ef30c9a9a0dfe8f3059988b7007c94c45b9bd))

#### `openai_dart` - `v0.3.3`

 - **FEAT**: Support FastChat OpenAI-compatible API ([#444](https://github.com/davidmigloz/langchain_dart/issues/444)). ([ddaf1f69](https://github.com/davidmigloz/langchain_dart/commit/ddaf1f69d8262210637999367690bf362f2dc5c3))
 - **FIX**: Make vector store name optional ([#436](https://github.com/davidmigloz/langchain_dart/issues/436)). ([29a46c7f](https://github.com/davidmigloz/langchain_dart/commit/29a46c7fa645439e8f4acc10a16da904e7cf14ff))
 - **FIX**: Fix deserialization of sealed classes ([#435](https://github.com/davidmigloz/langchain_dart/issues/435)). ([7b9cf223](https://github.com/davidmigloz/langchain_dart/commit/7b9cf223e42eae8496f864ad7ef2f8d0dca45678))


## 2024-05-20

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`langchain_firebase` - `v0.1.0+1`](#langchain_firebase---v0101)
- [`ollama_dart` - `v0.1.0+1`](#ollama_dart---v0101)
- [`openai_dart` - `v0.3.2+1`](#openai_dart---v0321)
- [`langchain_ollama` - `v0.2.1+1`](#langchain_ollama---v0211)
- [`langchain_openai` - `v0.6.1+1`](#langchain_openai---v0611)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_ollama` - `v0.2.1+1`
- `langchain_openai` - `v0.6.1+1`

---

#### `openai_dart` - `v0.3.2+1`

- **FIX**: Rename CreateRunRequestModel factories names ([#429](https://github.com/davidmigloz/langchain_dart/issues/429)). ([fd15793b](https://github.com/davidmigloz/langchain_dart/commit/fd15793b3c4ac94dfc90567b4a709e1458f4e0e8))
- **FIX**: Make quote nullable in MessageContentTextAnnotationsFileCitation ([#428](https://github.com/davidmigloz/langchain_dart/issues/428)). ([75b95645](https://github.com/davidmigloz/langchain_dart/commit/75b95645a58d51b369a01e261393e17f7463e1f5))

#### `ollama_dart` - `v0.1.0+1`

- **FIX**: digest path param in Ollama blob endpoints ([#430](https://github.com/davidmigloz/langchain_dart/issues/430)). ([2e9e935a](https://github.com/davidmigloz/langchain_dart/commit/2e9e935aefd74e5e9e09a23188a6c77ce535661d))

#### `langchain_firebase` - `v0.1.0+1`

- **DOCS**: Fix lint issues in langchain_firebase example. ([f85a6ad7](https://github.com/davidmigloz/langchain_dart/commit/f85a6ad755e00c513bd4349663e33d40be8a696c))

## 2024-05-14

### Changes

---

Packages with breaking changes:

- [`langchain_google` - `v0.5.0`](#langchain_google---v050)
- [`googleai_dart` - `v0.1.0`](#googleai_dart---v010)
- [`ollama_dart` - `v0.1.0`](#ollama_dart---v010)

Packages with other changes:

- [`langchain` - `v0.7.1`](#langchain---v071)
- [`langchain_core` - `v0.3.1`](#langchain_core---v031)
- [`langchain_community` - `v0.2.0+1`](#langchain_community---v0201)
- [`langchain_firebase` - `v0.1.0`](#langchain_firebase---v010)
- [`langchain_openai` - `v0.6.1`](#langchain_openai---v061)
- [`langchain_ollama` - `v0.2.1`](#langchain_ollama---v021)
- [`langchain_chroma` - `v0.2.0+4`](#langchain_chroma---v0204)
- [`langchain_mistralai` - `v0.2.0+1`](#langchain_mistralai---v0201)
- [`langchain_pinecone` - `v0.1.0+4`](#langchain_pinecone---v0104)
- [`langchain_supabase` - `v0.1.0+4`](#langchain_supabase---v0104)
- [`openai_dart` - `v0.3.2`](#openai_dart---v032)

---

#### `langchain` - `v0.7.1`

> Note: VertexAI for Firebase (`ChatFirebaseVertexAI`) is available in the new [`langchain_firebase`](https://pub.dev/packages/langchain_firebase) package.

- **DOCS**: Add docs for ChatFirebaseVertexAI ([#422](https://github.com/davidmigloz/langchain_dart/issues/422)). ([8d0786bc](https://github.com/davidmigloz/langchain_dart/commit/8d0786bc6228ce86de962d30e9c2cc9728a08f3f))
- **DOCS**: Update ChatOllama docs ([#417](https://github.com/davidmigloz/langchain_dart/issues/417)). ([9d30b1a1](https://github.com/davidmigloz/langchain_dart/commit/9d30b1a1c811d73cfa27110b8c3c10b10da1801e))

#### `langchain_core` - `v0.3.1`

- **FEAT**: Add equals to ChatToolChoiceForced ([#422](https://github.com/davidmigloz/langchain_dart/issues/422)). ([8d0786bc](https://github.com/davidmigloz/langchain_dart/commit/8d0786bc6228ce86de962d30e9c2cc9728a08f3f))
- **FIX**: Fix finishReason null check ([#406](https://github.com/davidmigloz/langchain_dart/issues/406)). ([5e2b0ecc](https://github.com/davidmigloz/langchain_dart/commit/5e2b0eccd54c6c1dc15af8ff6d62c395f12fbd90))

#### `langchain_community` - `v0.2.0+1`

- Update a dependency to the latest release.

#### `langchain_google` - `v0.5.0`

> Note: `ChatGoogleGenerativeAI` and `GoogleGenerativeAIEmbeddings` now use the version `v1beta` of the Gemini API (instead of `v1`) which support the latest models (`gemini-1.5-pro-latest` and `gemini-1.5-flash-latest`).
>
> VertexAI for Firebase (`ChatFirebaseVertexAI`) is available in the new [`langchain_firebase`](https://pub.dev/packages/langchain_firebase) package.

- **FEAT**: Add support for tool calling in ChatGoogleGenerativeAI ([#419](https://github.com/davidmigloz/langchain_dart/issues/419)). ([df41f38a](https://github.com/davidmigloz/langchain_dart/commit/df41f38aab64651a06a42fc41d9c35f33250a3e9))
- **DOCS**: Add Gemini 1.5 Flash to models list ([#423](https://github.com/davidmigloz/langchain_dart/issues/423)). ([40f4c9de](https://github.com/davidmigloz/langchain_dart/commit/40f4c9de9c25804e298fd481c80f8c52d53302fb))
- **BREAKING** **FEAT**: Migrate internal client from googleai_dart to google_generative_ai ([#407](https://github.com/davidmigloz/langchain_dart/issues/407)). ([fa4b5c37](https://github.com/davidmigloz/langchain_dart/commit/fa4b5c376a191fea50c3f8b1d6b07cef0480a74e))

#### `langchain_firebase` - `v0.1.0`

- **FEAT**: Add support for ChatFirebaseVertexAI ([#422](https://github.com/davidmigloz/langchain_dart/issues/422)). ([8d0786bc](https://github.com/davidmigloz/langchain_dart/commit/8d0786bc6228ce86de962d30e9c2cc9728a08f3f))
- **DOCS**: Add Gemini 1.5 Flash to models list ([#423](https://github.com/davidmigloz/langchain_dart/issues/423)). ([40f4c9de](https://github.com/davidmigloz/langchain_dart/commit/40f4c9de9c25804e298fd481c80f8c52d53302fb))

#### `langchain_openai` - `v0.6.1`

- **FEAT**: Add GPT-4o to model catalog ([#420](https://github.com/davidmigloz/langchain_dart/issues/420)). ([96214307](https://github.com/davidmigloz/langchain_dart/commit/96214307ec8ae045dade687d4c623bd4dc1be896))
- **FEAT**: Include usage stats when streaming with OpenAI and ChatOpenAI ([#406](https://github.com/davidmigloz/langchain_dart/issues/406)). ([5e2b0ecc](https://github.com/davidmigloz/langchain_dart/commit/5e2b0eccd54c6c1dc15af8ff6d62c395f12fbd90))

#### `langchain_ollama` - `v0.2.1`

- **FEAT**: Handle finish reason in ChatOllama ([#416](https://github.com/davidmigloz/langchain_dart/issues/416)). ([a5e1af13](https://github.com/davidmigloz/langchain_dart/commit/a5e1af13ef4d2db690ab599dbf5e42f28659a059))
- **FEAT**: Add keepAlive option to OllamaEmbeddings ([#415](https://github.com/davidmigloz/langchain_dart/issues/415)). ([32e19028](https://github.com/davidmigloz/langchain_dart/commit/32e19028a7e19ef5fc32a410061eb85bc6e27c39))
- **FEAT**: Update Ollama default model from llama2 to llama3 ([#417](https://github.com/davidmigloz/langchain_dart/issues/417)). ([9d30b1a1](https://github.com/davidmigloz/langchain_dart/commit/9d30b1a1c811d73cfa27110b8c3c10b10da1801e))
- **REFACTOR**: Remove deprecated Ollama options ([#414](https://github.com/davidmigloz/langchain_dart/issues/414)). ([861a2b74](https://github.com/davidmigloz/langchain_dart/commit/861a2b7430d33718340676ec2804a7aaccb2a08a))

#### `openai_dart` - `v0.3.2`

- **FEAT**: Add GPT-4o to model catalog ([#420](https://github.com/davidmigloz/langchain_dart/issues/420)). ([96214307](https://github.com/davidmigloz/langchain_dart/commit/96214307ec8ae045dade687d4c623bd4dc1be896))
- **FEAT**: Add support for different content types in Assistants API and other fixes ([#412](https://github.com/davidmigloz/langchain_dart/issues/412)). ([97acab45](https://github.com/davidmigloz/langchain_dart/commit/97acab45a5770422c666795ad3443c083fa08895))
- **FEAT**: Add support for completions and embeddings in batch API in openai_dart ([#425](https://github.com/davidmigloz/langchain_dart/issues/425)). ([16fe4c68](https://github.com/davidmigloz/langchain_dart/commit/16fe4c6814a828fb0d271a6793598f8369da259d))
- **FEAT**: Add incomplete status to RunObject in openai_dart ([#424](https://github.com/davidmigloz/langchain_dart/issues/424)). ([71b116e6](https://github.com/davidmigloz/langchain_dart/commit/71b116e6252a9dce5a92e979164e0af8fe96efc3))

#### `ollama_dart` - `v0.1.0`

- **BREAKING** **FEAT**: Align Ollama client to the Ollama v0.1.36 API  ([#411](https://github.com/davidmigloz/langchain_dart/issues/411)). ([326212ce](https://github.com/davidmigloz/langchain_dart/commit/326212ce4e4b035f7b29f4c810f447d5cf1731c4))
- **FEAT**: Update Ollama default model from llama2 to llama3 ([#417](https://github.com/davidmigloz/langchain_dart/issues/417)). ([9d30b1a1](https://github.com/davidmigloz/langchain_dart/commit/9d30b1a1c811d73cfa27110b8c3c10b10da1801e))
- **FEAT**: Add support for done reason ([#413](https://github.com/davidmigloz/langchain_dart/issues/413)). ([cc5b1b02](https://github.com/davidmigloz/langchain_dart/commit/cc5b1b021636379f32f215546b78547ace87d150))

#### `googleai_dart` - `v0.1.0`

- **REFACTOR**: Minor changes ([#407](https://github.com/davidmigloz/langchain_dart/issues/407)). ([fa4b5c37](https://github.com/davidmigloz/langchain_dart/commit/fa4b5c376a191fea50c3f8b1d6b07cef0480a74e))

#### `langchain_chroma` - `v0.2.0+4`

- Update a dependency to the latest release.

#### `langchain_mistralai` - `v0.2.0+1`

- Update a dependency to the latest release.

#### `langchain_pinecone` - `v0.1.0+4`

- Update a dependency to the latest release.

#### `langchain_supabase` - `v0.1.0+4`

- Update a dependency to the latest release.

## 2024-05-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.3.1`](#openai_dart---v031)
 - [`langchain_openai` - `v0.6.0+2`](#langchain_openai---v0602)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.6.0+2`

---

#### `openai_dart` - `v0.3.1`

 - **FEAT**: Add support for stream_options in openai_dart ([#405](https://github.com/davidmigloz/langchain_dart/issues/405)). ([c15714ca](https://github.com/davidmigloz/langchain_dart/commit/c15714ca2df9e30873bc8e4901482faa2d858d8a))
 - **FIX**: RunStepDetailsToolCalls deserialization in Assistants API v2 ([#404](https://github.com/davidmigloz/langchain_dart/issues/404)). ([d76c6aba](https://github.com/davidmigloz/langchain_dart/commit/d76c6aba321e666940614cbc90726500aa370c87))

## 2024-05-06

### Changes

---

Packages with breaking changes:

- [`openai_dart` - `v0.3.0`](#openai_dart---v030)

Packages with other changes:

- [`langchain_openai` - `v0.6.0+1`](#langchain_openai---v0601)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_openai` - `v0.6.0+1`

---

#### `openai_dart` - `v0.3.0`

- **BREAKING** **FEAT**: Migrate OpenAI Assistants API to v2 and add support for vector stores ([#402](https://github.com/davidmigloz/langchain_dart/issues/402)). ([45de29a1](https://github.com/davidmigloz/langchain_dart/commit/45de29a1957caf2ef05c91e4c99144a4e73ceb91))
- **FEAT**: Add support for `ChatCompletionToolChoiceMode.required` ([#402](https://github.com/davidmigloz/langchain_dart/issues/402)). ([45de29a1](https://github.com/davidmigloz/langchain_dart/commit/45de29a1957caf2ef05c91e4c99144a4e73ceb91))

## 2024-05-05

### Changes

---

Packages with breaking changes:

- [`langchain` - `v0.7.0`](#langchain---v070)
- [`langchain_core` - `v0.3.0`](#langchain_core---v030)
- [`langchain_community` - `v0.2.0`](#langchain_community---v020)
- [`langchain_openai` - `v0.6.0`](#langchain_openai---v060)
- [`langchain_google` - `v0.4.0`](#langchain_google---v040)
- [`langchain_mistralai` - `v0.2.0`](#langchain_mistralai---v020)
- [`langchain_ollama` - `v0.2.0`](#langchain_ollama---v020)

Packages with other changes:

- [`langchain_supabase` - `v0.1.0+3`](#langchain_supabase---v0103)
- [`langchain_pinecone` - `v0.1.0+3`](#langchain_pinecone---v0103)
- [`langchain_chroma` - `v0.2.0+3`](#langchain_chroma---v0203)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_supabase` - `v0.1.0+3`
- `langchain_pinecone` - `v0.1.0+3`
- `langchain_chroma` - `v0.2.0+3`

---

#### `langchain` - `v0.7.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
- **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

#### `langchain_core` - `v0.3.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
- **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

#### `langchain_community` - `v0.2.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
- **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

#### `langchain_openai` - `v0.6.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
- **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

#### `langchain_google` - `v0.4.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))

#### `langchain_mistralai` - `v0.2.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))

#### `langchain_ollama` - `v0.2.0`

- **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))

## 2024-04-30

### Changes

---

Packages with breaking changes:

 - [`langchain` - `v0.6.0+1`](#langchain---v0601)
 - [`langchain_core` - `v0.2.0+1`](#langchain_core---v0201)

Packages with other changes:

 - [`langchain_openai` - `v0.5.1+1`](#langchain_openai---v0511)
 - [`openai_dart` - `v0.2.2`](#openai_dart---v022)

Packages with dependency updates only:

 - `langchain_community` - `v0.1.0+2`
 - `langchain_ollama` - `v0.1.0+2`
 - `langchain_supabase` - `v0.1.0+2`
 - `langchain_pinecone` - `v0.1.0+2`
 - `langchain_chroma` - `v0.2.0+2`
 - `langchain_google` - `v0.3.0+2`
 - `langchain_mistralai` - `v0.1.0+2`

---

#### `langchain` - `v0.6.0+1`

- **FEAT** Add support for RunnableRouter ([#386](https://github.com/davidmigloz/langchain_dart/issues/386)). ([827e262](https://github.com/davidmigloz/langchain_dart/commit/827e2627535941d702e8fbe300ca1426ddf50efe))
- **FEAT**: Add support for Runnable.mapInputStream ([#393](https://github.com/davidmigloz/langchain_dart/issues/393)). ([a2b6bbb5](https://github.com/davidmigloz/langchain_dart/commit/a2b6bbb5ea7a65c36d1e955f9f96298cf2384afc))
- **FEAT**: Add support for JsonOutputParser ([#392](https://github.com/davidmigloz/langchain_dart/issues/392)). ([c6508f0f](https://github.com/davidmigloz/langchain_dart/commit/c6508f0fadde3fd4d93accbcae5cea37b7beca20))
- **FEAT**: Reduce input stream for PromptTemplate, LLM, ChatModel, Retriever and Tool ([#388](https://github.com/davidmigloz/langchain_dart/issues/388)). ([b59bcd40](https://github.com/davidmigloz/langchain_dart/commit/b59bcd409f4904fb2e16f928b3c7206a186ab3f4))
- **BREAKING** **FEAT**: Support different logic for streaming in RunnableFunction ([#394](https://github.com/davidmigloz/langchain_dart/issues/394)). ([8bb2b8ed](https://github.com/davidmigloz/langchain_dart/commit/8bb2b8ede18bfe3a4f266b78ca32f1dfb83db1b1))
- **FIX**: Allow async functions in Runnable.mapInput ([#396](https://github.com/davidmigloz/langchain_dart/issues/396)). ([e4c35092](https://github.com/davidmigloz/langchain_dart/commit/e4c3509267b7be28e2b0fa334a9255baadabfb6a))
- **DOCS**: Update LangChain Expression Language documentation ([#395](https://github.com/davidmigloz/langchain_dart/issues/395)). ([6ce75e5f](https://github.com/davidmigloz/langchain_dart/commit/6ce75e5fe6492c951f9b5209d7a2c3077ad178d2))

#### `langchain_core` - `v0.2.0+1`

- **FEAT** Add support for RunnableRouter ([#386](https://github.com/davidmigloz/langchain_dart/issues/386)). ([827e262](https://github.com/davidmigloz/langchain_dart/commit/827e2627535941d702e8fbe300ca1426ddf50efe))
- **FEAT**: Add support for Runnable.mapInputStream ([#393](https://github.com/davidmigloz/langchain_dart/issues/393)). ([a2b6bbb5](https://github.com/davidmigloz/langchain_dart/commit/a2b6bbb5ea7a65c36d1e955f9f96298cf2384afc))
- **FEAT**: Add support for JsonOutputParser ([#392](https://github.com/davidmigloz/langchain_dart/issues/392)). ([c6508f0f](https://github.com/davidmigloz/langchain_dart/commit/c6508f0fadde3fd4d93accbcae5cea37b7beca20))
- **FEAT**: Reduce input stream for PromptTemplate, LLM, ChatModel, Retriever and Tool ([#388](https://github.com/davidmigloz/langchain_dart/issues/388)). ([b59bcd40](https://github.com/davidmigloz/langchain_dart/commit/b59bcd409f4904fb2e16f928b3c7206a186ab3f4))
- **BREAKING** **FEAT**: Support different logic for streaming in RunnableFunction ([#394](https://github.com/davidmigloz/langchain_dart/issues/394)). ([8bb2b8ed](https://github.com/davidmigloz/langchain_dart/commit/8bb2b8ede18bfe3a4f266b78ca32f1dfb83db1b1))
- **FIX**: Allow async functions in Runnable.mapInput ([#396](https://github.com/davidmigloz/langchain_dart/issues/396)). ([e4c35092](https://github.com/davidmigloz/langchain_dart/commit/e4c3509267b7be28e2b0fa334a9255baadabfb6a))

#### `langchain_openai` - `v0.5.1+1`

 - **FEAT**: Add support for Runnable.mapInputStream ([#393](https://github.com/davidmigloz/langchain_dart/issues/393)). ([a2b6bbb5](https://github.com/davidmigloz/langchain_dart/commit/a2b6bbb5ea7a65c36d1e955f9f96298cf2384afc))

#### `openai_dart` - `v0.2.2`

 - **FEAT**: Add temperature, top_p and response format to Assistants API ([#384](https://github.com/davidmigloz/langchain_dart/issues/384)). ([1d18290f](https://github.com/davidmigloz/langchain_dart/commit/1d18290fdaba558e8661fed4f2316c795f20aef8))

## 2024-04-16

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`langchain` - `v0.5.0+1`](#langchain---v0501)
- [`openai_dart` - `v0.2.1`](#openai_dart---v021)
- [`langchain_openai` - `v0.5.0+1`](#langchain_openai---v0501)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_openai` - `v0.5.0+1`

---

#### `langchain` - `v0.5.0+1`

- **DOCS**: Update README.md. ([8139113a](https://github.com/davidmigloz/langchain_dart/commit/8139113a3ca8faa94145cbb6b1b80ca3bc2f3979))

#### `openai_dart` - `v0.2.1`

- **FEAT**: Add support for Batch API in openai_dart ([#383](https://github.com/davidmigloz/langchain_dart/issues/383)). ([6b89f4a2](https://github.com/davidmigloz/langchain_dart/commit/6b89f4a269417441df844545ab670fa67701e7b4))
- **FEAT**: Support specifying tool choice in Assistant API in openai_dart ([#382](https://github.com/davidmigloz/langchain_dart/issues/382)). ([97d7977a](https://github.com/davidmigloz/langchain_dart/commit/97d7977a2666ed004c0e04d57114538e02849156))
- **FEAT**: Support JSON mode in Assistant API in openai_dart ([#381](https://github.com/davidmigloz/langchain_dart/issues/381)). ([a864dae3](https://github.com/davidmigloz/langchain_dart/commit/a864dae3d38f49f83975012ecadec5b859dc43c2))
- **FEAT**: Support max tokens and truncation strategy in Assistant API in openai_dart ([#380](https://github.com/davidmigloz/langchain_dart/issues/380)). ([7153167b](https://github.com/davidmigloz/langchain_dart/commit/7153167b550549155cf7f68af2292d24036fc9f2))
- **FEAT**: Add streaming support to Assistant API in openai_dart ([#379](https://github.com/davidmigloz/langchain_dart/issues/379)). ([6ef68196](https://github.com/davidmigloz/langchain_dart/commit/6ef68196fbfff233b37eda8f3d1b1d373252613f))
- **FEAT**: Update models catalog with GPT-4 Turbo with Vision in openai_dart ([#378](https://github.com/davidmigloz/langchain_dart/issues/378)). ([88537540](https://github.com/davidmigloz/langchain_dart/commit/88537540fbab3cd20fd611447519bbdfed950ebe))
- **FEAT**: Add Weights & Biases fine-tuning integration and seed in openai_dart ([#377](https://github.com/davidmigloz/langchain_dart/issues/377)). ([a5fff1bf](https://github.com/davidmigloz/langchain_dart/commit/a5fff1bf6ec8cc258174f1e7bcf12c00b7201e0e))
- **FEAT**: Add support for checkpoints in fine-tuning jobs in openai_dart ([#376](https://github.com/davidmigloz/langchain_dart/issues/376)). ([69f8e2f9](https://github.com/davidmigloz/langchain_dart/commit/69f8e2f9137a92683a9eec79f2de1ad03452244a))

## 2024-04-10

### Changes

---

Packages with breaking changes:

- [`langchain` - `v0.5.0`](#langchain---v050)
- [`langchain_chroma` - `v0.2.0`](#langchain_chroma---v020)
- [`langchain_community` - `v0.1.0`](#langchain_community---v010)
- [`langchain_core` - `v0.1.0`](#langchain_core---v010)
- [`langchain_google` - `v0.3.0`](#langchain_google---v030)
- [`langchain_mistralai` - `v0.1.0`](#langchain_mistralai---v010)
- [`langchain_ollama` - `v0.1.0`](#langchain_ollama---v010)
- [`langchain_openai` - `v0.5.0`](#langchain_openai---v050)
- [`langchain_pinecone` - `v0.1.0`](#langchain_pinecone---v010)
- [`langchain_supabase` - `v0.1.0`](#langchain_supabase---v010)
- [`chromadb` - `v0.2.0`](#chromadb---v020)
- [`openai_dart` - `v0.2.0`](#openai_dart---v020)
- [`vertex_ai` - `v0.1.0`](#vertex_ai---v010)

Packages with other changes:

- [`googleai_dart` - `v0.0.4`](#googleai_dart---v004)
- [`mistralai_dart` - `v0.0.3+1`](#mistralai_dart---v0031)
- [`ollama_dart` - `v0.0.3+1`](#ollama_dart---v0031)

---

#### `langchain` - `v0.5.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
- **FEAT**: Add reduceOutputStream option to StringOutputParser ([#368](https://github.com/davidmigloz/langchain_dart/issues/368)). ([7f9a9fae](https://github.com/davidmigloz/langchain_dart/commit/7f9a9faeef93685ff810a88bbfe866da4b843369))
- **DOCS**: Update LCEL docs. ([ab3ab573](https://github.com/davidmigloz/langchain_dart/commit/ab3ab573f62d9a497e7c82308da0a044337e957d))
- **DOCS**: Add RAG example using OllamaEmbeddings and ChatOllama ([#337](https://github.com/davidmigloz/langchain_dart/issues/337)). ([8bddc6c0](https://github.com/davidmigloz/langchain_dart/commit/8bddc6c05b762be357a3c3ed0f6fc4af3aad866a))

#### `langchain_community` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))

#### `langchain_core` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
- **FEAT**: Add reduceOutputStream option to StringOutputParser ([#368](https://github.com/davidmigloz/langchain_dart/issues/368)). ([7f9a9fae](https://github.com/davidmigloz/langchain_dart/commit/7f9a9faeef93685ff810a88bbfe866da4b843369))

#### `langchain_chroma` - `v0.2.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))

#### `langchain_google` - `v0.3.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
- **FEAT**: Add streaming support in ChatGoogleGenerativeAI ([#360](https://github.com/davidmigloz/langchain_dart/issues/360)). ([68bfdb04](https://github.com/davidmigloz/langchain_dart/commit/68bfdb04e417a7023b8872cbe0798243503fbf3d))
- **FEAT**: Support tuned models in ChatGoogleGenerativeAI ([#359](https://github.com/davidmigloz/langchain_dart/issues/359)). ([764b633d](https://github.com/davidmigloz/langchain_dart/commit/764b633df1412f53fc238afe1e97d1e1ac22f206))
- **FEAT**: Add support for GoogleGenerativeAIEmbeddings ([#362](https://github.com/davidmigloz/langchain_dart/issues/362)). ([d4f888a0](https://github.com/davidmigloz/langchain_dart/commit/d4f888a0e347608f0538d656d0c5507b61e5ee7e))
- **FEAT**: Support output dimensionality in GoogleGenerativeAIEmbeddings ([#373](https://github.com/davidmigloz/langchain_dart/issues/373)). ([6dcb27d8](https://github.com/davidmigloz/langchain_dart/commit/6dcb27d861fa65d2c882e31ce28e8c0a92b65cc1))
- **FEAT**: Support updating API key in Google AI client ([#357](https://github.com/davidmigloz/langchain_dart/issues/357)). ([b9b808e7](https://github.com/davidmigloz/langchain_dart/commit/b9b808e72f02b9f38ab355d581284a0d848d4bd1))

#### `langchain_mistralai` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))

#### `langchain_ollama` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))

#### `langchain_openai` - `v0.5.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
- **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
- **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
- **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
- **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
- **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
- **FEAT**: Remove deprecated OpenAI instance id ([#350](https://github.com/davidmigloz/langchain_dart/issues/350)). ([52939336](https://github.com/davidmigloz/langchain_dart/commit/529393360b7643c8192153c3654e5482dfc299ad))

#### `langchain_pinecone` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))

#### `langchain_supabase` - `v0.1.0`

- **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))

#### `chromadb` - `v0.2.0`

- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

#### `openai_dart` - `v0.2.0`

- **FEAT**: Sync OpenAI API ([#347](https://github.com/davidmigloz/langchain_dart/issues/347)). ([f296eef6](https://github.com/davidmigloz/langchain_dart/commit/f296eef68bfd81305f87475c802705fe3ef477c3))
- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

#### `vertex_ai` - `v0.1.0`

- **REFACTOR**: Minor changes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))

#### `googleai_dart` - `v0.0.4`

- **FEAT**: Support generateContent for tuned model in googleai_dart client ([#358](https://github.com/davidmigloz/langchain_dart/issues/358)). ([b4641a09](https://github.com/davidmigloz/langchain_dart/commit/b4641a09af7f6d67d503d526451a370eca920c5c))
- **FEAT**: Support output dimensionality in Google AI Embeddings ([#373](https://github.com/davidmigloz/langchain_dart/issues/373)). ([6dcb27d8](https://github.com/davidmigloz/langchain_dart/commit/6dcb27d861fa65d2c882e31ce28e8c0a92b65cc1))
- **FEAT**: Support updating API key in Google AI client ([#357](https://github.com/davidmigloz/langchain_dart/issues/357)). ([b9b808e7](https://github.com/davidmigloz/langchain_dart/commit/b9b808e72f02b9f38ab355d581284a0d848d4bd1))
- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

#### `mistralai_dart` - `v0.0.3+1`

- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

#### `ollama_dart` - `v0.0.3+1`

- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

## 2024-02-15

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`chromadb` - `v0.1.2`](#chromadb---v012)
- [`googleai_dart` - `v0.0.3`](#googleai_dart---v003)
- [`langchain` - `v0.4.2`](#langchain---v042)
- [`langchain_chroma` - `v0.1.1`](#langchain_chroma---v011)
- [`langchain_google` - `v0.2.4`](#langchain_google---v024)
- [`langchain_mistralai` - `v0.0.3`](#langchain_mistralai---v003)
- [`langchain_ollama` - `v0.0.4`](#langchain_ollama---v004)
- [`langchain_openai` - `v0.4.1`](#langchain_openai---v041)
- [`langchain_pinecone` - `v0.0.7`](#langchain_pinecone---v007)
- [`langchain_supabase` - `v0.0.1+1`](#langchain_supabase---v0011)
- [`mistralai_dart` - `v0.0.3`](#mistralai_dart---v003)
- [`ollama_dart` - `v0.0.3`](#ollama_dart---v003)
- [`openai_dart` - `v0.1.7`](#openai_dart---v017)
- [`vertex_ai` - `v0.0.10`](#vertex_ai---v0010)

---

#### `googleai_dart` - `v0.0.3`

- **FEAT**: Add streaming support to googleai_dart client ([#299](https://github.com/davidmigloz/langchain_dart/issues/299)). ([2cbd538a](https://github.com/davidmigloz/langchain_dart/commit/2cbd538a3b67ef6bdd9ab7b92bebc3c8c7a1bea1))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `openai_dart` - `v0.1.7`

- **FEAT**: Allow to specify OpenAI custom instance ([#327](https://github.com/davidmigloz/langchain_dart/issues/327)). ([4744648c](https://github.com/davidmigloz/langchain_dart/commit/4744648cdf02828b9182ebd34ba3d7db5313786e))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_openai` - `v0.4.1`

- **FEAT**: Allow to specify OpenAI custom instance ([#327](https://github.com/davidmigloz/langchain_dart/issues/327)). ([4744648c](https://github.com/davidmigloz/langchain_dart/commit/4744648cdf02828b9182ebd34ba3d7db5313786e))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `ollama_dart` - `v0.0.3`

- **FEAT**: Add Ollama keep_alive param to control how long models stay loaded ([#319](https://github.com/davidmigloz/langchain_dart/issues/319)). ([3b86e227](https://github.com/davidmigloz/langchain_dart/commit/3b86e22788eb8df9c09b034c5acc98fdaa6b32c6))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_ollama` - `v0.0.4`

- **FEAT**: Add Ollama keep_alive param to control how long models stay loaded ([#319](https://github.com/davidmigloz/langchain_dart/issues/319)). ([3b86e227](https://github.com/davidmigloz/langchain_dart/commit/3b86e22788eb8df9c09b034c5acc98fdaa6b32c6))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `chromadb` - `v0.1.2`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))

#### `langchain` - `v0.4.2`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))

#### `langchain_chroma` - `v0.1.1`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_google` - `v0.2.4`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_mistralai` - `v0.0.3`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_pinecone` - `v0.0.7`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `langchain_supabase` - `v0.0.1+1`

- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `mistralai_dart` - `v0.0.3`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

#### `vertex_ai` - `v0.0.10`

- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 2024-01-31

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`langchain` - `v0.4.1`](#langchain---v041)
- [`langchain_supabase` - `v0.0.1`](#langchain_supabase---v001)
- [`langchain_chroma` - `v0.1.0+15`](#langchain_chroma---v01015)
- [`langchain_google` - `v0.2.3+3`](#langchain_google---v0233)
- [`langchain_mistralai` - `v0.0.2+3`](#langchain_mistralai---v0023)
- [`langchain_ollama` - `v0.0.3+3`](#langchain_ollama---v0033)
- [`langchain_openai` - `v0.4.0+1`](#langchain_openai---v0401)
- [`langchain_pinecone` - `v0.0.6+14`](#langchain_pinecone---v00614)
- [`chromadb` - `v0.1.1+1`](#chromadb---v0111)
- [`googleai_dart` - `v0.0.2+2`](#googleai_dart---v0022)
- [`mistralai_dart` - `v0.0.2+3`](#mistralai_dart---v0023)
- [`ollama_dart` - `v0.0.2+1`](#ollama_dart---v0021)
- [`openai_dart` - `v0.1.6+1`](#openai_dart---v0161)
- [`vertex_ai` - `v0.0.9+1`](#vertex_ai---v0091)

---

#### `langchain` - `v0.4.1`

- **DOCS**: Update Supabase docs. ([4a2a5329](https://github.com/davidmigloz/langchain_dart/commit/4a2a532931cac7577102d78b0ec8a5cc4eafb93c))
- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_supabase` - `v0.0.1`

- **FEAT**: Add support for Supabase VectorStore ([#69](https://github.com/davidmigloz/langchain_dart/issues/69)). ([be9e72bc](https://github.com/davidmigloz/langchain_dart/commit/be9e72bc210232e403f548a95a305d5bb6254f49))

#### `langchain_chroma` - `v0.1.0+15`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_google` - `v0.2.3+3`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_mistralai` - `v0.0.2+3`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_ollama` - `v0.0.3+3`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_openai` - `v0.4.0+1`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `langchain_pinecone` - `v0.0.6+14`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `chromadb` - `v0.1.1+1`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `googleai_dart` - `v0.0.2+2`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `mistralai_dart` - `v0.0.2+3`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `ollama_dart` - `v0.0.2+1`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `openai_dart` - `v0.1.6+1`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

#### `vertex_ai` - `v0.0.9+1`

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 2024-01-26

### Changes

---

Packages with breaking changes:

- [`langchain_openai` - `v0.4.0`](#langchain_openai---v040)

Packages with other changes:

- [`langchain` - `v0.4.0`](#langchain---v040)
- [`openai_dart` - `v0.1.6`](#openai_dart---v016)
- [`langchain_ollama` - `v0.0.3+2`](#langchain_ollama---v0032)
- [`langchain_mistralai` - `v0.0.2+2`](#langchain_mistralai---v0022)
- [`langchain_pinecone` - `v0.0.6+13`](#langchain_pinecone---v00613)
- [`langchain_chroma` - `v0.1.0+14`](#langchain_chroma---v01014)
- [`langchain_google` - `v0.2.3+2`](#langchain_google---v0232)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

- `langchain_ollama` - `v0.0.3+2`
- `langchain_mistralai` - `v0.0.2+2`
- `langchain_pinecone` - `v0.0.6+13`
- `langchain_chroma` - `v0.1.0+14`
- `langchain_google` - `v0.2.3+2`

---

#### `langchain` - `v0.4.0`

- **DOCS**: Update embeddings documentation ([#313](https://github.com/davidmigloz/langchain_dart/issues/313)). ([43463481](https://github.com/davidmigloz/langchain_dart/commit/4346348108dc105a1daaedc932641e725b648f3e))

#### `langchain_openai` - `v0.4.0`

- **BREAKING** **FEAT**: Update OpenAIEmbeddings' default model to text-embedding-3-small ([#313](https://github.com/davidmigloz/langchain_dart/issues/313)). ([43463481](https://github.com/davidmigloz/langchain_dart/commit/4346348108dc105a1daaedc932641e725b648f3e))
- **FEAT**: Add support for shortening embeddings in OpenAIEmbeddings ([#312](https://github.com/davidmigloz/langchain_dart/issues/312)). ([5f5eb54f](https://github.com/davidmigloz/langchain_dart/commit/5f5eb54f2b991c14c18abf785b873a677bdf7e14))

#### `openai_dart` - `v0.1.6`

- **FEAT**: Add gpt-4-0125-preview and gpt-4-turbo-preview in model catalog ([#309](https://github.com/davidmigloz/langchain_dart/issues/309)). ([f5a78867](https://github.com/davidmigloz/langchain_dart/commit/f5a78867e7fa61e03d7e7da101c939c38564454c))
- **FEAT**: Add text-embedding-3-small and text-embedding-3-large in model catalog ([#310](https://github.com/davidmigloz/langchain_dart/issues/310)). ([fda16024](https://github.com/davidmigloz/langchain_dart/commit/fda16024daa0b2b12999e628efe11d305d1abf4d))
- **FEAT**: Add support for shortening embeddings ([#311](https://github.com/davidmigloz/langchain_dart/issues/311)). ([c725db0b](https://github.com/davidmigloz/langchain_dart/commit/c725db0b07b41bee0f12981f956ed0f3cb3d73eb))

## 2024-01-25

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_openai` - `v0.3.3+1`](#langchain_openai---v0331)

---

#### `langchain_openai` - `v0.3.3+1`

 - **FIX**: Specified model is always overwritten in OpenAIFunctionsAgent ([#308](https://github.com/davidmigloz/langchain_dart/issues/308)). ([32dc37d8](https://github.com/davidmigloz/langchain_dart/commit/32dc37d8ca3e52929ab69d695f66627ff7e897fa))
 - **DOCS**: Update docs. ([6f15d7f8](https://github.com/davidmigloz/langchain_dart/commit/6f15d7f836e81ad82cf76988e90620a489b31abb))

## 2024-01-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.3.3`](#langchain---v033)
 - [`langchain_openai` - `v0.3.3`](#langchain_openai---v033)
 - [`langchain_google` - `v0.2.3+1`](#langchain_google---v0231)
 - [`langchain_mistralai` - `v0.0.2+1`](#langchain_mistralai---v0021)
 - [`openai_dart` - `v0.1.5`](#openai_dart---v015)
 - [`mistralai_dart` - `v0.0.2+2`](#mistralai_dart---v0022)
 - [`vertex_ai` - `v0.0.9`](#vertex_ai---v009)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.6+12`
 - `langchain_ollama` - `v0.0.3+1`
 - `langchain_chroma` - `v0.1.0+13`

---

#### `langchain` - `v0.3.3`

 - **DOCS**: Add Anyscale and Together AI documentation ([#305](https://github.com/davidmigloz/langchain_dart/issues/305)). ([7daa3eb0](https://github.com/davidmigloz/langchain_dart/commit/7daa3eb052c32baa7473d7532c795b7f242ed9fc))

#### `langchain_openai` - `v0.3.3`

 - **FEAT**: Support Anyscale in ChatOpenAI and OpenAIEmbeddings wrappers ([#305](https://github.com/davidmigloz/langchain_dart/issues/305)). ([7daa3eb0](https://github.com/davidmigloz/langchain_dart/commit/7daa3eb052c32baa7473d7532c795b7f242ed9fc))
 - **FEAT**: Support Together AI in ChatOpenAI wrapper ([#297](https://github.com/davidmigloz/langchain_dart/issues/297)). ([28ab56af](https://github.com/davidmigloz/langchain_dart/commit/28ab56aff35c93a6835e5f22397d47da9e45fe40))
 - **FEAT**: Support Together AI in OpenAIEmbeddings wrapper ([#304](https://github.com/davidmigloz/langchain_dart/issues/304)). ([ddc761d6](https://github.com/davidmigloz/langchain_dart/commit/ddc761d65154be2df1efc202d9e7e6b2e60e7ac2))

#### `langchain_google` - `v0.2.3+1`

 - **REFACTOR**: Remove tiktoken in favour of countTokens API on VertexAI ([#307](https://github.com/davidmigloz/langchain_dart/issues/307)). ([8158572b](https://github.com/davidmigloz/langchain_dart/commit/8158572b15c0525b9caa9bc71fbbbee6ab4458fe))

#### `langchain_mistralai` - `v0.0.2+1`

 - **REFACTOR**: Update safe_mode and max temperature in Mistral chat ([#300](https://github.com/davidmigloz/langchain_dart/issues/300)). ([1a4ccd1e](https://github.com/davidmigloz/langchain_dart/commit/1a4ccd1e7d1907e340ce609cc6ba8d0543ee3421))

#### `openai_dart` - `v0.1.5`

 - **FEAT**: Support Anyscale API in openai_dart client ([#303](https://github.com/davidmigloz/langchain_dart/issues/303)). ([e0a3651c](https://github.com/davidmigloz/langchain_dart/commit/e0a3651c1457065808e1306c7f498eb716159583))
 - **FEAT**: Support Together AI API ([#296](https://github.com/davidmigloz/langchain_dart/issues/296)). ([ca6f23d5](https://github.com/davidmigloz/langchain_dart/commit/ca6f23d53baebe8679b4bc67a7de9a705692dde3))
 - **FEAT**: Support Together AI Embeddings API in openai_dart client ([#301](https://github.com/davidmigloz/langchain_dart/issues/301)). ([4a6e1045](https://github.com/davidmigloz/langchain_dart/commit/4a6e1045c13d712ec4da992dcaa097a7b5c2a626))
 - **FEAT**: Add usage to Run/RunStep in openai_dart client ([#302](https://github.com/davidmigloz/langchain_dart/issues/302)). ([cc6538b5](https://github.com/davidmigloz/langchain_dart/commit/cc6538b53394d04084276d8687ec5d7cbb5b5506))

#### `vertex_ai` - `v0.0.9`

 - **FEAT**: Add count tokens method to vertex_ai client ([#306](https://github.com/davidmigloz/langchain_dart/issues/306)). ([54ae317d](https://github.com/davidmigloz/langchain_dart/commit/54ae317dda43f0313dca708d3831633252113c81))

#### `mistralai_dart` - `v0.0.2+2`

 - **REFACTOR**: Update safe_mode and max temperature in Mistral chat ([#300](https://github.com/davidmigloz/langchain_dart/issues/300)). ([1a4ccd1e](https://github.com/davidmigloz/langchain_dart/commit/1a4ccd1e7d1907e340ce609cc6ba8d0543ee3421))

## 2024-01-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.3.2`](#langchain---v032)
 - [`langchain_openai` - `v0.3.2`](#langchain_openai---v032)
 - [`langchain_google` - `v0.2.3`](#langchain_google---v023)
 - [`langchain_mistralai` - `v0.0.2`](#langchain_mistralai---v002)
 - [`langchain_ollama` - `v0.0.3`](#langchain_ollama---v003)
 - [`langchain_pinecone` - `v0.0.6+11`](#langchain_pinecone---v00611)
 - [`langchain_chroma` - `v0.1.0+12`](#langchain_chroma---v01012)
 - [`openai_dart` - `v0.1.4`](#openai_dart---v014)
 - [`googleai_dart` - `v0.0.2+1`](#googleai_dart---v0021)
 - [`mistralai_dart` - `v0.0.2+1`](#mistralai_dart---v0021)
 - [`vertex_ai` - `v0.0.8`](#vertex_ai---v008)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.6+11`
 - `langchain_chroma` - `v0.1.0+12`

---

#### `langchain` - `v0.3.2`

 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **FIX**: Export ConversationSummaryMemory ([#283](https://github.com/davidmigloz/langchain_dart/issues/283)). ([76b01d23](https://github.com/davidmigloz/langchain_dart/commit/76b01d2376c0d9727d1f4681dba83a46f4b02b3a))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

#### `langchain_openai` - `v0.3.2`

 - **FEAT**: Support OpenRouter API in ChatOpenAI wrapper ([#292](https://github.com/davidmigloz/langchain_dart/issues/292)). ([c6e7e5be](https://github.com/davidmigloz/langchain_dart/commit/c6e7e5beeb03c32a93b062aab874cae3da0a52d9)) ([docs](https://langchaindart.com/#/modules/model_io/models/chat_models/integrations/open_router))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

#### `langchain_google` - `v0.2.3`

 - **REFACTOR**: Use cl100k_base encoding model when no tokenizer is available ([#295](https://github.com/davidmigloz/langchain_dart/issues/295)). ([ca908e80](https://github.com/davidmigloz/langchain_dart/commit/ca908e8011a168a74240310c78abb3c590654a49))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

#### `langchain_mistralai` - `v0.0.2`

 - **REFACTOR**: Use cl100k_base encoding model when no tokenizer is available ([#295](https://github.com/davidmigloz/langchain_dart/issues/295)). ([ca908e80](https://github.com/davidmigloz/langchain_dart/commit/ca908e8011a168a74240310c78abb3c590654a49))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

#### `langchain_ollama` - `v0.0.3`

 - **REFACTOR**: Use cl100k_base encoding model when no tokenizer is available ([#295](https://github.com/davidmigloz/langchain_dart/issues/295)). ([ca908e80](https://github.com/davidmigloz/langchain_dart/commit/ca908e8011a168a74240310c78abb3c590654a49))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

#### `openai_dart` - `v0.1.4`

 - **FEAT**: Support OpenRouter API ([#292](https://github.com/davidmigloz/langchain_dart/issues/292)). ([57699b32](https://github.com/davidmigloz/langchain_dart/commit/57699b328ee280bf9ac394d60013d6c2e969ab41))
 - **FEAT**: Remove OpenAI deprecated models ([#290](https://github.com/davidmigloz/langchain_dart/issues/290)). ([893b1c51](https://github.com/davidmigloz/langchain_dart/commit/893b1c51abe0fff7955cac6d3cedaa85ccdbf3eb))

#### `googleai_dart` - `v0.0.2+1`

 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))

#### `mistralai_dart` - `v0.0.2+1`

 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))

#### `vertex_ai` - `v0.0.8`

 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

## 2024-01-04

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.3.1+1`](#langchain---v0311)
 - [`langchain_ollama` - `v0.0.2+1`](#langchain_ollama---v0021)
 - [`langchain_mistralai` - `v0.0.1+4`](#langchain_mistralai---v0014)
 - [`langchain_google` - `v0.2.2+1`](#langchain_google---v0221)
 - [`langchain_pinecone` - `v0.0.6+10`](#langchain_pinecone---v00610)
 - [`langchain_chroma` - `v0.1.0+11`](#langchain_chroma---v01011)
 - [`langchain_openai` - `v0.3.1+1`](#langchain_openai---v0311)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_ollama` - `v0.0.2+1`
 - `langchain_mistralai` - `v0.0.1+4`
 - `langchain_google` - `v0.2.2+1`
 - `langchain_pinecone` - `v0.0.6+10`
 - `langchain_chroma` - `v0.1.0+11`
 - `langchain_openai` - `v0.3.1+1`

---

#### `langchain` - `v0.3.1+1`

 - **FIX**: Export token_buffer.dart (ConversationTokenBufferMemory) ([#280](https://github.com/davidmigloz/langchain_dart/issues/280)). ([265fcb4b](https://github.com/davidmigloz/langchain_dart/commit/265fcb4b68a5aa6144456868aebf023e1b0ce539))


## 2023-12-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.3.1`](#langchain---v031)
 - [`langchain_ollama` - `v0.0.2`](#langchain_ollama---v002)
 - [`ollama_dart` - `v0.0.2`](#ollama_dart---v002)
 - [`openai_dart` - `v0.1.3`](#openai_dart---v013)
 - [`langchain_google` - `v0.2.2`](#langchain_google---v022)
 - [`langchain_openai` - `v0.3.1`](#langchain_openai---v031)
 - [`langchain_chroma` - `v0.1.0+10`](#langchain_chroma---v01010)
 - [`langchain_pinecone` - `v0.0.6+9`](#langchain_pinecone---v0069)
 - [`langchain_mistralai` - `v0.0.1+3`](#langchain_mistralai---v0013)
 - [`googleai_dart` - `v0.0.2`](#googleai_dart---v002)
 - [`mistralai_dart` - `v0.0.2`](#mistralai_dart---v002)
 - [`chromadb` - `v0.1.1`](#chromadb---v011)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_chroma` - `v0.1.0+10`
 - `langchain_pinecone` - `v0.0.6+9`
 - `langchain_mistralai` - `v0.0.1+3`

---

#### `langchain` - `v0.3.1`

 - **FEAT**: Make ChatPromptTemplates more convenient to use ([#275](https://github.com/davidmigloz/langchain_dart/issues/275)). ([9f8e6f75](https://github.com/davidmigloz/langchain_dart/commit/9f8e6f75543a41b87aff72fbeb249acf859a9562))

#### `langchain_ollama` - `v0.0.2`

 - **FEAT**: Migrate ChatOllama to Ollama chat API and add multi-modal support ([#279](https://github.com/davidmigloz/langchain_dart/issues/279)). ([c5de7e12](https://github.com/davidmigloz/langchain_dart/commit/c5de7e12d14c7095864879c604ccd814c51212cc))

#### `ollama_dart` - `v0.0.2`

 - **FEAT**: Add support for chat API and multi-modal LLMs ([#274](https://github.com/davidmigloz/langchain_dart/issues/274)). ([76e1a294](https://github.com/davidmigloz/langchain_dart/commit/76e1a2946fbbf5c4802c4e66addeb9adf5900b17))

#### `openai_dart` - `v0.1.3`

 - **FEAT**: Add support for Assistants API ([#278](https://github.com/davidmigloz/langchain_dart/issues/278)). ([06de2d5e](https://github.com/davidmigloz/langchain_dart/commit/06de2d5e541aa79f8d54a8f9a33338c6a6edae3c))

#### `langchain_google` - `v0.2.2`

 - Update a dependency to the latest release.

#### `langchain_openai` - `v0.3.1`

 - Update a dependency to the latest release.

#### `mistralai_dart` - `v0.0.2`

 - Update a dependency to the latest release.

#### `chromadb` - `v0.1.1`

 - Update a dependency to the latest release.

#### `googleai_dart` - `v0.0.2`

- Update a dependency to the latest release.


## 2023-12-15

### Changes

---

New packages:
 - [`googleai_dart` - `v0.0.1`](#googleai_dart---v001)

Packages with breaking changes:

 - [`langchain` - `v0.3.0`](#langchain---v030)
 - [`langchain_openai` - `v0.3.0`](#langchain_openai---v030)

Packages with other changes:

 - [`langchain_chroma` - `v0.1.0+9`](#langchain_chroma---v0109)
 - [`langchain_google` - `v0.2.1`](#langchain_google---v021)
 - [`langchain_ollama` - `v0.0.1+2`](#langchain_ollama---v0012)
 - [`langchain_mistralai` - `v0.0.1+1`](#langchain_mistralai---v0011)
 - [`langchain_pinecone` - `v0.0.6+8`](#langchain_pinecone---v0068)

---

#### `langchain` - `v0.3.0`

 - **BREAKING** **REFACTOR**: Make MIME Type mandatory for base64 images in prompt ([#269](https://github.com/davidmigloz/langchain_dart/issues/269)). ([2fe076bb](https://github.com/davidmigloz/langchain_dart/commit/2fe076bb8d2ddacfee6ec077c3f564bff919dace))
 - **FEAT**: Allow to pass options to countTokens method ([#268](https://github.com/davidmigloz/langchain_dart/issues/268)). ([4ecb123b](https://github.com/davidmigloz/langchain_dart/commit/4ecb123bd34f0b01d377045b97dace89676d5d16))
 - **DOCS**: Update README.md and docs ([#272](https://github.com/davidmigloz/langchain_dart/issues/272)). ([306a1fdd](https://github.com/davidmigloz/langchain_dart/commit/306a1fdd6504ef28dc2066953ae575e975ab9025))

> [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/269)

#### `langchain_openai` - `v0.3.0`

 - **BREAKING** **REFACTOR**: Make MIME Type mandatory for base64 images in prompt ([#269](https://github.com/davidmigloz/langchain_dart/issues/269)). ([2fe076bb](https://github.com/davidmigloz/langchain_dart/commit/2fe076bb8d2ddacfee6ec077c3f564bff919dace))
 - **FEAT**: Allow to pass options to countTokens method ([#268](https://github.com/davidmigloz/langchain_dart/issues/268)). ([4ecb123b](https://github.com/davidmigloz/langchain_dart/commit/4ecb123bd34f0b01d377045b97dace89676d5d16))

#### `googleai_dart` - `v0.0.1`

 - **FEAT**: Implement Dart client for Google AI API ([#267](https://github.com/davidmigloz/langchain_dart/issues/267)). ([99083cd2](https://github.com/davidmigloz/langchain_dart/commit/99083cd22ec35b3256b800ce76df328b9c9165e4))

#### `langchain_chroma` - `v0.1.0+9`

 - **DOCS**: Update README.md and docs ([#272](https://github.com/davidmigloz/langchain_dart/issues/272)). ([306a1fdd](https://github.com/davidmigloz/langchain_dart/commit/306a1fdd6504ef28dc2066953ae575e975ab9025))

#### `langchain_google` - `v0.2.1`

 - **FEAT**: Add support for ChatGoogleGenerativeAI wrapper (Gemini API) ([#270](https://github.com/davidmigloz/langchain_dart/issues/270)). ([5d006c12](https://github.com/davidmigloz/langchain_dart/commit/5d006c121172192765b1a76582588c05b779e9c0))

#### `langchain_ollama` - `v0.0.1+2`

 - Update a dependency to the latest release.

#### `langchain_mistralai` - `v0.0.1+1`

 - Update a dependency to the latest release.

#### `langchain_pinecone` - `v0.0.6+8`

 - Update a dependency to the latest release.


## 2023-12-12

### Changes

---

New packages:

 - [`mistralai_dart` - `v0.0.1`](#mistralai_dart---v001)
 - [`langchain_mistralai` - `v0.0.1`](#langchain_mistralai---v001)

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.2.1`](#langchain---v021)
 - [`langchain_ollama` - `v0.0.1+1`](#langchain_ollama---v0011)
 - [`langchain_openai` - `v0.2.0+1`](#langchain_openai---v0201)
 - [`openai_dart` - `v0.1.2+1`](#openai_dart---v0121)
 - [`langchain_pinecone` - `v0.0.6+7`](#langchain_pinecone---v0067)
 - [`langchain_chroma` - `v0.1.0+8`](#langchain_chroma---v0108)
 - [`langchain_google` - `v0.2.0+1`](#langchain_google---v0201)

---

#### `langchain` - `v0.2.1`

 - **FEAT**: Support customizing Tool input description ([#258](https://github.com/davidmigloz/langchain_dart/issues/258)). ([a9a1b2a0](https://github.com/davidmigloz/langchain_dart/commit/a9a1b2a0f4fa5fee320e9ca5b46a99a0b834035c))
 - **DOCS**: Update Mistral AI documentation ([#265](https://github.com/davidmigloz/langchain_dart/issues/265)). ([59b4127e](https://github.com/davidmigloz/langchain_dart/commit/59b4127eddb7a04bafa34b11b071336ab336e7a9))

#### `langchain_mistralai` - `v0.0.1`

 - **FEAT**: Add support for ChatMistralAI wrapper ([#262](https://github.com/davidmigloz/langchain_dart/issues/262)). ([1364afec](https://github.com/davidmigloz/langchain_dart/commit/1364afec6ea56043ae17d5460276b10bf19b124e))
 - **FEAT**: Add support for MistralAIEmbeddings ([#254](https://github.com/davidmigloz/langchain_dart/issues/254)) ([#264](https://github.com/davidmigloz/langchain_dart/issues/264)). ([1c6bb1a3](https://github.com/davidmigloz/langchain_dart/commit/1c6bb1a3089c94340267f1091d226c3696efc1f1))

#### `langchain_ollama` - `v0.0.1+1`

 - **REFACTOR**: Minor changes in ChatOllama. ([725b8ff0](https://github.com/davidmigloz/langchain_dart/commit/725b8ff0dde5507378a6f2f54e5979f2f596aa2f))

#### `langchain_openai` - `v0.2.0+1`

 - **FIX**: Fix ChatOpenAI not considering functions from default options ([#257](https://github.com/davidmigloz/langchain_dart/issues/257)). ([cd864783](https://github.com/davidmigloz/langchain_dart/commit/cd864783f7190f7e8aa8988ba5c2cb5f7bfb3fad))

#### `mistralai_dart` - `v0.0.1`

 - **FIX**: Wrong role used as system role ([#263](https://github.com/davidmigloz/langchain_dart/issues/263)). ([7d68a871](https://github.com/davidmigloz/langchain_dart/commit/7d68a871a7bdd940544aa20e2514099a215da782))
 - **FEAT**: Implement Dart client for Mistral AI API ([#261](https://github.com/davidmigloz/langchain_dart/issues/261)). ([f4954c59](https://github.com/davidmigloz/langchain_dart/commit/f4954c59f17c6427d554db7b380073302fb08175))

#### `openai_dart` - `v0.1.2+1`

 - **FIX**: Make ChatCompletionNamedToolChoice fields required ([#259](https://github.com/davidmigloz/langchain_dart/issues/259)). ([4c7d0436](https://github.com/davidmigloz/langchain_dart/commit/4c7d0436070ede83369b9a667ca4c6d2cac99f1a))

#### `langchain_pinecone` - `v0.0.6+7`

 - Update a dependency to the latest release.

#### `langchain_chroma` - `v0.1.0+8`

 - Update a dependency to the latest release.

#### `langchain_google` - `v0.2.0+1`

 - Update a dependency to the latest release.


## 2023-12-05

### Changes

---

New packages:

 - [`langchain_ollama` - `v0.0.1`](#langchain_ollama---v001)

Packages with breaking changes:

 - [`langchain` - `v0.2.0`](#langchain---v020)
 - [`langchain_google` - `v0.2.0`](#langchain_google---v020)
 - [`langchain_openai` - `v0.2.0`](#langchain_openai---v020)

Packages with other changes:

 - [`langchain_chroma` - `v0.1.0+7`](#langchain_chroma---v0107)
 - [`ollama_dart` - `v0.0.1+1`](#ollama_dart---v0011)
 - [`openai_dart` - `v0.1.2`](#openai_dart---v012)
 - [`langchain_pinecone` - `v0.0.6+6`](#langchain_pinecone---v0066)

---

#### `langchain` - `v0.2.0`

> Migration guides:
> - [`Retriever`](https://github.com/davidmigloz/langchain_dart/issues/248)
> - [`Tools`](https://github.com/davidmigloz/langchain_dart/issues/243)

 - **BREAKING** **FEAT**: Move all retriever config options to RetrieverOptions ([#248](https://github.com/davidmigloz/langchain_dart/issues/248)). ([f5785b77](https://github.com/davidmigloz/langchain_dart/commit/f5785b772c11750bb57f4b143f978a84743f9222))
 - **BREAKING** **FEAT**: Allow to pass call options to tools ([#243](https://github.com/davidmigloz/langchain_dart/issues/243)). ([4a01adb9](https://github.com/davidmigloz/langchain_dart/commit/4a01adb9346b33cdb148d0f0aa7196e2b16867a9))
 - **FEAT**: Allow to mutate default options ([#256](https://github.com/davidmigloz/langchain_dart/issues/256)). ([cb5e4058](https://github.com/davidmigloz/langchain_dart/commit/cb5e4058fb89f33c8495ac22fb240ce92daa683c))
 - **REFACTOR**: Use JsonPath.readValues in JsonLoader ([#245](https://github.com/davidmigloz/langchain_dart/issues/245)). ([3e159254](https://github.com/davidmigloz/langchain_dart/commit/3e159254379d03b70655f274b6fe81fc07a5095f))
 - **FIX**: Out of rage error in ConversationBufferWindowMemory ([#249](https://github.com/davidmigloz/langchain_dart/issues/249)). ([1b38bff7](https://github.com/davidmigloz/langchain_dart/commit/1b38bff7eff10327cd0154c0a8d47bd363870e2d))
 - **FIX**: PromptTemplate stream should only emit if it has all inputs ([#247](https://github.com/davidmigloz/langchain_dart/issues/247)). ([a56a2ec5](https://github.com/davidmigloz/langchain_dart/commit/a56a2ec5e084d5c140b0e8469707ecaa19dfdaff))

#### `langchain_google` - `v0.2.0`

> Migration guides:
> - [`VertexAI`](https://github.com/davidmigloz/langchain_dart/issues/241)
> - [`ChatVertexAI`](https://github.com/davidmigloz/langchain_dart/issues/242)

 - **BREAKING** **FEAT**: Move all model config options to VertexAIOptions ([#241](https://github.com/davidmigloz/langchain_dart/issues/241)). ([a714882a](https://github.com/davidmigloz/langchain_dart/commit/a714882a3026c7f381b6853d6b61506060b0775e))
 - **BREAKING** **FEAT**: Move all model config options to ChatVertexAIOptions ([#242](https://github.com/davidmigloz/langchain_dart/issues/242)). ([89bef8a2](https://github.com/davidmigloz/langchain_dart/commit/89bef8a22fb0b74ffd9d7a4028c64b2d94d38578))
 - **FEAT**: Allow to mutate default options ([#256](https://github.com/davidmigloz/langchain_dart/issues/256)). ([cb5e4058](https://github.com/davidmigloz/langchain_dart/commit/cb5e4058fb89f33c8495ac22fb240ce92daa683c))

#### `langchain_openai` - `v0.2.0`

> Migration guides:
> - [`OpenAI`](https://github.com/davidmigloz/langchain_dart/issues/232)
> - [`ChatOpenAI`](https://github.com/davidmigloz/langchain_dart/issues/240)
> - [`OpenAIDallETool`](https://github.com/davidmigloz/langchain_dart/issues/244)

 - **BREAKING** **FEAT**: Move all model config options to OpenAIOptions ([#232](https://github.com/davidmigloz/langchain_dart/issues/232)). ([16e3e8e4](https://github.com/davidmigloz/langchain_dart/commit/16e3e8e449790444f2c1370f08430d42f15b6f5c))
 - **BREAKING** **FEAT**: Move all model config options to ChatOpenAIOptions ([#240](https://github.com/davidmigloz/langchain_dart/issues/240)). ([dd6a21a7](https://github.com/davidmigloz/langchain_dart/commit/dd6a21a75de28a0e605b287f75d9770bce4bb706))
 - **BREAKING** **FEAT**: Allow to pass call options to tools ([#243](https://github.com/davidmigloz/langchain_dart/issues/243)). ([4a01adb9](https://github.com/davidmigloz/langchain_dart/commit/4a01adb9346b33cdb148d0f0aa7196e2b16867a9))
 - **BREAKING** **FEAT**: Move all DallE config options to OpenAIDallEToolOptions ([#244](https://github.com/davidmigloz/langchain_dart/issues/244)). ([c24877c6](https://github.com/davidmigloz/langchain_dart/commit/c24877c6bb1063a06d2be7320cbf8ef94fa04ae0))
 - **FEAT**: Allow to mutate default options ([#256](https://github.com/davidmigloz/langchain_dart/issues/256)). ([cb5e4058](https://github.com/davidmigloz/langchain_dart/commit/cb5e4058fb89f33c8495ac22fb240ce92daa683c))
 - **FEAT**: Allow to update OpenAI key without having to recreate the wrapper ([#246](https://github.com/davidmigloz/langchain_dart/issues/246)). ([05739bd1](https://github.com/davidmigloz/langchain_dart/commit/05739bd1a43a82e1e5ba24543ccc985d48d48286))
 - **FIX**: PromptTemplate stream should only emit if it has all inputs ([#247](https://github.com/davidmigloz/langchain_dart/issues/247)). ([a56a2ec5](https://github.com/davidmigloz/langchain_dart/commit/a56a2ec5e084d5c140b0e8469707ecaa19dfdaff))

#### `langchain_chroma` - `v0.1.0+7`

 - **DOCS**: Fix typo in Chroma docs. ([dd97db40](https://github.com/davidmigloz/langchain_dart/commit/dd97db400892fc42cd4d395ace93a40b313247c1))

#### `langchain_ollama` - `v0.0.1`

 - **FEAT**: Add support for ChatOllama chat model ([#255](https://github.com/davidmigloz/langchain_dart/issues/255)). ([5b156910](https://github.com/davidmigloz/langchain_dart/commit/5b1569104a3e31fcba078e05b81e7a61b67a24dd))
 - **FEAT**: Add support for OllamaEmbeddings ([#254](https://github.com/davidmigloz/langchain_dart/issues/254)). ([b69701c7](https://github.com/davidmigloz/langchain_dart/commit/b69701c720ba63269ca3541881df4afa4c75504b))
 - **FEAT**: Add support for Ollama LLM ([#253](https://github.com/davidmigloz/langchain_dart/issues/253)). ([23362fdd](https://github.com/davidmigloz/langchain_dart/commit/23362fddf06c056fb2f497a6d1d1648e21895eb8))
 - **DOCS**: Update Ollama docs. ([8161f6c9](https://github.com/davidmigloz/langchain_dart/commit/8161f6c99a6d5169e6df48bb0cfc95374ec4c664))

#### `ollama_dart` - `v0.0.1+1`

 - **DOCS**: Update README.me. ([be20dbaf](https://github.com/davidmigloz/langchain_dart/commit/be20dbaf4568c773aca88f1339a489092b3a5551))

#### `openai_dart` - `v0.1.2`

 - **FEAT**: Allow to update OpenAI key without having to recreate the wrapper ([#246](https://github.com/davidmigloz/langchain_dart/issues/246)). ([05739bd1](https://github.com/davidmigloz/langchain_dart/commit/05739bd1a43a82e1e5ba24543ccc985d48d48286))

#### `langchain_pinecone` - `v0.0.6+6`

 - Update a dependency to the latest release.


## 2023-11-21

### Changes

---

New packages:

 - [`ollama_dart` - `v0.0.1`](#ollama_dart---v001)

Packages with breaking changes:

 - There are no breaking changes in this release.

---

#### `ollama_dart` - `v0.0.1`

 - **FEAT**: Implement ollama_dart, a Dart client for Ollama API ([#238](https://github.com/davidmigloz/langchain_dart/issues/238)). ([d213aa9c](https://github.com/davidmigloz/langchain_dart/commit/d213aa9c5dec0aea11d656b5f16ddf3174f5b789))


## 2023-11-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.1.1+1`](#langchain---v0111)
 - [`langchain_pinecone` - `v0.0.6+5`](#langchain_pinecone---v0065)
 - [`langchain_openai` - `v0.1.2+2`](#langchain_openai---v0122)
 - [`langchain_chroma` - `v0.1.0+6`](#langchain_chroma---v0106)
 - [`langchain_google` - `v0.1.0+4`](#langchain_google---v0104)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.1.2+2`
 - `langchain_chroma` - `v0.1.0+6`
 - `langchain_google` - `v0.1.0+4`

---

#### `langchain` - `v0.1.1+1`

 - **FIX**: Conditionally import dart:io in LocalFileStore ([#237](https://github.com/davidmigloz/langchain_dart/issues/237)). ([71d337e6](https://github.com/davidmigloz/langchain_dart/commit/71d337e62af49f173369e402fa6a72e363fd8724))

#### `langchain_pinecone` - `v0.0.6+5`

 - **FIX**: Decode JSON responses as UTF-8 in Pinecone ([#236](https://github.com/davidmigloz/langchain_dart/issues/236)). ([edb427b1](https://github.com/davidmigloz/langchain_dart/commit/edb427b16e6cd938adcaaa7cf641f4df6632f479))


## 2023-11-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`chromadb` - `v0.1.0+2`](#chromadb---v0102)
 - [`langchain_chroma` - `v0.1.0+5`](#langchain_chroma---v0105)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_chroma` - `v0.1.0+5`

---

#### `chromadb` - `v0.1.0+2`

 - **FIX**: Decode JSON responses as UTF-8 ([#234](https://github.com/davidmigloz/langchain_dart/issues/234)) ([#235](https://github.com/davidmigloz/langchain_dart/issues/235)). ([29347763](https://github.com/davidmigloz/langchain_dart/commit/29347763fe04cb7c9199e33c643dbc585de0a7b8))


## 2023-11-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.1.1+2`](#openai_dart---v0112)
 - [`langchain_openai` - `v0.1.2+1`](#langchain_openai---v0121)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.1.2+1`

---

#### `openai_dart` - `v0.1.1+2`

 - **FIX**: Decode JSON responses as UTF-8 ([#234](https://github.com/davidmigloz/langchain_dart/issues/234)). ([0bca67f4](https://github.com/davidmigloz/langchain_dart/commit/0bca67f4ea682ebd5a8b9d3c7319c9511229b0ba))


## 2023-11-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.1.1`](#langchain---v011)
 - [`langchain_openai` - `v0.1.2`](#langchain_openai---v012)
 - [`langchain_pinecone` - `v0.0.6+4`](#langchain_pinecone---v0064)
 - [`langchain_chroma` - `v0.1.0+4`](#langchain_chroma---v0104)
 - [`langchain_google` - `v0.1.0+3`](#langchain_google---v0103)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.6+4`
 - `langchain_chroma` - `v0.1.0+4`
 - `langchain_google` - `v0.1.0+3`

---

#### `langchain` - `v0.1.1`

 - **FEAT**: Add support for OpenAIDallETool ([#231](https://github.com/davidmigloz/langchain_dart/issues/231)). ([541e8d77](https://github.com/davidmigloz/langchain_dart/commit/541e8d77d76246b25ffa8c4d3715b5ca728cfc3a))
 - **FEAT**: Support implementing custom agents using LCEL ([#230](https://github.com/davidmigloz/langchain_dart/issues/230)). ([625eeeb4](https://github.com/davidmigloz/langchain_dart/commit/625eeeb4ffa9d92c6fd8da003fa471f5d4752257))
 - **FEAT**: Add support for Runnable.mapInput() ([#229](https://github.com/davidmigloz/langchain_dart/issues/229)). ([7cc832ca](https://github.com/davidmigloz/langchain_dart/commit/7cc832ca82bd86b4031ca5f2c796e136ca646375))
 - **REFACTOR**: Rename RunnableMapFromItem to RunnableMapFromInput ([#228](https://github.com/davidmigloz/langchain_dart/issues/228)). ([7330cfcd](https://github.com/davidmigloz/langchain_dart/commit/7330cfcd0c7e19c831da1454c3ff4cc03d079cf7))
 - **REFACTOR**: Improve handling of input and output keys in chains ([#227](https://github.com/davidmigloz/langchain_dart/issues/227)). ([acf76b24](https://github.com/davidmigloz/langchain_dart/commit/acf76b240a076cf4b1f153bdaba9127580369d9e))

#### `langchain_openai` - `v0.1.2`

 - **FEAT**: Add support for OpenAIDallETool ([#231](https://github.com/davidmigloz/langchain_dart/issues/231)). ([541e8d77](https://github.com/davidmigloz/langchain_dart/commit/541e8d77d76246b25ffa8c4d3715b5ca728cfc3a))
 - **FEAT**: Support implementing custom agents using LCEL ([#230](https://github.com/davidmigloz/langchain_dart/issues/230)). ([625eeeb4](https://github.com/davidmigloz/langchain_dart/commit/625eeeb4ffa9d92c6fd8da003fa471f5d4752257))


## 2023-11-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`openai_dart` - `v0.1.1+1`](#openai_dart---v0111)
 - [`langchain_openai` - `v0.1.1+1`](#langchain_openai---v0111)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.1.1+1`

---

#### `openai_dart` - `v0.1.1+1`

 - **FIX**: Fetch requests with big payloads dropping connection ([#226](https://github.com/davidmigloz/langchain_dart/issues/226)). ([1e771098](https://github.com/davidmigloz/langchain_dart/commit/1e771098d1090dd79846fca6520a1195efc5ac1e))


## 2023-11-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.1.0+2`](#langchain---v0102)
 - [`langchain_openai` - `v0.1.1`](#langchain_openai---v011)
 - [`openai_dart` - `v0.1.1`](#openai_dart---v011)
 - [`langchain_pinecone` - `v0.0.6+3`](#langchain_pinecone---v0063)
 - [`langchain_chroma` - `v0.1.0+3`](#langchain_chroma---v0103)
 - [`langchain_google` - `v0.1.0+2`](#langchain_google---v0102)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.6+3`
 - `langchain_chroma` - `v0.1.0+3`
 - `langchain_google` - `v0.1.0+2`

---

#### `langchain` - `v0.1.0+2`

 - **DOCS**: Update README.md ([#225](https://github.com/davidmigloz/langchain_dart/issues/225)). ([afff8567](https://github.com/davidmigloz/langchain_dart/commit/afff856723f15022bcc3f0ba0285ff1ffed51c68))

#### `langchain_openai` - `v0.1.1`

 - **FEAT**: Add Azure OpenAI API support ([#224](https://github.com/davidmigloz/langchain_dart/issues/224)). ([333fb7af](https://github.com/davidmigloz/langchain_dart/commit/333fb7af4b1edbdc716221609f2dc8f3923822cf))

#### `openai_dart` - `v0.1.1`

 - **FEAT**: Add Azure OpenAI API support ([#224](https://github.com/davidmigloz/langchain_dart/issues/224)). ([333fb7af](https://github.com/davidmigloz/langchain_dart/commit/333fb7af4b1edbdc716221609f2dc8f3923822cf))

## 2023-11-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`chromadb` - `v0.1.0+1`](#chromadb---v0101)
 - [`langchain` - `v0.1.0+1`](#langchain---v0101)
 - [`langchain_google` - `v0.1.0+1`](#langchain_google---v0101)
 - [`langchain_openai` - `v0.1.0+1`](#langchain_openai---v0101)
 - [`langchain_pinecone` - `v0.0.6+2`](#langchain_pinecone---v0062)
 - [`openai_dart` - `v0.1.0+1`](#openai_dart---v0101)
 - [`vertex_ai` - `v0.0.7+2`](#vertex_ai---v0072)
 - [`langchain_chroma` - `v0.1.0+2`](#langchain_chroma---v0102)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_chroma` - `v0.1.0+2`

---

#### `chromadb` - `v0.1.0+1`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `langchain` - `v0.1.0+1`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `langchain_google` - `v0.1.0+1`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `langchain_openai` - `v0.1.0+1`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `langchain_pinecone` - `v0.0.6+2`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `openai_dart` - `v0.1.0+1`

 - **FIX**: Add missing `name` param in ChatCompletionMessage ([#222](https://github.com/davidmigloz/langchain_dart/issues/222)). ([6f186775](https://github.com/davidmigloz/langchain_dart/commit/6f186775f67cf3db5e28e4a15f896927b9af50ce))
 - **FIX**: Remove dependency on io.HttpException ([#221](https://github.com/davidmigloz/langchain_dart/issues/221)). ([95369e4c](https://github.com/davidmigloz/langchain_dart/commit/95369e4c1a9b8f277390b612df7d9bb21c19d82f))
 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

#### `vertex_ai` - `v0.0.7+2`

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))


## 2023-11-15

### Changes

---

Packages with breaking changes:

 - [`langchain` - `v0.1.0`](#langchain---v010)
 - [`langchain_google` - `v0.1.0`](#langchain_google---v010)
 - [`langchain_openai` - `v0.1.0`](#langchain_openai---v010)
 - [`openai_dart` - `v0.1.0`](#openai_dart---v010)

Packages with other changes:

 - [`langchain_pinecone` - `v0.0.6+1`](#langchain_pinecone---v0061)
 - [`langchain_chroma` - `v0.1.0+1`](#langchain_chroma---v0101)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.6+1`
 - `langchain_chroma` - `v0.1.0+1`

---

#### `langchain` - `v0.1.0`

 - **BREAKING** **FEAT**: Add multi-modal messages support with OpenAI Vision ([#220](https://github.com/davidmigloz/langchain_dart/issues/220)). ([6da2e069](https://github.com/davidmigloz/langchain_dart/commit/6da2e069932782eed8c27da45c56b4c290373fac))

 > [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/220)

#### `langchain_google` - `v0.1.0`

 - **BREAKING** **FEAT**: Add multi-modal messages support with OpenAI Vision ([#220](https://github.com/davidmigloz/langchain_dart/issues/220)). ([6da2e069](https://github.com/davidmigloz/langchain_dart/commit/6da2e069932782eed8c27da45c56b4c290373fac))

 > [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/220)

#### `langchain_openai` - `v0.1.0`

 - **REFACTOR**: Align openai_dart client breaking changes ([#219](https://github.com/davidmigloz/langchain_dart/issues/219)). ([172db27f](https://github.com/davidmigloz/langchain_dart/commit/172db27f6da429e16dcda55678a73e1d885bb6d9))
 - **BREAKING** **FEAT**: Add multi-modal messages support with OpenAI Vision ([#220](https://github.com/davidmigloz/langchain_dart/issues/220)). ([6da2e069](https://github.com/davidmigloz/langchain_dart/commit/6da2e069932782eed8c27da45c56b4c290373fac))

 > [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/220)

#### `openai_dart` - `v0.1.0`

 - **BREAKING** **FEAT**: Add multi-modal support ([#218](https://github.com/davidmigloz/langchain_dart/issues/218)). ([14c8e7ef](https://github.com/davidmigloz/langchain_dart/commit/14c8e7ef7194400057d40422822df1127c4cb131))
 - **BREAKING** **FEAT**: Rename factory const to more meaningful names ([#215](https://github.com/davidmigloz/langchain_dart/issues/215)). ([7e4602fa](https://github.com/davidmigloz/langchain_dart/commit/7e4602fa86c55bd6d82a0aac253b1165afa21aeb))
 - **FEAT**: Add gpt-3.5-turbo-1106 chat model ([#217](https://github.com/davidmigloz/langchain_dart/issues/217)). ([73f37915](https://github.com/davidmigloz/langchain_dart/commit/73f37915e99d83bd458f8f8500385a24a64d3948))
 - **REFACTOR**: Improve request error handling ([#214](https://github.com/davidmigloz/langchain_dart/issues/214)). ([4a9f3d33](https://github.com/davidmigloz/langchain_dart/commit/4a9f3d335124526438651149e5b91c07921617a2))

 > Migration guides: [new factories](https://github.com/davidmigloz/langchain_dart/issues/215) and [multi-modal](https://github.com/davidmigloz/langchain_dart/issues/218)

## 2023-11-13

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- [`langchain_pinecone` - `v0.0.6`](#langchain_pinecone---v006)

---

#### `langchain_pinecone` - `v0.0.6`

- **FEAT**: Add support for global headers in Pinecone ([#213](https://github.com/davidmigloz/langchain_dart/issues/213)). ([8e0d221f](https://github.com/davidmigloz/langchain_dart/commit/8e0d221fad55b1fa62d9ff6f97476ee647837c6b))


## 2023-11-12

### Changes

---

Packages with breaking changes:

 - [`chromadb` - `v0.1.0`](#chromadb---v010)
 - [`langchain_chroma` - `v0.1.0`](#langchain_chroma---v010)

Packages with other changes:

 - [`openai_dart` - `v0.0.2+2`](#openai_dart---v0022)
 - [`langchain_openai` - `v0.0.15+2`](#langchain_openai---v00152)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.0.15+2`

---

#### `langchain_chroma` - `v0.1.0`

 - **BREAKING** **FEAT**: Chroma databases, tenants and global headers support ([#211](https://github.com/davidmigloz/langchain_dart/issues/211)). ([5a1d8397](https://github.com/davidmigloz/langchain_dart/commit/5a1d83971c78849f7185a674ffff527e0348511d))


#### `chromadb` - `v0.1.0`

 - **BREAKING** **FEAT**: Multi-modal and tenants support ([#210](https://github.com/davidmigloz/langchain_dart/issues/210)). ([bfb0d89c](https://github.com/davidmigloz/langchain_dart/commit/bfb0d89cf82881090f6a50ee4d70b70f62e4302e))

#### `openai_dart` - `v0.0.2+2`

 - **REFACTOR**: Migrate to generated client stream methods ([#208](https://github.com/davidmigloz/langchain_dart/issues/208)). ([9122f551](https://github.com/davidmigloz/langchain_dart/commit/9122f5517bb12a9596d22acfa6e81251f6d9afe8))
 - **FIX**: Fix integer overflow when targeting web ([#207](https://github.com/davidmigloz/langchain_dart/issues/207)). ([eaf69f32](https://github.com/davidmigloz/langchain_dart/commit/eaf69f32266abe4c8a4c99502fe9b1be2029d7d1))


## 2023-11-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_chroma` - `v0.0.5+3`](#langchain_chroma---v0053)
 - [`langchain_google` - `v0.0.10+1`](#langchain_google---v00101)
 - [`langchain_openai` - `v0.0.15+1`](#langchain_openai---v00151)
 - [`langchain_pinecone` - `v0.0.5+2`](#langchain_pinecone---v0052)
 - [`openai_dart` - `v0.0.2+1`](#openai_dart---v0021)

---

#### `langchain_chroma` - `v0.0.5+3`

 - **DOCS**: Update vector stores documentation. ([dad60d24](https://github.com/davidmigloz/langchain_dart/commit/dad60d247fac157f2980f73c14ac88e9a0894fba))

#### `langchain_google` - `v0.0.10+1`

 - **DOCS**: Update vector stores documentation. ([dad60d24](https://github.com/davidmigloz/langchain_dart/commit/dad60d247fac157f2980f73c14ac88e9a0894fba))

#### `langchain_openai` - `v0.0.15+1`

 - **REFACTOR**: Rename ChatCompletionFunction to FunctionObject (internal) ([#206](https://github.com/davidmigloz/langchain_dart/issues/206)). ([0f06df3f](https://github.com/davidmigloz/langchain_dart/commit/0f06df3f9b32e5887976936b5fd2e6aa5a4f4f5b))

#### `langchain_pinecone` - `v0.0.5+2`

 - **DOCS**: Update vector stores documentation. ([dad60d24](https://github.com/davidmigloz/langchain_dart/commit/dad60d247fac157f2980f73c14ac88e9a0894fba))

#### `openai_dart` - `v0.0.2+1`

 - **REFACTOR**: Rename ChatCompletionFunction to FunctionObject ([#206](https://github.com/davidmigloz/langchain_dart/issues/206)). ([0f06df3f](https://github.com/davidmigloz/langchain_dart/commit/0f06df3f9b32e5887976936b5fd2e6aa5a4f4f5b))


## 2023-11-07

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.0.15`](#langchain---v0015)
 - [`langchain_google` - `v0.0.10`](#langchain_google---v0010)
 - [`langchain_openai` - `v0.0.15`](#langchain_openai---v0015)
 - [`openai_dart` - `v0.0.2`](#openai_dart---v002)
 - [`langchain_pinecone` - `v0.0.5+1`](#langchain_pinecone---v0051)
 - [`langchain_chroma` - `v0.0.5+2`](#langchain_chroma---v0052)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_pinecone` - `v0.0.5+1`
 - `langchain_chroma` - `v0.0.5+2`

---

#### `langchain` - `v0.0.15`

 - **FEAT**: Add streaming support in LangChain Expression Language ([#192](https://github.com/davidmigloz/langchain_dart/issues/192)). ([2e4bcf91](https://github.com/davidmigloz/langchain_dart/commit/2e4bcf91f6b364b32b6f999e71252001ca6392c8))
 - **DOCS**: Add streaming to docs. ([bb87c190](https://github.com/davidmigloz/langchain_dart/commit/bb87c1901b34810aa2e841ed83da8e70703b9d08))
 - **FEAT**: Add streaming support to OutputFunctionsParsers ([#194](https://github.com/davidmigloz/langchain_dart/issues/194)). ([8b4e6a13](https://github.com/davidmigloz/langchain_dart/commit/8b4e6a138cd9942dd6ea1a97fe5e19e84a30000c))
 - **FIX**: Remove unused generic param in StringOutputParser ([#193](https://github.com/davidmigloz/langchain_dart/issues/193)). ([decd3176](https://github.com/davidmigloz/langchain_dart/commit/decd31765114bea1967f15e5fbd83110709938e4))

#### `langchain_openai` - `v0.0.15`

 - **FEAT**: Add streaming support to OpenAI ([#196](https://github.com/davidmigloz/langchain_dart/issues/196)). ([b21fcb38](https://github.com/davidmigloz/langchain_dart/commit/b21fcb387685af8706db62caf33b24e0ccf9c73f))
 - **FEAT**: Support seed and system_fingerprint in OpenAI wrapper ([#204](https://github.com/davidmigloz/langchain_dart/issues/204)). ([c31b6795](https://github.com/davidmigloz/langchain_dart/commit/c31b67959ca7ce3d42e9832669fd18de11f41984))
 - **FEAT**: Add streaming support to ChatOpenAI ([#197](https://github.com/davidmigloz/langchain_dart/issues/197)). ([2268da78](https://github.com/davidmigloz/langchain_dart/commit/2268da783703b76422448128ea929e6fb6f805b6))
 - **FEAT**: Support seed, system_fingerprint and JSON Mode in ChatOpenAI ([#205](https://github.com/davidmigloz/langchain_dart/issues/205)). ([3332c228](https://github.com/davidmigloz/langchain_dart/commit/3332c2281b8a345ac7a6789202cbd5ac2225296b))

#### `langchain_google` - `v0.0.10`

 - **FEAT**: Add result id in ChatVertexAI generations ([#195](https://github.com/davidmigloz/langchain_dart/issues/195)). ([a5bea6d3](https://github.com/davidmigloz/langchain_dart/commit/a5bea6d3aefbb53ed55d3abda0f51f5878445b72))

#### `openai_dart` - `v0.0.2`

 - **FEAT**: Support new models API functionality ([#203](https://github.com/davidmigloz/langchain_dart/issues/203)). ([33ebe746](https://github.com/davidmigloz/langchain_dart/commit/33ebe746b509009ba41e417f36abf267d9d1c2ca))
 - **FEAT**: Support new images API functionality ([#202](https://github.com/davidmigloz/langchain_dart/issues/202)). ([fcf21daf](https://github.com/davidmigloz/langchain_dart/commit/fcf21dafbbdf4b1598ed8ddbfe30ebd09da65ada))
 - **FEAT**: Support new fine-tunning API functionality ([#201](https://github.com/davidmigloz/langchain_dart/issues/201)). ([f5f44ad8](https://github.com/davidmigloz/langchain_dart/commit/f5f44ad831c87c71ad995567748546b82ee231a4))
 - **FEAT**: Support new embeddings API functionality ([#200](https://github.com/davidmigloz/langchain_dart/issues/200)). ([9b43d85b](https://github.com/davidmigloz/langchain_dart/commit/9b43d85b63ddf916c38e7c5d7c65d5be32fa3015))
 - **FEAT**: Support new completion API functionality ([#199](https://github.com/davidmigloz/langchain_dart/issues/199)). ([f12f6f57](https://github.com/davidmigloz/langchain_dart/commit/f12f6f577c0e74db6160101796522c8786c4f37e))
 - **FEAT**: Support new chat completion API functionality ([#198](https://github.com/davidmigloz/langchain_dart/issues/198)). ([01820d69](https://github.com/davidmigloz/langchain_dart/commit/01820d697c9ffac09f77d2a16a5db6b5e6ed6fc6))
 - **FIX**: Handle nullable function call fields when streaming ([#191](https://github.com/davidmigloz/langchain_dart/issues/191)). ([8f23cf16](https://github.com/davidmigloz/langchain_dart/commit/8f23cf16c96f73d69a2abf17f2142b7eb4922a73))


## 2023-11-03

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_chroma` - `v0.0.5+1`](#langchain_chroma---v0051)
 - [`langchain_openai` - `v0.0.14+1`](#langchain_openai---v00141)
 - [`langchain_pinecone` - `v0.0.5`](#langchain_pinecone---v005)

---

#### `langchain_chroma` - `v0.0.5+1`

 - **DOCS**: Update CHANGELOG.md. ([5ea4e532](https://github.com/davidmigloz/langchain_dart/commit/5ea4e5326e706a52d157284a281eb881e05117c5))

#### `langchain_openai` - `v0.0.14+1`

 - **FIX**: Revert OpenAI maxTokens default to 256 ([#189](https://github.com/davidmigloz/langchain_dart/issues/189)). ([ab2ce6d4](https://github.com/davidmigloz/langchain_dart/commit/ab2ce6d4231ca0e2aff7aa3d9831625b10d0524d))
 - **DOCS**: Update CHANGELOG.md. ([5ea4e532](https://github.com/davidmigloz/langchain_dart/commit/5ea4e5326e706a52d157284a281eb881e05117c5))

#### `langchain_pinecone` - `v0.0.5`

 - **FEAT**: Upgrade pinecone client to v0.6.0 ([#188](https://github.com/davidmigloz/langchain_dart/issues/188)). ([57e2587f](https://github.com/davidmigloz/langchain_dart/commit/57e2587fa3849e7aea199dd52e2cb2ce4f61946a))
 - **DOCS**: Update CHANGELOG.md. ([5ea4e532](https://github.com/davidmigloz/langchain_dart/commit/5ea4e5326e706a52d157284a281eb881e05117c5))


## 2023-11-02

### Changes

---

New packages:

- [`openai_dart` - `v0.0.1`](#openai_dart---v001)

Packages with breaking changes:

 - [`langchain` - `v0.0.14`](#langchain---v0014)
 - [`langchain_chroma` - `v0.0.5`](#langchain_chroma---v005)
 - [`langchain_google` - `v0.0.9`](#langchain_google---v009)
 - [`langchain_pinecone` - `v0.0.4`](#langchain_pinecone---v004)

Packages with other changes:

 - [`langchain_openai` - `v0.0.14`](#langchain_openai---v0014)

---

#### `langchain` - `v0.0.14`

 - **BREAKING** **FIX**: Change loaders lastModified metadata field to integer ([#172](https://github.com/davidmigloz/langchain_dart/issues/172)). ([72c724f8](https://github.com/davidmigloz/langchain_dart/commit/72c724f8a716e27b4a807b70bcbbafdd9feb0a18))
 - **BREAKING** **FEAT**: Update uuid internal dependency to 4.x.x ([#173](https://github.com/davidmigloz/langchain_dart/issues/173)). ([b01f4afe](https://github.com/davidmigloz/langchain_dart/commit/b01f4afea6cfcdf8a0aa6e1b11d3057efa6e5fc0))
 - **REFACTOR**: Don't require implement getFormatInstructions. ([d8b1286d](https://github.com/davidmigloz/langchain_dart/commit/d8b1286db59e02b60179e395eb43cdc3828582c2))
 - **DOCS**: Update docs. ([af7ee827](https://github.com/davidmigloz/langchain_dart/commit/af7ee8278f18620a54072bb9d1772882956d5c2d))

#### `langchain_openai` - `v0.0.14`

- **FEAT**: Migrate OpenAI to openai_dart client ([#184](https://github.com/davidmigloz/langchain_dart/issues/184)). ([6c90b371](https://github.com/davidmigloz/langchain_dart/commit/6c90b37183eb47354df91fc4870065afecaf3673))
- **FEAT**: Migrate ChatOpenAI to openai_dart client ([#185](https://github.com/davidmigloz/langchain_dart/issues/185)). ([de8f487d](https://github.com/davidmigloz/langchain_dart/commit/de8f487dfddb10bee049539356a20b77b7556cad))
- **FEAT**: Migrate OpenAIEmbeddings to openai_dart client ([#183](https://github.com/davidmigloz/langchain_dart/issues/183)). ([8f626fe8](https://github.com/davidmigloz/langchain_dart/commit/8f626fe8253f6b11fba0fcab0e143db93d3bce08))
- **REFACTOR**: Remove dependency on dart_openai ([#186](https://github.com/davidmigloz/langchain_dart/issues/186)). ([273cfa2e](https://github.com/davidmigloz/langchain_dart/commit/273cfa2e84421161c979ddc41168d1b38981ca04))

#### `langchain_chroma` - `v0.0.5`

 - **BREAKING** **FIX**: Change loaders lastModified metadata field to integer ([#172](https://github.com/davidmigloz/langchain_dart/issues/172)). ([72c724f8](https://github.com/davidmigloz/langchain_dart/commit/72c724f8a716e27b4a807b70bcbbafdd9feb0a18))
 - **BREAKING** **FEAT**: Update uuid internal dependency to 4.x.x ([#173](https://github.com/davidmigloz/langchain_dart/issues/173)). ([b01f4afe](https://github.com/davidmigloz/langchain_dart/commit/b01f4afea6cfcdf8a0aa6e1b11d3057efa6e5fc0))
 - **DOCS**: Update changelog. ([d45d624a](https://github.com/davidmigloz/langchain_dart/commit/d45d624a0ba12e53c4e78a29750cad30d66c61c5))

#### `langchain_google` - `v0.0.9`

 - **BREAKING** **FEAT**: Update uuid internal dependency to 4.x.x ([#173](https://github.com/davidmigloz/langchain_dart/issues/173)). ([b01f4afe](https://github.com/davidmigloz/langchain_dart/commit/b01f4afea6cfcdf8a0aa6e1b11d3057efa6e5fc0))
 - **DOCS**: Update changelog. ([d45d624a](https://github.com/davidmigloz/langchain_dart/commit/d45d624a0ba12e53c4e78a29750cad30d66c61c5))

#### `langchain_pinecone` - `v0.0.4`

 - **BREAKING** **FEAT**: Update uuid internal dependency to 4.x.x ([#173](https://github.com/davidmigloz/langchain_dart/issues/173)). ([b01f4afe](https://github.com/davidmigloz/langchain_dart/commit/b01f4afea6cfcdf8a0aa6e1b11d3057efa6e5fc0))

#### `openai_dart` - `v0.0.1`

 - **FIX**: Fix static analysis warning ([#187](https://github.com/davidmigloz/langchain_dart/issues/187)). ([3fe91570](https://github.com/davidmigloz/langchain_dart/commit/3fe915705ca5a8b335333fa5ea94260040aaf0db))
 - **FIX**: Several fixes and improvments ([#182](https://github.com/davidmigloz/langchain_dart/issues/182)). ([115e8bef](https://github.com/davidmigloz/langchain_dart/commit/115e8bef43c82d907ce94518fa382657a1237fcc))
 - **FEAT**: Support different embedding response formats ([#180](https://github.com/davidmigloz/langchain_dart/issues/180)). ([4f676e87](https://github.com/davidmigloz/langchain_dart/commit/4f676e875f05a837343792c976701fa0cda0076e))
 - **FEAT**: Implement openai_dart, a Dart client for OpenAI API ([#178](https://github.com/davidmigloz/langchain_dart/issues/178)). ([fa5d032a](https://github.com/davidmigloz/langchain_dart/commit/fa5d032a6225933a79d4ff039732d893156ac92d))


## 2023-09-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.0.13`](#langchain---v0013)
 - [`langchain_openai` - `v0.0.13`](#langchain_openai---v0013)
 - [`langchain_pinecone` - `v0.0.3`](#langchain_pinecone---v003)
 - [`langchain_chroma` - `v0.0.4`](#langchain_chroma---v004)
 - [`langchain_google` - `v0.0.8`](#langchain_google---v008)

---

#### `langchain` - `v0.0.13`

 - Check out the [LangChain Expression Language documentation](https://langchaindart.com/#/expression_language/interface) for more details

 - **FEAT**: Add support for JsonOutputFunctionsParser ([#165](https://github.com/davidmigloz/langchain_dart/issues/165)). ([66c8e644](https://github.com/davidmigloz/langchain_dart/commit/66c8e64410d1dbf8b75e5734cb0cbb0e43dc0615))
 - **FEAT**: Add support for StringOutputParser ([#164](https://github.com/davidmigloz/langchain_dart/issues/164)). ([ee29e99a](https://github.com/davidmigloz/langchain_dart/commit/ee29e99a410c3cc6a7ae263fea1cde283f904edf))
 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))
 - **FEAT**: Support custom doc prompt in StuffDocumentsQAChain ([#157](https://github.com/davidmigloz/langchain_dart/issues/157)). ([faa9d2d7](https://github.com/davidmigloz/langchain_dart/commit/faa9d2d768c2a70f17247d5703dd1d821af08240))

#### `langchain_openai` - `v0.0.13`

 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))

#### `langchain_pinecone` - `v0.0.3`

 - **FIX**: Update pinecone client version ([#160](https://github.com/davidmigloz/langchain_dart/issues/160)). ([d15cc576](https://github.com/davidmigloz/langchain_dart/commit/d15cc5761563476fe7b5d66effd42ded077dbbbc))

#### `langchain_chroma` - `v0.0.4`

 - Updated `langchain` dependency

#### `langchain_google` - `v0.0.8`

 - Updated `langchain` dependency


## 2023-09-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain_google` - `v0.0.7+1`](#langchain_google---v0071)
 - [`langchain_pinecone` - `v0.0.2+1`](#langchain_pinecone---v0021)
 - [`vertex_ai` - `v0.0.7+1`](#vertex_ai---v0071)

---

#### `langchain_google` - `v0.0.7+1`

 - **REFACTOR**: Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))

#### `langchain_pinecone` - `v0.0.2+1`

 - **REFACTOR**: Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))

#### `vertex_ai` - `v0.0.7+1`

 - **REFACTOR**: Require `http.Client` instead of `AuthClient` ([#156](https://github.com/davidmigloz/langchain_dart/issues/156)). ([0f7fee7f](https://github.com/davidmigloz/langchain_dart/commit/0f7fee7f0780e5b650ec50307a7fda65e242e822))


## 2023-09-05

### Changes

---

Packages with breaking changes:

 - [`langchain` - `v0.0.12`](#langchain---v0012)
 - [`langchain_google` - `v0.0.7`](#langchain_google---v007)
 - [`langchain_openai` - `v0.0.12`](#langchain_openai---v0012)

Packages with other changes:

 - [`langchain_pinecone` - `v0.0.2`](#langchain_pinecone---v002)
 - [`langchain_chroma` - `v0.0.3`](#langchain_chroma---v003)
 - [`vertex_ai` - `v0.0.7`](#vertex_ai---v007)
 - [`chromadb` - `v0.0.3`](#chromadb---v003)

---

#### `langchain` - `v0.0.12`

 - **BREAKING** **REFACTOR**: Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **DOCS**: Acknowledge sponsors in readme. ([092d94c8](https://github.com/davidmigloz/langchain_dart/commit/092d94c8ac166cf47f1ddab748b61d440f4b8585))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_google` - `v0.0.7`

 - **BREAKING** **FEAT**: Add default and call options in VertexAI and ChatVertexAI ([#155](https://github.com/davidmigloz/langchain_dart/issues/155)). ([fe1b12ea](https://github.com/davidmigloz/langchain_dart/commit/fe1b12ea282cd587f9dc78bd959741781ebb6d35))
 - **BREAKING** **REFACTOR**: Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **FEAT**: Support document title in VertexAIEmbeddings ([#154](https://github.com/davidmigloz/langchain_dart/issues/154)). ([6b763731](https://github.com/davidmigloz/langchain_dart/commit/6b76373139bb50e8d0e59b3f63b54f6adae3d498))
 - **FEAT**: Support task type in VertexAIEmbeddings ([#151](https://github.com/davidmigloz/langchain_dart/issues/151)). ([8a2199e2](https://github.com/davidmigloz/langchain_dart/commit/8a2199e26a945f7d2ad8d3da3ca14e083172f6f1))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_openai` - `v0.0.12`

 - **BREAKING** **REFACTOR**: Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `langchain_pinecone` - `v0.0.2`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))
 - **DOCS**: Update changelog. ([df784ff1](https://github.com/davidmigloz/langchain_dart/commit/df784ff108584b0732ec9455f1531636256e9c4e))

#### `langchain_chroma` - `v0.0.3`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `vertex_ai` - `v0.0.7`

 - **FEAT**: Add support for stopSequence and candidateCount ([#150](https://github.com/davidmigloz/langchain_dart/issues/150)). ([eab7d968](https://github.com/davidmigloz/langchain_dart/commit/eab7d968f464db58a04f3453b4470ad3859536aa))
 - **FEAT**: Support task type and title in embeddings models ([#149](https://github.com/davidmigloz/langchain_dart/issues/149)). ([421d36bd](https://github.com/davidmigloz/langchain_dart/commit/421d36bdfe1ad8c4776811f6e1f0d3bf8c316ee3))
 - **FIX**: Fix typo in stop sequences field deserialization ([#152](https://github.com/davidmigloz/langchain_dart/issues/152)). ([4f7161da](https://github.com/davidmigloz/langchain_dart/commit/4f7161da55309bcbd5a62c21ba2a7fa703c4eb09))
 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))

#### `chromadb` - `v0.0.3`

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))


## 2023-08-31

### Changes

---

New packages:

- [`langchain_pinecone` - `v0.0.1`](#langchain_pinecone---v001)
 
Packages with breaking changes:

 - [`langchain` - `v0.0.11`](#langchain---v0011)

Packages with other changes:

 - [`langchain_google` - `v0.0.6`](#langchain_google---v006)
 - [`langchain_openai` - `v0.0.11`](#langchain_openai---v0011)
 - [`langchain_chroma` - `v0.0.2`](#langchain_chroma---v002)
 - [`vertex_ai` - `v0.0.6`](#vertex_ai---v006)
 - [`chromadb` - `v0.0.2`](#chromadb---v002)

---

#### `langchain` - `v0.0.11`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **BREAKING** **REFACTOR**: Remove addDocuments from VectorStoreRetriever ([#146](https://github.com/davidmigloz/langchain_dart/issues/146)). ([d32a5fd9](https://github.com/davidmigloz/langchain_dart/commit/d32a5fd94645d10deee5a35f0d83501f93be7308))
 - **BREAKING** **REFACTOR**: Rename VectorStoreRetrieverMemory and require vector store ([#145](https://github.com/davidmigloz/langchain_dart/issues/145)). ([67af3195](https://github.com/davidmigloz/langchain_dart/commit/67af319595755ec3c3834ceabaf4086cfa32ad8c))

#### `langchain_pinecone` - `v0.0.1`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))
 - **FEAT**: Add support for Pinecone VectorStore ([#37](https://github.com/davidmigloz/langchain_dart/issues/37)). ([e43eef97](https://github.com/davidmigloz/langchain_dart/commit/e43eef979c329fc72a3eed72d818992287838a80))

#### `langchain_google` - `v0.0.6`

 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `langchain_openai` - `v0.0.11`

 - **FEAT**: Add ability to specify user in OpenAI and ChatOpenAI ([#143](https://github.com/davidmigloz/langchain_dart/issues/143)). ([457ab54e](https://github.com/davidmigloz/langchain_dart/commit/457ab54e45afd5aa382e284806dc73cfe0905c09))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `langchain_chroma` - `v0.0.2`

 - **DOCS**: Update readme. ([e1b5b295](https://github.com/davidmigloz/langchain_dart/commit/e1b5b2958bdf2b787c8b49aeeb6690c33c225943))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `vertex_ai` - `v0.0.6`

 - **FIX**: typecast exception when null publicationDate ([#148](https://github.com/davidmigloz/langchain_dart/issues/148)). ([d4afc131](https://github.com/davidmigloz/langchain_dart/commit/d4afc1315f7fc041a7730346942891bb966f8d14))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

#### `chromadb` - `v0.0.2`

 - **REFACTOR**: Update generated Chroma API client ([#142](https://github.com/davidmigloz/langchain_dart/issues/142)). ([4f0e7379](https://github.com/davidmigloz/langchain_dart/commit/4f0e7379f4408fe03a6433e3bdb6ebbe2262cbbc))


## 2023-08-27

### Changes

---

Packages with changes:

- [`langchain` - `v0.0.10`](#langchain---v0010)
- [`langchain_google` - `v0.0.5`](#langchain_google---v005)
- [`langchain_openai` - `v0.0.10`](#langchain_openai---v0010)
- [`vertex_ai` - `v0.0.5`](#vertex_ai---v005)

New packages:

- [`langchain_chroma` - `v0.0.1`](#langchain_chroma---v001)
- [`chromadb` - `v0.0.1`](#chromadb---v001)

---

#### `langchain` - `v0.0.10`

- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_google` - `v0.0.5`

- **DOCS**: Fix typos. ([282cfa24](https://github.com/davidmigloz/langchain_dart/commit/282cfa24caa7b91ce28db6b1997af4c2c3ecf3e4))
- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_openai` - `v0.0.10`

- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `langchain_chroma` - `v0.0.1`

- **FEAT**: Add support for Chroma VectorStore ([#139](https://github.com/davidmigloz/langchain_dart/issues/139)). ([098783b4](https://github.com/davidmigloz/langchain_dart/commit/098783b4895ab30bb61d07355a0b587ff76b9175))

#### `vertex_ai` - `v0.0.5`

- **DOCS**: Fix typos. ([282cfa24](https://github.com/davidmigloz/langchain_dart/commit/282cfa24caa7b91ce28db6b1997af4c2c3ecf3e4))
- **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

#### `chromadb` - `v0.0.1`

- **FEAT**: Add Chroma embedding database API client ([#140](https://github.com/davidmigloz/langchain_dart/issues/140)). ([5fdcbc52](https://github.com/davidmigloz/langchain_dart/commit/5fdcbc528c1bbac1114a89433cf72bd8870fa4eb))


## 2023-08-23

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`langchain` - `v0.0.9`](#langchain---v009)
 - [`langchain_google` - `v0.0.4`](#langchain_google---v004)
 - [`langchain_openai` - `v0.0.9`](#langchain_openai---v009)
 - [`vertex_ai` - `v0.0.4`](#vertex_ai---v004)

---

#### `langchain` - `v0.0.9`

 - **FEAT**: Support filtering in MemoryVectorStore ([#137](https://github.com/davidmigloz/langchain_dart/issues/137)). ([84da480f](https://github.com/davidmigloz/langchain_dart/commit/84da480f6820a81f092756f0194deb77c4cda151))
 - **FEAT**: Support filtering in VertexAI Matching Engine ([#136](https://github.com/davidmigloz/langchain_dart/issues/136)). ([768c6987](https://github.com/davidmigloz/langchain_dart/commit/768c6987de5b36b60090a1fe94f49483da11b885))
 - **FEAT**: Allow to pass vector search config ([#135](https://github.com/davidmigloz/langchain_dart/issues/135)). ([5b8fa5a3](https://github.com/davidmigloz/langchain_dart/commit/5b8fa5a3fcaf785615016be1d5da0a003178cfa9))
 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))

#### `langchain_google` - `v0.0.4`

 - **FEAT**: Support filtering in VertexAI Matching Engine ([#136](https://github.com/davidmigloz/langchain_dart/issues/136)). ([768c6987](https://github.com/davidmigloz/langchain_dart/commit/768c6987de5b36b60090a1fe94f49483da11b885))
 - **FEAT**: Allow to pass vector search config ([#135](https://github.com/davidmigloz/langchain_dart/issues/135)). ([5b8fa5a3](https://github.com/davidmigloz/langchain_dart/commit/5b8fa5a3fcaf785615016be1d5da0a003178cfa9))
 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))

#### `langchain_openai` - `v0.0.9`

 - **DOCS**: Update changelog. ([b211ab47](https://github.com/davidmigloz/langchain_dart/commit/b211ab4739b8feb17d00089ecca548716766272d))

#### `vertex_ai` - `v0.0.4`

 - **DOCS**: Fix API documentation errors ([#138](https://github.com/davidmigloz/langchain_dart/issues/138)). ([1aa38fce](https://github.com/davidmigloz/langchain_dart/commit/1aa38fce17eed7f325e7872d03096740256d57be))


## 2023-08-20

### Changes

---

Packages with changes:

 - [`langchain_openai` - `v0.0.8+1`](#langchain_openai---v0081)

---

#### `langchain_openai` - `v0.0.8+1`

 - **FIX**: OpenAIFunctionsAgent wrong prompt order with no memory ([#134](https://github.com/davidmigloz/langchain_dart/issues/134)). ([8c9dcf22](https://github.com/davidmigloz/langchain_dart/commit/8c9dcf22e5fb0229bb98e5fd22492845d44bc531))


## 2023-08-19

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.8`](#langchain---v008)
 - [`langchain_google` - `v0.0.3`](#langchain_google---v003)
 - [`langchain_openai` - `v0.0.8`](#langchain_openai---v008)
 - [`vertex_ai` - `v0.0.3`](#vertex_ai---v003)

---

#### `langchain` - `v0.0.8`

 - **REFACTOR**: Rename store folder to chat_message_history ([#126](https://github.com/davidmigloz/langchain_dart/issues/126)). ([fa54c7e2](https://github.com/davidmigloz/langchain_dart/commit/fa54c7e22410182848b1936b64e85d9cf709eaeb))
 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))
 - **FEAT**: Add support for LocalFileStore ([#132](https://github.com/davidmigloz/langchain_dart/issues/132)). ([2c508dce](https://github.com/davidmigloz/langchain_dart/commit/2c508dcea4959dbe755ee713de43dc20c9680640))
 - **FEAT**: Add support for CacheBackedEmbeddings ([#131](https://github.com/davidmigloz/langchain_dart/issues/131)). ([27d8b777](https://github.com/davidmigloz/langchain_dart/commit/27d8b777b4da360e57f32de6e1e1fc09ea6b6333))
 - **FEAT**: Add FakeEmbeddings testing model ([#130](https://github.com/davidmigloz/langchain_dart/issues/130)). ([f06920d7](https://github.com/davidmigloz/langchain_dart/commit/f06920d792d1083876b040744213d78c9b11bd4c))
 - **FEAT**: Add support for EncoderBackedStore ([#129](https://github.com/davidmigloz/langchain_dart/issues/129)). ([85bb3191](https://github.com/davidmigloz/langchain_dart/commit/85bb31918308f7a956afd0f991a78cf65e6dcd8d))
 - **FEAT**: Add support for InMemoryStore ([#128](https://github.com/davidmigloz/langchain_dart/issues/128)). ([699c0904](https://github.com/davidmigloz/langchain_dart/commit/699c09045fec3f91666f7ee264525cec8b16f910))
 - **FEAT**: Add support for InMemoryDocStore ([#127](https://github.com/davidmigloz/langchain_dart/issues/127)). ([d9d7268d](https://github.com/davidmigloz/langchain_dart/commit/d9d7268ddcd9e346f67e1278127e25ee467ea99c))
 - **FEAT**: Initial vectors, ids, and delete in MemoryVectorStore ([#123](https://github.com/davidmigloz/langchain_dart/issues/123)). ([f87a738d](https://github.com/davidmigloz/langchain_dart/commit/f87a738d6e9c78aabcbd95014dd4fac2d6c58817))

#### `langchain_google` - `v0.0.3`

 - **FEAT**: Infeer queryRootUrl in VertexAIMatchingEngine ([#133](https://github.com/davidmigloz/langchain_dart/issues/133)). ([c5353368](https://github.com/davidmigloz/langchain_dart/commit/c5353368d1455756554f6640d33d0b3752476eb9))

#### `langchain_openai` - `v0.0.8`

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))

#### `vertex_ai` - `v0.0.3`

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.7+1`](#langchain---v0071)
 - [`langchain_openai` - `v0.0.7+1`](#langchain_openai---v0071)
 - [`langchain_google` - `v0.0.2+2`](#langchain_google---v0022)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `langchain_openai` - `v0.0.7+1`
 - `langchain_google` - `v0.0.2+2`

---

#### `langchain` - `v0.0.7+1`

 - **FIX**: Text splitters were not preserving docs IDs ([#122](https://github.com/davidmigloz/langchain_dart/issues/122)). ([a9d7f098](https://github.com/davidmigloz/langchain_dart/commit/a9d7f098e650329fe43f35e2f0e11a1f61778e4f))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain_google` - `v0.0.2+1`](#langchain_google---v0021)
 - [`vertex_ai` - `v0.0.2+1`](#vertex_ai---v0021)

---

#### `langchain_google` - `v0.0.2+1`

 - **DOCS**: Add VertexAI Matching Engine sample setup script ([#121](https://github.com/davidmigloz/langchain_dart/issues/121)). ([ed2e1549](https://github.com/davidmigloz/langchain_dart/commit/ed2e1549ca1d6bb0223231bcbe0c1c4a6a198402))

#### `vertex_ai` - `v0.0.2+1`

 - **FIX**: approximateNeighborsCount deserialization issue ([#120](https://github.com/davidmigloz/langchain_dart/issues/120)). ([f3381208](https://github.com/davidmigloz/langchain_dart/commit/f33812082191d3105d692f1d6bf461069df14750))
 - **DOCS**: Update readme. ([81f67c5e](https://github.com/davidmigloz/langchain_dart/commit/81f67c5e2f5963df9756d3245dd263b2060af173))


## 2023-08-16

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.7`](#langchain---v007)
 - [`langchain_google` - `v0.0.2`](#langchain_google---v002)
 - [`langchain_openai` - `v0.0.7`](#langchain_openai---v007)
 - [`vertex_ai` - `v0.0.2`](#vertex_ai---v002)

---

#### `langchain` - `v0.0.7`

 - **FEAT**: Integrate Vertex AI Matching Engine vector store ([#103](https://github.com/davidmigloz/langchain_dart/issues/103)). ([289c3eef](https://github.com/davidmigloz/langchain_dart/commit/289c3eef722206ac9dea0c968c036ad3289d10be))

#### `langchain_google` - `v0.0.2`

 - **FEAT**: Integrate Vertex AI Matching Engine vector store ([#103](https://github.com/davidmigloz/langchain_dart/issues/103)). ([289c3eef](https://github.com/davidmigloz/langchain_dart/commit/289c3eef722206ac9dea0c968c036ad3289d10be))

#### `langchain_openai` - `v0.0.7`

 - Updated `langchain` dependency

#### `vertex_ai` - `v0.0.2`

 - **FEAT**: Add GCP Vertex AI Matching Engine client ([#116](https://github.com/davidmigloz/langchain_dart/issues/116)). ([2c1bbfcc](https://github.com/davidmigloz/langchain_dart/commit/2c1bbfcca22a4ddfb40bcb28e8ec8cbca865a9a5))


## 2023-08-13

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.6`](#langchain---v006)
 - [`langchain_openai` - `v0.0.6`](#langchain_openai---v006)

New packages:

 - [`langchain_google` - `v0.0.1`](#langchain_google---v001)
 - [`vertex_ai` - `v0.0.1`](#vertex_ai---v001)

---

#### `langchain` - `v0.0.6`

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**: Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))
 - **FIX**: VectorStore k variable was ignored ([#110](https://github.com/davidmigloz/langchain_dart/issues/110)). ([80e61eb7](https://github.com/davidmigloz/langchain_dart/commit/80e61eb7a11757f4e541ce5ba6033fb11b1b01f0))

#### `langchain_openai` - `v0.0.6`

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**: Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))

#### `langchain_google` - `v0.0.1`

 - **FEAT**: Integrate Google Vertex AI PaLM Text model ([#98](https://github.com/davidmigloz/langchain_dart/issues/98)). ([b2746c23](https://github.com/davidmigloz/langchain_dart/commit/b2746c235d68045ba20afd1f2be7c24dcccb5f24))
 - **FEAT**: Integrate Google Vertex AI PaLM Chat Model ([#99](https://github.com/davidmigloz/langchain_dart/issues/99)). ([3897595d](https://github.com/davidmigloz/langchain_dart/commit/3897595db597d5957ef80ae7a1de35c5f41265b8))
 - **FEAT**: Integrate Google Vertex AI PaLM Embeddings ([#100](https://github.com/davidmigloz/langchain_dart/issues/100)). ([d777eccc](https://github.com/davidmigloz/langchain_dart/commit/d777eccc0c81c58b322f28e6e3c4a8763f3f84b7))

#### `vertex_ai` - `v0.0.1`

 - **REFACTOR**: Move Vertex AI client to its own package ([#111](https://github.com/davidmigloz/langchain_dart/issues/111)). ([d8aea156](https://github.com/davidmigloz/langchain_dart/commit/d8aea15633f1a9fb0df35cf9cc44bbc93ad46cd8))

## 2023-08-09

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.5+1`](#langchain---v0051)
 - [`langchain_openai` - `v0.0.5+1`](#langchain_openai---v0051)

---

#### `langchain` - `v0.0.5+1`

 - **FIX**: OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))
 - **DOCS**: Improve RetrievalQAChain API documentation ([#95](https://github.com/davidmigloz/langchain_dart/issues/95)). ([e6d0a9d3](https://github.com/davidmigloz/langchain_dart/commit/e6d0a9d3abd65704883452e50b40344428f9580d))

#### `langchain_openai` - `v0.0.5+1`

 - **FIX**: ChatOpenAIOptions class not exported ([#105](https://github.com/davidmigloz/langchain_dart/issues/105)). ([dfd77076](https://github.com/davidmigloz/langchain_dart/commit/dfd77076dfb60cd71aed3654f78c562ce0bc88bf))
 - **FIX**: OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))


## 2023-08-06

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.5`](#langchain---v005)
 - [`langchain_openai` - `v0.0.5`](#langchain_openai---v005)

---

#### `langchain` - `v0.0.5`

 - **FIX**: Suff and MapReduce docs chains don't handle chat messages ([#92](https://github.com/davidmigloz/langchain_dart/issues/92)). ([19182ca1](https://github.com/davidmigloz/langchain_dart/commit/19182ca1921e53fc2cb0fa61d96d602aacf830f3))
 - **FEAT**: Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **FEAT**: Add MessagePlaceholder ([#87](https://github.com/davidmigloz/langchain_dart/issues/87)). ([23ee95b6](https://github.com/davidmigloz/langchain_dart/commit/23ee95b6cb0bb15701a141adc41ee1b826684ad0))
 - **DOCS**: Update CONTRIBUTING.md. ([5f2b9264](https://github.com/davidmigloz/langchain_dart/commit/5f2b92641ae1f20fcc8803c977428b81e3f525bd))
 - **DOCS**: Fix typo in MessagePlaceholder API docs ([#90](https://github.com/davidmigloz/langchain_dart/issues/90)). ([f53e1a2b](https://github.com/davidmigloz/langchain_dart/commit/f53e1a2b9dc81c89a66a368758cfd1ec7df4c0f9))

#### `langchain_openai` - `v0.0.5`

 - **FIX**: FunctionChatMessage not saved properly in memory ([#88](https://github.com/davidmigloz/langchain_dart/issues/88)). ([d7b763de](https://github.com/davidmigloz/langchain_dart/commit/d7b763ded1abd59a964afd781558b3559a65d9ec))
 - **FEAT**: Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **DOCS**: Add example of using memory in OpenAIFunctionsAgent ([#91](https://github.com/davidmigloz/langchain_dart/issues/91)). ([898d5350](https://github.com/davidmigloz/langchain_dart/commit/898d53502713ec2fd1ecc93e76e7f941123b81a5))


## 2023-08-05

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.4`](#langchain---v004)
 - [`langchain_openai` - `v0.0.4`](#langchain_openai---v004)

---

#### `langchain` - `v0.0.4`

 - **REFACTOR**: Extract default memory key and prefixes to constants. ([750fd01a](https://github.com/davidmigloz/langchain_dart/commit/750fd01a74f94042cbc26684d6651b531fb0a93c))
 - **FIX**: systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FIX**: Allow to add memory to an agent executor ([#80](https://github.com/davidmigloz/langchain_dart/issues/80)). ([8110464c](https://github.com/davidmigloz/langchain_dart/commit/8110464c4b4ad53f3b1826722df76943d0d66621))
 - **FEAT**: Add ConversationSummaryMemory ([#27](https://github.com/davidmigloz/langchain_dart/issues/27)). ([f631d9e5](https://github.com/davidmigloz/langchain_dart/commit/f631d9e529d99319afe671b5aff441436e43ea31))
 - **FEAT**: Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**: Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))
 - **FEAT**: Add FakeChatModel for testing purposes. ([659783a6](https://github.com/davidmigloz/langchain_dart/commit/659783a6ccad9fc3046040f38c39805743ffdff1))
 - **FEAT**: Add support for ConversationTokenBufferMemory ([#26](https://github.com/davidmigloz/langchain_dart/issues/26)). ([8113d1c0](https://github.com/davidmigloz/langchain_dart/commit/8113d1c0dc742ce9f6c49018c4b012cd3823fac1))
 - **FEAT**: Improve SummarizeChain.mapReduce summaryMaxTokens name and docs. ([0be06e02](https://github.com/davidmigloz/langchain_dart/commit/0be06e02f280de54a2790d150fac142d9fbe4222))
 - **FEAT**: Add support for CsvLoader ([#77](https://github.com/davidmigloz/langchain_dart/issues/77)). ([41d24e76](https://github.com/davidmigloz/langchain_dart/commit/41d24e7632a77b08234951c0e6bf911530dff56a))
 - **FEAT**: Add ConversationBufferWindowMemory ([#25](https://github.com/davidmigloz/langchain_dart/issues/25)). ([9c271f7e](https://github.com/davidmigloz/langchain_dart/commit/9c271f7e7a31bc59c122a895daf238a0bb5ac7d0))

#### `langchain_openai` - `v0.0.4`

 - **FIX**: systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FEAT**: Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**: Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))


## 2023-07-28

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.3`](#langchain---v003)
 - [`langchain_openai` - `v0.0.3`](#langchain_openai---v003)

---

#### `langchain` - `v0.0.3`

 - **FIX**: Loaders tests. ([f0498300](https://github.com/davidmigloz/langchain_dart/commit/f049830057fc1b8ff315469afd1512aa13ceb459))
 - **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))
 - **FEAT**: Add support for VectorStoreRetrieverMemory ([#54](https://github.com/davidmigloz/langchain_dart/issues/54)). ([72cd1b10](https://github.com/davidmigloz/langchain_dart/commit/72cd1b100ad88e7213ec12d432674ec4666ce172))

#### `langchain_openai` - `v0.0.3`

 - **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))


## 2023-07-23

### Changes

---

Packages with changes:

 - [`langchain` - `v0.0.2`](#langchain---v002)
 - [`langchain_openai` - `v0.0.2`](#langchain_openai---v002)

---

#### `langchain` - `v0.0.2`

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Add support for SummarizeChain ([#58](https://github.com/davidmigloz/langchain_dart/issues/58)). ([9499fc04](https://github.com/davidmigloz/langchain_dart/commit/9499fc047ae8be7e7b9dfb0d0ef8678b84245f5d))
 - **FEAT**: Add support for SequentialChain class ([#30](https://github.com/davidmigloz/langchain_dart/issues/30)). ([381a6768](https://github.com/davidmigloz/langchain_dart/commit/381a676812992370da61ced0e59de5fadf0ef164))
 - **FEAT**: Add support for WebBaseLoader ([#74](https://github.com/davidmigloz/langchain_dart/issues/74)). ([0b5bf4b0](https://github.com/davidmigloz/langchain_dart/commit/0b5bf4b0fb2cf6e1a7be116920e9512233e7e613))
 - **FEAT**: Add Support for JsonLoader ([#72](https://github.com/davidmigloz/langchain_dart/issues/72)). ([2457a973](https://github.com/davidmigloz/langchain_dart/commit/2457a9735aacc2aeffcca2710ce0afc7be2f6f09))
 - **FEAT**: Add support for MapReduceDocumentsChain ([#59](https://github.com/davidmigloz/langchain_dart/issues/59)). ([9f2190c4](https://github.com/davidmigloz/langchain_dart/commit/9f2190c4d5f45378f91eaa02d52d8305f7da254e))
 - **FEAT**: Add support for ReduceDocumentsChain ([#70](https://github.com/davidmigloz/langchain_dart/issues/70)). ([34cf10bd](https://github.com/davidmigloz/langchain_dart/commit/34cf10bd485618bff4cddb5b29a1b46ac9f3a9fa))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))
 - **FEAT**: Add support for CodeTextSplitter ([#63](https://github.com/davidmigloz/langchain_dart/issues/63)). ([92a8c7da](https://github.com/davidmigloz/langchain_dart/commit/92a8c7daccda2be38a25d4bdb0235c2f397225a2))
 - **FEAT**: Add support for RecursiveCharacterTextSplitter ([#61](https://github.com/davidmigloz/langchain_dart/issues/61)). ([697cdcbf](https://github.com/davidmigloz/langchain_dart/commit/697cdcbfef8fc45930de127cb5b7ee2eb3d7ec37))
 - **DOCS**: Document sequential chain. ([b9693a4e](https://github.com/davidmigloz/langchain_dart/commit/b9693a4e2dfcc6bfc74025ebb935865be942b266))
 - **DOCS**: Document text, json and web loaders. ([a95b3e9f](https://github.com/davidmigloz/langchain_dart/commit/a95b3e9f843fcffce9449ea93f343df793512a09))
 - **DOCS**: Update API docs. ([7bfa6d17](https://github.com/davidmigloz/langchain_dart/commit/7bfa6d17cf57aac05906b1401ac3967c21e6f403))
 - **DOCS**: Update readme. ([dd394715](https://github.com/davidmigloz/langchain_dart/commit/dd39471557b37da0d0c2a87dea0c067463a45f45))

#### `langchain_openai` - `v0.0.2`

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))
