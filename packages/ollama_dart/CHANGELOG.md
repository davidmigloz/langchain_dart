📣 Check out the [#announcements](https://discord.com/channels/1123158322812555295/1123250594644242534) channel in the [LangChain.dart Discord](https://discord.gg/x4qbhqecVR) server for more details.

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
