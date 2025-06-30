# langchain_compat

A unified compatibility layer for LangChain.dart, enabling seamless use of all major LLM, chat, and embedding providers (OpenAI, GoogleAI, VertexAI, Anthropic, Mistral, Ollama, and more) from a single package. No need to import provider-specific packages—just use `langchain_compat` for everything.

## Features

- **Single Import:** Access all major LLM, chat, and embedding providers from one package.
- **Unified API:** Consistent interfaces for chat, completion, and embedding models.
- **Provider Barrels:** All types, constants, and utilities are re-exported for easy access.
- **Self-Contained:** No need to import from `src/` directories or upstream packages.
- **OpenAI-Compatible:** Includes all major OpenAI-compatible providers (Groq, Together, Fireworks, etc.).
- **Native Providers:** Full support for native APIs (Anthropic, Gemini, Ollama, etc.).
- **Local Ollama:** Supports both native and OpenAI-compatible endpoints for Ollama.
- **Analyzer Clean:** Error-free according to `dart analyze` (except for expected warnings).
- **Traceable:** Every file is mapped to its original source in `extraction-specs/FILE_SOURCE_MAP.md`.

## Supported Providers

### Provider Capabilities

| Provider                   | Default Model                                     | Capabilities                                           | Notes                                  |
| -------------------------- | ------------------------------------------------- | ------------------------------------------------------ | -------------------------------------- |
| **OpenAI**                 | gpt-4o-mini                                       | Text Generation, Embeddings, Chat, File Uploads, Tools | Full feature support                   |
| **OpenRouter**             | google/gemini-2.5-flash                           | Text Generation, Chat, File Uploads, Tools             | No embedding support                   |
| **Google Gemini**          | gemini-2.0-flash                                  | Text Generation, Embeddings, Chat, File Uploads, Tools | Uses native Gemini API                 |
| **Gemini (OpenAI-compat)** | gemini-2.0-flash                                  | Text Generation, Embeddings, Chat, File Uploads, Tools | Uses OpenAI-compatible Gemini endpoint |
| **Fireworks AI**           | accounts/fireworks/models/llama-v3p1-70b-instruct | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Groq**                   | llama3-70b-8192                                   | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Together AI**            | mistralai/Mixtral-8x7B-Instruct-v0.1              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Mistral AI**             | mistral-small-latest                              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Cohere**                 | command-r-plus                                    | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Lambda**                 | llama3.2-3b-instruct                              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **NVIDIA NIM**             | nvidia/nemotron-mini-4b-instruct                  | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Anthropic**              | claude-3-5-sonnet-20241022                        | Text Generation, Chat, File Uploads, Tools             | Native Claude API                      |
| **Ollama**                 | llama3.1                                          | Text Generation, Chat                                  | Local models only (native API)         |
| **Ollama (OpenAI-compat)** | llama3.1                                          | Text Generation, Chat                                  | Local OpenAI-compatible endpoint       |

### Provider Configuration

| Provider                   | Provider Prefix | Aliases                      | API Key Name       | API Key Link                                                                   | Provider Type     |
| -------------------------- | --------------- | ---------------------------- | ------------------ | ------------------------------------------------------------------------------ | ----------------- |
| **OpenAI**                 | openai          | -                            | OPENAI_API_KEY     | [Get OpenAI API Key](https://platform.openai.com/account/api-keys)             | OpenAIProvider    |
| **OpenRouter**             | openrouter      | -                            | OPENROUTER_API_KEY | [Get OpenRouter API Key](https://openrouter.ai/keys)                           | OpenAIProvider    |
| **Google Gemini**          | google          | gemini, googleai, google-gla | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | GoogleAIProvider  |
| **Gemini (OpenAI-compat)** | gemini-openai   | -                            | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | OpenAIProvider    |
| **Fireworks AI**           | fireworks       | -                            | FIREWORKS_API_KEY  | [Get Fireworks API Key](https://app.fireworks.ai/keys)                         | OpenAIProvider    |
| **Groq**                   | groq            | -                            | GROQ_API_KEY       | [Get Groq API Key](https://console.groq.com/keys)                              | OpenAIProvider    |
| **Together AI**            | together        | -                            | TOGETHER_API_KEY   | [Get Together AI Key](https://platform.together.ai/account/api-keys)           | OpenAIProvider    |
| **Mistral AI**             | mistral         | -                            | MISTRAL_API_KEY    | [Get Mistral API Key](https://console.mistral.ai/api-keys)                     | OpenAIProvider    |
| **Cohere**                 | cohere          | -                            | COHERE_API_KEY     | [Get Cohere API Key](https://dashboard.cohere.com/api-keys)                    | OpenAIProvider    |
| **Lambda**                 | lambda          | -                            | LAMBDA_API_KEY     | [Get Lambda API Key](https://platform.lambdalabs.com/api-keys)                 | OpenAIProvider    |
| **NVIDIA NIM**             | nvidia          | -                            | NVIDIA_API_KEY     | [Get NVIDIA API Key](https://platform.nvidia.com/en-us/nim/api-keys/)          | OpenAIProvider    |
| **Anthropic**              | anthropic       | claude                       | ANTHROPIC_API_KEY  | [Get Anthropic API Key](https://console.anthropic.com/settings/keys)           | AnthropicProvider |
| **Ollama**                 | ollama          | -                            |                    | [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) | OllamaProvider    |
| **Ollama (OpenAI-compat)** | ollama-openai   | -                            |                    | [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) | OpenAIProvider    |

*Note: The native Ollama provider uses the /api endpoint and ChatOllama, while the OpenAI-compatible provider uses the /v1 endpoint and OpenAIProvider logic. Both default to llama3.1. Choose the provider that matches your Ollama server setup.*

## Getting started

Add `langchain_compat` to your `pubspec.yaml`:

```yaml
dependencies:
  langchain_compat: ^VERSION
```

Import the package:

```dart
import 'package:langchain_compat/langchain_compat.dart';
```

## Usage

Here's a minimal example that runs a chat prompt with both native and OpenAI-compatible Ollama providers:

```dart
import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/providers.dart';

void main() async {
  const promptText = 'Tell me a joke about Dart programming.';

  for (final provider in [Provider.ollama, Provider.ollamaOpenAI]) {
    final model = provider.createModel();
    print('\n# [1m${provider.displayName}[0m (${provider.name}:${model.name})');
    await for (final chunk in model.stream(PromptValue.string(promptText))) {
      stdout.write(chunk.output.content);
    }
    print('');
  }
}
```

You can also use any other provider from `Provider.all` for a unified experience.

## Additional information
- To contribute, open issues or pull requests on GitHub. Please follow the project style and compat rules.
- For questions or support, file an issue and the maintainers will respond as soon as possible.
