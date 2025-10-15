## 0.4.0

> Note: This release has breaking changes.

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

## 0.3.9

 - Update a dependency to the latest release.

## 0.3.8

 - **FEAT**: Make CreateChatCompletionStreamResponse.choices field nullable to support Groq's OpenAI-compatible API ([#742](https://github.com/davidmigloz/langchain_dart/issues/742)). ([76fbbdc6](https://github.com/davidmigloz/langchain_dart/commit/76fbbdc6f78e83f1f622ed73ff4b27b37a4f744b))
 - **FIX**: Add multi-LLM compatibility for Tool.fromFunction getInputFromJson ([#738](https://github.com/davidmigloz/langchain_dart/issues/738)). ([291a0efc](https://github.com/davidmigloz/langchain_dart/commit/291a0efcebe1696f609ecbd0b803cc9324474db5))
 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.3.7

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **FEAT**: Add to/fromMap serialization to ChatMessage, PromptValue & ChatHistory ([#681](https://github.com/davidmigloz/langchain_dart/issues/681)). ([d239c7c7](https://github.com/davidmigloz/langchain_dart/commit/d239c7c7b4a1504559e475466be7f176521a0473))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **FIX**: RunnableMap doesn't invoke multiple Runnables in parallel ([#649](https://github.com/davidmigloz/langchain_dart/issues/649)). ([fc722d85](https://github.com/davidmigloz/langchain_dart/commit/fc722d85eef6644f7593dd26c7fd55a56615595b))

## 0.3.6+1

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

## 0.3.6

 - **FEAT**: Add retry support for Runnables ([#540](https://github.com/davidmigloz/langchain_dart/issues/540)). ([1099725d](https://github.com/davidmigloz/langchain_dart/commit/1099725d88de4103381edad533209a9a098bdb7f))

## 0.3.5

 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))
 - **FEAT**: Support OpenAI's strict mode for tool calling in ChatOpenAI ([#536](https://github.com/davidmigloz/langchain_dart/issues/536)). ([71623f49](https://github.com/davidmigloz/langchain_dart/commit/71623f490289e63252165167305e00038d800be1))
 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))

## 0.3.4

 - **FEAT**: Add Fallback support for Runnables ([#501](https://github.com/davidmigloz/langchain_dart/issues/501)). ([5887858d](https://github.com/davidmigloz/langchain_dart/commit/5887858d667d43c49978291ea98a92cab0069971))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))

## 0.3.3

 - **FEAT**: Add support for ChatToolChoiceRequired ([#474](https://github.com/davidmigloz/langchain_dart/issues/474)). ([bf324f36](https://github.com/davidmigloz/langchain_dart/commit/bf324f36f645c53458d5891f8285991cd50f2649))
 - **FEAT**: Update ChatResult.id concat logic ([#477](https://github.com/davidmigloz/langchain_dart/issues/477)). ([44c7fafd](https://github.com/davidmigloz/langchain_dart/commit/44c7fafd934bf6517e285830b1ca98282127cb7d))

## 0.3.2

 - **REFACTOR**: Migrate to langchaindart.dev domain ([#434](https://github.com/davidmigloz/langchain_dart/issues/434)). ([358f79d6](https://github.com/davidmigloz/langchain_dart/commit/358f79d6e0bae2ecd657aeed2eae7fad16d97c18))
 - **FIX**: Stream errors are not propagated by StringOutputParser ([#440](https://github.com/davidmigloz/langchain_dart/issues/440)). ([496b11cc](https://github.com/davidmigloz/langchain_dart/commit/496b11cca9bbf9892c425e49138562537398bc70))
 - **FEAT**: Add Runnable.close() to close any resources associated with it ([#439](https://github.com/davidmigloz/langchain_dart/issues/439)). ([4e08cced](https://github.com/davidmigloz/langchain_dart/commit/4e08cceda964921178061e9721618a1505198ff5))

## 0.3.1

 - **FEAT**: Add equals to ChatToolChoiceForced ([#422](https://github.com/davidmigloz/langchain_dart/issues/422)). ([8d0786bc](https://github.com/davidmigloz/langchain_dart/commit/8d0786bc6228ce86de962d30e9c2cc9728a08f3f))
 - **FIX**: Fix finishReason null check ([#406](https://github.com/davidmigloz/langchain_dart/issues/406)). ([5e2b0ecc](https://github.com/davidmigloz/langchain_dart/commit/5e2b0eccd54c6c1dc15af8ff6d62c395f12fbd90))

## 0.3.0

> Note: This release has breaking changes.  
> If you are using "function calling" check [how to migrate to "tool calling"](https://github.com/davidmigloz/langchain_dart/issues/400).

 - **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
 - **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

## 0.2.0+1

 - **FIX**: Allow async functions in Runnable.mapInput ([#396](https://github.com/davidmigloz/langchain_dart/issues/396)). ([e4c35092](https://github.com/davidmigloz/langchain_dart/commit/e4c3509267b7be28e2b0fa334a9255baadabfb6a))

## 0.2.0

> Note: This release has breaking changes.  
> If you are using `Runnable.fromFunction` check the [migration guide](https://github.com/davidmigloz/langchain_dart/issues/394).

 - **FEAT** Add support for RunnableRouter ([#386](https://github.com/davidmigloz/langchain_dart/issues/386)). ([827e262](https://github.com/davidmigloz/langchain_dart/commit/827e2627535941d702e8fbe300ca1426ddf50efe))
 - **FEAT**: Add support for Runnable.mapInputStream ([#393](https://github.com/davidmigloz/langchain_dart/issues/393)). ([a2b6bbb5](https://github.com/davidmigloz/langchain_dart/commit/a2b6bbb5ea7a65c36d1e955f9f96298cf2384afc))
 - **FEAT**: Add support for JsonOutputParser ([#392](https://github.com/davidmigloz/langchain_dart/issues/392)). ([c6508f0f](https://github.com/davidmigloz/langchain_dart/commit/c6508f0fadde3fd4d93accbcae5cea37b7beca20))
 - **FEAT**: Reduce input stream for PromptTemplate, LLM, ChatModel, Retriever and Tool ([#388](https://github.com/davidmigloz/langchain_dart/issues/388)). ([b59bcd40](https://github.com/davidmigloz/langchain_dart/commit/b59bcd409f4904fb2e16f928b3c7206a186ab3f4))
 - **BREAKING** **FEAT**: Support different logic for streaming in RunnableFunction ([#394](https://github.com/davidmigloz/langchain_dart/issues/394)). ([8bb2b8ed](https://github.com/davidmigloz/langchain_dart/commit/8bb2b8ede18bfe3a4f266b78ca32f1dfb83db1b1))

## 0.1.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/discussions/374)

 - **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
 - **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
 - **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
 - **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
 - **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))
 - **FEAT**: Add reduceOutputStream option to StringOutputParser ([#368](https://github.com/davidmigloz/langchain_dart/issues/368)). ([7f9a9fae](https://github.com/davidmigloz/langchain_dart/commit/7f9a9faeef93685ff810a88bbfe866da4b843369))

## 0.0.1-dev.2

 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))

## 0.0.1-dev.1

- Bootstrap package.
