# 🦜️🔗 LangChain.dart

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
[![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)
[![Code Assist AI](https://img.shields.io/badge/AI-Code%20Assist-EB9FDA)](https://app.commanddash.io/agent?github=https://github.com/davidmigloz/langchain_dart)

Build LLM-powered Dart/Flutter applications.

## What is LangChain.dart?

LangChain.dart is an unofficial Dart port of the popular [LangChain](https://github.com/hwchase17/langchain) Python framework created by [Harrison Chase](https://www.linkedin.com/in/harrison-chase-961287118).

LangChain provides a set of ready-to-use components for working with language models and a standard interface for chaining them together to formulate more advanced use cases (e.g. chatbots, Q&A with RAG, agents, summarization, translation, extraction, recsys, etc.).

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

### [`langchain_core`](https://pub.dev/packages/langchain_core) [![langchain_core](https://img.shields.io/pub/v/langchain_core.svg)](https://pub.dev/packages/langchain_core)

Contains only the core abstractions as well as LangChain Expression Language as a way to compose them together. 

> Depend on this package to build frameworks on top of LangChain.dart or to interoperate with it.

### [`langchain`](https://pub.dev/packages/langchain) [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)

Contains higher-level and use-case specific chains, agents, and retrieval algorithms that are at the core of the application's cognitive architecture.

> Depend on this package to build LLM applications with LangChain.dart.  
> 
> This package exposes `langchain_core` so you don't need to depend on it explicitly.

### [`langchain_community`](https://pub.dev/packages/langchain_community) [![langchain_community](https://img.shields.io/pub/v/langchain_community.svg)](https://pub.dev/packages/langchain_community)

Contains third-party integrations and community-contributed components that are not part of the core LangChain.dart API.

> Depend on this package if you want to use any of the integrations or components it provides.

### Integration-specific packages

Popular third-party integrations (e.g. [`langchain_openai`](https://pub.dev/packages/langchain_openai), [`langchain_google`](https://pub.dev/packages/langchain_google), [`langchain_ollama`](https://pub.dev/packages/langchain_ollama), etc.) are moved to their own packages so that they can be imported independently without depending on the entire `langchain_community` package.

> Depend on an integration-specific package if you want to use the specific integration.

| Package                                                             | Version                                                                                                                      | Description                                                                                                                                                                                             |
|---------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [langchain_anthropic](https://pub.dev/packages/langchain_anthropic) | [![langchain_anthropic](https://img.shields.io/pub/v/langchain_anthropic.svg)](https://pub.dev/packages/langchain_anthropic) | Anthopic integration (Claude 3.5 Sonnet, Opus, Haiku, Instant, etc.)                                                                                                                                    |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)       | [![langchain_chroma](https://img.shields.io/pub/v/langchain_chroma.svg)](https://pub.dev/packages/langchain_chroma)          | Chroma vector database integration                                                                                                                                                                      |
| [langchain_firebase](https://pub.dev/packages/langchain_firebase)   | [![langchain_firebase](https://img.shields.io/pub/v/langchain_firebase.svg)](https://pub.dev/packages/langchain_firebase)    | Firebase integration (VertexAI for Firebase (Gemini 1.5 Pro, Gemini 1.5 Flash, etc.))                                                                                                                   |
| [langchain_google](https://pub.dev/packages/langchain_google)       | [![langchain_google](https://img.shields.io/pub/v/langchain_google.svg)](https://pub.dev/packages/langchain_google)          | Google integration (GoogleAI, VertexAI, Gemini, PaLM 2, Embeddings, Vector Search, etc.)                                                                                                                |
| [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) | [![langchain_mistralai](https://img.shields.io/pub/v/langchain_mistralai.svg)](https://pub.dev/packages/langchain_mistralai) | Mistral AI integration (Mistral-7B, Mixtral 8x7B, Mixtral 8x22B, Mistral Small, Mistral Large, embeddings, etc.).                                                                                       |
| [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | [![langchain_ollama](https://img.shields.io/pub/v/langchain_ollama.svg)](https://pub.dev/packages/langchain_ollama)          | Ollama integration (Llama 3.1, Gemma 2, Phi-3, Mistral nemo, WizardLM-2, CodeGemma, Command R, LLaVA, DBRX, Qwen, Dolphin, DeepSeek Coder, Vicuna, Orca, etc.)                                          |
| [langchain_openai](https://pub.dev/packages/langchain_openai)       | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)          | OpenAI integration (GPT-3.5 Turbo, GPT-4, GPT-4o, Embeddings, Tools, Vision, DALL·E 3, etc.) and OpenAI Compatible services (TogetherAI, Anyscale, OpenRouter, One API, Groq, Llamafile, GPT4All, etc.) |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)   | [![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)](https://pub.dev/packages/langchain_pinecone)    | Pinecone vector database integration                                                                                                                                                                    |
| [langchain_supabase](https://pub.dev/packages/langchain_supabase)   | [![langchain_supabase](https://img.shields.io/pub/v/langchain_supabase.svg)](https://pub.dev/packages/langchain_supabase)    | Supabase Vector database integration                                                                                                                                                                    |

<p align="center">
    <img src="https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain_packages.png" width="500">
</p>

### API clients packages

The following packages are maintained (and used internally) by LangChain.dart, although they can also be used independently:

> Depend on an API client package if you just want to consume the API of a specific provider directly without using LangChain.dart abstractions. 

| Package                                                           | Version                                                                                                                   | Description                                                         | 
|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| [anthropic_sdk_dart](https://pub.dev/packages/anthropic_sdk_dart) | [![anthropic_sdk_dart](https://img.shields.io/pub/v/anthropic_sdk_dart.svg)](https://pub.dev/packages/anthropic_sdk_dart) | [Anthropic](https://docs.anthropic.com/en/api) API client           |
| [chromadb](https://pub.dev/packages/chromadb)                     | [![chromadb](https://img.shields.io/pub/v/chromadb.svg)](https://pub.dev/packages/chromadb)                               | [Chroma DB](https://trychroma.com/) API client                      |
| [googleai_dart](https://pub.dev/packages/googleai_dart)           | [![googleai_dart](https://img.shields.io/pub/v/googleai_dart.svg)](https://pub.dev/packages/googleai_dart)                | [Google AI for Developers](https://ai.google.dev/) API client       |
| [mistralai_dart](https://pub.dev/packages/mistralai_dart)         | [![mistralai_dart](https://img.shields.io/pub/v/mistralai_dart.svg)](https://pub.dev/packages/mistralai_dart)             | [Mistral AI](https://docs.mistral.ai/api) API client                |
| [ollama_dart](https://pub.dev/packages/ollama_dart)               | [![ollama_dart](https://img.shields.io/pub/v/ollama_dart.svg)](https://pub.dev/packages/ollama_dart)                      | [Ollama](https://ollama.ai/) API client                             |
| [openai_dart](https://pub.dev/packages/openai_dart)               | [![openai_dart](https://img.shields.io/pub/v/openai_dart.svg)](https://pub.dev/packages/openai_dart)                      | [OpenAI](https://platform.openai.com/docs/api-reference) API client |
| [tavily_dart](https://pub.dev/packages/tavily_dart)               | [![tavily_dart](https://img.shields.io/pub/v/tavily_dart.svg)](https://pub.dev/packages/tavily_dart)                      | [Tavily](https://tavily.com) API client                             |
| [vertex_ai](https://pub.dev/packages/vertex_ai)                   | [![vertex_ai](https://img.shields.io/pub/v/vertex_ai.svg)](https://pub.dev/packages/vertex_ai)                            | [GCP Vertex AI](https://cloud.google.com/vertex-ai) API client      |

## Integrations

The following integrations are available in LangChain.dart:

### Chat Models

| Chat model                                                                                                              | Package                                                             | Streaming | Multi-modal | Tool-call | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|-----------|-------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [ChatAnthropic](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/anthropic)                 | [langchain_anthropic](https://pub.dev/packages/langchain_anthropic) | ✔         | ✔           | ✔         | [Anthropic Messages API](https://docs.anthropic.com/en/api/messages) (aka Claude API)                                                                                                                                                                                                                                                                                                                                                                                                                |
| [ChatFirebaseVertexAI](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/firebase_vertex_ai) | [langchain_firebase](https://pub.dev/packages/langchain_firebase)   | ✔         | ✔           | ✔         | [Vertex AI for Firebase API](https://firebase.google.com/docs/vertex-ai) (aka Gemini API)                                                                                                                                                                                                                                                                                                                                                                                                            |
| [ChatGoogleGenerativeAI](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/googleai)         | [langchain_google](https://pub.dev/packages/langchain_google)       | ✔         | ✔           | ✔         | [Google AI for Developers API](https://ai.google.dev) (aka Gemini API)                                                                                                                                                                                                                                                                                                                                                                                                                               |
| [ChatMistralAI](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/mistralai)                 | [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) | ✔         |             |           | [Mistral Chat API](https://ollama.ai)                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| [ChatOllama](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/ollama)                       | [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | ✔         | ✔           | ✔         | [Ollama Chat API](https://ollama.ai)                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| [ChatOpenAI](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/openai)                       | [langchain_openai](https://pub.dev/packages/langchain_openai)       | ✔         | ✔           | ✔         | [OpenAI Chat API](https://platform.openai.com/docs/api-reference/chat) and OpenAI Chat API compatible services ([GitHub Models](https://github.com/marketplace/models), [TogetherAI](https://www.together.ai/), [Anyscale](https://www.anyscale.com/), [OpenRouter](https://openrouter.ai), [One API](https://github.com/songquanpeng/one-api), [Groq](https://groq.com/), [Llamafile](https://llamafile.ai/), [GPT4All](https://gpt4all.io/), [FastChat](https://github.com/lm-sys/FastChat), etc.) | 
| [ChatVertexAI](https://langchaindart.dev/#/modules/model_io/models/chat_models/integrations/gcp_vertex_ai)              | [langchain_google](https://pub.dev/packages/langchain_google)       |           |             |           | [GCP Vertex AI Chat API](https://cloud.google.com/vertex-ai)                                                                                                                                                                                                                                                                                                                                                                                                                                         |

### LLMs

_Note: Prefer using Chat Models over LLMs as many providers have deprecated them._

| LLM                                                                                             | Package                                                       | Streaming | Description                                                                          |
|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------|-----------|--------------------------------------------------------------------------------------|
| [Ollama](https://langchaindart.dev/#/modules/model_io/models/llms/integrations/ollama)          | [langchain_ollama](https://pub.dev/packages/langchain_ollama) | ✔         | [Ollama Completions API](https://ollama.ai)                                          |
| [OpenAI](https://langchaindart.dev/#/modules/model_io/models/llms/integrations/openai)          | [langchain_openai](https://pub.dev/packages/langchain_openai) | ✔         | [OpenAI Completions API](https://platform.openai.com/docs/api-reference/completions) | 
| [VertexAI](https://langchaindart.dev/#/modules/model_io/models/llms/integrations/gcp_vertex_ai) | [langchain_google](https://pub.dev/packages/langchain_google) |           | [GCP Vertex AI Text API](https://cloud.google.com/vertex-ai)                         |

### Embedding Models

| Embedding model                                                                                                     | Package                                                             | Description                                                                        |
|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|------------------------------------------------------------------------------------|
| [GoogleGenerativeAIEmbeddings](https://langchaindart.dev/#/modules/retrieval/text_embedding/integrations/google_ai) | [langchain_google](https://pub.dev/packages/langchain_google)       | [Google AI Embeddings API](https://ai.google.dev)                                  |
| [MistralAIEmbeddings](https://langchaindart.dev/#/modules/retrieval/text_embedding/integrations/mistralai)          | [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) | [Mistral Embeddings API](https://docs.mistral.ai)                                  |
| [OllamaEmbeddings](https://langchaindart.dev/#/modules/retrieval/text_embedding/integrations/ollama)                | [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | [Ollama Embeddings API](https://ollama.ai)                                         |
| [OpenAIEmbeddings](https://langchaindart.dev/#/modules/retrieval/text_embedding/integrations/openai)                | [langchain_openai](https://pub.dev/packages/langchain_openai)       | [OpenAI Embeddings API](https://platform.openai.com/docs/api-reference/embeddings) | 
| [VertexAIEmbeddings](https://langchaindart.dev/#/modules/retrieval/text_embedding/integrations/gcp_vertex_ai)       | [langchain_google](https://pub.dev/packages/langchain_google)       | [GCP Vertex AI Embeddings API](https://cloud.google.com/vertex-ai)                 |

### Vector Stores

| Vector store                                                                                                 | Package                                                             | Description                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| [Chroma](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/chroma)                    | [langchain_chroma](https://pub.dev/packages/langchain_chroma)       | [Chroma](https://trychroma.com/) integration                                                                                   |
| [MemoryVectorStore](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/memory)         | [langchain](https://pub.dev/packages/langchain)                     | In-memory vector store for prototype and testing                                                                               |
| [ObjectBoxVectorStore](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/objectbox)   | [langchain_community](https://pub.dev/packages/langchain_community) | [ObjectBox](https://objectbox.io/) integration                                                                                 |
| [Pinecone](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/pinecone)                | [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)   | [Pinecone](https://pinecone.io/) integration                                                                                   |
| [Supabase](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/supabase)                | [langchain_supabase](https://pub.dev/packages/langchain_supabase)   | [Supabase Vector](https://supabase.com/vector) integration                                                                     |
| [VertexAIMatchingEngine](https://langchaindart.dev/#/modules/retrieval/vector_stores/integrations/vertex_ai) | [langchain_google](https://pub.dev/packages/langchain_google)       | [Vertex AI Vector Search](https://cloud.google.com/vertex-ai/docs/vector-search/overview) (former Matching Engine) integration |

### Tools

| Tool                                                                              | Package                                                             | Description                                                                                |
|-----------------------------------------------------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| [CalculatorTool](https://langchaindart.dev/#/modules/agents/tools/calculator)     | [langchain_community](https://pub.dev/packages/langchain_community) | To calculate math expressions                                                              |
| [OpenAIDallETool](https://langchaindart.dev/#/modules/agents/tools/openai_dall_e) | [langchain_openai](https://pub.dev/packages/langchain_openai)       | [OpenAI's DALL-E Image Generator](https://platform.openai.com/docs/api-reference/images)   | 
| TavilyAnswerTool                                                                  | [langchain_community](https://pub.dev/packages/langchain_community) | Returns an answer for a query using the [Tavily](https://tavily.com) search engine         |
| TavilySearchResultsTool                                                           | [langchain_community](https://pub.dev/packages/langchain_community) | Returns a list of results for a query using the [Tavily](https://tavily.com) search engine |

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
- [Code Assist AI](https://app.commanddash.io/agent?github=https://github.com/davidmigloz/langchain_dart) (Chatbot for LangChain.dart documentation)
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
