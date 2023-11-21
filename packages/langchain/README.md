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
- 📚 **Retrieval:** assists in loading user data (document loaders), modifying it (document
  transformers and embedding models), storing (vector stores), and retrieving when needed
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

| Package                                                           | Version                                                                                                                   | Description                                                | Models | Data conn. | Chains | Agents & Tools |
|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|--------|------------|--------|----------------|
| [langchain](https://pub.dev/packages/langchain)                   | [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)                            | Core LangChain API                                         | ★      | ★          | ★      | ★              |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)     | [![langchain_chroma](https://img.shields.io/pub/v/langchain_chroma.svg)](https://pub.dev/packages/langchain_chroma)       | Chroma DB integration                                      |        | ✔          |        |                |
| [langchain_google](https://pub.dev/packages/langchain_google)     | [![langchain_google](https://img.shields.io/pub/v/langchain_google.svg)](https://pub.dev/packages/langchain_google)       | Google integration (VertexAI, PaLM, Matching Engine, etc.) | ✔      | ✔          |        |                |
| [langchain_openai](https://pub.dev/packages/langchain_openai)     | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)       | OpenAI integration (GPT-3, GPT-4, Functions, Vision, etc.) | ✔      | ✔          | ✔      | ✔              |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone) | [![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)](https://pub.dev/packages/langchain_pinecone) | Pinecone DB integration                                    |        | ✔          |        |                |

The following packages are maintained (and used internally) by LangChain.dart,
although they can also be used independently:

| Package                                             | Version                                                                                              | Description              | 
|-----------------------------------------------------|------------------------------------------------------------------------------------------------------|--------------------------|
| [chromadb](https://pub.dev/packages/chromadb)       | [![chromadb](https://img.shields.io/pub/v/chromadb.svg)](https://pub.dev/packages/chromadb)          | Chroma DB API client     |
| [ollama_dart)https://pub.dev/packages/ollama_dart)  | [![ollama_dart](https://img.shields.io/pub/v/ollama_dart.svg)](https://pub.dev/packages/ollama_dart) | Ollama API client        |
| [openai_dart](https://pub.dev/packages/openai_dart) | [![openai_dart](https://img.shields.io/pub/v/openai_dart.svg)](https://pub.dev/packages/openai_dart) | OpenAI API client        |
| [vertex_ai](https://pub.dev/packages/vertex_ai)     | [![vertex_ai](https://img.shields.io/pub/v/vertex_ai.svg)](https://pub.dev/packages/vertex_ai)       | GCP Vertex AI API client |

## Getting started

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file.
Also, include the dependencies for the specific integrations you want to use
(e.g.`langchain_openai`):

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
```

The most basic building block of LangChain.dart is calling an LLM on some input:

```dart
final llm = OpenAI(apiKey: openaiApiKey);
final result = await llm('Hello world!');
// Hello everyone! I'm new here and excited to be part of this community.
```

But you can build complex pipelines by chaining together multiple components:

```dart
final promptTemplate1 = ChatPromptTemplate.fromTemplate(
  'What is the city {person} is from? Only respond with the name of the city.',
);
final promptTemplate2 = ChatPromptTemplate.fromTemplate(
  'What country is the city {city} in? Respond in {language}.',
);

final model = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser();

final chain = Runnable.fromMap({
  'city': promptTemplate1 | model | stringOutputParser,
  'language': Runnable.getItemFromMap('language'),
}) |
promptTemplate2 |
model |
stringOutputParser;

final res = await chain.invoke({
'person': 'Rafael Nadal',
'language': 'Spanish',
});
print(res);
// La ciudad de Manacor se encuentra en España.
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

- [LangChain](https://github.com/langchain-ai/langchain): The original Python LangChain project.
- [LangChain.js](https://github.com/langchain-ai/langchainjs): A JavaScript port of LangChain.
- [LangChain.go](https://github.com/tmc/langchaingo): A Go port of LangChain.
- [LangChain.rb](https://github.com/andreibondarev/langchainrb): A Ruby port of LangChain.

## Sponsors

<p align="center">
  <a href="https://github.com/sponsors/davidmigloz">
    <img src='https://raw.githubusercontent.com/davidmigloz/sponsors/main/sponsors.svg'/>
  </a>
</p>

## License

LangChain.dart is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
