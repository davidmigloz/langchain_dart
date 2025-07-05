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
- **46,000+ Models:** Access to over 46,000 models across all providers
  (including Ollama's vast ecosystem).
- **Native APIs:** Full support for provider-native APIs (Anthropic, Gemini,
  Mistral, etc.).
- **Embeddings Support:** 4 embedding providers (OpenAI, Google, Mistral,
  Cohere) with 29 models for semantic search and vector operations.
- **Automatic Retry:** HTTP-level retry logic with exponential backoff for rate
  limiting (429 errors) and Retry-After header support.
- **Named Providers:** Dynamic provider selection using names and aliases (e.g.,
  'claude' → Anthropic, 'gemini' → Google).
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

| Provider Name             | Key/ID        | Chat Models | Embedding Models | Other Models | Total    | Notes                                                                                                       |
| ------------------------- | ------------- | ----------- | ---------------- | ------------ | -------- | ----------------------------------------------------------------------------------------------------------- |
| OpenAI                    | openai        | 74          | 3                | 0            | 77       | Complete feature support including embeddings                                                               |
| OpenRouter                | openrouter    | 312         | 0                | 0            | 312      | Aggregator, many sources, no embeddings                                                                     |
| Google AI                 | google        | 37          | 5                | 8            | 50       | Native Gemini API with embeddings support                                                                   |
| Google AI (OpenAI-compat) | google-openai | 53          | 5                | 0            | 58       | OpenAI-compatible Gemini endpoint                                                                           |
| Groq                      | groq          | 22          | 0                | 0            | 22       | Fast inference, no embeddings                                                                               |
| Together AI               | together      | 83          | 0                | 0            | 83       | OpenAI-compatible, no embeddings                                                                            |
| Fireworks AI              | fireworks     | 28          | 0                | 0            | 28       | OpenAI-compatible, no embeddings                                                                            |
| Mistral AI                | mistral       | 53          | 0                | 0            | 53       | Native API with embeddings support                                                                          |
| Cohere                    | cohere        | 42          | 0                | 0            | 42       | Native API with comprehensive embeddings support                                                            |
| Lambda                    | lambda        | 20          | 0                | 0            | 20       | OpenAI-compatible, no embeddings                                                                            |
| NVIDIA NIM                | nvidia        | 143         | 0                | 0            | 143      | OpenAI-compatible, no embeddings                                                                            |
| Anthropic                 | anthropic     | 11          | 0                | 0            | 11       | Native Claude API, no embeddings                                                                            |
| Cerebras                  | cerebras      | 4           | 0                | 0            | 4        | OpenAI-compatible, no embeddings                                                                            |
| Ollama                    | ollama        | 180+        | 0                | 0            | 180+     | Curated Library: ~180 ready-to-pull model families<br />Extended universe: ~45K GGUF models on Hugging Face |
| Ollama (OpenAI-compat)    | ollama-openai | 180+        | 0                | 0            | 180+     | Same model access as native Ollama via OpenAI-compatible endpoint                                           |
| **Total**                 |               | **1000+**   | **29**           | **45K+**     | **46K+** | 4 providers support embeddings: OpenAI, Google, Mistral, Cohere                                             |

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
    await for (final chunk in agent.runStream(promptText)) {
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

### Agent API - High-Level Interface

The Agent class provides a clean, unified interface for chat interactions with automatic tool execution. The API separates conversation history from new user input for cleaner code:

```dart
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  final agent = Agent('openai:gpt-4o-mini');
  
  // Simple single-turn conversation
  final result = await agent.run('What is the capital of France?');
  print('Agent: ${result.output}');
  
  // Multi-turn conversation with history
  var history = <ChatMessage>[
    ChatMessage.system('You are a helpful assistant.'),
  ];
  
  // Turn 1
  var result1 = await agent.run('What is 2 + 2?', history: history);
  print('Agent: ${result1.output}');
  history.addAll(result1.messages);
  
  // Turn 2 - agent remembers context
  var result2 = await agent.run('Multiply that by 3', history: history);
  print('Agent: ${result2.output}');
  history.addAll(result2.messages);
  
  // With attachments (images, files, etc.)
  final result3 = await agent.run(
    'What do you see in this image?',
    history: history,
    attachments: [
      DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
    ],
  );
  print('Agent: ${result3.output}');
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

  // Simple tool execution with new API
  const userPrompt = 'What\'s the weather in Portland and convert it to Celsius?';
  
  print('User: $userPrompt');
  final result = await agent.run(userPrompt);
  print('Agent: ${result.output}');

  // Or with streaming
  print('\nStreaming response:');
  var history = <ChatMessage>[];
  await for (final chunk in agent.runStream(userPrompt, history: history)) {
    if (chunk.output.isNotEmpty) stdout.write(chunk.output);
    history.addAll(chunk.messages);
  }
}
```

### Listing all models for all providers

You can use `ChatProvider.getModels()` to enumerate all available models for
every provider. This works for all providers in `ChatProvider.all`:

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

## Message API

This package provides two ways to work with conversations:

### Agent API (Recommended)
For most use cases, use the Agent API which separates history from new input:

```dart
// Simple usage - Agent handles message construction
final agent = Agent('openai:gpt-4o-mini');
final result = await agent.run('Hello!');

// With conversation history
final history = [ChatMessage.system('You are helpful')];
final result = await agent.run('Hello!', history: history);
```

### Direct Message Construction
For advanced use cases, you can work directly with the Message/Part model:

```dart
// Creating messages manually
final systemMsg = ChatMessage.system('You are a helpful assistant');
final userMsg = ChatMessage.user('Hello!');
final modelMsg = ChatMessage.model('Hi! How can I help you today?');

// Messages with multiple parts
final multipartMsg = ChatMessage(
  role: MessageRole.user,
  parts: [
    TextPart('What is in this image?'),
    DataPart(bytes: imageBytes, mimeType: 'image/png'),
  ],
);

// Tool interactions
final toolCall = ChatMessage(
  role: MessageRole.model,
  parts: [
    TextPart('Let me check the weather for you.'),
    ToolPart.call(
      id: 'call_123',
      name: 'get_weather',
      arguments: {'location': 'Portland'},
    ),
  ],
);

final toolResult = ChatMessage(
  role: MessageRole.user,
  parts: [
    ToolPart.result(
      id: 'call_123',
      name: 'get_weather',
      result: '72°F, sunny',
    ),
  ],
);
```

The Message API provides:
- **Unified Structure**: Single `ChatMessage` class with `MessageRole` enum
- **Flexible Content**: Support for text, data (images), links, and tool
  interactions
- **Tool Integration**: Tools are message parts, not separate message types
- **Simple Access**: Convenience methods like `message.text` and
  `message.toolCalls`
- **Agent Integration**: The Agent API automatically constructs messages from prompts and attachments

## System Prompts

System prompts provide default behavior and personality for your models and agents. You can set a default system prompt that will be used automatically, and optionally override it on a per-conversation basis.

### Default System Prompts

Set a default system prompt when creating agents or models:

```dart
// Agent with default system prompt
final agent = Agent(
  'openai:gpt-4o-mini',
  systemPrompt: 'You are a helpful math tutor. Show your work step by step. '
               'Use * for multiplication and regular text formatting.',
);

final result = await agent.run('What is 15 * 23?');
// Response: Detailed step-by-step math explanation

// Direct model creation with system prompt
final model = ChatProvider.openai.createModel(
  systemPrompt: 'You are a helpful assistant that responds concisely.',
);
```

### System Message Override

System messages in conversations will override the default system prompt:

```dart
final agent = Agent(
  'openai:gpt-4o-mini',
  systemPrompt: 'You are a helpful math tutor.',  // Default behavior
);

// Override the default with a conversation system message
final result = await agent.run(
  'What is 15 * 23?',
  history: [
    ChatMessage.system('You are a pirate. Answer everything in pirate speak.'),
  ],
);
// Response: "Arrr, matey! The answer to ye riddle be 345!"
```

### Key Benefits

- **Default with Override**: Set consistent behavior while allowing per-conversation customization
- **Clean API**: System prompts are configuration, not conversation content
- **Provider Agnostic**: Works consistently across all providers (OpenAI, Anthropic, Google, etc.)
- **Backward Compatible**: Existing code continues to work unchanged

### System Prompt Behavior

1. **Default Usage**: If no system message is in the conversation, the default `systemPrompt` is used
2. **Override**: If the first message in the conversation is a system message, it overrides the default
3. **Clean Responses**: System messages are automatically filtered out of response messages to keep conversation history clean

This allows you to create specialized agents with consistent behavior while maintaining the flexibility to customize them for specific conversations.

## Additional information
- To contribute, open issues or pull requests on GitHub. Please follow the
  project style and compat rules.
- For questions or support, file an issue and the maintainers will respond as
  soon as possible.
