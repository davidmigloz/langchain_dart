# 🦜️🔗 LangChain.dart

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Build powerful LLM-based Dart/Flutter applications.

## What is LangChain.dart?

> Check out the announcement post: [Introducing LangChain.dart 🦜️🔗](https://blog.langchaindart.com/introducing-langchain-dart-6b1d34fc41ef)

LangChain.dart is a Dart port of the popular [LangChain](https://github.com/hwchase17/langchain)
Python framework created by [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118).

LangChain provides a set of ready-to-use components for working with language models and the
concept of chains, which allows to "chain" components together to formulate more advanced use cases
around LLMs.

The components can be grouped into a few core modules:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

- 📃 **Model I/O:** streamlines the interaction between the model inputs (prompt templates), the
  Language Model (abstracting different providers), and the model output (output parsers).
- 📚 **Data Connection:** assists in loading user data (document loaders), modifying it (document
  transformers), storing (via text embedding models and vector stores), and retrieving when needed
  (retrievers).
- 🔗 **Chains:** a way to compose multiple components or other chains into a single pipeline.
- 🧠 **Memory:** equips chains or agents with both short-term and long-term memory capabilities,
  facilitating recall of prior interactions with the user.
- 🤖 **Agents:** "Bots" that harness LLMs to perform tasks. They serve as the link between LLM and the
  tools (web search, calculators, database lookup, etc.). They determine what has to be
  accomplished and the tools that are more suitable for the specific task.

## Motivation

Large Language Models (LLMs) have revolutionized Natural Language Processing (NLP), serving as
essential components in a wide range of applications, such as question-answering, summarization,
translation, and text generation.

The adoption of LLMs is creating a new tech stack in its wake. However, emerging libraries and
tools are predominantly being developed for the Python and JavaScript ecosystems. As a result, the
number of applications leveraging LLMs in these ecosystems has grown exponentially.

In contrast, the Dart / Flutter ecosystem has not experienced similar growth, which can likely be
attributed to the scarcity of Dart and Flutter libraries that streamline the complexities
associated with working with LLMs.

LangChain.dart aims to fill this gap by abstracting the intricacies of working with LLMs in Dart
and Flutter, enabling developers to harness their combined potential effectively.

## Packages

LangChain.dart has a modular design where the core [langchain](https://pub.dev/packages/langchain)
package provides the LangChain API and each integration with a model provider, data store, etc. is
provided by a separate package.

| Package                                                       | Version                                                                                                             | Description        | Models | Data conn. | Memory | Agents & Tools |
|---------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------------------|--------|------------|--------|----------------|
| [langchain](https://pub.dev/packages/langchain)               | [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)                      | Core LangChain API | ★      | ★          | ★      | ★              |
| [langchain_openai](https://pub.dev/packages/langchain_openai) | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai) | OpenAI integration | ✔      | ✔          |        | ✔              |

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
final llm = OpenAI(apiKey: openaiApiKey);
final result = await llm('Hello world!');
```

## Documentation

- [LangChain conceptual guide](https://docs.langchain.com/docs)
- [LangChain.dart documentation](https://langchaindart.com)
- [Sample apps](https://github.com/davidmigloz/langchain_dart/tree/main/examples)
- [LangChain.dart blog](https://blog.langchaindart.com)
- [Project board](https://github.com/users/davidmigloz/projects/2/views/1)

## Support

Having trouble? Get help in the official [LangChain.dart Discord](https://discord.gg/x4qbhqecVR).

## Contribute

| 📢 **Call for Collaborators** 📢                                        |
|-------------------------------------------------------------------------|
| We are looking for collaborators to join the core group of maintainers. |

New contributors welcome! Check out our
[Contributors Guide](https://github.com/davidmigloz/langchain_dart/blob/main/CONTRIBUTING.md) for
help getting started.

Join us on [Discord](https://discord.gg/x4qbhqecVR) to meet other maintainers. We'll help you get
your first contribution in no time!

## Related projects

- [LangChain](https://github.com/hwchase17/langchain): The original Python LangChain project.
- [LangChain.js](https://github.com/hwchase17/langchainjs): A JavaScript port of LangChain.
- [LangChain.go](https://github.com/tmc/langchaingo): A Go port of LangChain.
- [LangChain.rb](https://github.com/andreibondarev/langchainrb): A Ruby port of LangChain.

## License

LangChain.dart is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
