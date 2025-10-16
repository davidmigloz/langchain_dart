## 0.4.0+1

 - **REFACTOR**: Fix pub format warnings ([#809](https://github.com/davidmigloz/langchain_dart/issues/809)). ([640cdefb](https://github.com/davidmigloz/langchain_dart/commit/640cdefbede9c0a0182fb6bb4005a20aa6f35635))

## 0.4.0

> Note: This release has breaking changes.

 - **FEAT**: Upgrade to http v1.5.0 ([#785](https://github.com/davidmigloz/langchain_dart/issues/785)). ([f7c87790](https://github.com/davidmigloz/langchain_dart/commit/f7c8779011015b5a4a7f3a07dca32bde1bb2ea88))
 - **BREAKING** **BUILD**: Require Dart >=3.8.0 ([#792](https://github.com/davidmigloz/langchain_dart/issues/792)). ([b887f5c6](https://github.com/davidmigloz/langchain_dart/commit/b887f5c62e307b3a510c5049e3d1fbe7b7b4f4c9))

## 0.3.4+3

 - Update a dependency to the latest release.

## 0.3.4+2

 - Update a dependency to the latest release.

## 0.3.4+1

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.3.4

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix static instance of ObjectBoxVectorStore ([#684](https://github.com/davidmigloz/langchain_dart/issues/684)). ([719ead93](https://github.com/davidmigloz/langchain_dart/commit/719ead93c6e91d42bb8e45910ccf0da4e3e51afd))
 - **FIX**: Fix langchain_community  WASM compatibility ([#660](https://github.com/davidmigloz/langchain_dart/issues/660)). ([0be8aae4](https://github.com/davidmigloz/langchain_dart/commit/0be8aae44950fddd9ac9538ccfa5d017e6f585a0))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **FIX**: Made apiKey optional for `TavilyAnswerTool` and `TavilySearchResultsTool` ([#646](https://github.com/davidmigloz/langchain_dart/issues/646)). ([5085ea4a](https://github.com/davidmigloz/langchain_dart/commit/5085ea4ad8b5cd072832e73afcbb7075a6375307))

## 0.3.3

 - **FEAT**: Add support for DirectoryLoader ([#620](https://github.com/davidmigloz/langchain_dart/issues/620)). ([4730f2a3](https://github.com/davidmigloz/langchain_dart/commit/4730f2a376b152ea38e5204125209ef01f29cab9))
 - **FEAT**: Expose internal store in ObjectBoxVectorStore ([#611](https://github.com/davidmigloz/langchain_dart/issues/611)). ([c33f2e07](https://github.com/davidmigloz/langchain_dart/commit/c33f2e07c31ddd91dae16856df3b6c8ffddc45e9))
 - **FIX**: Chinese character support on web loader ([#600](https://github.com/davidmigloz/langchain_dart/issues/600)). ([48e64d5b](https://github.com/davidmigloz/langchain_dart/commit/48e64d5b01aa8469dbf7a973350eeac26b43df8f))
 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))
 - **REFACTOR**: Upgrade api clients generator version ([#610](https://github.com/davidmigloz/langchain_dart/issues/610)). ([0c8750e8](https://github.com/davidmigloz/langchain_dart/commit/0c8750e85b34764f99b6e34cc531776ffe8fba7c))

## 0.3.2+2

 - **FIX**: Update ObjectBox SDK to v4.0.3 to fix StorageException in iOS ([#581](https://github.com/davidmigloz/langchain_dart/issues/581)). ([943811a5](https://github.com/davidmigloz/langchain_dart/commit/943811a5d5ab1c7ef3e83db0c45082a0d4d1fc4a))

## 0.3.2+1

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

## 0.3.2

 - **FEAT**: Add support for deleteWhere in ObjectBoxVectorStore ([#552](https://github.com/davidmigloz/langchain_dart/issues/552)). ([90918bba](https://github.com/davidmigloz/langchain_dart/commit/90918bbac411ccfe4823ae195de6a50a46575573))
 - **REFACTOR**: Add stubs for ObjectBox on web platform ([#553](https://github.com/davidmigloz/langchain_dart/issues/553)). ([41caed92](https://github.com/davidmigloz/langchain_dart/commit/41caed924bf24382567758be4590d5ddff31e839))

## 0.3.1

 - **FEAT**: Deprecate OpenAIToolsAgent in favour of ToolsAgent ([#532](https://github.com/davidmigloz/langchain_dart/issues/532)). ([68d8011a](https://github.com/davidmigloz/langchain_dart/commit/68d8011a9aa09368875ba0434839d12623ba2bab))

## 0.3.0

- **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
- **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))

## 0.2.2

 - **FEAT**: Add support for TavilySearchResultsTool and TavilyAnswerTool ([#467](https://github.com/davidmigloz/langchain_dart/issues/467)). ([a9f35755](https://github.com/davidmigloz/langchain_dart/commit/a9f35755dfac9d257efb251c4a6c5948673c2f6c))

## 0.2.1+1

 - **FIX**: Add missing dependency in langchain_community package ([#448](https://github.com/davidmigloz/langchain_dart/issues/448)). ([70ffd027](https://github.com/davidmigloz/langchain_dart/commit/70ffd027cb41c5c5058bb266966734894f773330))

## 0.2.1

 - **FEAT**: Add support for ObjectBoxVectorStore ([#438](https://github.com/davidmigloz/langchain_dart/issues/438)). ([81e167a6](https://github.com/davidmigloz/langchain_dart/commit/81e167a6888fff9f8db381caaef6ee788acef3a8))
   + Check out the [ObjectBoxVectorStore documentation](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/objectbox?id=objectbox)

## 0.2.0+1

- Update a dependency to the latest release.

## 0.2.0

> Note: This release has breaking changes.  
> If you are using "function calling" check [how to migrate to "tool calling"](https://github.com/davidmigloz/langchain_dart/issues/400).

 - **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))
 - **BREAKING** **REFACTOR**: Improve Tool abstractions ([#398](https://github.com/davidmigloz/langchain_dart/issues/398)). ([2a50aec2](https://github.com/davidmigloz/langchain_dart/commit/2a50aec28385068f9be32392020d727fc9a1561e))

## 0.1.0+2

 - Update a dependency to the latest release.

## 0.1.0+1

 - Update a dependency to the latest release.

## 0.1.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/discussions/374)

 - **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))

## 0.0.1-dev.2

 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))

## 0.0.1-dev.1

- Bootstrap package.
