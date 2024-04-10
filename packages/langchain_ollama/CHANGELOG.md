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
