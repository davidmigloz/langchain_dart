# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Install dependencies
dart pub get

# Run analysis and linting
dart analyze

# Format code
dart format .

# Run examples
dart run example/provider_models.dart      # List all available models
dart run example/single_turn_chat.dart     # Simple chat example
dart run example/multi_turn_chat.dart      # Conversation example
dart run example/single_tool_call.dart     # Tool calling example
dart run example/multi_tool_call.dart      # Multi-tool calling example
dart run example/usage_tracking.dart       # Usage tracking example
dart run example/agent.dart                # Agent demo with tool chaining
```

## Project Architecture

This is a **Dart compatibility layer package** that provides unified access to 15+ LLM providers through a single import. Key architectural patterns:

### Provider Abstraction Layer
- **Unified Interface**: All providers implement the `Provider` interface
- **Factory Pattern**: Providers create models via `createModel()` method
- **Single Import**: Users only need `import 'package:langchain_compat/langchain_compat.dart'`
- **Verbatim Copying**: Code copied directly from upstream LangChain.dart packages with minimal changes

### Core Architecture Layers

#### Domain Organization
- **`lib/src/chat/`** - Primary domain: Chat models, providers, and tools (main functionality)
- **`lib/src/embeddings/`** - Secondary domain: Text embedding models and providers (mirrors chat structure)
- **`lib/src/language_models/`** - Shared abstractions: Base classes, usage tracking, finish reasons
- **`lib/src/tools/`** - Tool definitions and utilities for function calling
- **`lib/src/*.dart`** - Shared utilities: HTTP clients, exceptions, custom types

#### Chat Domain Structure (Primary Pattern)
```
chat/
├── chat_providers/     # Factory layer - provider discovery and model creation
├── chat_models/        # Implementation layer - per-provider model implementations  
└── tools/             # Tool layer - function calling and execution
```

#### Per-Provider Organization Pattern
Each provider follows consistent structure (applies to both chat and embeddings):
```
provider_chat/  # e.g., openai_chat/, anthropic_chat/
├── provider_chat.dart          # Barrel export for the provider
├── provider_chat_model.dart    # Core model implementation
├── provider_chat_options.dart  # Provider-specific configuration
└── provider_mappers.dart       # API request/response transformations
```

#### Embeddings Domain Structure (Mirror Pattern)
Deliberately mirrors chat architecture for consistency:
```
embeddings/
├── embeddings_providers/    # Factory layer (same pattern as chat)
├── embeddings_models/       # Implementation layer with per-provider subdirs
├── embeddings_model.dart    # Base model abstractions
├── embeddings_result.dart   # Result types
└── similarity.dart         # Similarity utilities
```

### Supported Providers (1000+ models total)
- **Cloud**: OpenAI (77), OpenRouter (318), Google Gemini (50), Anthropic (11), Mistral (53), Groq (22), Together AI (81), Fireworks AI (29), Cohere (42), NVIDIA NIM (142)
- **Local**: Ollama (180+) with both native and OpenAI-compatible endpoints

### Key Design Principles
1. **Self-Contained**: No external provider dependencies for end users
2. **OpenAI-Compatible**: Standardizes on OpenAI API format where possible
3. **Native API Support**: Also supports provider-native APIs (Anthropic, Gemini, Mistral, Cohere)
4. **Dual Ollama Support**: Both native Ollama API and OpenAI-compatible endpoints
5. **Architectural Consistency**: Embeddings deliberately mirrors chat structure for maintainability

### Provider Implementation Patterns

#### Provider Discovery and Registration
```dart
// Static registry pattern - all providers discoverable via static lists
static List<ChatProvider> get all => [openai, anthropic, google, mistral, ...];
static List<EmbeddingsProvider> get all => [openai, google, mistral, cohere];

// Name/alias lookup for dynamic provider selection
final provider = ChatProvider.forName('claude');  // resolves to anthropic
final provider = EmbeddingsProvider.forName('openai');
```

#### Three Provider Architecture Types
1. **OpenAIProvider** - Used for OpenAI-compatible APIs (OpenAI, Groq, Together, Fireworks, NVIDIA, Lambda, OpenRouter)
2. **Native Providers** - Provider-specific APIs (AnthropicProvider, GoogleProvider, MistralProvider, CohereProvider) 
3. **Hybrid Providers** - Special cases (OllamaProvider for native API, CohereOpenAIProvider for compatibility)

#### Barrel File Export Strategy
Hierarchical exports create clean abstraction boundaries:
```dart
// Main entry: langchain_compat.dart
├── chat/chat.dart
├── embeddings/embeddings.dart  
└── language_models/language_models.dart

// Domain level: chat/chat.dart
├── chat_models/chat_models.dart
├── chat_providers/chat_providers.dart
└── tools/tools.dart

// Provider level: chat_models/openai_chat/openai_chat.dart
├── openai_chat_model.dart
├── openai_chat_options.dart
└── openai_mappers.dart
```

## Development Guidelines

### Code Conventions
- Uses `all_lint_rules_community` for strict linting
- Dart SDK 3.8.1+ required
- Follow existing patterns when adding new providers or models
- Maintain traceability to original source files (see `extraction-specs/FILE_SOURCE_MAP.md`)

### Unified API Usage Patterns

#### Basic Chat Usage (Same Code, All Providers)
```dart
// Provider selection - only line that changes between providers
final provider = ChatProvider.openai;  // or anthropic, google, mistral, etc.
final model = provider.createModel();
final response = await model.invoke(PromptValue.string('Hello'));

// Dynamic provider selection via name/alias
final provider = ChatProvider.forName('claude');  // resolves to anthropic
final model = provider.createModel();
```

#### Basic Embeddings Usage (Same Pattern)
```dart
// Provider selection for embeddings (4 providers available)
final provider = EmbeddingsProvider.openai;  // or google, mistral, cohere
final model = provider.createModel();
final result = await model.embedQuery('Hello world');
```

#### Provider Options Pattern
```dart
// Each provider has strongly-typed options that merge with defaults
final model = provider.createModel(
  model: 'gpt-4o',  // provider-specific model name
  temperature: 0.7,
  options: OpenAIChatOptions(  // provider-specific options
    responseFormat: const ChatCompletionResponseFormat.jsonObject(),
    user: 'user123',
  ),
);
```

### Agent Architecture (High-Level Tool Orchestration)

The package provides a **dual-layer architecture** for chat functionality:

#### ChatModel Layer (Raw API)
- **Direct provider access** via `sendStream()` method only
- **No tool execution** - returns raw `ChatResult<AIChatMessage>` 
- **Provider-specific streaming** protocols handled in mappers
- **Minimal abstraction** over native APIs

#### Agent Layer (Orchestration)
- **High-level interface** via `Agent` class in `lib/src/agent.dart`
- **Automatic tool execution** with error handling and streaming UX
- **Model lifecycle management** with provider:model string parsing
- **Message consolidation** across tool calls and responses
- **Streaming enhancement** with proper message separation

```dart
// Low-level: Direct model access (raw API calls)
final model = ChatProvider.openai.createModel();
await for (final chunk in model.sendStream(messages)) {
  // Raw AIChatMessage chunks, manual tool handling required
}

// High-level: Agent orchestration (recommended)
final agent = Agent('openai:gpt-4o-mini', tools: tools);
await for (final chunk in agent.runStream(messages)) {
  // String output chunks, tools executed automatically
}
```

#### Critical Streaming Fix for Tool Arguments
The Agent layer includes a **crucial fix** for streaming tool argument parsing:
- **Problem**: OpenAI-compatible providers send empty `arguments: {}` for streaming responses
- **Solution**: Agent automatically parses `argumentsRaw` JSON when `arguments` is empty
- **Handles edge cases**: Cohere sends `"null"` for parameter-less tools
- **Error resilient**: Graceful fallback for malformed JSON

### Adding New Providers (Implementation Guide)

#### For Chat Providers
1. **Create provider directory**: `lib/src/chat/chat_models/provider_chat/`
2. **Follow the four-file pattern**:
   - `provider_chat.dart` - Barrel export
   - `provider_chat_model.dart` - Core implementation extending `ChatModel<TOptions>`
   - `provider_chat_options.dart` - Options class extending `ChatModelOptions`
   - `provider_mappers.dart` - API request/response transformations
3. **Implement `sendStream()` method** only (Agent handles tool execution)
4. **Add provider class**: `lib/src/chat/chat_providers/provider_provider.dart`
5. **Register in provider list**: Add static instance to `ChatProvider.all`
6. **Update barrel exports**: Add to `chat_models.dart` and `chat_providers.dart`

#### For Embeddings Providers (Mirror Pattern)
1. **Create provider directory**: `lib/src/embeddings/embeddings_models/provider_embeddings/`
2. **Follow the three-file pattern**:
   - `provider_embeddings.dart` - Barrel export
   - `provider_embeddings_model.dart` - Implementation extending `EmbeddingsModel<TOptions>`
   - `provider_embeddings_model_options.dart` - Options extending `EmbeddingsModelOptions`
3. **Add provider class**: `lib/src/embeddings/embeddings_providers/provider_embeddings_provider.dart`
4. **Register in provider list**: Add static instance to `EmbeddingsProvider.all`
5. **Update barrel exports**: Add to `embeddings_models.dart` and `embeddings_providers.dart`

### Migration Status & Verbatim Copying Strategy
- This package is in active development migrating from multiple upstream packages
- **Verbatim copying principle**: Code copied directly from upstream LangChain.dart packages with minimal changes
- Some analyzer errors may exist during migration (this is expected)
- Maintain traceability to original source files (see `extraction-specs/FILE_SOURCE_MAP.md`)
- Check `extraction-specs/EXTRACTION_SUMMARY.md` for current migration status

## Testing & Quality

- **Test Framework**: Standard Dart `test` package (no test files exist yet - tests are TODO)
- **Linting**: Comprehensive rules via `all_lint_rules_community` with custom overrides
- **Analysis**: Run `dart analyze` to check for errors (some expected during migration)
- **Examples**: Located in `/example/` directory with working demonstrations
- **Documentation**: Provider specs in `/extraction-specs/` directory

## Environment Setup

Most providers require API keys set as environment variables:
- `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `GEMINI_API_KEY`, etc.
- Ollama runs locally without API keys
- See README.md provider table for specific key names and links

## Common Tasks

### Run All Examples
```bash
dart run example/provider_models.dart    # List all 1000+ available models
dart run example/single_turn_chat.dart   # Basic chat example
dart run example/multi_turn_chat.dart    # Conversation example  
dart run example/single_tool_call.dart   # Function calling example
dart run example/multi_tool_call.dart    # Multi-tool calling example
dart run example/usage_tracking.dart     # Usage tracking example
dart run example/agent.dart              # Agent demo with weather + temp conversion
dart run example/embeddings.dart         # Text embedding example
```

### Find Provider by Name
```dart
// Find provider using name or alias
final provider = ChatProvider.forName('openai');    // by name
final provider = ChatProvider.forName('claude');    // by alias (maps to anthropic)
final provider = ChatProvider.forName('gemini');    // by alias (maps to google)
```