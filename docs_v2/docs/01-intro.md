---
sidebar_position: 0
sidebar_class_name: hidden
---

# Introduction

Build Dart/Flutter applications powered by Large Language Models. 

## What is LangChain.dart?

LangChain.dart is an unofficial Dart port of the popular [LangChain](https://github.com/hwchase17/langchain) Python framework created by [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118). LangChain is a framework for developing applications that are powered by large language models (LLMs).

It comes with a set of components that make working with LLMs easy. 
The components can be grouped into a few core modules:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

- 📃 **Model I/O:** LangChain offers a unified API for interacting with various LLM providers (e.g. OpenAI, Google, Mistral, Ollama, etc.), allowing developers to switch between them with ease. Additionally, it provides tools for managing model inputs (prompt templates and example selectors) and parsing the resulting model outputs (output parsers).
- 📚 **Retrieval:** assists in loading user data (via document loaders), transforming it (with text splitters), extracting its meaning (using embedding models), storing (in vector stores) and retrieving it (through retrievers) so that it can be used to ground the model's responses (i.e. Retrieval-Augmented Generation or RAG). 
- 🤖 **Agents:** "bots" that leverage LLMs to make informed decisions about which available tools (such as web search, calculators, database lookup, etc.) to use to accomplish the designated task.

The different components can be composed together using the [LangChain Expression Language (LCEL)](https://langchaindart.dev/#/expression_language/get_started).

## Motivation

Large Language Models (LLMs) have revolutionized Natural Language Processing (NLP), serving as essential components in a wide range of applications, such as question-answering, summarization, translation, and text generation.

The adoption of LLMs is creating a new tech stack in its wake. However, emerging libraries and tools are predominantly being developed for the Python and JavaScript ecosystems. As a result, the number of applications leveraging LLMs in these ecosystems has grown exponentially.

In contrast, the Dart / Flutter ecosystem has not experienced similar growth, which can likely be attributed to the scarcity of Dart and Flutter libraries that streamline the complexities associated with working with LLMs.

LangChain.dart aims to fill this gap by abstracting the intricacies of working with LLMs in Dart and Flutter, enabling developers to harness their combined potential effectively.

## Packages

LangChain.dart has a modular design that allows developers to import only the components they need. The ecosystem consists of several packages:

### [`langchain_core`](https://pub.dev/packages/langchain_core)

Contains only the core abstractions as well as LangChain Expression Language as a way to compose them together. 

> Depend on this package to build frameworks on top of LangChain.dart or to interoperate with it.

### [`langchain`](https://pub.dev/packages/langchain)

Contains higher-level and use-case specific chains, agents, and retrieval algorithms that are at the core of the application's cognitive architecture.

> Depend on this package to build LLM applications with LangChain.dart.  
> 
> This package exposes `langchain_core` so you don't need to depend on it explicitly.

### [`langchain_community`](https://pub.dev/packages/langchain_community)

Contains third-party integrations and community-contributed components that are not part of the core LangChain.dart API.

> Depend on this package if you want to use any of the integrations or components it provides.

### Integration-specific packages

Popular third-party integrations (e.g. [`langchain_openai`](https://pub.dev/packages/langchain_openai), [`langchain_google`](https://pub.dev/packages/langchain_google), [`langchain_ollama`](https://pub.dev/packages/langchain_ollama), etc.) are moved to their own packages so that they can be imported independently without depending on the entire `langchain_community` package.

> Depend on an integration-specific package if you want to use the specific integration.


## Getting started

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file. Also, include the dependencies for the specific integrations you want to use (e.g.`langchain_community`, `langchain_openai`, `langchain_google`, etc.):

```yaml
dependencies:
  langchain: {version}
  langchain_community: {version}
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

// 2. Define the retrieval chain
final retriever = vectorStore.asRetriever();
final setupAndRetrieval = Runnable.fromMap<String>({
  'context': retriever.pipe(
    Runnable.mapInput((docs) => docs.map((d) => d.pageContent).join('\n')),
  ),
  'question': Runnable.passthrough(),
});

// 3. Construct a RAG prompt template
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

// 4. Define the final chain
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();
final chain = setupAndRetrieval
    .pipe(promptTemplate)
    .pipe(model)
    .pipe(outputParser);

// 5. Run the pipeline
final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// David created LangChain.dart
```

## Documentation

- [LangChain.dart documentation](https://langchaindart.dev)
- [Sample apps](https://github.com/davidmigloz/langchain_dart/tree/main/examples)
- [LangChain.dart blog](https://blog.langchaindart.dev)
- [Project board](https://github.com/users/davidmigloz/projects/2/views/1)

## Community

Stay up-to-date on the latest news and updates on the field, have great discussions, and get help in the official [LangChain.dart Discord server](https://discord.gg/x4qbhqecVR).

[![LangChain.dart Discord server](https://invidget.switchblade.xyz/x4qbhqecVR?theme=light)](https://discord.gg/x4qbhqecVR)

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
