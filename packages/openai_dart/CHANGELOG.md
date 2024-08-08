📣 Check out the [#announcements](https://discord.com/channels/1123158322812555295/1123250594644242534) channel in the [LangChain.dart Discord](https://discord.gg/x4qbhqecVR) server for more details.

## 0.4.0

 - **FEAT**: Add support for disabling parallel tool calls in openai_dart ([#492](https://github.com/davidmigloz/langchain_dart/issues/492)). ([a91e0719](https://github.com/davidmigloz/langchain_dart/commit/a91e07196278ae4da5917d52395f3c246fc35bf2))
 - **FEAT**: Add GPT-4o-mini to model catalog ([#497](https://github.com/davidmigloz/langchain_dart/issues/497)). ([faa23aee](https://github.com/davidmigloz/langchain_dart/commit/faa23aeeecfb64dc7d018e642952e41cc7f9eeaf))
 - **FEAT**: Support chunking strategy in file_search tool in openai_dart ([#496](https://github.com/davidmigloz/langchain_dart/issues/496)). ([cfa974a9](https://github.com/davidmigloz/langchain_dart/commit/cfa974a9e2fc4b79e5b66765b22d76710575d5bc))
 - **FEAT**: Add support for overrides in the file search tool in openai_dart ([#491](https://github.com/davidmigloz/langchain_dart/issues/491)). ([89605638](https://github.com/davidmigloz/langchain_dart/commit/89605638c465be37c2738258d840c21d32fe9554))
 - **FEAT**: Allow to customize OpenAI-Beta header in openai_dart ([#502](https://github.com/davidmigloz/langchain_dart/issues/502)). ([5fed8dbb](https://github.com/davidmigloz/langchain_dart/commit/5fed8dbb8205ba7925ca59d6f07a4f5e052b52b1))
 - **FEAT**: Add support for service tier in openai_dart ([#494](https://github.com/davidmigloz/langchain_dart/issues/494)). ([0838e4b9](https://github.com/davidmigloz/langchain_dart/commit/0838e4b9f5bb25e29fbc163a0ff5cf3e64409d40))

## 0.3.3+1

 - **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

## 0.3.3

 - **FEAT**: Support FastChat OpenAI-compatible API ([#444](https://github.com/davidmigloz/langchain_dart/issues/444)). ([ddaf1f69](https://github.com/davidmigloz/langchain_dart/commit/ddaf1f69d8262210637999367690bf362f2dc5c3))
 - **FIX**: Make vector store name optional in openai_dart ([#436](https://github.com/davidmigloz/langchain_dart/issues/436)). ([29a46c7f](https://github.com/davidmigloz/langchain_dart/commit/29a46c7fa645439e8f4acc10a16da904e7cf14ff))
 - **FIX**: Fix deserialization of sealed classes ([#435](https://github.com/davidmigloz/langchain_dart/issues/435)). ([7b9cf223](https://github.com/davidmigloz/langchain_dart/commit/7b9cf223e42eae8496f864ad7ef2f8d0dca45678))

## 0.3.2+1

 - **FIX**: Rename CreateRunRequestModel factories names ([#429](https://github.com/davidmigloz/langchain_dart/issues/429)). ([fd15793b](https://github.com/davidmigloz/langchain_dart/commit/fd15793b3c4ac94dfc90567b4a709e1458f4e0e8))
 - **FIX**: Make quote nullable in MessageContentTextAnnotationsFileCitation ([#428](https://github.com/davidmigloz/langchain_dart/issues/428)). ([75b95645](https://github.com/davidmigloz/langchain_dart/commit/75b95645a58d51b369a01e261393e17f7463e1f5))

## 0.3.2

 - **FEAT**: Add GPT-4o to model catalog ([#420](https://github.com/davidmigloz/langchain_dart/issues/420)). ([96214307](https://github.com/davidmigloz/langchain_dart/commit/96214307ec8ae045dade687d4c623bd4dc1be896))
 - **FEAT**: Add support for different content types in Assistants API and other fixes ([#412](https://github.com/davidmigloz/langchain_dart/issues/412)). ([97acab45](https://github.com/davidmigloz/langchain_dart/commit/97acab45a5770422c666795ad3443c083fa08895))
 - **FEAT**: Add support for completions and embeddings in batch API in openai_dart ([#425](https://github.com/davidmigloz/langchain_dart/issues/425)). ([16fe4c68](https://github.com/davidmigloz/langchain_dart/commit/16fe4c6814a828fb0d271a6793598f8369da259d))
 - **FEAT**: Add incomplete status to RunObject in openai_dart ([#424](https://github.com/davidmigloz/langchain_dart/issues/424)). ([71b116e6](https://github.com/davidmigloz/langchain_dart/commit/71b116e6252a9dce5a92e979164e0af8fe96efc3))

## 0.3.1

 - **FEAT**: Add support for stream_options in openai_dart ([#405](https://github.com/davidmigloz/langchain_dart/issues/405)). ([c15714ca](https://github.com/davidmigloz/langchain_dart/commit/c15714ca2df9e30873bc8e4901482faa2d858d8a))
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

 - **FEAT**: Support Anyscale API in openai_dart client ([#303](https://github.com/davidmigloz/langchain_dart/issues/303)). ([e0a3651c](https://github.com/davidmigloz/langchain_dart/commit/e0a3651c1457065808e1306c7f498eb716159583))
 - **FEAT**: Support Together AI API ([#296](https://github.com/davidmigloz/langchain_dart/issues/296)). ([ca6f23d5](https://github.com/davidmigloz/langchain_dart/commit/ca6f23d53baebe8679b4bc67a7de9a705692dde3))
 - **FEAT**: Support Together AI Embeddings API in openai_dart client ([#301](https://github.com/davidmigloz/langchain_dart/issues/301)). ([4a6e1045](https://github.com/davidmigloz/langchain_dart/commit/4a6e1045c13d712ec4da992dcaa097a7b5c2a626))
 - **FEAT**: Add usage to Run/RunStep in openai_dart client ([#302](https://github.com/davidmigloz/langchain_dart/issues/302)). ([cc6538b5](https://github.com/davidmigloz/langchain_dart/commit/cc6538b53394d04084276d8687ec5d7cbb5b5506))

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
