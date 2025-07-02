# Model Naming Specification

This document defines the centralized model naming conventions and patterns
implemented in the `langchain_compat` package to ensure consistency,
maintainability, and clear separation between native and cross-platform
providers.

## Core Design Principles

1. **Single Source of Truth**: Each chat model class defines its own
   `defaultModelName` constant
2. **Provider Flexibility**: Native providers use model defaults; cross-platform
   providers can override
3. **Consistency**: All providers follow the same API signature patterns
4. **Type Safety**: Proper nullable/non-nullable type handling throughout
5. **Clear Intent**: Naming reflects behavior and usage patterns

## Model Constant Naming Convention

### Chat Model Classes
All chat model classes **MUST** define a `defaultModelName` constant:

```dart
class ChatOpenAI extends BaseChatModel<ChatOpenAIOptions> {
  /// The default model to use unless another is specified.
  static const defaultModelName = 'gpt-4o-mini';
  
  static String _validateModel(String? model) {
    if (model != null && model.isEmpty) {
      throw ArgumentError(
        "Model cannot be empty. Pass null to use the provider's default model.",
      );
    }
    return model ?? defaultModelName; // ← References constant
  }
}
```

### Current Default Models

| Chat Model Class         | `defaultModelName`             | Purpose                     |
| ------------------------ | ------------------------------ | --------------------------- |
| `ChatOpenAI`             | `'gpt-4o-mini'`                | Cost-effective OpenAI model |
| `ChatGoogleGenerativeAI` | `'gemini-2.0-flash'`           | Latest Google AI model      |
| `ChatAnthropic`          | `'claude-3-5-sonnet-20241022'` | Latest Claude model         |
| `ChatMistralAI`          | `'mistral-small'`              | Standard Mistral model      |
| `ChatOllama`             | `'llama3.1'`                   | Stable local Llama model    |

## Provider Classification System

### Native Providers
**Definition**: Providers that use their own proprietary API endpoints

**Model Strategy**: `defaultModel: null` → Delegate to chat model's
`defaultModelName`

| Provider    | Type   | API Endpoint                   | `defaultModel` | Effective Model                           |
| ----------- | ------ | ------------------------------ | -------------- | ----------------------------------------- |
| `openai`    | Native | `https://api.openai.com/v1`    | `null`         | `ChatOpenAI.defaultModelName`             |
| `google`    | Native | Gemini API                     | `null`         | `ChatGoogleGenerativeAI.defaultModelName` |
| `anthropic` | Native | `https://api.anthropic.com/v1` | `null`         | `ChatAnthropic.defaultModelName`          |
| `mistral`   | Native | `https://api.mistral.ai/v1`    | `null`         | `ChatMistralAI.defaultModelName`          |
| `ollama`    | Native | `http://localhost:11434/api`   | `null`         | `ChatOllama.defaultModelName`             |

### Cross-Platform Providers
**Definition**: Providers that use OpenAI-compatible APIs but with different
model ecosystems

**Model Strategy**: `defaultModel: 'specific-model'` → Override with
provider-appropriate model

| Provider       | Type           | API Endpoint                             | `defaultModel`                                        | Reason                 |
| -------------- | -------------- | ---------------------------------------- | ----------------------------------------------------- | ---------------------- |
| `cohere`       | Cross-platform | `https://api.cohere.ai/compatibility/v1` | `'command-r-plus'`                                    | Cohere's best model    |
| `groq`         | Cross-platform | `https://api.groq.com/openai/v1`         | `'llama3-70b-8192'`                                   | Groq's fast inference  |
| `openrouter`   | Cross-platform | `https://openrouter.ai/api/v1`           | `'google/gemini-2.5-flash'`                           | Cost-effective routing |
| `fireworks`    | Cross-platform | `https://api.fireworks.ai/inference/v1`  | `'accounts/fireworks/models/llama-v3p1-70b-instruct'` | Fireworks specialty    |
| `ollamaOpenAI` | Cross-platform | `http://localhost:11434/v1`              | `'llama3.1'`                                          | OpenAI-compat endpoint |

## Model Selection Flow

