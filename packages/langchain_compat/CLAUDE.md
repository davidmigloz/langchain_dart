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
```

## Project Architecture

This is a **Dart compatibility layer package** that provides unified access to 15+ LLM providers through a single import. Key architectural patterns:

### Provider Abstraction Layer
- **Unified Interface**: All providers implement the `Provider` interface
- **Factory Pattern**: Providers create models via `createModel()` method
- **Single Import**: Users only need `import 'package:langchain_compat/langchain_compat.dart'`
- **Verbatim Copying**: Code copied directly from upstream LangChain.dart packages with minimal changes

### Core Directories
- **`lib/src/chat/chat_providers/`** - Provider implementations (OpenAI, Anthropic, Google, Mistral, Ollama, etc.)
- **`lib/src/chat/chat_models/`** - Chat model implementations for each provider
- **`lib/src/chat/tools/`** - Function calling and tool execution
- **`lib/src/embeddings/`** - Text embedding models
- **`lib/src/language_models/`** - Base language model abstractions
- **`lib/src/`** - HTTP clients, custom utilities, and shared components

### Supported Providers (1000+ models total)
- **Cloud**: OpenAI (77), OpenRouter (318), Google Gemini (50), Anthropic (11), Mistral (53), Groq (22), Together AI (81), Fireworks AI (29), Cohere (42), NVIDIA NIM (142)
- **Local**: Ollama (180+) with both native and OpenAI-compatible endpoints

### Key Design Principles
1. **Self-Contained**: No external provider dependencies for end users
2. **OpenAI-Compatible**: Standardizes on OpenAI API format where possible
3. **Native API Support**: Also supports provider-native APIs (Anthropic, Gemini)
4. **Dual Ollama Support**: Both native Ollama API and OpenAI-compatible endpoints

## Development Guidelines

### Code Conventions
- Uses `all_lint_rules_community` for strict linting
- Dart SDK 3.8.1+ required
- Follow existing patterns when adding new providers or models
- Maintain traceability to original source files (see `extraction-specs/FILE_SOURCE_MAP.md`)

### Provider Implementation Pattern
```dart
// All providers follow this pattern
final provider = ChatProvider.openai;  // or anthropic, google, etc.
final model = provider.createModel();
final response = await model.invoke(PromptValue.string('Hello'));

// Alternative: find provider by name/alias  
final provider = ChatProvider.forName('claude');  // uses alias for anthropic
final model = provider.createModel();
```

### Migration Status
- This package is in active development migrating from multiple upstream packages
- Some analyzer errors may exist during migration
- Code is copied verbatim from source packages to maintain compatibility
- Check `extraction-specs/EXTRACTION_SUMMARY.md` for current status

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
dart run example/embeddings.dart         # Text embedding example
```

### Find Provider by Name
```dart
// Find provider using name or alias
final provider = ChatProvider.forName('openai');    // by name
final provider = ChatProvider.forName('claude');    // by alias (maps to anthropic)
final provider = ChatProvider.forName('gemini');    // by alias (maps to google)
```