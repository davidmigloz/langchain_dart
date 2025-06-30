# langchain_compat

A unified compatibility layer for LangChain.dart, enabling seamless use of all
major LLM, chat, and embedding providers (OpenAI, GoogleAI, VertexAI, Anthropic,
Mistral, Ollama, and more) from a single package. No need to import
provider-specific packages—just use `langchain_compat` for everything.

## Features

- **Single Import:** Access all major LLM, chat, and embedding providers from
  one package.
- **Unified API:** Consistent interfaces for chat, completion, and embedding
  models.
- **OpenAI-Compatible:** Includes all major OpenAI-compatible providers (Groq,
  Together, Fireworks, etc.).
- **Native Providers:** Full support for native APIs (Anthropic, Gemini, Ollama,
  etc.).
- **Local Ollama:** Supports both native and OpenAI-compatible endpoints for
  Ollama.

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

### Model Availability by Provider

*Model counts as of June 30, 2025.*

| Provider Name | Key/ID     | # Models  | Notes                                                                                                       |
| ------------- | ---------- | --------- | ----------------------------------------------------------------------------------------------------------- |
| OpenAI        | openai     | 77        |                                                                                                             |
| OpenRouter    | openrouter | 318       | Aggregator, many sources                                                                                    |
| Groq          | groq       | 22        |                                                                                                             |
| Together AI   | together   | 81        |                                                                                                             |
| Fireworks AI  | fireworks  | 29        |                                                                                                             |
| Mistral AI    | mistral    | 53        |                                                                                                             |
| Cohere        | cohere     | 42        |                                                                                                             |
| Lambda        | lambda     | 20        |                                                                                                             |
| NVIDIA NIM    | nvidia     | 142       |                                                                                                             |
| Google AI     | google     | 50        |                                                                                                             |
| Anthropic     | anthropic  | 11        |                                                                                                             |
| Ollama        | ollama     | 180+      | Curated Library: ~180 ready-to-pull model families<br />Extended universe: ~45K GGUF models on Hugging Face |
| **Total**     |            | **>1000** |                                                                                                             |

*Note: Model counts and details may change as APIs evolve. Some providers
aggregate or proxy many models from other sources.*

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

Here's a minimal example that runs a chat prompt with both native and
OpenAI-compatible Ollama providers:

```dart
import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/providers.dart';

void main() async {
  const promptText = 'Tell me a joke about Dart programming.';

  for (final provider in [Provider.ollama, Provider.ollamaOpenAI]) {
    final model = provider.createModel();
    print('\n# 𝟏${provider.displayName}𝟎 (${provider.name}:${model.name})');
    await for (final chunk in model.stream(PromptValue.string(promptText))) {
      stdout.write(chunk.output.content);
    }
    print('');
  }
}
```

You can also use any other provider from `Provider.all` for a unified
experience.

### Listing all models for all providers

You can use `Provider.listModels()` to enumerate all available models for every
provider. This works for all providers in `Provider.all`:

```dart
import 'package:langchain_compat/src/providers.dart';

Future<void> main() async {
  var totalProviders = 0;
  var totalModels = 0;
  for (final provider in Provider.all) {
    totalProviders++;
    print('\n# [1m${provider.displayName}[0m (${provider.name})');
    final models = await provider.listModels();
    final modelList = models.toList();
    totalModels += modelList.length;
    for (final model in modelList) {
      final kinds = model.kinds.map((k) => k.name).join(', ');
      print(
        '- ${provider.name}:${model.name} '
        '${model.displayName != null ? '"${model.displayName}" ' : ''}'
        '($kinds) ',
      );
    }
    print('  (${modelList.length} models)');
  }
  print('\nTotal providers: $totalProviders');
  print('Total models: $totalModels');
}
```

This will print all providers, their available models, and a summary count at
the end.

## Additional information
- To contribute, open issues or pull requests on GitHub. Please follow the
  project style and compat rules.
- For questions or support, file an issue and the maintainers will respond as
  soon as possible.
