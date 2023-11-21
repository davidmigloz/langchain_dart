# 🦜️🔗 LangChain.dart / OpenAI

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

OpenAI module for [LangChain.dart](https://github.com/davidmigloz/langchain_dart).

## Features

- LLMs:
  * `OpenAI`: wrapper around OpenAI Completions API.
- Chat models:
  * `ChatOpenAI`: wrapper around OpenAI Chat API.
- Embeddings:
  * `OpenAIEmbeddings`: wrapper around OpenAI Embeddings API.
- Chains:
  * `OpenAIQAWithStructureChain` a chain that answer questions in the specified 
    structure.
  * `OpenAIQAWithSourcesChain`: a chain that answer questions providing sources.
- Agents:
  * `OpenAIFunctionsAgent`: an agent driven by OpenAIs Functions powered API.
- Tools:
  * `OpenAIDallETool`: a tool that uses DallE to generate images from text.

## License

LangChain.dart is licensed under the
[MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
