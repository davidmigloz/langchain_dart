## 0.6.0

> Note: This release has breaking changes.

 - **FIX**: Correct text content serialization in CreateMessageRequest ([#805](https://github.com/davidmigloz/langchain_dart/issues/805)). ([e4569c96](https://github.com/davidmigloz/langchain_dart/commit/e4569c96ede23223ca23711579d2415bd05b4e27))
 - **FIX**: Handle optional space after colon in SSE parser ([#779](https://github.com/davidmigloz/langchain_dart/issues/779)). ([9defa827](https://github.com/davidmigloz/langchain_dart/commit/9defa827ce145533a85ead2bccfc25f5fa069358))
 - **FEAT**: Add OpenRouter provider routing support ([#794](https://github.com/davidmigloz/langchain_dart/issues/794)). ([6d306bc1](https://github.com/davidmigloz/langchain_dart/commit/6d306bc1f8e8fda8dcf581ec993eea0c755f9433))
 - **FEAT**: Add OpenAI-compatible vendor reasoning content support ([#793](https://github.com/davidmigloz/langchain_dart/issues/793)). ([e0712c38](https://github.com/davidmigloz/langchain_dart/commit/e0712c3851377fae10a0b35606e1b5098abc575b))
 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

## 0.5.5

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

## 0.5.4+1

 - **FIX**: Change CreateChatCompletionRequest.verbosity default value to null ([#771](https://github.com/davidmigloz/langchain_dart/issues/771)). ([46d22905](https://github.com/davidmigloz/langchain_dart/commit/46d22905fee42dd7f1b149d676323d8bce57630f))

## 0.5.4

 - **FEAT**: Add gpt-5 to model catalog ([#758](https://github.com/davidmigloz/langchain_dart/issues/758)). ([f92c94ed](https://github.com/davidmigloz/langchain_dart/commit/f92c94ed799ab49e988f97880017f041522216a6))
 - **FEAT**: Add support for minimal reasoning effort ([#760](https://github.com/davidmigloz/langchain_dart/issues/760)). ([2ebc5506](https://github.com/davidmigloz/langchain_dart/commit/2ebc5506505e07f3d9b85ef60e1c54ed171a7480))
 - **FEAT**: Add Verbosity support ([#759](https://github.com/davidmigloz/langchain_dart/issues/759)). ([3894da76](https://github.com/davidmigloz/langchain_dart/commit/3894da76229bb0fd4a5124b68cd02e2996a6854a))

## 0.5.3

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.5.2

 - **FEAT**: Make Model.object/owned_by  fields nullable to support OpenRouter's OpenAI-compatible API ([#736](https://github.com/davidmigloz/langchain_dart/issues/736)). ([afa98b8c](https://github.com/davidmigloz/langchain_dart/commit/afa98b8c44c612126f2f6ee32d6aecdad41663b4))
 - **FEAT**: Make Model.created field nullable to support Google's OpenAI-compatible API ([#735](https://github.com/davidmigloz/langchain_dart/issues/735)). ([d617e49f](https://github.com/davidmigloz/langchain_dart/commit/d617e49f9d5760e2714d27d76cf699364e9cfe51))

## 0.5.1

 - **FEAT**: Make ToolCallChunk.index field nullable to support Gemini OpenAI-compatible API ([#733](https://github.com/davidmigloz/langchain_dart/issues/733)). ([19cb49c0](https://github.com/davidmigloz/langchain_dart/commit/19cb49c09e42204cc523fbbdd3941b3070146063))
 - **FEAT**: Make Embedding.index field nullable to support Gemini OpenAI-compatible API ([#729](https://github.com/davidmigloz/langchain_dart/issues/729)). ([9d22f197](https://github.com/davidmigloz/langchain_dart/commit/9d22f1972d99b8b1f6dbcfcb3f7bfba2257fca5b))

## 0.5.0

 - **BREAKING** **FEAT**: Align OpenAI API changes ([#706](https://github.com/davidmigloz/langchain_dart/issues/706)). ([b8b04ca6](https://github.com/davidmigloz/langchain_dart/commit/b8b04ca618ffbc6f84b935a89852767479da1611))
 - **FEAT**: Add support for web search, gpt-image-1 and list chat completions ([#716](https://github.com/davidmigloz/langchain_dart/issues/716)). ([269dea03](https://github.com/davidmigloz/langchain_dart/commit/269dea035be679c8d2fcc03f526703c76c72c5d4))
 - **FEAT**: Update OpenAI model catalog ([#714](https://github.com/davidmigloz/langchain_dart/issues/714)). ([68df4558](https://github.com/davidmigloz/langchain_dart/commit/68df4558a01e872c73ad465f4b85f1b5c61ddd50))
 - **FEAT**: Change the default value of 'reasoning_effort' from medium to null ([#713](https://github.com/davidmigloz/langchain_dart/issues/713)). ([f224572e](https://github.com/davidmigloz/langchain_dart/commit/f224572eff249daa1971a7f287c150ee3779a6b2))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **DOCS**: Fix TruncationObject docs typo. ([ee5ed4fd](https://github.com/davidmigloz/langchain_dart/commit/ee5ed4fdfdf4213ceec05d7a5a2b24cca95ae386))
 - **DOCS**: Document Azure Assistants API base url ([#626](https://github.com/davidmigloz/langchain_dart/issues/626)). ([c3459eea](https://github.com/davidmigloz/langchain_dart/commit/c3459eea354f36a11f69145a7313b3feda7a15eb))

## 0.4.5

 - **FEAT**: Support Predicted Outputs ([#613](https://github.com/davidmigloz/langchain_dart/issues/613)). ([315fe0fd](https://github.com/davidmigloz/langchain_dart/commit/315fe0fd3227e2c5a1a874be7fd01e25dcd7b33c))
 - **FEAT**: Support streaming audio responses in chat completions ([#615](https://github.com/davidmigloz/langchain_dart/issues/615)). ([6da756a8](https://github.com/davidmigloz/langchain_dart/commit/6da756a87be35a34048c6671f7629b553bf0699e))
 - **FEAT**: Add gpt-4o-2024-11-20 to model catalog ([#614](https://github.com/davidmigloz/langchain_dart/issues/614)). ([bf333081](https://github.com/davidmigloz/langchain_dart/commit/bf33308165869792446c3897db95e6ad7a7cb519))
 - **FIX**: Default store field to null to support Azure and Groq APIs ([#608](https://github.com/davidmigloz/langchain_dart/issues/608)). ([21332960](https://github.com/davidmigloz/langchain_dart/commit/21332960c2c9928873b5b2948b86af31245f9312))
 - **FIX**: Make first_id and last_id nullable in list endpoints ([#607](https://github.com/davidmigloz/langchain_dart/issues/607)). ([7cfc4ddf](https://github.com/davidmigloz/langchain_dart/commit/7cfc4ddf469846624d3dd6f3f86cab54c5333395))
 - **DOCS**: Update OpenAI endpoints descriptions ([#612](https://github.com/davidmigloz/langchain_dart/issues/612)). ([10c66888](https://github.com/davidmigloz/langchain_dart/commit/10c6688884f8bc42ddaa771996030a42125333de))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

## 0.4.4

 - **FEAT**: Add five new voice types to Chat Completions API ([#594](https://github.com/davidmigloz/langchain_dart/issues/594)). ([543f2977](https://github.com/davidmigloz/langchain_dart/commit/543f2977ea1e6dd6e49fa4a2ae9a084ae525003e))

## 0.4.3

 - **FEAT**: Add support for audio in chat completions ([#577](https://github.com/davidmigloz/langchain_dart/issues/577)). ([0fb058cd](https://github.com/davidmigloz/langchain_dart/commit/0fb058cd9215c83b0ec5a10c84b125bb44845bf5))
 - **FEAT**: Add support for storing outputs for model distillation and metadata ([#578](https://github.com/davidmigloz/langchain_dart/issues/578)). ([c9b8bdf4](https://github.com/davidmigloz/langchain_dart/commit/c9b8bdf425b809a5b94a314173b57a43cc3fbc88))
 - **FEAT**: Support multi-modal moderations ([#576](https://github.com/davidmigloz/langchain_dart/issues/576)). ([45b9f423](https://github.com/davidmigloz/langchain_dart/commit/45b9f423a0aef2a1f8cad4ddac73a6a7d8cd89d2))
 - **FIX**: submitThreadToolOutputsToRunStream not returning any events ([#574](https://github.com/davidmigloz/langchain_dart/issues/574)). ([00803ac7](https://github.com/davidmigloz/langchain_dart/commit/00803ac7aedabcbca4c75e3918a4cb441f9e7b84))
 - **DOCS**: Add xAI to list of OpenAI-compatible APIs ([#582](https://github.com/davidmigloz/langchain_dart/issues/582)). ([017cb74f](https://github.com/davidmigloz/langchain_dart/commit/017cb74fc0ca3510d07f9f02c1efade8d37aecac))
 - **DOCS**: Fix assistants API outdated documentation ([#579](https://github.com/davidmigloz/langchain_dart/issues/579)). ([624c4128](https://github.com/davidmigloz/langchain_dart/commit/624c41287a65904db5c91d19c4305bf377b6b339))

## 0.4.2+2

 - **DOCS**: Fix typo. ([e7ddd558](https://github.com/davidmigloz/langchain_dart/commit/e7ddd558da643e3cc59581b8b0e69473c7cb9779))

## 0.4.2+1

 - **DOCS**: Add note about the new [openai_realtime_dart](https://pub.dev/packages/openai_realtime_dart) client. ([44672f0a](https://github.com/davidmigloz/langchain_dart/commit/44672f0a453a1b2e1b31bc5ef400f4c8ac7a4e76))

## 0.4.2

 - **FEAT**: Add OpenAI o1-preview and o1-mini to model catalog ([#555](https://github.com/davidmigloz/langchain_dart/issues/555)). ([9ceb5ff9](https://github.com/davidmigloz/langchain_dart/commit/9ceb5ff9029cf1ae1967a32189f88c7a8215248e))
 - **FEAT**: Add support for maxCompletionTokens and reasoningTokens ([#556](https://github.com/davidmigloz/langchain_dart/issues/556)). ([37d75b61](https://github.com/davidmigloz/langchain_dart/commit/37d75b612b0f42bbf8d092bdd81c554278716582))
 - **FEAT**: Option to include file search results in assistants API ([#543](https://github.com/davidmigloz/langchain_dart/issues/543)). ([e916ad3c](https://github.com/davidmigloz/langchain_dart/commit/e916ad3c0c4e322319cedac8b06b5908f1c31935))

## 0.4.1

 - **FEAT**: Add support for Structured Outputs ([#525](https://github.com/davidmigloz/langchain_dart/issues/525)). ([c7574077](https://github.com/davidmigloz/langchain_dart/commit/c7574077195acfc96e9ca9d526cc050788c23c1d))
 - **FEAT**: Add log probabilities for refusal tokens ([#534](https://github.com/davidmigloz/langchain_dart/issues/534)). ([8470a24c](https://github.com/davidmigloz/langchain_dart/commit/8470a24cc42042e20ffffa4b67bc831e03efbc6c))
 - **FEAT**: Add gpt-4o-2024-08-06 to model catalog ([#522](https://github.com/davidmigloz/langchain_dart/issues/522)). ([563200e0](https://github.com/davidmigloz/langchain_dart/commit/563200e0bb9d021d9cb3e46e7a77d96cf3860b1c))
 - **FEAT**: Add chatgpt-4o-latest to model catalog ([#527](https://github.com/davidmigloz/langchain_dart/issues/527)). ([ec82c760](https://github.com/davidmigloz/langchain_dart/commit/ec82c760582eed123d6e5d3287c24f82ac251df7))

## 0.4.0

 - **FEAT**: Add support for disabling parallel tool calls ([#492](https://github.com/davidmigloz/langchain_dart/issues/492)). ([a91e0719](https://github.com/davidmigloz/langchain_dart/commit/a91e07196278ae4da5917d52395f3c246fc35bf2))
 - **FEAT**: Add GPT-4o-mini to model catalog ([#497](https://github.com/davidmigloz/langchain_dart/issues/497)). ([faa23aee](https://github.com/davidmigloz/langchain_dart/commit/faa23aeeecfb64dc7d018e642952e41cc7f9eeaf))
 - **FEAT**: Support chunking strategy in file_search tool ([#496](https://github.com/davidmigloz/langchain_dart/issues/496)). ([cfa974a9](https://github.com/davidmigloz/langchain_dart/commit/cfa974a9e2fc4b79e5b66765b22d76710575d5bc))
 - **FEAT**: Add support for overrides in the file search tool ([#491](https://github.com/davidmigloz/langchain_dart/issues/491)). ([89605638](https://github.com/davidmigloz/langchain_dart/commit/89605638c465be37c2738258d840c21d32fe9554))
 - **FEAT**: Allow to customize OpenAI-Beta header ([#502](https://github.com/davidmigloz/langchain_dart/issues/502)). ([5fed8dbb](https://github.com/davidmigloz/langchain_dart/commit/5fed8dbb8205ba7925ca59d6f07a4f5e052b52b1))
 - **FEAT**: Add support for service tier ([#494](https://github.com/davidmigloz/langchain_dart/issues/494)). ([0838e4b9](https://github.com/davidmigloz/langchain_dart/commit/0838e4b9f5bb25e29fbc163a0ff5cf3e64409d40))

## 0.3.3+1

 - **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

## 0.3.3

 - **FEAT**: Support FastChat OpenAI-compatible API ([#444](https://github.com/davidmigloz/langchain_dart/issues/444)). ([ddaf1f69](https://github.com/davidmigloz/langchain_dart/commit/ddaf1f69d8262210637999367690bf362f2dc5c3))
 - **FIX**: Make vector store name optional ([#436](https://github.com/davidmigloz/langchain_dart/issues/436)). ([29a46c7f](https://github.com/davidmigloz/langchain_dart/commit/29a46c7fa645439e8f4acc10a16da904e7cf14ff))
 - **FIX**: Fix deserialization of sealed classes ([#435](https://github.com/davidmigloz/langchain_dart/issues/435)). ([7b9cf223](https://github.com/davidmigloz/langchain_dart/commit/7b9cf223e42eae8496f864ad7ef2f8d0dca45678))

## 0.3.2+1

 - **FIX**: Rename CreateRunRequestModel factories names ([#429](https://github.com/davidmigloz/langchain_dart/issues/429)). ([fd15793b](https://github.com/davidmigloz/langchain_dart/commit/fd15793b3c4ac94dfc90567b4a709e1458f4e0e8))
 - **FIX**: Make quote nullable in MessageContentTextAnnotationsFileCitation ([#428](https://github.com/davidmigloz/langchain_dart/issues/428)). ([75b95645](https://github.com/davidmigloz/langchain_dart/commit/75b95645a58d51b369a01e261393e17f7463e1f5))

## 0.3.2

 - **FEAT**: Add GPT-4o to model catalog ([#420](https://github.com/davidmigloz/langchain_dart/issues/420)). ([96214307](https://github.com/davidmigloz/langchain_dart/commit/96214307ec8ae045dade687d4c623bd4dc1be896))
 - **FEAT**: Add support for different content types in Assistants API and other fixes ([#412](https://github.com/davidmigloz/langchain_dart/issues/412)). ([97acab45](https://github.com/davidmigloz/langchain_dart/commit/97acab45a5770422c666795ad3443c083fa08895))
 - **FEAT**: Add support for completions and embeddings in batch API ([#425](https://github.com/davidmigloz/langchain_dart/issues/425)). ([16fe4c68](https://github.com/davidmigloz/langchain_dart/commit/16fe4c6814a828fb0d271a6793598f8369da259d))
 - **FEAT**: Add incomplete status to RunObject ([#424](https://github.com/davidmigloz/langchain_dart/issues/424)). ([71b116e6](https://github.com/davidmigloz/langchain_dart/commit/71b116e6252a9dce5a92e979164e0af8fe96efc3))

## 0.3.1

 - **FEAT**: Add support for stream_options ([#405](https://github.com/davidmigloz/langchain_dart/issues/405)). ([c15714ca](https://github.com/davidmigloz/langchain_dart/commit/c15714ca2df9e30873bc8e4901482faa2d858d8a))
 - **FIX**: RunStepDetailsToolCalls deserialization in Assistants API v2 ([#404](https://github.com/davidmigloz/langchain_dart/issues/404)). ([d76c6aba](https://github.com/davidmigloz/langchain_dart/commit/d76c6aba321e666940614cbc90726500aa370c87))

## 0.3.0

> Note: This release has breaking changes.  
> If you are using the Assistants API v1, please refer to the [OpenAI docs](https://platform.openai.com/docs/api-reference/assistants) to see how to migrate to v2.

 - **BREAKING** **FEAT**: Migrate OpenAI Assistants API to v2 and add support for vector stores ([#402](https://github.com/davidmigloz/langchain_dart/issues/402)). ([45de29a1](https://github.com/davidmigloz/langchain_dart/commit/45de29a1957caf2ef05c91e4c99144a4e73ceb91))
 - **FEAT**: Add support for `ChatCompletionToolChoiceMode.required` ([#402](https://github.com/davidmigloz/langchain_dart/issues/402)). ([45de29a1](https://github.com/davidmigloz/langchain_dart/commit/45de29a1957caf2ef05c91e4c99144a4e73ceb91))

## 0.2.2

 - **FEAT**: Add temperature, top_p and response format to Assistants API ([#384](https://github.com/davidmigloz/langchain_dart/issues/384)). ([1d18290f](https://github.com/davidmigloz/langchain_dart/commit/1d18290fdaba558e8661fed4f2316c795f20aef8))

## 0.2.1

 - **FEAT**: Support for Batch API ([#383](https://github.com/davidmigloz/langchain_dart/issues/383)). ([6b89f4a2](https://github.com/davidmigloz/langchain_dart/commit/6b89f4a269417441df844545ab670fa67701e7b4))
 - **FEAT**: Streaming support for Assistant API ([#379](https://github.com/davidmigloz/langchain_dart/issues/379)). ([6ef68196](https://github.com/davidmigloz/langchain_dart/commit/6ef68196fbfff233b37eda8f3d1b1d373252613f))
 - **FEAT**: Option to specify tool choice in Assistant API ([#382](https://github.com/davidmigloz/langchain_dart/issues/382)). ([97d7977a](https://github.com/davidmigloz/langchain_dart/commit/97d7977a2666ed004c0e04d57114538e02849156))
 - **FEAT**: JSON mode in Assistant API ([#381](https://github.com/davidmigloz/langchain_dart/issues/381)). ([a864dae3](https://github.com/davidmigloz/langchain_dart/commit/a864dae3d38f49f83975012ecadec5b859dc43c2))
 - **FEAT**: Max tokens and truncation strategy in Assistant API ([#380](https://github.com/davidmigloz/langchain_dart/issues/380)). ([7153167b](https://github.com/davidmigloz/langchain_dart/commit/7153167b550549155cf7f68af2292d24036fc9f2))
 - **FEAT**: Updated models catalog with GPT-4 Turbo with Vision ([#378](https://github.com/davidmigloz/langchain_dart/issues/378)). ([88537540](https://github.com/davidmigloz/langchain_dart/commit/88537540fbab3cd20fd611447519bbdfed950ebe))
 - **FEAT**: Weights & Biases integration for fine-tuning and seed options ([#377](https://github.com/davidmigloz/langchain_dart/issues/377)). ([a5fff1bf](https://github.com/davidmigloz/langchain_dart/commit/a5fff1bf6ec8cc258174f1e7bcf12c00b7201e0e))
 - **FEAT**: Support for checkpoints in fine-tuning jobs ([#376](https://github.com/davidmigloz/langchain_dart/issues/376)). ([69f8e2f9](https://github.com/davidmigloz/langchain_dart/commit/69f8e2f9137a92683a9eec79f2de1ad03452244a))

## 0.2.0

 - **FEAT**: Sync OpenAI API ([#347](https://github.com/davidmigloz/langchain_dart/issues/347)). ([f296eef6](https://github.com/davidmigloz/langchain_dart/commit/f296eef68bfd81305f87475c802705fe3ef477c3))
 - **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

## 0.1.7

 - **FEAT**: Allow to specify OpenAI custom instance ([#327](https://github.com/davidmigloz/langchain_dart/issues/327)). ([4744648c](https://github.com/davidmigloz/langchain_dart/commit/4744648cdf02828b9182ebd34ba3d7db5313786e))
 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
 - **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 0.1.6+1

 - **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.1.6

 - **FEAT**: Add `gpt-4-0125-preview` and `gpt-4-turbo-preview` in model catalog ([#309](https://github.com/davidmigloz/langchain_dart/issues/309)). ([f5a78867](https://github.com/davidmigloz/langchain_dart/commit/f5a78867e7fa61e03d7e7da101c939c38564454c))
 - **FEAT**: Add `text-embedding-3-small` and `text-embedding-3-large` in model catalog ([#310](https://github.com/davidmigloz/langchain_dart/issues/310)). ([fda16024](https://github.com/davidmigloz/langchain_dart/commit/fda16024daa0b2b12999e628efe11d305d1abf4d))
 - **FEAT**: Add support for shortening embeddings ([#311](https://github.com/davidmigloz/langchain_dart/issues/311)). ([c725db0b](https://github.com/davidmigloz/langchain_dart/commit/c725db0b07b41bee0f12981f956ed0f3cb3d73eb))

## 0.1.5

 - **FEAT**: Support Anyscale API client ([#303](https://github.com/davidmigloz/langchain_dart/issues/303)). ([e0a3651c](https://github.com/davidmigloz/langchain_dart/commit/e0a3651c1457065808e1306c7f498eb716159583))
 - **FEAT**: Support Together AI API ([#296](https://github.com/davidmigloz/langchain_dart/issues/296)). ([ca6f23d5](https://github.com/davidmigloz/langchain_dart/commit/ca6f23d53baebe8679b4bc67a7de9a705692dde3))
 - **FEAT**: Support Together AI Embeddings API client ([#301](https://github.com/davidmigloz/langchain_dart/issues/301)). ([4a6e1045](https://github.com/davidmigloz/langchain_dart/commit/4a6e1045c13d712ec4da992dcaa097a7b5c2a626))
 - **FEAT**: Add usage to Run/RunStep client ([#302](https://github.com/davidmigloz/langchain_dart/issues/302)). ([cc6538b5](https://github.com/davidmigloz/langchain_dart/commit/cc6538b53394d04084276d8687ec5d7cbb5b5506))

## 0.1.4

 - **FEAT**: Support OpenRouter API ([#292](https://github.com/davidmigloz/langchain_dart/issues/292)). ([57699b32](https://github.com/davidmigloz/langchain_dart/commit/57699b328ee280bf9ac394d60013d6c2e969ab41))
 - **FEAT**: Remove OpenAI deprecated models ([#290](https://github.com/davidmigloz/langchain_dart/issues/290)). ([893b1c51](https://github.com/davidmigloz/langchain_dart/commit/893b1c51abe0fff7955cac6d3cedaa85ccdbf3eb))

## 0.1.3

 - **FEAT**: Add support for Assistants API ([#278](https://github.com/davidmigloz/langchain_dart/issues/278)). ([06de2d5e](https://github.com/davidmigloz/langchain_dart/commit/06de2d5e541aa79f8d54a8f9a33338c6a6edae3c))

## 0.1.2+1

 - **FIX**: Make `ChatCompletionNamedToolChoice` fields required ([#259](https://github.com/davidmigloz/langchain_dart/issues/259)). ([4c7d0436](https://github.com/davidmigloz/langchain_dart/commit/4c7d0436070ede83369b9a667ca4c6d2cac99f1a))

## 0.1.2

 - **FEAT**: Allow to update OpenAI key without having to recreate the wrapper ([#246](https://github.com/davidmigloz/langchain_dart/issues/246)). ([05739bd1](https://github.com/davidmigloz/langchain_dart/commit/05739bd1a43a82e1e5ba24543ccc985d48d48286))

## 0.1.1+2

 - **FIX**: Decode JSON responses as UTF-8 ([#234](https://github.com/davidmigloz/langchain_dart/issues/234)). ([0bca67f4](https://github.com/davidmigloz/langchain_dart/commit/0bca67f4ea682ebd5a8b9d3c7319c9511229b0ba))

## 0.1.1+1

 - **FIX**: Fetch requests with big payloads dropping connection ([#226](https://github.com/davidmigloz/langchain_dart/issues/226)). ([1e771098](https://github.com/davidmigloz/langchain_dart/commit/1e771098d1090dd79846fca6520a1195efc5ac1e))

## 0.1.1

 - **FEAT**: Add Azure OpenAI API support ([#224](https://github.com/davidmigloz/langchain_dart/issues/224)). ([333fb7af](https://github.com/davidmigloz/langchain_dart/commit/333fb7af4b1edbdc716221609f2dc8f3923822cf))

## 0.1.0+1

 - **FIX**: Add missing `name` param in ChatCompletionMessage ([#222](https://github.com/davidmigloz/langchain_dart/issues/222)). ([6f186775](https://github.com/davidmigloz/langchain_dart/commit/6f186775f67cf3db5e28e4a15f896927b9af50ce))
 - **FIX**: Remove dependency on io.HttpException ([#221](https://github.com/davidmigloz/langchain_dart/issues/221)). ([95369e4c](https://github.com/davidmigloz/langchain_dart/commit/95369e4c1a9b8f277390b612df7d9bb21c19d82f))
 - **DOCS**: Add `public_member_api_docs` lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

## 0.1.0

> Note: This release has breaking changes.
> Migration guides: [new factories](https://github.com/davidmigloz/langchain_dart/issues/215) and [multi-modal](https://github.com/davidmigloz/langchain_dart/issues/218)

 - **BREAKING** **FEAT**: Add multi-modal support ([#218](https://github.com/davidmigloz/langchain_dart/issues/218)). ([14c8e7ef](https://github.com/davidmigloz/langchain_dart/commit/14c8e7ef7194400057d40422822df1127c4cb131))
 - **BREAKING** **FEAT**: Rename factory const to more meaningful names ([#215](https://github.com/davidmigloz/langchain_dart/issues/215)). ([7e4602fa](https://github.com/davidmigloz/langchain_dart/commit/7e4602fa86c55bd6d82a0aac253b1165afa21aeb))
 - **FEAT**: Add `gpt-3.5-turbo-1106` chat model ([#217](https://github.com/davidmigloz/langchain_dart/issues/217)). ([73f37915](https://github.com/davidmigloz/langchain_dart/commit/73f37915e99d83bd458f8f8500385a24a64d3948))
 - **REFACTOR**: Improve request error handling ([#214](https://github.com/davidmigloz/langchain_dart/issues/214)). ([4a9f3d33](https://github.com/davidmigloz/langchain_dart/commit/4a9f3d335124526438651149e5b91c07921617a2))

## 0.0.2+2

 - **REFACTOR**: Migrate to generated client stream methods ([#208](https://github.com/davidmigloz/langchain_dart/issues/208)). ([9122f551](https://github.com/davidmigloz/langchain_dart/commit/9122f5517bb12a9596d22acfa6e81251f6d9afe8))
 - **FIX**: Fix integer overflow when targeting web ([#207](https://github.com/davidmigloz/langchain_dart/issues/207)). ([eaf69f32](https://github.com/davidmigloz/langchain_dart/commit/eaf69f32266abe4c8a4c99502fe9b1be2029d7d1))

## 0.0.2+1

 - **REFACTOR**: Rename `ChatCompletionFunction` to `FunctionObject` ([#206](https://github.com/davidmigloz/langchain_dart/issues/206)). ([0f06df3f](https://github.com/davidmigloz/langchain_dart/commit/0f06df3f9b32e5887976936b5fd2e6aa5a4f4f5b))

## 0.0.2

 - **FEAT**: Support new models API functionality ([#203](https://github.com/davidmigloz/langchain_dart/issues/203)). ([33ebe746](https://github.com/davidmigloz/langchain_dart/commit/33ebe746b509009ba41e417f36abf267d9d1c2ca))
 - **FEAT**: Support new images API functionality ([#202](https://github.com/davidmigloz/langchain_dart/issues/202)). ([fcf21daf](https://github.com/davidmigloz/langchain_dart/commit/fcf21dafbbdf4b1598ed8ddbfe30ebd09da65ada))
 - **FEAT**: Support new fine-tuning API functionality ([#201](https://github.com/davidmigloz/langchain_dart/issues/201)). ([f5f44ad8](https://github.com/davidmigloz/langchain_dart/commit/f5f44ad831c87c71ad995567748546b82ee231a4))
 - **FEAT**: Support new embeddings API functionality ([#200](https://github.com/davidmigloz/langchain_dart/issues/200)). ([9b43d85b](https://github.com/davidmigloz/langchain_dart/commit/9b43d85b63ddf916c38e7c5d7c65d5be32fa3015))
 - **FEAT**: Support new completion API functionality ([#199](https://github.com/davidmigloz/langchain_dart/issues/199)). ([f12f6f57](https://github.com/davidmigloz/langchain_dart/commit/f12f6f577c0e74db6160101796522c8786c4f37e))
 - **FEAT**: Support new chat completion API functionality ([#198](https://github.com/davidmigloz/langchain_dart/issues/198)). ([01820d69](https://github.com/davidmigloz/langchain_dart/commit/01820d697c9ffac09f77d2a16a5db6b5e6ed6fc6))
 - **FIX**: Handle nullable function call fields when streaming ([#191](https://github.com/davidmigloz/langchain_dart/issues/191)). ([8f23cf16](https://github.com/davidmigloz/langchain_dart/commit/8f23cf16c96f73d69a2abf17f2142b7eb4922a73))

## 0.0.1

 - **FIX**: Fix static analysis warning ([#187](https://github.com/davidmigloz/langchain_dart/issues/187)). ([3fe91570](https://github.com/davidmigloz/langchain_dart/commit/3fe915705ca5a8b335333fa5ea94260040aaf0db))
 - **FIX**: Several fixes and improvements ([#182](https://github.com/davidmigloz/langchain_dart/issues/182)). ([115e8bef](https://github.com/davidmigloz/langchain_dart/commit/115e8bef43c82d907ce94518fa382657a1237fcc))
 - **FEAT**: Support different embedding response formats ([#180](https://github.com/davidmigloz/langchain_dart/issues/180)). ([4f676e87](https://github.com/davidmigloz/langchain_dart/commit/4f676e875f05a837343792c976701fa0cda0076e))
 - **FEAT**: Implement openai_dart, a Dart client for OpenAI API ([#178](https://github.com/davidmigloz/langchain_dart/issues/178)). ([fa5d032a](https://github.com/davidmigloz/langchain_dart/commit/fa5d032a6225933a79d4ff039732d893156ac92d))

## 0.0.1-dev.1

- Bootstrap project
