## 0.2.5

 - **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

## 0.2.4

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.2.3

 - **FEAT**: Add think/thinking params to ollama_dart ([#721](https://github.com/davidmigloz/langchain_dart/issues/721)). ([701d7968](https://github.com/davidmigloz/langchain_dart/commit/701d7968baaa07f5612a25d74a1d19c2c24e7077))
 - **FEAT**: Add capabilities, projector_info, tensors and modified_at to Ollama's ModelInfo ([#690](https://github.com/davidmigloz/langchain_dart/issues/690)). ([c5e247db](https://github.com/davidmigloz/langchain_dart/commit/c5e247db6aadedaa6ec668652e416477a6c03b51))
 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

## 0.2.2+1

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

## 0.2.2

 - **FEAT**: Update Ollama default model to llama-3.2 ([#554](https://github.com/davidmigloz/langchain_dart/issues/554)). ([f42ed0f0](https://github.com/davidmigloz/langchain_dart/commit/f42ed0f04136021b30556787cfdea13a14ca5768))

## 0.2.1

 - **FEAT**: Add support for min_p in Ollama ([#512](https://github.com/davidmigloz/langchain_dart/issues/512)). ([e40d54b2](https://github.com/davidmigloz/langchain_dart/commit/e40d54b2e729d8fb6bf14bb4ea97820121bc85c7))

## 0.2.0

> Note: This release has breaking changes.

 - **FEAT**: Add tool calling support in ollama_dart ([#504](https://github.com/davidmigloz/langchain_dart/issues/504)). ([1ffdb41b](https://github.com/davidmigloz/langchain_dart/commit/1ffdb41b8f19941336c1cd911c73f0b3d46af975))
 - **BREAKING** **FEAT**: Update Ollama default model to llama-3.1 ([#506](https://github.com/davidmigloz/langchain_dart/issues/506)). ([b1134bf1](https://github.com/davidmigloz/langchain_dart/commit/b1134bf1163cdcea26a9f1e65fee5c515be3857c))
 - **FEAT**: Add support for Ollama version and model info ([#488](https://github.com/davidmigloz/langchain_dart/issues/488)). ([a110ecb7](https://github.com/davidmigloz/langchain_dart/commit/a110ecb7f10e7975bd2416aa65add98984c6efb8))
 - **FEAT**: Add suffix support in Ollama completions API in ollama_dart ([#503](https://github.com/davidmigloz/langchain_dart/issues/503)). ([30d05a69](https://github.com/davidmigloz/langchain_dart/commit/30d05a69b07f88f803b9abfdf2fded9348a73490))
 - **BREAKING** **REFACTOR**: Change Ollama push model status type from enum to String ([#489](https://github.com/davidmigloz/langchain_dart/issues/489)). ([90c9ccd9](https://github.com/davidmigloz/langchain_dart/commit/90c9ccd986c7b679ed30225d2380120e17dfec41))
 - **DOCS**: Update Ollama request options default values in API docs ([#479](https://github.com/davidmigloz/langchain_dart/issues/479)). ([e1f93366](https://github.com/davidmigloz/langchain_dart/commit/e1f9336619ee12624a7b045ca18a3118ead0158f))

## 0.1.2

 - **FEAT**: Add support for listing running Ollama models ([#451](https://github.com/davidmigloz/langchain_dart/issues/451)). ([cfaa31fb](https://github.com/davidmigloz/langchain_dart/commit/cfaa31fb8ce1dc128570c95d403809f71e0199d9))
 - **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

## 0.1.1

 - **FEAT**: Support buffered stream responses in ollama_dart ([#445](https://github.com/davidmigloz/langchain_dart/issues/445)). ([ce2ef30c](https://github.com/davidmigloz/langchain_dart/commit/ce2ef30c9a9a0dfe8f3059988b7007c94c45b9bd))
 - **FIX**: Fix deserialization of sealed classes ([#435](https://github.com/davidmigloz/langchain_dart/issues/435)). ([7b9cf223](https://github.com/davidmigloz/langchain_dart/commit/7b9cf223e42eae8496f864ad7ef2f8d0dca45678))

## 0.1.0+1

 - **FIX**: digest path param in Ollama blob endpoints ([#430](https://github.com/davidmigloz/langchain_dart/issues/430)). ([2e9e935a](https://github.com/davidmigloz/langchain_dart/commit/2e9e935aefd74e5e9e09a23188a6c77ce535661d))

## 0.1.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: Align Ollama client to the Ollama v0.1.36 API  ([#411](https://github.com/davidmigloz/langchain_dart/issues/411)). ([326212ce](https://github.com/davidmigloz/langchain_dart/commit/326212ce4e4b035f7b29f4c810f447d5cf1731c4))
 - **FEAT**: Update Ollama default model from llama2 to llama3 ([#417](https://github.com/davidmigloz/langchain_dart/issues/417)). ([9d30b1a1](https://github.com/davidmigloz/langchain_dart/commit/9d30b1a1c811d73cfa27110b8c3c10b10da1801e))
 - **FEAT**: Add support for done reason ([#413](https://github.com/davidmigloz/langchain_dart/issues/413)). ([cc5b1b02](https://github.com/davidmigloz/langchain_dart/commit/cc5b1b021636379f32f215546b78547ace87d150))

## 0.0.3+1

 - **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

## 0.0.3

 - **FEAT**: Add Ollama keep_alive param to control how long models stay loaded ([#319](https://github.com/davidmigloz/langchain_dart/issues/319)). ([3b86e227](https://github.com/davidmigloz/langchain_dart/commit/3b86e22788eb8df9c09b034c5acc98fdaa6b32c6))
 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
 - **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 0.0.2+1

 - **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.0.2

 - **FEAT**: Add support for chat API and multi-modal LLMs ([#274](https://github.com/davidmigloz/langchain_dart/issues/274)). ([76e1a294](https://github.com/davidmigloz/langchain_dart/commit/76e1a2946fbbf5c4802c4e66addeb9adf5900b17))

## 0.0.1+2

 - **FIX**: Fetch web requests with big payloads dropping connection ([#273](https://github.com/davidmigloz/langchain_dart/issues/273)). ([425889dc](https://github.com/davidmigloz/langchain_dart/commit/425889dc24a74790a7072c75f0bdb0d19ab40cf6))

## 0.0.1+1

 - **DOCS**: Update README.me. ([be20dbaf](https://github.com/davidmigloz/langchain_dart/commit/be20dbaf4568c773aca88f1339a489092b3a5551))

## 0.0.1

 - **FEAT**: Implement ollama_dart, a Dart client for Ollama API ([#238](https://github.com/davidmigloz/langchain_dart/issues/238)). ([d213aa9c](https://github.com/davidmigloz/langchain_dart/commit/d213aa9c5dec0aea11d656b5f16ddf3174f5b789))

## 0.0.1-dev.1

- Bootstrap project.
