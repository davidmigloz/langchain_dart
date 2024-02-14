# 🦜️🔗 LangChain.dart Core

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain_core](https://img.shields.io/pub/v/langchain_core.svg)](https://pub.dev/packages/langchain_core)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

## What is it?

LangChain.dart Core contains the base abstractions that power the rest of the [LangChain.dart](https://github.com/davidmigloz/langchain_dart) ecosystem.

These abstractions are designed to be as modular and simple as possible. Examples of these abstractions include those for language models, document loaders, embedding models, vector stores, retrievers, and more.

The benefit of having these abstractions is that any provider can implement the required interface and then easily be used in the rest of the LangChain ecosystem.

For full documentation see the [API reference](https://pub.dev/documentation/langchain_core/latest/).

## Core Interface: Runnables

The concept of a Runnable is central to LangChain Core – it is the interface that most LangChain Core components implement, giving them

- a common invocation interface (invoke, batch, stream, etc.)
- built-in utilities for retries, fallbacks, schemas and runtime configurability

For more check out the [runnable docs](https://langchaindart.com/#/expression_language/interface). Examples of components that implement the interface include: LLMs, Chat Models, Prompts, Retrievers, Tools, Output Parsers.

You can use LangChain Core objects in two ways:

1. **imperative**, i.e. call them directly, eg. `model.invoke(...)`

2. **declarative**, with LangChain Expression Language (LCEL)

3. or a mix of both! eg. one of the steps in your LCEL sequence can be a custom function

## What is LangChain Expression Language?

LangChain Expression Language (LCEL) is a _declarative language_ for composing LangChain Core runnables into sequences (or DAGs), covering the most common patterns when building with LLMs.

LangChain Core compiles LCEL sequences to an _optimized execution plan_, with automatic parallelization, streaming, and tracing support.

For more check out the [LCEL docs](https://langchaindart.com/#/expression_language/interface).

![Diagram outlining the hierarchical organization of the LangChain.dart framework, displaying the interconnected parts across multiple layers.](https://python.langchain.com/assets/images/langchain_stack-f21828069f74484521f38199910007c1.svg "LangChain Framework Overview")

## Contributing

New contributors welcome! Check out our
[Contributors Guide](https://github.com/davidmigloz/langchain_dart/blob/main/CONTRIBUTING.md) for
help getting started.

Join us on [Discord](https://discord.gg/x4qbhqecVR) to meet other maintainers. We'll help you get
your first contribution in no time!


## Why build on top of LangChain Core?

The whole LangChain.dart ecosystem is built on top of LangChain Core, so you're in good company when building on top of it. Some of the benefits:

- **Modularity**: LangChain Core is designed around abstractions that are independent of each other, and not tied to any specific model provider.
- **Stability**: We are committed to a stable versioning scheme, and will communicate any breaking changes with advance notice and version bumps.
- **Battle-tested**: LangChain Core components have the largest install base in the LLM ecosystem, and are used in production by many companies.
- **Community**: LangChain Core is developed in the open, and we welcome contributions from the community.

## License

LangChain.dart is licensed under the
[MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