### Provider.createModel() Logic
```dart
@override
BaseChatModel<TOptions> createModel({
  String? model,
  List<ToolSpec>? tools,
  double? temperature,
  TOptions? options,
}) {
  final modelToUse = model ?? defaultModel; // ← Provider's defaultModel (null or string)
  return ChatModel(
    model: modelToUse, // ← Passes to chat model constructor
    tools: tools,
    temperature: temperature,
    // ... other options
  );
}
```

### Chat Model Constructor Logic
```dart
ChatModel({
  String? model,
  // ... other parameters
}) : _model = _validateModel(model), // ← Validation function
     super(model: _validateModel(model));

static String _validateModel(String? model) {
  if (model != null && model.isEmpty) {
    throw ArgumentError("Model cannot be empty. Pass null to use the provider's default model.");
  }
  return model ?? defaultModelName; // ← Chat model's constant
}
```

## Usage Examples

### Native Provider Usage
```dart
// Uses ChatOpenAI.defaultModelName ('gpt-4o-mini')
final model1 = Provider.openai.createModel();

// Uses ChatGoogleGenerativeAI.defaultModelName ('gemini-2.0-flash')  
final model2 = Provider.google.createModel();

// Explicit model override
final model3 = Provider.openai.createModel(model: 'gpt-4o');
```

### Cross-Platform Provider Usage
```dart
// Uses Cohere's override ('command-r-plus')
final model1 = Provider.cohere.createModel();

// Uses Groq's override ('llama3-70b-8192')
final model2 = Provider.groq.createModel();

// Explicit model override  
final model3 = Provider.cohere.createModel(model: 'command-r');
```

### Direct Constructor Usage
```dart
// Uses ChatOpenAI.defaultModelName ('gpt-4o-mini')
final model1 = ChatOpenAI(model: null);

// Uses specific model
final model2 = ChatOpenAI(model: 'gpt-4o');

// Error: empty string not allowed
final model3 = ChatOpenAI(model: ''); // ← Throws ArgumentError
```

## Validation Rules

### Model Parameter Validation
1. **`null`**: ✅ Use appropriate default (provider's `defaultModel` or chat
   model's `defaultModelName`)
2. **Non-empty string**: ✅ Use specified model
3. **Empty string**: ❌ Throw `ArgumentError` with helpful message
4. **Whitespace-only**: ❌ Treated as invalid (implementation-dependent)

### Error Messages
```dart
ArgumentError("Model cannot be empty. Pass null to use the provider's default model.")
```

## Migration Guide

### From Hardcoded Strings
```dart
// OLD: Hardcoded model strings
final model = ChatOpenAI(model: 'gpt-4o-mini');
final model = Provider.google.createModel(model: 'gemini-2.0-flash');

// NEW: Use defaults or constants
final model = ChatOpenAI(); // Uses defaultModelName
final model = Provider.google.createModel(); // Uses defaultModelName
final model = ChatOpenAI(model: ChatOpenAI.defaultModelName); // Explicit constant
```

### From Inconsistent Defaults
```dart
// OLD: Different defaults in different places
static const defaultModel = 'gpt-4o-mini';
return model ?? 'gpt-4o'; // ← Inconsistent!

// NEW: Single source of truth
static const defaultModelName = 'gpt-4o-mini';
return model ?? defaultModelName; // ← Consistent!
```

## Implementation Checklist

When adding a new chat model or provider:

- [ ] Chat model defines `static const defaultModelName`
- [ ] `_validateModel()` function references `defaultModelName`
- [ ] Provider uses appropriate `defaultModel` strategy (null for native,
  specific for cross-platform)
- [ ] Provider's `createModel()` implements `final modelToUse = model ??
  defaultModel`
- [ ] All hardcoded model strings removed from examples
- [ ] Documentation updated to reflect new patterns

## Benefits Achieved

1. **🎯 Consistency**: Same patterns across all providers and chat models
2. **🔧 Maintainability**: Single place to update default models
3. **🚀 Flexibility**: Native vs cross-platform providers handled elegantly  
4. **🛡️ Type Safety**: Proper nullable handling with validation
5. **📚 Clarity**: Clear intent through naming conventions
6. **🎨 Clean Code**: No scattered hardcoded strings

This specification ensures the `langchain_compat` package maintains consistent,
maintainable, and intuitive model naming across all providers and chat models. 