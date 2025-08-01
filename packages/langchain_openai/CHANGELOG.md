## 0.7.5

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.7.4+2

 - Update a dependency to the latest release.

## 0.7.4+1

 - Update a dependency to the latest release.

## 0.7.4

 - **FEAT**: Update OpenAI model catalog ([#714](https://github.com/davidmigloz/langchain_dart/issues/714)). ([68df4558](https://github.com/davidmigloz/langchain_dart/commit/68df4558a01e872c73ad465f4b85f1b5c61ddd50))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

## 0.7.3

 - **FEAT**: Add gpt-4o-2024-11-20 to model catalog in openai_dart ([#614](https://github.com/davidmigloz/langchain_dart/issues/614)). ([bf333081](https://github.com/davidmigloz/langchain_dart/commit/bf33308165869792446c3897db95e6ad7a7cb519))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

## 0.7.2+5

 - Update a dependency to the latest release.

## 0.7.2+4

 - Update a dependency to the latest release.

## 0.7.2+3

 - Update a dependency to the latest release.

## 0.7.2+2

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

## 0.7.2+1

 - Update a dependency to the latest release.

## 0.7.2

 - **FEAT**: Add OpenAI o1-preview and o1-mini to model catalog ([#555](https://github.com/davidmigloz/langchain_dart/issues/555)). ([9ceb5ff9](https://github.com/davidmigloz/langchain_dart/commit/9ceb5ff9029cf1ae1967a32189f88c7a8215248e))
 - **REFACTOR**: Migrate ChatOpenAI to maxCompletionTokens ([#557](https://github.com/davidmigloz/langchain_dart/issues/557)). ([08057a5b](https://github.com/davidmigloz/langchain_dart/commit/08057a5b6e08ee2633c6be6144be1619e902bbc5))

## 0.7.1

 - **FEAT**: Add support for Structured Outputs in ChatOpenAI ([#526](https://github.com/davidmigloz/langchain_dart/issues/526)). ([c5387b5d](https://github.com/davidmigloz/langchain_dart/commit/c5387b5dd87fe2aac511c4eca2d4a497065db61f))
 - **FEAT**: Handle refusal in OpenAI's Structured Outputs API ([#533](https://github.com/davidmigloz/langchain_dart/issues/533)). ([f4c4ed99](https://github.com/davidmigloz/langchain_dart/commit/f4c4ed9902177560f13fa9f44b07f0a49c3fdf0a))
 - **FEAT**: Include logprobs in result metadata from ChatOpenAI ([#535](https://github.com/davidmigloz/langchain_dart/issues/535)). ([1834b3ad](https://github.com/davidmigloz/langchain_dart/commit/1834b3adb210b7d190a7e0574a304f069813486b))
 - **FEAT**: Add chatgpt-4o-latest to model catalog ([#527](https://github.com/davidmigloz/langchain_dart/issues/527)). ([ec82c760](https://github.com/davidmigloz/langchain_dart/commit/ec82c760582eed123d6e5d3287c24f82ac251df7))
 - **FEAT**: Add gpt-4o-2024-08-06 to model catalog ([#522](https://github.com/davidmigloz/langchain_dart/issues/522)). ([563200e0](https://github.com/davidmigloz/langchain_dart/commit/563200e0bb9d021d9cb3e46e7a77d96cf3860b1c))
 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))
 - **REFACTOR**: Don't send OpenAI-Beta header in ChatOpenAI ([#511](https://github.com/davidmigloz/langchain_dart/issues/511)). ([0e532bab](https://github.com/davidmigloz/langchain_dart/commit/0e532bab84483bf9d77a0d745f1a591eea2ff7c8))

## 0.7.0

 - **BREAKING** **FEAT**: Update ChatOpenAI default model to gpt-4o-mini ([#507](https://github.com/davidmigloz/langchain_dart/issues/507)). ([c7b8ce91](https://github.com/davidmigloz/langchain_dart/commit/c7b8ce91ac5b4dbe6bed563fae124a9f5ad76a84))
 - **FEAT**: Add support for disabling parallel tool calls in ChatOpenAI ([#493](https://github.com/davidmigloz/langchain_dart/issues/493)). ([c46d676d](https://github.com/davidmigloz/langchain_dart/commit/c46d676dee836f1d17e0d1fd61a8f1f0ba5c2881))
 - **FEAT**: Add GPT-4o-mini to model catalog ([#497](https://github.com/davidmigloz/langchain_dart/issues/497)). ([faa23aee](https://github.com/davidmigloz/langchain_dart/commit/faa23aeeecfb64dc7d018e642952e41cc7f9eeaf))
 - **FEAT**: Add support for service tier in ChatOpenAI ([#495](https://github.com/davidmigloz/langchain_dart/issues/495)). ([af79a4ff](https://github.com/davidmigloz/langchain_dart/commit/af79a4ffcadb207bfc704365462edebfca1ed6c7))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

## 0.6.3

 - **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))

## 0.6.2

 - **FEAT**: Add Runnable.close() to close any resources associated with it ([#439](https://github.com/davidmigloz/langchain_dart/issues/439)). ([4e08cced](https://github.com/davidmigloz/langchain_dart/commit/4e08cceda964921178061e9721618a1505198ff5))
 - **DOCS**: Document tool calling with OpenRouter ([#437](https://github.com/davidmigloz/langchain_dart/issues/437)). ([47986592](https://github.com/davidmigloz/langchain_dart/commit/47986592a674322fe2f69aff7166a3e594756ace))

## 0.6.1+1

 - Update a dependency to the latest release.

## 0.6.1

 - **FEAT**: Add GPT-4o to model catalog ([#420](https://github.com/davidmigloz/langchain_dart/issues/420)). ([96214307](https://github.com/davidmigloz/langchain_dart/commit/96214307ec8ae045dade687d4c623bd4dc1be896))
 - **FEAT**: Include usage stats when streaming with OpenAI and ChatOpenAI ([#406](https://github.com/davidmigloz/langchain_dart/issues/406)). ([5e2b0ecc](https://github.com/davidmigloz/langchain_dart/commit/5e2b0eccd54c6c1dc15af8ff6d62c395f12fbd90))

## 0.6.0+2

 - Update a dependency to the latest release.

## 0.6.0+1

 - Update a dependency to the latest release.

## 0.6.0

> Note: This release has breaking changes.  
> If you are using "function calling" check [how to migrate to "tool calling"](https://github.com/davidmigloz/langchain_dart/issues/400).

 - **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
 - **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

## 0.5.1+1

 - Update a dependency to the latest release.

## 0.5.1

 - **FEAT**: Add support for Runnable.mapInputStream ([#393](https://github.com/davidmigloz/langchain_dart/issues/393)). ([a2b6bbb5](https://github.com/davidmigloz/langchain_dart/commit/a2b6bbb5ea7a65c36d1e955f9f96298cf2384afc))

## 0.5.0+1

 - Update a dependency to the latest release.

## 0.5.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/discussions/374)

 - **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
 - **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
 - **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
 - **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
 - **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
 - **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
 - **FEAT**: Remove deprecated OpenAI instance id ([#350](https://github.com/davidmigloz/langchain_dart/issues/350)). ([52939336](https://github.com/davidmigloz/langchain_dart/commit/529393360b7643c8192153c3654e5482dfc299ad))

## 0.4.1

 - **FEAT**: Allow to specify OpenAI custom instance ([#327](https://github.com/davidmigloz/langchain_dart/issues/327)). ([4744648c](https://github.com/davidmigloz/langchain_dart/commit/4744648cdf02828b9182ebd34ba3d7db5313786e))
 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
 - **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 0.4.0+1

 - **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.4.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: Update OpenAIEmbeddings' default model to text-embedding-3-small ([#313](https://github.com/davidmigloz/langchain_dart/issues/313)). ([43463481](https://github.com/davidmigloz/langchain_dart/commit/4346348108dc105a1daaedc932641e725b648f3e))
 - **FEAT**: Add support for shortening embeddings in OpenAIEmbeddings ([#312](https://github.com/davidmigloz/langchain_dart/issues/312)). ([5f5eb54f](https://github.com/davidmigloz/langchain_dart/commit/5f5eb54f2b991c14c18abf785b873a677bdf7e14))

## 0.3.3+1

 - **FIX**: Specified model is always overwritten in OpenAIFunctionsAgent ([#308](https://github.com/davidmigloz/langchain_dart/issues/308)). ([32dc37d8](https://github.com/davidmigloz/langchain_dart/commit/32dc37d8ca3e52929ab69d695f66627ff7e897fa))

## 0.3.3

 - **FEAT**: Support Anyscale in ChatOpenAI and OpenAIEmbeddings wrappers ([#305](https://github.com/davidmigloz/langchain_dart/issues/305)). ([7daa3eb0](https://github.com/davidmigloz/langchain_dart/commit/7daa3eb052c32baa7473d7532c795b7f242ed9fc))
 - **FEAT**: Support Together AI API in ChatOpenAI wrapper ([#297](https://github.com/davidmigloz/langchain_dart/issues/297)). ([28ab56af](https://github.com/davidmigloz/langchain_dart/commit/28ab56aff35c93a6835e5f22397d47da9e45fe40))
 - **FEAT**: Support Together AI in OpenAIEmbeddings wrapper ([#304](https://github.com/davidmigloz/langchain_dart/issues/304)). ([ddc761d6](https://github.com/davidmigloz/langchain_dart/commit/ddc761d65154be2df1efc202d9e7e6b2e60e7ac2))

## 0.3.2

 - **FEAT**: Support OpenRouter API in ChatOpenAI wrapper ([#292](https://github.com/davidmigloz/langchain_dart/issues/292)). ([c6e7e5be](https://github.com/davidmigloz/langchain_dart/commit/c6e7e5beeb03c32a93b062aab874cae3da0a52d9)) ([docs](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/open_router))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

## 0.3.1+1

 - Update a dependency to the latest release.

## 0.3.1

 - Update a dependency to the latest release.

## 0.3.0

> Note: This release has breaking changes.

 - **BREAKING** **REFACTOR**: Make MIME Type mandatory for base64 images in prompt ([#269](https://github.com/davidmigloz/langchain_dart/issues/269)). ([2fe076bb](https://github.com/davidmigloz/langchain_dart/commit/2fe076bb8d2ddacfee6ec077c3f564bff919dace))
 - **FEAT**: Allow to pass options to countTokens method ([#268](https://github.com/davidmigloz/langchain_dart/issues/268)). ([4ecb123b](https://github.com/davidmigloz/langchain_dart/commit/4ecb123bd34f0b01d377045b97dace89676d5d16))

## 0.2.0+1

 - **FIX**: Fix ChatOpenAI not considering functions from default options ([#257](https://github.com/davidmigloz/langchain_dart/issues/257)). ([cd864783](https://github.com/davidmigloz/langchain_dart/commit/cd864783f7190f7e8aa8988ba5c2cb5f7bfb3fad))

## 0.2.0

> Note: This release has breaking changes.
>
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

## 0.1.2+2

 - Update a dependency to the latest release.

## 0.1.2+1

 - **FIX**: Decode JSON responses as UTF-8 ([#234](https://github.com/davidmigloz/langchain_dart/issues/234)). ([0bca67f4](https://github.com/davidmigloz/langchain_dart/commit/0bca67f4ea682ebd5a8b9d3c7319c9511229b0ba))

## 0.1.2

 - **FEAT**: Add support for OpenAIDallETool ([#231](https://github.com/davidmigloz/langchain_dart/issues/231)). ([541e8d77](https://github.com/davidmigloz/langchain_dart/commit/541e8d77d76246b25ffa8c4d3715b5ca728cfc3a))
 - **FEAT**: Support implementing custom agents using LCEL ([#230](https://github.com/davidmigloz/langchain_dart/issues/230)). ([625eeeb4](https://github.com/davidmigloz/langchain_dart/commit/625eeeb4ffa9d92c6fd8da003fa471f5d4752257))

## 0.1.1+1

 - **FIX**: Fetch requests with big payloads dropping connection ([#226](https://github.com/davidmigloz/langchain_dart/issues/226)). ([1e771098](https://github.com/davidmigloz/langchain_dart/commit/1e771098d1090dd79846fca6520a1195efc5ac1e))

## 0.1.1

 - **FEAT**: Add Azure OpenAI API support ([#224](https://github.com/davidmigloz/langchain_dart/issues/224)). ([333fb7af](https://github.com/davidmigloz/langchain_dart/commit/333fb7af4b1edbdc716221609f2dc8f3923822cf))

## 0.1.0+1

 - **DOCS**: Add public_member_api_docs lint rule and document missing APIs ([#223](https://github.com/davidmigloz/langchain_dart/issues/223)). ([52380433](https://github.com/davidmigloz/langchain_dart/commit/523804331783970870b023946c016be6c0797920))

## 0.1.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/issues/220)

 - **REFACTOR**: Align openai_dart client breaking changes ([#219](https://github.com/davidmigloz/langchain_dart/issues/219)). ([172db27f](https://github.com/davidmigloz/langchain_dart/commit/172db27f6da429e16dcda55678a73e1d885bb6d9))
 - **BREAKING** **FEAT**: Add multi-modal messages support with OpenAI Vision ([#220](https://github.com/davidmigloz/langchain_dart/issues/220)). ([6da2e069](https://github.com/davidmigloz/langchain_dart/commit/6da2e069932782eed8c27da45c56b4c290373fac))

## 0.0.15+2

 - Update a dependency to the latest release.

## 0.0.15+1

 - **REFACTOR**: Rename ChatCompletionFunction to FunctionObject (internal) ([#206](https://github.com/davidmigloz/langchain_dart/issues/206)). ([0f06df3f](https://github.com/davidmigloz/langchain_dart/commit/0f06df3f9b32e5887976936b5fd2e6aa5a4f4f5b))

## 0.0.15

 - **FEAT**: Add streaming support to OpenAI ([#196](https://github.com/davidmigloz/langchain_dart/issues/196)). ([b21fcb38](https://github.com/davidmigloz/langchain_dart/commit/b21fcb387685af8706db62caf33b24e0ccf9c73f))
 - **FEAT**: Support seed and system_fingerprint in OpenAI wrapper ([#204](https://github.com/davidmigloz/langchain_dart/issues/204)). ([c31b6795](https://github.com/davidmigloz/langchain_dart/commit/c31b67959ca7ce3d42e9832669fd18de11f41984))
 - **FEAT**: Add streaming support to ChatOpenAI ([#197](https://github.com/davidmigloz/langchain_dart/issues/197)). ([2268da78](https://github.com/davidmigloz/langchain_dart/commit/2268da783703b76422448128ea929e6fb6f805b6))
 - **FEAT**: Support seed, system_fingerprint and JSON Mode in ChatOpenAI ([#205](https://github.com/davidmigloz/langchain_dart/issues/205)). ([3332c228](https://github.com/davidmigloz/langchain_dart/commit/3332c2281b8a345ac7a6789202cbd5ac2225296b))

## 0.0.14+1

 - **FIX**: Revert OpenAI maxTokens default to 256 ([#189](https://github.com/davidmigloz/langchain_dart/issues/189)). ([ab2ce6d4](https://github.com/davidmigloz/langchain_dart/commit/ab2ce6d4231ca0e2aff7aa3d9831625b10d0524d))
 - **DOCS**: Update CHANGELOG.md. ([5ea4e532](https://github.com/davidmigloz/langchain_dart/commit/5ea4e5326e706a52d157284a281eb881e05117c5))

## 0.0.14

 - **REFACTOR**: Remove dependency on dart_openai ([#186](https://github.com/davidmigloz/langchain_dart/issues/186)). ([273cfa2e](https://github.com/davidmigloz/langchain_dart/commit/273cfa2e84421161c979ddc41168d1b38981ca04))
 - **FEAT**: Migrate ChatOpenAI to openai_dart client ([#185](https://github.com/davidmigloz/langchain_dart/issues/185)). ([de8f487d](https://github.com/davidmigloz/langchain_dart/commit/de8f487dfddb10bee049539356a20b77b7556cad))
 - **FEAT**: Migrate OpenAI to openai_dart client ([#184](https://github.com/davidmigloz/langchain_dart/issues/184)). ([6c90b371](https://github.com/davidmigloz/langchain_dart/commit/6c90b37183eb47354df91fc4870065afecaf3673))
 - **FEAT**: Migrate OpenAIEmbeddings to openai_dart client ([#183](https://github.com/davidmigloz/langchain_dart/issues/183)). ([8f626fe8](https://github.com/davidmigloz/langchain_dart/commit/8f626fe8253f6b11fba0fcab0e143db93d3bce08))

## 0.0.13

 - **FEAT**: Implement LangChain Expression Language (LCEL) ([#163](https://github.com/davidmigloz/langchain_dart/issues/163)). ([85ea41af](https://github.com/davidmigloz/langchain_dart/commit/85ea41af9f5e2ff42bba620a60f765ca0f67c86c))

## 0.0.12

> Note: This release has breaking changes.

 - **DOCS**: Add topics to pubspecs. ([8c1d6297](https://github.com/davidmigloz/langchain_dart/commit/8c1d62970710cc326fd5930101918aaf16b18f74))
 - **BREAKING** **REFACTOR**: Change embedDocuments input to `List<Document>` ([#153](https://github.com/davidmigloz/langchain_dart/issues/153)). ([1b5d6fbf](https://github.com/davidmigloz/langchain_dart/commit/1b5d6fbf20bcbb7734581f91d66eff3a86731fec))

## 0.0.11

 - **FEAT**: Add ability to specify user in OpenAI and ChatOpenAI ([#143](https://github.com/davidmigloz/langchain_dart/issues/143)). ([457ab54e](https://github.com/davidmigloz/langchain_dart/commit/457ab54e45afd5aa382e284806dc73cfe0905c09))
 - **DOCS**: Update packages example. ([4f8488fc](https://github.com/davidmigloz/langchain_dart/commit/4f8488fcb324e31b9d8dece7d1999333d7982253))

## 0.0.10

 - **DOCS**: Update readme. ([b61eda5b](https://github.com/davidmigloz/langchain_dart/commit/b61eda5ba506b4602592511c6a9be1e7aae5bf57))

## 0.0.9

 - **DOCS**: Update changelog. ([b211ab47](https://github.com/davidmigloz/langchain_dart/commit/b211ab4739b8feb17d00089ecca548716766272d))

## 0.0.8+1

 - **FIX**: OpenAIFunctionsAgent wrong prompt order with no memory ([#134](https://github.com/davidmigloz/langchain_dart/issues/134)). ([8c9dcf22](https://github.com/davidmigloz/langchain_dart/commit/8c9dcf22e5fb0229bb98e5fd22492845d44bc531))

## 0.0.8

 - **REFACTOR**: Fix Dart 3.1.0 linter issues ([#125](https://github.com/davidmigloz/langchain_dart/issues/125)). ([cc32f3f1](https://github.com/davidmigloz/langchain_dart/commit/cc32f3f13240c28cf174a9dbffc7d61bc061f843))

## 0.0.7+1

 - Update a dependency to the latest release.

## 0.0.7

- Update a dependency to the latest release.

## 0.0.6

 - **REFACTOR**: Always await or explicitly discard Futures ([#106](https://github.com/davidmigloz/langchain_dart/issues/106)). ([989e93db](https://github.com/davidmigloz/langchain_dart/commit/989e93dbf6b5d61f053550219d88842156aeb492))
 - **FIX**: Fix OpenAIQAWithSourcesChain returning empty strings ([#113](https://github.com/davidmigloz/langchain_dart/issues/113)). ([6181ff8d](https://github.com/davidmigloz/langchain_dart/commit/6181ff8df77653d38cd84cb066776c04c0ff74ad))
 - **FEAT**: Integrate Google Vertex AI PaLM Embeddings ([#100](https://github.com/davidmigloz/langchain_dart/issues/100)). ([d777eccc](https://github.com/davidmigloz/langchain_dart/commit/d777eccc0c81c58b322f28e6e3c4a8763f3f84b7))
 - **FEAT**: Integrate Google Vertex AI PaLM Chat Model ([#99](https://github.com/davidmigloz/langchain_dart/issues/99)). ([3897595d](https://github.com/davidmigloz/langchain_dart/commit/3897595db597d5957ef80ae7a1de35c5f41265b8))
 - **FEAT**: Integrate Google Vertex AI PaLM Text model ([#98](https://github.com/davidmigloz/langchain_dart/issues/98)). ([b2746c23](https://github.com/davidmigloz/langchain_dart/commit/b2746c235d68045ba20afd1f2be7c24dcccb5f24))

## 0.0.5+1

 - **FIX**: ChatOpenAIOptions class not exported ([#105](https://github.com/davidmigloz/langchain_dart/issues/105)). ([dfd77076](https://github.com/davidmigloz/langchain_dart/commit/dfd77076dfb60cd71aed3654f78c562ce0bc88bf))
 - **FIX**: OpenAIOptions class not exported ([#104](https://github.com/davidmigloz/langchain_dart/issues/104)). ([e50efc3d](https://github.com/davidmigloz/langchain_dart/commit/e50efc3ddf0b13ece43298b2e3fee531e944601d))

## 0.0.5

 - **FIX**: FunctionChatMessage not saved properly in memory ([#88](https://github.com/davidmigloz/langchain_dart/issues/88)). ([d7b763de](https://github.com/davidmigloz/langchain_dart/commit/d7b763ded1abd59a964afd781558b3559a65d9ec))
 - **FEAT**: Update AgentExecutor constructor to use agent's tools ([#89](https://github.com/davidmigloz/langchain_dart/issues/89)). ([3af56a45](https://github.com/davidmigloz/langchain_dart/commit/3af56a45930fff84b11f6bec29c50502a490c2b4))
 - **DOCS**: Add example of using memory in OpenAIFunctionsAgent ([#91](https://github.com/davidmigloz/langchain_dart/issues/91)). ([898d5350](https://github.com/davidmigloz/langchain_dart/commit/898d53502713ec2fd1ecc93e76e7f941123b81a5))

## 0.0.4

 - **FIX**: systemChatMessage was ignored in OpenAIFunctionsAgent ([#86](https://github.com/davidmigloz/langchain_dart/issues/86)). ([cfe1e009](https://github.com/davidmigloz/langchain_dart/commit/cfe1e00972d481f83b9dc9e225a32b7077aa5fd4))
 - **FEAT**: Support LLMChain in OpenAIFunctionsAgent and memory. ([bd4a1cb9](https://github.com/davidmigloz/langchain_dart/commit/bd4a1cb9101ba385ce9613f9aa0b7e5474380f32))
 - **FEAT**: Return ChatMessage when LLMChain used with ChatModel. ([bb5f4d23](https://github.com/davidmigloz/langchain_dart/commit/bb5f4d2325ae1f615159f2ffd11cc8ec4e87ed3c))

## 0.0.3

- **FEAT**: Update internal dependencies (including http to 1.1.0). ([8f3e8bc8](https://github.com/davidmigloz/langchain_dart/commit/8f3e8bc811df5c8bdba2c7e33b6c53ea0c2edad4))

## 0.0.2

 - **FIX**: OpenAIQAWithSourcesChain throws exception. ([45c6cb9d](https://github.com/davidmigloz/langchain_dart/commit/45c6cb9d32be670902dd2fe4cb92597765590d85))
 - **FEAT**: Support estimating the number of tokens for a given prompt ([#3](https://github.com/davidmigloz/langchain_dart/issues/3)). ([e22f22c8](https://github.com/davidmigloz/langchain_dart/commit/e22f22c89f188a019b96a7c0003dbd26471bebb7))

## 0.0.1

- Initial public release.

Check out the announcement post for all the details:
https://blog.langchaindart.dev/introducing-langchain-dart-6b1d34fc41ef

## 0.0.1-dev.7

- Add support for OpenAIAgent class (#34).
- Export OpenAI Client class (allowing to define custom base URL).

## 0.0.1-dev.6

- Add support for OpenAIQAWithSourcesChain (#53).

## 0.0.1-dev.5

- Add support for OpenAIEmbeddings (#38).
- Add support for OpenAI functions (#35).

## 0.0.1-dev.4

- Improve API documentation.

## 0.0.1-dev.3

- Add support for ChatPromptTemplate class (#8).

## 0.0.1-dev.2

- Add support for OpenAI LLM (`OpenAI` class).
- Add support for OpenAI chat model (`ChatOpenAI` class).

## 0.0.1-dev.1

- Bootstrap project.
