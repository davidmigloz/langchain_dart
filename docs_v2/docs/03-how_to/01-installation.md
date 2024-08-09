# Installation

LangChain as a framework consists of a number of packages. 

### [`langchain_core`](https://pub.dev/packages/langchain_core)
This package contains base abstractions of different components and ways to compose them together.
The interfaces for core components like LLMs, vector stores, retrievers and more are defined here.
No third party integrations are defined here.

> Depend on this package to build frameworks on top of LangChain.dart or to interoperate with it.

### [`langchain`](https://pub.dev/packages/langchain)

Contains higher-level and use-case specific chains, agents, and retrieval algorithms that are at the core of the application's cognitive architecture.

> Depend on this package to build LLM applications with LangChain.dart.  
> 
> This package exposes `langchain_core` so you don't need to depend on it explicitly.

### [`langchain_community`](https://pub.dev/packages/langchain_community)

Contains third-party integrations and community-contributed components that are not part of the core LangChain.dart API.

> Depend on this package if you want to use any of the integrations or components it provides.

To start using LangChain.dart, add `langchain` as a dependency to your `pubspec.yaml` file. 
```yaml
dependencies:
  langchain: {version}
  langchain_community: {version}
  langchain_openai: {version}
  langchain_google: {version}
  ...
```

Let's say you're using [OpenAI](https://platform.openai.com/), you'd choose the `langchain_openai` package.


| Package                                                             | Version                                                                                                                      | Description                                                                                                                                                                                             |
|---------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [langchain_core](https://pub.dev/packages/langchain_core)           | [![langchain_core](https://img.shields.io/pub/v/langchain_core.svg)](https://pub.dev/packages/langchain_core)                | Core abstractions and LCEL                                                                                                                                                                              |
| [langchain](https://pub.dev/packages/langchain)                     | [![langchain](https://img.shields.io/pub/v/langchain.svg)](https://pub.dev/packages/langchain)                               | Higher-level and use-case specific chains, agents, and retrieval algorithms                                                                                                                             |
| [langchain_community](https://pub.dev/packages/langchain_community) | [![langchain_community](https://img.shields.io/pub/v/langchain_community.svg)](https://pub.dev/packages/langchain_community) | Third-party integrations (without specific packages) and community-contributed components and utilities                                                                                                 |
| [langchain_openai](https://pub.dev/packages/langchain_openai)       | [![langchain_openai](https://img.shields.io/pub/v/langchain_openai.svg)](https://pub.dev/packages/langchain_openai)          | OpenAI integration (GPT-3.5 Turbo, GPT-4, GPT-4o, Embeddings, Tools, Vision, DALL·E 3, etc.) and OpenAI Compatible services (TogetherAI, Anyscale, OpenRouter, One API, Groq, Llamafile, GPT4All, etc.) |
| [langchain_google](https://pub.dev/packages/langchain_google)       | [![langchain_google](https://img.shields.io/pub/v/langchain_google.svg)](https://pub.dev/packages/langchain_google)          | Google integration (GoogleAI, VertexAI, Gemini, PaLM 2, Embeddings, Vector Search, etc.)                                                                                                                |
| [langchain_firebase](https://pub.dev/packages/langchain_firebase)   | [![langchain_firebase](https://img.shields.io/pub/v/langchain_firebase.svg)](https://pub.dev/packages/langchain_firebase)    | Firebase integration (VertexAI for Firebase (Gemini 1.5 Pro, Gemini 1.5 Flash, etc.))                                                                                                                   |
| [langchain_ollama](https://pub.dev/packages/langchain_ollama)       | [![langchain_ollama](https://img.shields.io/pub/v/langchain_ollama.svg)](https://pub.dev/packages/langchain_ollama)          | Ollama integration (Llama 3, Phi-3, WizardLM-2, Mistral 7B, Gemma, CodeGemma, Command R, LLaVA, DBRX, Qwen 1.5, Dolphin, DeepSeek Coder, Vicuna, Orca, etc.)                                            |
| [langchain_mistralai](https://pub.dev/packages/langchain_mistralai) | [![langchain_mistralai](https://img.shields.io/pub/v/langchain_mistralai.svg)](https://pub.dev/packages/langchain_mistralai) | Mistral AI integration (Mistral-7B, Mixtral 8x7B, Mixtral 8x22B, Mistral Small, Mistral Large, embeddings, etc.).                                                                                       |
| [langchain_pinecone](https://pub.dev/packages/langchain_pinecone)   | [![langchain_pinecone](https://img.shields.io/pub/v/langchain_pinecone.svg)](https://pub.dev/packages/langchain_pinecone)    | Pinecone vector database integration                                                                                                                                                                    |
| [langchain_chroma](https://pub.dev/packages/langchain_chroma)       | [![langchain_chroma](https://img.shields.io/pub/v/langchain_chroma.svg)](https://pub.dev/packages/langchain_chroma)          | Chroma vector database integration                                                                                                                                                                      |
| [langchain_supabase](https://pub.dev/packages/langchain_supabase)   | [![langchain_supabase](https://img.shields.io/pub/v/langchain_supabase.svg)](https://pub.dev/packages/langchain_supabase)    | Supabase Vector database integration                                                                                                                                                                    |
