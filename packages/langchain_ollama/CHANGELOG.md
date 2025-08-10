## 0.3.3+2

 - Update a dependency to the latest release.

## 0.3.3+1

 - **BUILD**: Update dependencies ([#751](https://github.com/davidmigloz/langchain_dart/issues/751)). ([250a3c6](https://github.com/davidmigloz/langchain_dart/commit/250a3c6a6c1815703a61a142ba839c0392a31015))

## 0.3.3

 - **FEAT**: Update dependencies (requires Dart 3.6.0) ([#709](https://github.com/davidmigloz/langchain_dart/issues/709)). ([9e3467f7](https://github.com/davidmigloz/langchain_dart/commit/9e3467f7caabe051a43c0eb3c1110bc4a9b77b81))
 - **REFACTOR**: Fix linter issues ([#708](https://github.com/davidmigloz/langchain_dart/issues/708)). ([652e7c64](https://github.com/davidmigloz/langchain_dart/commit/652e7c64776d92d309cbd708d9e477fc2ee1391c))
 - **REFACTOR**: Remove fetch_client dependency in favor of http v1.3.0 ([#659](https://github.com/davidmigloz/langchain_dart/issues/659)). ([0e0a685c](https://github.com/davidmigloz/langchain_dart/commit/0e0a685c376895425dbddb0f9b83758c700bb0c7))
 - **FIX**: Fix linter issues ([#656](https://github.com/davidmigloz/langchain_dart/issues/656)). ([88a79c65](https://github.com/davidmigloz/langchain_dart/commit/88a79c65aad23bcf5859e58a7375a4b686cf02ef))
 - **DOCS**: Add langchain_ollama example ([#661](https://github.com/davidmigloz/langchain_dart/issues/661)). ([0bba6cb4](https://github.com/davidmigloz/langchain_dart/commit/0bba6cb4ebe4386ad53b1aa02836d375d5f59cbe))

## 0.3.2+2

 - **REFACTOR**: Add new lint rules and fix issues ([#621](https://github.com/davidmigloz/langchain_dart/issues/621)). ([60b10e00](https://github.com/davidmigloz/langchain_dart/commit/60b10e008acf55ebab90789ad08d2449a44b69d8))

## 0.3.2+1

 - **FIX**: UUID 'Namespace' can't be assigned to the parameter type 'String?' ([#566](https://github.com/davidmigloz/langchain_dart/issues/566)). ([1e93a595](https://github.com/davidmigloz/langchain_dart/commit/1e93a595f2f166da2cae3f7cfcdbb28892abf9b5))

## 0.3.2

 - **FEAT**: Update Ollama default model to llama-3.2 ([#554](https://github.com/davidmigloz/langchain_dart/issues/554)). ([f42ed0f0](https://github.com/davidmigloz/langchain_dart/commit/f42ed0f04136021b30556787cfdea13a14ca5768))

## 0.3.1

 - **FEAT**: Add support for min_p in Ollama ([#512](https://github.com/davidmigloz/langchain_dart/issues/512)). ([e40d54b2](https://github.com/davidmigloz/langchain_dart/commit/e40d54b2e729d8fb6bf14bb4ea97820121bc85c7))
 - **FEAT**: Add copyWith method to all RunnableOptions subclasses ([#531](https://github.com/davidmigloz/langchain_dart/issues/531)). ([42c8d480](https://github.com/davidmigloz/langchain_dart/commit/42c8d480041e7ca331e4928c46536037c06dbff0))

## 0.3.0

 - **FEAT**: Add tool calling support in ChatOllama ([#505](https://github.com/davidmigloz/langchain_dart/issues/505)). ([6ffde204](https://github.com/davidmigloz/langchain_dart/commit/6ffde2043c1e865411c8b1096063619d6bcd80aa))
 - **BREAKING** **FEAT**: Update Ollama default model to llama-3.1 ([#506](https://github.com/davidmigloz/langchain_dart/issues/506)). ([b1134bf1](https://github.com/davidmigloz/langchain_dart/commit/b1134bf1163cdcea26a9f1e65fee5c515be3857c))
 - **FEAT**: Implement additive options merging for cascade bind calls ([#500](https://github.com/davidmigloz/langchain_dart/issues/500)). ([8691eb21](https://github.com/davidmigloz/langchain_dart/commit/8691eb21d5d2ffbf853997cbc0eaa29a56c6ca43))
 - **REFACTOR**: Remove default model from the language model options ([#498](https://github.com/davidmigloz/langchain_dart/issues/498)). ([44363e43](https://github.com/davidmigloz/langchain_dart/commit/44363e435778282ed27bc1b2771cf8b25abc7560))
 - **REFACTOR**: Depend on exact versions for internal 1st party dependencies ([#484](https://github.com/davidmigloz/langchain_dart/issues/484)). ([244e5e8f](https://github.com/davidmigloz/langchain_dart/commit/244e5e8f30e0d9a642fe01a804cc0de5e807e13d))
 - **DOCS**: Update Ollama request options default values in API docs ([#479](https://github.com/davidmigloz/langchain_dart/issues/479)). ([e1f93366](https://github.com/davidmigloz/langchain_dart/commit/e1f9336619ee12624a7b045ca18a3118ead0158f))

## 0.2.2+1

 - **DOCS**: Update ChatOllama API docs. ([cc4246c8](https://github.com/davidmigloz/langchain_dart/commit/cc4246c8ab907de2c82843bff145edfffe32d302))

## 0.2.2

 - **FEAT**: Add Runnable.close() to close any resources associated with it ([#439](https://github.com/davidmigloz/langchain_dart/issues/439)). ([4e08cced](https://github.com/davidmigloz/langchain_dart/commit/4e08cceda964921178061e9721618a1505198ff5))

## 0.2.1+1

 - Update a dependency to the latest release.

## 0.2.1

 - **FEAT**: Handle finish reason in ChatOllama ([#416](https://github.com/davidmigloz/langchain_dart/issues/416)). ([a5e1af13](https://github.com/davidmigloz/langchain_dart/commit/a5e1af13ef4d2db690ab599dbf5e42f28659a059))
 - **FEAT**: Add keepAlive option to OllamaEmbeddings ([#415](https://github.com/davidmigloz/langchain_dart/issues/415)). ([32e19028](https://github.com/davidmigloz/langchain_dart/commit/32e19028a7e19ef5fc32a410061eb85bc6e27c39))
 - **FEAT**: Update Ollama default model from llama2 to llama3 ([#417](https://github.com/davidmigloz/langchain_dart/issues/417)). ([9d30b1a1](https://github.com/davidmigloz/langchain_dart/commit/9d30b1a1c811d73cfa27110b8c3c10b10da1801e))
 - **REFACTOR**: Remove deprecated Ollama options ([#414](https://github.com/davidmigloz/langchain_dart/issues/414)). ([861a2b74](https://github.com/davidmigloz/langchain_dart/commit/861a2b7430d33718340676ec2804a7aaccb2a08a))

## 0.2.0

> Note: This release has breaking changes.  
> If you are using "function calling" check [how to migrate to "tool calling"](https://github.com/davidmigloz/langchain_dart/issues/400).

 - **BREAKING** **FEAT**: Migrate from function calling to tool calling ([#400](https://github.com/davidmigloz/langchain_dart/issues/400)). ([44413b83](https://github.com/davidmigloz/langchain_dart/commit/44413b8321b1188ff6b4027b1972a7ee0002761e))

## 0.1.0+2

 - Update a dependency to the latest release.

## 0.1.0+1

 - Update a dependency to the latest release.

## 0.1.0

> Note: This release has breaking changes.  
> [Migration guide](https://github.com/davidmigloz/langchain_dart/discussions/374)

 - **BREAKING** **REFACTOR**: Introduce langchain_core and langchain_community packages ([#328](https://github.com/davidmigloz/langchain_dart/issues/328)). ([5fa520e6](https://github.com/davidmigloz/langchain_dart/commit/5fa520e663602d9cdfcab0c62a053090fa02b02e))
 - **BREAKING** **REFACTOR**: Simplify LLMResult and ChatResult classes ([#363](https://github.com/davidmigloz/langchain_dart/issues/363)). ([ffe539c1](https://github.com/davidmigloz/langchain_dart/commit/ffe539c13f92cce5f564107430163b44be1dfd96))
 - **BREAKING** **REFACTOR**: Simplify Output Parsers ([#367](https://github.com/davidmigloz/langchain_dart/issues/367)). ([f24b7058](https://github.com/davidmigloz/langchain_dart/commit/f24b7058949fba47ba624f071a3f548b8f6e915e))
 - **BREAKING** **REFACTOR**: Remove deprecated generate and predict APIs ([#335](https://github.com/davidmigloz/langchain_dart/issues/335)). ([c55fe50f](https://github.com/davidmigloz/langchain_dart/commit/c55fe50f0040cc04cbd2e90bca475887c093c654))
 - **REFACTOR**: Simplify internal .stream implementation ([#364](https://github.com/davidmigloz/langchain_dart/issues/364)). ([c83fed22](https://github.com/davidmigloz/langchain_dart/commit/c83fed22b2b89d5e51211984b12ec126a3ca225e))
 - **FEAT**: Implement .batch support ([#370](https://github.com/davidmigloz/langchain_dart/issues/370)). ([d254f929](https://github.com/davidmigloz/langchain_dart/commit/d254f929b03d9c950029e55c66831f9f89cc14a9))

## 0.0.4

 - **FEAT**: Add Ollama keep_alive param to control how long models stay loaded ([#319](https://github.com/davidmigloz/langchain_dart/issues/319)). ([3b86e227](https://github.com/davidmigloz/langchain_dart/commit/3b86e22788eb8df9c09b034c5acc98fdaa6b32c6))
 - **FEAT**: Update meta and test dependencies ([#331](https://github.com/davidmigloz/langchain_dart/issues/331)). ([912370ee](https://github.com/davidmigloz/langchain_dart/commit/912370ee0ba667ee9153303395a457e6caf5c72d))
 - **DOCS**: Update pubspecs. ([d23ed89a](https://github.com/davidmigloz/langchain_dart/commit/d23ed89adf95a34a78024e2f621dc0af07292f44))

## 0.0.3+3

 - **DOCS**: Update CHANGELOG.md. ([d0d46534](https://github.com/davidmigloz/langchain_dart/commit/d0d46534565d6f52d819d62329e8917e00bc7030))

## 0.0.3+2

 - Update a dependency to the latest release.

## 0.0.3+1

 - Update a dependency to the latest release.

## 0.0.3

 - **REFACTOR**: Use cl100k_base encoding model when no tokenizer is available ([#295](https://github.com/davidmigloz/langchain_dart/issues/295)). ([ca908e80](https://github.com/davidmigloz/langchain_dart/commit/ca908e8011a168a74240310c78abb3c590654a49))
 - **REFACTOR**: Make all LLM options fields nullable and add copyWith ([#284](https://github.com/davidmigloz/langchain_dart/issues/284)). ([57eceb9b](https://github.com/davidmigloz/langchain_dart/commit/57eceb9b47da42cf19f64ddd88bfbd2c9676fd5e))
 - **REFACTOR**: Migrate tokenizer to langchain_tiktoken package ([#285](https://github.com/davidmigloz/langchain_dart/issues/285)). ([6a3b6466](https://github.com/davidmigloz/langchain_dart/commit/6a3b6466e3e4cfddda2f506adbf2eb563814d02f))
 - **FEAT**: Update internal dependencies ([#291](https://github.com/davidmigloz/langchain_dart/issues/291)). ([69621cc6](https://github.com/davidmigloz/langchain_dart/commit/69621cc61659980d046518ee20ce055e806cba1f))

## 0.0.2+1

 - Update a dependency to the latest release.

## 0.0.2

 - **FEAT**: Migrate ChatOllama to Ollama chat API and add multi-modal support ([#279](https://github.com/davidmigloz/langchain_dart/issues/279)). ([c5de7e12](https://github.com/davidmigloz/langchain_dart/commit/c5de7e12d14c7095864879c604ccd814c51212cc))

## 0.0.1+3

 - Update a dependency to the latest release.

## 0.0.1+2

 - Update a dependency to the latest release.

## 0.0.1+1

 - **REFACTOR**: Minor changes in ChatOllama. ([725b8ff0](https://github.com/davidmigloz/langchain_dart/commit/725b8ff0dde5507378a6f2f54e5979f2f596aa2f))

## 0.0.1

 - **FEAT**: Add support for ChatOllama chat model ([#255](https://github.com/davidmigloz/langchain_dart/issues/255)). ([5b156910](https://github.com/davidmigloz/langchain_dart/commit/5b1569104a3e31fcba078e05b81e7a61b67a24dd))
 - **FEAT**: Add support for OllamaEmbeddings ([#254](https://github.com/davidmigloz/langchain_dart/issues/254)). ([b69701c7](https://github.com/davidmigloz/langchain_dart/commit/b69701c720ba63269ca3541881df4afa4c75504b))
 - **FEAT**: Add support for Ollama LLM ([#253](https://github.com/davidmigloz/langchain_dart/issues/253)). ([23362fdd](https://github.com/davidmigloz/langchain_dart/commit/23362fddf06c056fb2f497a6d1d1648e21895eb8))
 - **DOCS**: Update Ollama docs. ([8161f6c9](https://github.com/davidmigloz/langchain_dart/commit/8161f6c99a6d5169e6df48bb0cfc95374ec4c664))

## 0.0.1-dev.1

- Bootstrap project.
