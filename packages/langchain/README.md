# 🦜️🔗 LangChain.dart

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Build powerful LLM-based Dart/Flutter applications.

## What is LangChain.dart?

LangChain.dart is a Dart port of the popular [LangChain](https://github.com/hwchase17/langchain) Python framework created by [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118).

LangChain provides a set of ready-to-use components for working with language models and the concept of chains, which allows to "chain" components together to formulate more advanced use cases around LLMs.

The components can be grouped into a few core modules:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

- 📃 **Model I/O:** streamlines the interaction between the model inputs (prompt templates), the Language Model (abstracting different providers under a unified API), and the model output (output parsers).
- 📚 **Retrieval:** assists in loading user data (document loaders), transforming (document transformers and embedding models), storing (vector stores), and retrieving it when needed (retrievers).
- 🤖 **Agents:** "bots" that harness LLMs to perform tasks. They serve as the link between LLM and the tools (web search, calculators, database lookup, etc.). They determine what has to be accomplished and the tools that are more suitable for the specific task.

The different components can be composed together using the LangChain Expression Language (LCEL).

## Motivation

Large Language Models (LLMs) have revolutionized Natural Language Processing (NLP), serving as essential components in a wide range of applications, such as question-answering, summarization, translation, and text generation.

The adoption of LLMs is creating a new tech stack in its wake. However, emerging libraries and tools are predominantly being developed for the Python and JavaScript ecosystems. As a result, the number of applications leveraging LLMs in these ecosystems has grown exponentially.

In contrast, the Dart / Flutter ecosystem has not experienced similar growth, which can likely be attributed to the scarcity of Dart and Flutter libraries that streamline the complexities associated with working with LLMs.

LangChain.dart aims to fill this gap by abstracting the intricacies of working with LLMs in Dart and Flutter, enabling developers to harness their combined potential effectively.

## Packages

LangChain.dart has a modular design where the core [langchain](https://pub.dev/packages/langchain) package provides the LangChain API and each 3rd party integration with a model provider, database, etc. is provided by a separate package.

| Package                                                             | Version                                                                      | Description                                                                                                                                                 |
|---------------------------------------------------------------------|------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [langchain](https://pub.dev/packages/langchain)                     | ![langchain](https://img.shields.io/pub/v/langchain.svg)                     | Core LangChain API (base components abstraction, logic for chaining them (LCEL), etc.)                                                                      |
| [langchain_openai](https://pub.dev/packages/langchain_openai)       | ![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)       | OpenAI integration (GPT-3.5, GPT-4, Embeddings, Functions, Vision, DALL·E 3, etc.) and OpenAI Compatible services (Together AI, Anyscale, OpenRouter, etc.) |
| [langchain_google](https://pub.dev/packages/langchain_google)       | ![langchain_google](https://img.shields.io/pub/v/langchain_google.svg)       | Google integration (GoogleAI, VertexAI, Gemini, PaLM 2, Embeddings, Vector Search, etc.)                                                                    |
| [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | ![langchain_ollama](https://img.shields.io/pub/v/langchain_ollama.svg)       | Ollama integration (Llama 2, Code Llama, Mistral, LLaVA, Phi, Vicuna, Orca, Starling, etc.)                                                                 |
| [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) | ![langchain_mistralai](https://img.shields.io/pub/v/langchain_mistralai.svg) | Mistral AI integration (Mistral-7B, Mixtral 8x7B, embeddings, etc.).                                                                                        |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)   | ![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)   | Pinecone vector database integration                                                                                                                        |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)       | ![langchain_chroma](https://img.shields.io/pub/v/langchain_chroma.svg)       | Chroma vector database integration                                                                                                                          |
| [langchain_supabase](https://pub.dev/packages/langchain_supabase)   | ![langchain_supabase](https://img.shields.io/pub/v/langchain_supabase.svg)   | Supabase Vector database integration                                                                                                                        |

Functionality provided by each package:

| Package                                                             | LLMs | Chat models | Embeddings | Vector stores | Chains | Agents | Tools |
|---------------------------------------------------------------------|------|-------------|------------|---------------|--------|--------|-------|
| [langchain](https://pub.dev/packages/langchain)                     | ★    | ★           | ★          | ★             | ★      | ★      | ★     |
| [langchain_openai](https://pub.dev/packages/langchain_openai)       | ✔    | ✔           | ✔          |               | ✔      | ✔      | ✔     |
| [langchain_google](https://pub.dev/packages/langchain_google)       | ✔    | ✔           | ✔          | ✔             |        |        |       |
| [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | ✔    | ✔           | ✔          |               |        |        |       |
| [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) |      | ✔           | ✔          |               |        |        |       |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)   |      |             |            | ✔             |        |        |       |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)       |      |             |            | ✔             |        |        |       |
| [langchain_supabase](https://pub.dev/packages/langchain_supabase)   |      |             |            | ✔             |        |        |       |

The following packages are maintained (and used internally) by LangChain.dart, although they can also be used independently:

| Package                                                   | Version                                                                                                       | Description                                   | 
|-----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| [chromadb](https://pub.dev/packages/chromadb)             | [![chromadb](https://img.shields.io/pub/v/chromadb.svg)](https://pub.dev/packages/chromadb)                   | Chroma DB API client                          |
| [googleai_dart](https://pub.dev/packages/googleai_dart)   | [![googleai_dart](https://img.shields.io/pub/v/googleai_dart.svg)](https://pub.dev/packages/googleai_dart)    | Google AI for Developers (Gemini API) client  |
| [mistralai_dart](https://pub.dev/packages/mistralai_dart) | [![mistralai_dart](https://img.shields.io/pub/v/mistralai_dart.svg)](https://pub.dev/packages/mistralai_dart) | Mistral AI API client                         |
| [ollama_dart](https://pub.dev/packages/ollama_dart)       | [![ollama_dart](https://img.shields.io/pub/v/ollama_dart.svg)](https://pub.dev/packages/ollama_dart)          | Ollama API client                             |
| [openai_dart](https://pub.dev/packages/openai_dart)       | [![openai_dart](https://img.shields.io/pub/v/openai_dart.svg)](https://pub.dev/packages/openai_dart)          | OpenAI API client                             |
| [vertex_ai](https://pub.dev/packages/vertex_ai)           | [![vertex_ai](https://img.shields.io/pub/v/vertex_ai.svg)](https://pub.dev/packages/vertex_ai)                | GCP Vertex AI API client                      |

## Getting started

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file. Also, include the dependencies for the specific integrations you want to use (e.g.`langchain_openai` or `langchain_google`):

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
  langchain_google: {version}
  ...
```

The most basic building block of LangChain.dart is calling an LLM on some prompt. LangChain.dart provides a unified interface for calling different LLMs. For example, we can use `ChatGoogleGenerativeAI` to call Google's Gemini model:

```dart
final model = ChatGoogleGenerativeAI(apiKey: googleApiKey);
final prompt = PromptValue.string('Hello world!');
final result = await model.invoke(prompt);
// Hello everyone! I'm new here and excited to be part of this community.
```

But the power of LangChain.dart comes from chaining together multiple components to implement complex use cases. For example, a RAG (Retrieval-Augmented Generation) pipeline that would accept a user query, retrieve relevant documents from a vector store, format them using prompt templates, invoke the model, and parse the output:

```dart
// 1. Create a vector store and add documents to it
final vectorStore = MemoryVectorStore(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
);
await vectorStore.addDocuments(
  documents: [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
  ],
);

// 2. Construct a RAG prompt template
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

// 3. Create a Runnable that combines the retrieved documents into a single string
final docCombiner = Runnable.fromFunction<List<Document>, String>((docs, _) {
  return docs.map((d) => d.pageContent).join('\n');
});

// 4. Define the RAG pipeline
final chain = Runnable.fromMap<String>({
  'context': vectorStore.asRetriever().pipe(docCombiner),
  'question': Runnable.passthrough(),
})
    .pipe(promptTemplate)
    .pipe(ChatOpenAI(apiKey: openaiApiKey))
    .pipe(StringOutputParser());

// 5. Run the pipeline
final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// David created LangChain.dart
```

## Documentation

- [LangChain.dart documentation](https://langchaindart.com)
- [Sample apps](https://github.com/davidmigloz/langchain_dart/tree/main/examples)
- [LangChain.dart blog](https://blog.langchaindart.com)
- [Project board](https://github.com/users/davidmigloz/projects/2/views/1)

## Community

Stay up-to-date on the latest news and updates on the field, have great discussions, and get help in the official [LangChain.dart Discord server](https://discord.gg/x4qbhqecVR).

[![LangChain.dart Discord server](https://invidget.switchblade.xyz/x4qbhqecVR?theme=light)](http://discord.gg/x4qbhqecVR)

## Contribute

| 📢 **Call for Collaborators** 📢                                        |
|-------------------------------------------------------------------------|
| We are looking for collaborators to join the core group of maintainers. |

New contributors welcome! Check out our [Contributors Guide](https://github.com/davidmigloz/langchain_dart/blob/main/CONTRIBUTING.md) for help getting started.

Join us on [Discord](https://discord.gg/x4qbhqecVR) to meet other maintainers. We'll help you get your first contribution in no time!

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
