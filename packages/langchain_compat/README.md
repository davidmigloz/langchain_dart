# langchain_compat

A unified compatibility layer for LangChain.dart, enabling seamless use of all
major LLM, chat, and embedding providers (OpenAI, GoogleAI, Anthropic, Mistral,
Cohere, Ollama, and more) from a single package. No need to import
provider-specific packages—just use `langchain_compat` for everything.

## Features

- **Single Import:** Access all major LLM, chat, and embedding providers from
  one package.
- **Unified API:** Consistent interfaces for chat, completion, and embedding
  models.
- **15+ Providers:** OpenAI, Google, Anthropic, Mistral, Cohere, Groq, Together,
  Fireworks, NVIDIA, Lambda, Ollama, and more.
- **46,000+ Models:** Access to over 46,000 models across all providers (including Ollama's vast ecosystem).
- **Native APIs:** Full support for provider-native APIs (Anthropic, Gemini,
  Mistral, etc.).
- **Embeddings Support:** 4 embedding providers (OpenAI, Google, Mistral,
  Cohere) with 29 models for semantic search and vector operations.
- **Automatic Retry:** HTTP-level retry logic with exponential backoff for rate
  limiting (429 errors) and Retry-After header support.
- **Named Providers:** Dynamic provider selection using names and aliases
  (e.g., 'claude' → Anthropic, 'gemini' → Google).
- **Usage Tracking:** Token usage monitoring and reporting across all providers.

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
| **Together AI**            | meta-llama/Llama-3.2-3B-Instruct-Turbo            | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Mistral AI**             | mistral-small-latest                              | Text Generation, Embeddings, Chat, File Uploads, Tools | Native API with embeddings support     |
| **Cohere**                 | command-r-plus                                    | Text Generation, Embeddings, Chat, File Uploads, Tools | Native API with embeddings support     |
| **Lambda**                 | llama3.2-3b-instruct                              | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **NVIDIA NIM**             | nvidia/nemotron-mini-4b-instruct                  | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Anthropic**              | claude-3-5-sonnet-20241022                        | Text Generation, Chat, File Uploads, Tools             | Native Claude API                      |
| **Cerebras**               | llama-4-scout-17b-16e-instruct                    | Text Generation, Chat, File Uploads, Tools             | OpenAI-compatible                      |
| **Ollama**                 | llama3.1                                          | Text Generation, Chat                                  | Local models only (native API)         |
| **Ollama (OpenAI-compat)** | llama3.1                                          | Text Generation, Chat                                  | Local OpenAI-compatible endpoint       |

### Provider Configuration

| Provider                   | Provider Prefix | Aliases                      | API Key Name       | API Key Link                                                                   | Provider Type     |
| -------------------------- | --------------- | ---------------------------- | ------------------ | ------------------------------------------------------------------------------ | ----------------- |
| **OpenAI**                 | openai          | -                            | OPENAI_API_KEY     | [Get OpenAI API Key](https://platform.openai.com/account/api-keys)             | OpenAIProvider    |
| **OpenRouter**             | openrouter      | -                            | OPENROUTER_API_KEY | [Get OpenRouter API Key](https://openrouter.ai/keys)                           | OpenAIProvider    |
| **Google Gemini**          | google          | gemini, googleai, google-gla | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | GoogleAIProvider  |
| **Gemini (OpenAI-compat)** | google-openai   | -                            | GEMINI_API_KEY     | [Get Gemini API Key](https://aistudio.google.com/app/apikey)                   | OpenAIProvider    |
| **Fireworks AI**           | fireworks       | -                            | FIREWORKS_API_KEY  | [Get Fireworks API Key](https://app.fireworks.ai/keys)                         | OpenAIProvider    |
| **Groq**                   | groq            | -                            | GROQ_API_KEY       | [Get Groq API Key](https://console.groq.com/keys)                              | OpenAIProvider    |
| **Together AI**            | together        | -                            | TOGETHER_API_KEY   | [Get Together AI Key](https://platform.together.ai/account/api-keys)           | OpenAIProvider    |
| **Mistral AI**             | mistral         | -                            | MISTRAL_API_KEY    | [Get Mistral API Key](https://console.mistral.ai/api-keys)                     | MistralProvider   |
| **Cohere**                 | cohere          | -                            | COHERE_API_KEY     | [Get Cohere API Key](https://dashboard.cohere.com/api-keys)                    | CohereProvider    |
| **Lambda**                 | lambda          | -                            | LAMBDA_API_KEY     | [Get Lambda API Key](https://platform.lambdalabs.com/api-keys)                 | OpenAIProvider    |
| **NVIDIA NIM**             | nvidia          | -                            | NVIDIA_API_KEY     | [Get NVIDIA API Key](https://platform.nvidia.com/en-us/nim/api-keys/)          | OpenAIProvider    |
| **Anthropic**              | anthropic       | claude                       | ANTHROPIC_API_KEY  | [Get Anthropic API Key](https://console.anthropic.com/settings/keys)           | AnthropicProvider |
| **Cerebras**               | cerebras        | -                            | CEREBRAS_API_KEY   | [Get Cerebras API Key](https://inference.cerebras.ai/)                         | OpenAIProvider    |
| **Ollama**                 | ollama          | -                            |                    | [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) | OllamaProvider    |
| **Ollama (OpenAI-compat)** | ollama-openai   | -                            |                    | [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/api.md) | OpenAIProvider    |

### Model Availability by Provider

*Model counts as of July 4, 2025.*

| Provider Name | Key/ID     | Chat Models | Embedding Models | Other Models | Total    | Notes                                                                                                       |
| ------------- | ---------- | ----------- | ---------------- | ------------ | -------- | ----------------------------------------------------------------------------------------------------------- |
| OpenAI        | openai     | 74          | 3                | 0            | 77       | Complete feature support including embeddings                                                               |
| OpenRouter    | openrouter | 312         | 0                | 0            | 312      | Aggregator, many sources, no embeddings                                                                     |
| Google AI     | google     | 37          | 5                | 8            | 50       | Native Gemini API with embeddings support                                                                   |
| Google AI (OpenAI-compat) | google-openai | 53 | 5            | 0            | 58       | OpenAI-compatible Gemini endpoint                                                                            |
| Groq          | groq       | 22          | 0                | 0            | 22       | Fast inference, no embeddings                                                                               |
| Together AI   | together   | 83          | 0                | 0            | 83       | OpenAI-compatible, no embeddings                                                                            |
| Fireworks AI  | fireworks  | 28          | 0                | 0            | 28       | OpenAI-compatible, no embeddings                                                                            |
| Mistral AI    | mistral    | 53          | 0                | 0            | 53       | Native API with embeddings support                                                                          |
| Cohere        | cohere     | 42          | 0                | 0            | 42       | Native API with comprehensive embeddings support                                                            |
| Lambda        | lambda     | 20          | 0                | 0            | 20       | OpenAI-compatible, no embeddings                                                                            |
| NVIDIA NIM    | nvidia     | 143         | 0                | 0            | 143      | OpenAI-compatible, no embeddings                                                                            |
| Anthropic     | anthropic  | 11          | 0                | 0            | 11       | Native Claude API, no embeddings                                                                            |
| Cerebras      | cerebras   | 4           | 0                | 0            | 4        | OpenAI-compatible, no embeddings                                                                            |
| Ollama        | ollama     | 180+        | 0                | 0            | 180+     | Curated Library: ~180 ready-to-pull model families<br />Extended universe: ~45K GGUF models on Hugging Face |
| Ollama (OpenAI-compat) | ollama-openai | 180+ | 0              | 0            | 180+     | Same model access as native Ollama via OpenAI-compatible endpoint                                           |
| **Total**     |            | **1000+**   | **29**           | **45K+**     | **46K+** | 4 providers support embeddings: OpenAI, Google, Mistral, Cohere                                             |

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

### Chat Models

Here's a minimal example that runs a chat prompt with multiple providers:

```dart
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  const promptText = 'Tell me a joke about Dart programming.';

  for (final provider in [ChatProvider.ollama, ChatProvider.openai, ChatProvider.anthropic]) {
    final agent = Agent.fromProvider(provider);
    print('\n# ${provider.displayName} (${agent.model})');
    await for (final chunk in agent.runStream([ChatMessage.humanText(promptText)])) {
      stdout.write(chunk.output);
    }
    print('');
  }
}
```

### Embedding Models

Here's how to use the embedding providers for semantic search and vector
operations:

```dart
import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/embeddings/embeddings_provider.dart';

void main() async {
  const texts = [
    'The quick brown fox jumps over the lazy dog.',
    'Machine learning is a subset of artificial intelligence.',
    'Dart is a programming language developed by Google.',
  ];

  // Try all embedding providers
  for (final provider in EmbeddingsProvider.all) {
    try {
      final model = provider.createModel();
      print('\n# ${provider.displayName} Embeddings');
      
      final result = await model.embedDocuments(texts);
      print('Generated ${result.embeddings.length} embeddings');
      print('Vector dimensions: ${result.embeddings.first.length}');
      print('Usage: ${result.usage}');
    } catch (e) {
      print('${provider.displayName}: API key required');
    }
  }
}
```

### Tool Calling with Agent

The Agent class provides high-level tool execution and message orchestration:

```dart
import 'package:langchain_compat/langchain_compat.dart';
import 'package:json_schema/json_schema.dart';

void main() async {
  // Define tools
  final weatherTool = Tool<String>(
    name: 'get_weather',
    description: 'Get current weather for a location',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'location': {'type': 'string', 'description': 'City name'},
      },
      'required': ['location'],
    }),
    onCall: (args) => 'Weather in ${args['location']}: 72°F, sunny',
    inputFromJson: (json) => json,
  );

  final tempTool = Tool<String>(
    name: 'convert_temp',
    description: 'Convert Fahrenheit to Celsius',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'fahrenheit': {'type': 'number', 'description': 'Temperature in Fahrenheit'},
      },
      'required': ['fahrenheit'],
    }),
    onCall: (args) {
      final f = args['fahrenheit'] as num;
      final c = (f - 32) * 5 / 9;
      return '${c.toStringAsFixed(1)}°C';
    },
    inputFromJson: (json) => json,
  );

  // Create agent with tools
  final agent = Agent('openai:gpt-4o-mini', tools: [weatherTool, tempTool]);

  // Multi-turn conversation with tool execution
  final messages = [
    ChatMessage.humanText('What\'s the weather in Portland and convert it to Celsius?'),
  ];

  print('User: ${messages.last.content}');
  await for (final chunk in agent.runStream(messages)) {
    stdout.write(chunk.output);
    messages.addAll(chunk.messages);
  }
}
```

### Listing all models for all providers

You can use `ChatProvider.getModels()` to enumerate all available models for every
provider. This works for all providers in `ChatProvider.all`:

```dart
import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  var totalProviders = 0;
  var totalModels = 0;
  for (final provider in ChatProvider.all) {
    totalProviders++;
    print('\n# [1m${provider.displayName}[0m (${provider.name})');
    final models = await provider.getModels();
    final modelList = models.toList();
    totalModels += modelList.length;
    for (final model in modelList) {
      print('- ${provider.name}:${model.name} ${model.displayName ?? ''}');
    }
    print('  (${modelList.length} models)');
  }
  print('\nTotal providers: $totalProviders');
  print('Total models: $totalModels');
}
```

This will print all providers, their available models, and a summary count at
the end.

## Reliability Features

### Automatic Retry with Rate Limiting

The package includes automatic retry logic for handling rate limits (429 errors)
with exponential backoff and proper `Retry-After` header support. This is
automatically enabled for all OpenAI-compatible providers.

```dart
// Retry is automatic - no configuration needed
final model = ChatProvider.openai.createModel();
final response = await model.sendStream(messages);
// Will automatically retry on 429 with proper delays
```

**Features:**
- Respects server `Retry-After` headers
- Exponential backoff with jitter
- Configurable retry attempts (default: 3)
- Structured logging for debugging
- Works with all HTTP operations

### Provider Selection by Name

Use static typed providers or dynamic lookup by name/alias:

```dart
// Static typed provider selection (recommended)
final openaiProvider = ChatProvider.openai;
final anthropicProvider = ChatProvider.anthropic;
final googleProvider = ChatProvider.google;
final cerebrasProvider = ChatProvider.cerebras;
final ollamaProvider = ChatProvider.ollama;

// Embeddings providers
final openaiEmbeddings = EmbeddingsProvider.openai;
final googleEmbeddings = EmbeddingsProvider.google;
final mistralEmbeddings = EmbeddingsProvider.mistral;
final cohereEmbeddings = EmbeddingsProvider.cohere;

// Dynamic selection by name
final provider = ChatProvider.forName('openai');

// Using aliases
final claudeProvider = ChatProvider.forName('claude');  // → Anthropic
final geminiProvider = ChatProvider.forName('gemini');   // → Google
```

### Usage Tracking

All models automatically track token usage when available:

```dart
final model = ChatProvider.openai.createModel();
final result = await model.sendStream(messages).last;

// Access usage information
if (result.usage != null) {
  print('Input tokens: ${result.usage!.promptTokens}');
  print('Output tokens: ${result.usage!.responseTokens}');
  print('Total tokens: ${result.usage!.totalTokens}');
}
```

## Additional information
- To contribute, open issues or pull requests on GitHub. Please follow the
  project style and compat rules.
- For questions or support, file an issue and the maintainers will respond as
  soon as possible.
