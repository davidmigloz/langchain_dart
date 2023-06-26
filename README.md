# 🦜️🔗 LangChain.dart

[![Test](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml/badge.svg)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Build powerful LLM-based Dart/Flutter applications.

| 🚧 **Early Stage of Development** 🚧                                                                                                                              | 📢 **Call for Collaborators** 📢                                        |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Please note that this project is in a very early stage of development. We are still working on the initial version and there may be bugs and incomplete features. | We are looking for collaborators to join the core group of maintainers. |

## What is LangChain.dart?

LangChain.dart is a Dart port of the popular [LangChain](https://github.com/hwchase17/langchain) 
Python framework created by [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118).

LangChain provides a set of ready-to-use components for working with language models and the 
concept of chains, which allows to "chain" components together to formulate more advanced use cases 
around LLMs.

The components can be grouped into a few core modules:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

## Motivation

Large Language Models (LLMs) have revolutionized Natural Language Processing (NLP), serving as 
essential components in a wide range of applications, such as question-answering, summarization, 
translation, and text generation.

The adoption of LLMs is creating a new tech stack in its wake. However, most emerging libraries and 
tools are being predominantly developed for the Python and JavaScript ecosystems. As a result, the 
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

| Package                                                                 | Version                                                                                                                            | Description                                       | Models | Doc. loaders | Memory | Tools |
|-------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------|--------|--------------|--------|-------|
| [langchain](https://pub.dev/packages/langchain)                         | [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)                                     | The core package that provides the LangChain API. | 🟢     | 🟢           | 🟢     | 🟢    |
| [langchain_amazon](https://pub.dev/packages/langchain_amazon)           | [![langchain_amazon](https://img.shields.io/pub/v/langchain_amazon.svg)](https://pub.dev/packages/langchain_amazon)                | Integration with Amazon.                          |        |              |        |       |
| [langchain_anthropic](https://pub.dev/packages/langchain_anthropic)     | [![langchain_anthropic](https://img.shields.io/pub/v/langchain_anthropic.svg)](https://pub.dev/packages/langchain_anthropic)       | Integration with Anthropic.                       |        |              |        |       |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)           | [![langchain_chroma](https://img.shields.io/pub/v/langchain_chroma.svg)](https://pub.dev/packages/langchain_chroma)                | Integration with Chroma.                          |        |              |        |       |
| [langchain_cohere](https://pub.dev/packages/langchain_cohere)           | [![langchain_cohere](https://img.shields.io/pub/v/langchain_cohere.svg)](https://pub.dev/packages/langchain_cohere)                | Integration with Cohere.                          |        |              |        |       |
| [langchain_google](https://pub.dev/packages/langchain_google)           | [![langchain_google](https://img.shields.io/pub/v/langchain_google.svg)](https://pub.dev/packages/langchain_google)                | Integration with Google.                          |        |              |        |       |
| [langchain_huggingface](https://pub.dev/packages/langchain_huggingface) | [![langchain_huggingface](https://img.shields.io/pub/v/langchain_huggingface.svg)](https://pub.dev/packages/langchain_huggingface) | Integration with Hugging Face.                    |        |              |        |       |
| [langchain_microsoft](https://pub.dev/packages/langchain_microsoft)     | [![langchain_microsoft](https://img.shields.io/pub/v/langchain_microsoft.svg)](https://pub.dev/packages/langchain_microsoft)       | Integration with Microsoft.                       |        |              |        |       |
| [langchain_openai](https://pub.dev/packages/langchain_openai)           | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)                | Integration with OpenAI.                          | ✅      |              |        |       |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)       | [![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)](https://pub.dev/packages/langchain_pinecone)          | Integration with Pinecone.                        |        |              |        |       |
| [langchain_supabase](https://pub.dev/packages/langchain_supabase)       | [![langchain_supabase](https://img.shields.io/pub/v/langchain_supabase.svg)](https://pub.dev/packages/langchain_supabase)          | Integration with Supabase.                        |        |              |        |       |
| [langchain_weaviate](https://pub.dev/packages/langchain_weaviate)       | [![langchain_weaviate](https://img.shields.io/pub/v/langchain_weaviate.svg)](https://pub.dev/packages/langchain_weaviate)          | Integration with Weaviate.                        |        |              |        |       |
| [langchain_wikipedia](https://pub.dev/packages/langchain_wikipedia)     | [![langchain_wikipedia](https://img.shields.io/pub/v/langchain_wikipedia.svg)](https://pub.dev/packages/langchain_wikipedia)       | Integration with Wikipedia.                       |        |              |        |       |
| [langchain_wolfram](https://pub.dev/packages/langchain_wolfram)         | [![langchain_wolfram](https://img.shields.io/pub/v/langchain_wolfram.svg)](https://pub.dev/packages/langchain_wolfram)             | Integration with Wolfram Research.                |        |              |        |       |
| [langchain_zapier](https://pub.dev/packages/langchain_zapier)           | [![langchain_zapier](https://img.shields.io/pub/v/langchain_zapier.svg)](https://pub.dev/packages/langchain_zapier)                | Integration with Zapier.                          |        |              |        |       |

## Getting started

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file.
Also, include the dependencies for the specific integrations you want to use
(e.g.`langchain_openai`):

```yaml
dependencies:
  langchain: { version }
  langchain_openai: { version }
```

The most basic building block of LangChain is calling an LLM on some input:

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
final result = await llm('Hello world!');
```

## Docs

- [LangChain conceptual guide](https://docs.langchain.com/docs)
- [LangChain.dart documentation](https://langchaindart.com)
- [Sample apps](https://github.com/davidmigloz/langchain_dart/tree/main/examples)

## Contribute

TODO

## Related projects

- [LangChain](https://github.com/hwchase17/langchain): The official Python LangChain project.
- [LangChain.js](https://github.com/hwchase17/langchainjs): A JavaScript port of LangChain.
- [LangChain.go](https://github.com/tmc/langchaingo): A Go port of LangChain.
- [LangChain.rb](https://github.com/andreibondarev/langchainrb): A Ruby port of LangChain.

## License

LangChain.dart is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
