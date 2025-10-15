## 1.0.0

> Note: This release has breaking changes.

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

### Breaking Changes

- **Resource-based API**: Methods reorganized under strongly-typed resources:
  - `client.models.*` (generation, streaming, embeddings, tokens, prediction)
  - `client.tunedModels.*`
  - `client.files.*`, `client.generatedFiles.*`
  - `client.cachedContents.*`
  - `client.batches.*`
  - `client.corpora.*`
  - `client.ragStores.*`
- **Parameter rename**: `modelId` → `model`.
- **Configuration**: New `GoogleAIConfig` with `AuthProvider` pattern (API key / bearer / custom OAuth).
- **Exceptions**: Replaced ad-hoc errors with a typed hierarchy:
  - `ApiException`, `ValidationException`, `RateLimitException`, `TimeoutException`, `AbortedException`.
- **Dependencies**: Removed `fetch_client`; now minimal (`http`, `logging`).

See **[MIGRATION.md](MIGRATION.md)** for step-by-step examples and mapping tables.

## 0.1.3

- **FEAT**: Migrate to Freezed v3 ([#773](https://github.com/davidmigloz/langchain_dart/issues/773)). ([f87c8c03](https://github.com/davidmigloz/langchain_dart/commit/f87c8c03711ef382d2c9de19d378bee92e7631c1))

## 0.1.2

- **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.1.1

- **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
- **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
- **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))

## 0.1.0+3

- **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

## 0.1.0+2

- **REFACTOR**: Migrate conditional imports to js_interop ([#453](https://github.com/davidmigloz/langchain_dart/issues/453)). ([a6a78cfe](https://github.com/davidmigloz/langchain_dart/commit/a6a78cfe05fb8ce68e683e1ad4395ca86197a6c5))

## 0.1.0+1

- **FIX**: Fix deserialization of sealed classes ([#435](https://github.com/davidmigloz/langchain_dart/issues/435)). ([7b9cf223](https://github.com/davidmigloz/langchain_dart/commit/7b9cf223e42eae8496f864ad7ef2f8d0dca45678))

## 0.1.0

- **REFACTOR**: Minor changes ([#407](https://github.com/davidmigloz/langchain_dart/issues/407)). ([fa4b5c37](https://github.com/davidmigloz/langchain_dart/commit/fa4b5c376a191fea50c3f8b1d6b07cef0480a74e))

## 0.0.4

- **FEAT**: Support generateContent for tuned model in googleai_dart client ([#358](https://github.com/davidmigloz/langchain_dart/issues/358)). ([b4641a09](https://github.com/davidmigloz/langchain_dart/commit/b4641a09af7f6d67d503d526451a370eca920c5c))
- **FEAT**: Support output dimensionality in Google AI Embeddings ([#373](https://github.com/davidmigloz/langchain_dart/issues/373)). ([6dcb27d8](https://github.com/davidmigloz/langchain_dart/commit/6dcb27d861fa65d2c882e31ce28e8c0a92b65cc1))
- **FEAT**: Support updating API key in Google AI client ([#357](https://github.com/davidmigloz/langchain_dart/issues/357)). ([b9b808e7](https://github.com/davidmigloz/langchain_dart/commit/b9b808e72f02b9f38ab355d581284a0d848d4bd1))
- **FIX**: Have the == implementation use Object instead of dynamic ([#334](https://github.com/davidmigloz/langchain_dart/issues/334)). ([89f7b0b9](https://github.com/davidmigloz/langchain_dart/commit/89f7b0b94144c216de19ec7244c48f3c34c2c635))

## 0.0.3

- **FEAT**: Add streaming support to googleai_dart client ([#299](https://github.com/davidmigloz/langchain_dart/issues/299)). ([2cbd538a](https://github.com/davidmigloz/langchain_dart/commit/2cbd538a3b67ef6bdd9ab7b92bebc3c8c7a1bea1))
- **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
- **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 0.0.2+2

- **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.0.2+1

- **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))

## 0.0.2

- Update a dependency to the latest release.

## 0.0.1+1

- **FIX**: Fetch web requests with big payloads dropping connection ([#273](https://github.com/davidmigloz/langchain_dart/issues/273)). ([425889dc](https://github.com/davidmigloz/langchain_dart/commit/425889dc24a74790a7072c75f0bdb0d19ab40cf6))

## 0.0.1

- **FEAT**: Implement Dart client for Google AI API ([#267](https://github.com/davidmigloz/langchain_dart/issues/267)). ([99083cd2](https://github.com/davidmigloz/langchain_dart/commit/99083cd22ec35b3256b800ce76df328b9c9165e4))

## 0.0.1-dev.1

- Bootstrap project.
