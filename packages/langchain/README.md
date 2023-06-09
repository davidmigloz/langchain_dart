# 🦜️🔗 LangChain.dart

Build powerful LLM-based Dart/Flutter applications.

| 🚧 **Early Stage of Development** 🚧                                                                                                                              | 📢 **Call for Collaborators** 📢                                        |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Please note that this project is in a very early stage of development. We are still working on the initial version and there may be bugs and incomplete features. | We are looking for collaborators to join the core group of maintainers. |

## What is LangChain.dart?

LangChain.dart is a Dart port of [LangChain](https://github.com/hwchase17/langchain).

## Motivation

Large Language Models (LLMs) have revolutionized Natural Language Processing (NLP), serving as
essential components in a wide range of applications, such as question answering, summarization,
translation, and text generation.

Notably, most libraries and tools designed to support LLMs have been predominantly developed for
the Python and JavaScript ecosystems. As a result, the number of Python and JavaScript applications
leveraging LLMs has grown exponentially.

In contrast, the Dart / Flutter ecosystem has not experienced similar growth, which can likely be
attributed to the scarcity of Dart and Flutter libraries that streamline the complexities associated
with working with LLMs.

Flutter provides a unique technology that enables the rapid development of high-quality, natively
compiled applications for mobile, web, desktop, and embedded devices from a single codebase, making
it an ideal choice for building these types of applications.

LangChain.dart aims to fill this gap by abstracting the complexities of working with LLMs in Dart,
enabling developers to harness the combined potential of both Flutter and LLMs effectively.

## Packages

LangChain.dart has a modular design where the core [langchain](https://pub.dev/packages/langchain)
package provides the LangChain API and each integration with a model provider, data store, etc. is
provided by a separate package.



| Package                                                           | Version                                                                                                                   | Description                                       |
|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| [langchain](https://pub.dev/packages/langchain)                   | [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)                            | The core package that provides the LangChain API. |
| [langchain_openai](https://pub.dev/packages/langchain_openai)     | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)       | LangChain integration with OpenAI.                |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone) | [![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)](https://pub.dev/packages/langchain_pinecone) | LangChain integration with Pinecone.              | 

## Getting started

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file.
Also, include the dependencies for the specific integrations you want to use
(e.g.`langchain_openai`):

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
```

The most basic building block of LangChain is calling an LLM on some input:

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
final result = await llm('Hello world!');
```

## Docs

You can find the full documentation at [langchaindart.com](https://langchaindart.com/#/).
- Getting started (installation, setting up the environment, simple examples)
- How-To examples (demos, integrations, helper functions)
- Reference (full API docs)
- Resources (high-level explanation of core concepts)

## Contribute

TODO

## Related projects

- [LangChain](https://github.com/hwchase17/langchain): The official Python LangChain project.
- [LangChain.js](https://github.com/hwchase17/langchainjs): A JavaScript port of LangChain.
- [LangChain.go](https://github.com/tmc/langchaingo): A Go port of LangChain.
- [LangChain.rb](https://github.com/andreibondarev/langchainrb): A Ruby port of LangChain.

## License

LangChain.dart is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
