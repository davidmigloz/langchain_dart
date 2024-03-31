# 🦜️🔗 LangChain.dart Core

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain_core](https://img.shields.io/pub/v/langchain_core.svg)](https://pub.dev/packages/langchain_core)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Core package for [LangChain.dart](https://github.com/davidmigloz/langchain_dart).

## What is LangChain.dart Core?

LangChain.dart Core contains the core abstractions that power the rest of the [LangChain.dart](https://github.com/davidmigloz/langchain_dart) ecosystem as well as LangChain Expression Language (LCEL) as a way to compose them together.

These abstractions are designed to be as modular and simple as possible. Examples of these abstractions include those for language models, document loaders, embedding models, vector stores, retrievers, etc.

LangChain Expression Language (LCEL) is a _declarative language_ for composing components (Runnables) into sequences (or DAGs), covering the most common patterns when building with LLMs.

> Depend on this package to build frameworks on top of LangChain.dart or to interoperate with it.

For full documentation see the [API reference](https://pub.dev/documentation/langchain_core/latest/).

![LangChain.dart packages](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain_packages.png)

## Why build on top of LangChain Core?

The whole LangChain.dart ecosystem is built on top of LangChain Core, so you're in good company when building on top of it. Some of the benefits:

- **Modularity**: LangChain Core is designed around abstractions that are independent of each other, and not tied to any specific model provider.
- **Stability**: We are committed to a stable versioning scheme, and will communicate any breaking changes with advance notice and version bumps.
- **Battle-tested**: LangChain Core components have the largest install base in the LLM ecosystem, and are used in production by many companies.
- **Community**: LangChain Core is developed in the open, and we welcome contributions from the community.

## License

LangChain.dart is licensed under the
[MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
