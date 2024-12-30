---
sidebar_position: 0
sidebar_class_name: hidden
---

# Installation

To get started, add LangChain.dart dependency to your project `pubspec.yaml` file:

```yaml
dependencies:
  langchain: {version}
```

Then, run `pub get` to install the package.

Using LangChain will usually require integrations with one or more model providers, data stores, tools APIs, etc.

For example, if you wan to use OpenAI’s APIs, you will need to add LangChain.dart OpenAI package as well:

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
```

## Integration Packages

Check out the following section for a list of available intergration packages.


```
The following table contains the list of existing Langchain.dart integration packages. 

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
## Documentation

Detailed documentation for various integrations can be found in the `/docs/05-integration/` directory:

- [Anthropic](/docs/integrations/anthropic)
- [Anyscale](/docs/integrations/anyscale)
- [Firebase VertexAI](/docs/integrations/firebase_vertex_ai)
- [GCP VertexAI](/docs/integrations/gcp_vertex_ai)
- [GoogleAI](/docs/integrations/googleai)
- [MistralAI](/docs/integrations/mistralai)
- [Ollama](/docs/integrations/ollama)
- [OpenRouter](/docs/integrations/open_router)
- [OpenAI](/docs/integrations/openai)
- [PrEM](/docs/integrations/prem)
- [TogetherAI](/docs/integrations/together_ai)