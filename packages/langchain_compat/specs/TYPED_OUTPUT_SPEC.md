# Typed Output Architecture and Implementation

This document specifies the architecture, principles, and implementation details for structured JSON output support across all chat model providers in the LangChain Dart compatibility layer.

## Overview

The typed output system enables developers to constrain LLM responses to specific JSON schemas, ensuring structured, parseable responses suitable for application integration. Each provider implements structured output using their native capabilities where available.

## Core Architecture

### Agent-Model Coordination

The typed output system operates through a two-layer architecture:

1. **Model Layer**: Responsible for requesting structured output from the underlying LLM API
2. **Agent Layer**: Responsible for validating and parsing the final JSON response

```dart
// High-level usage
final result = await agent.run(
  'What is the capital of France?',
  outputSchema: CityCountry.schema,
);

// Agent expects valid JSON output for parsing
final parsed = jsonDecode(result.output); // Must succeed
```

### Coordination Flow

1. **Schema Propagation**: `JsonSchema` parameter flows from Agent → Model → Provider API
2. **Response Generation**: LLM generates structured response according to schema
3. **JSON Extraction**: Model layer ensures final text content is valid JSON
4. **Agent Parsing**: Agent layer validates JSON and converts to typed objects

## Provider Implementation Strategies

### Native Structured Output Providers

#### OpenAI
- **Implementation**: Uses `ResponseFormat.jsonSchema()` with strict mode
- **API Feature**: Native structured output with schema validation
- **Schema Conversion**: Direct `JsonSchema.schemaMap` to OpenAI format
- **Reliability**: Highest - enforced by API

```dart
// Conceptual implementation
ResponseFormat.jsonSchema(
  jsonSchema: JsonSchemaObject(
    schema: outputSchema.schemaMap,
    strict: true,
  ),
)
```

#### Google/Gemini  
- **Implementation**: Uses `GenerationConfig` with JSON response mode
- **API Feature**: Native schema support through `responseSchema`
- **Schema Conversion**: `JsonSchema` → Gemini `Schema` format with type mapping
- **Reliability**: High - enforced by API

```dart
// Conceptual implementation
GenerationConfig(
  responseMimeType: 'application/json',
  responseSchema: convertToGeminiSchema(outputSchema),
)
```

#### Ollama
- **Implementation**: Uses native `format` parameter with full JSON schema via direct HTTP
- **API Feature**: Native JSON schema support through format field
- **Schema Conversion**: Direct `JsonSchema.schemaMap` to format parameter
- **Reliability**: High - enforced by local model with full schema validation
- **Note**: Bypasses ollama_dart package limitation via direct HTTP requests

```dart
// Conceptual implementation
// Direct HTTP POST to /api/chat with:
{
  "format": outputSchema.schemaMap, // Full JSON schema object
  "model": "...",
  "messages": [...],
  ...
}
```

### Prompt-Based Structured Output Providers

#### Anthropic
- **Implementation**: Uses prefilling technique with system prompt instructions
- **API Feature**: Response prefilling as recommended in official docs
- **Schema Conversion**: `JsonSchema` embedded in system prompt + prefilled `{`
- **Streaming Fix**: Manually stream prefilled content as first chunk (streaming API omits it)
- **Reliability**: Medium-High - relies on prompt following rather than API enforcement
- **Reference**: [Anthropic's structured output guide](https://docs.anthropic.com/en/docs/test-and-evaluate/strengthen-guardrails/increase-consistency)

```dart
// Conceptual implementation
// 1. Add schema to system prompt
systemMsg += 'You must respond with valid JSON matching: ${jsonSchema}'

// 2. Prefill assistant response
messages.add(Message(role: assistant, content: '{'))

// 3. Stream prefilled content first (compensates for streaming API limitation)
yield ChatResult(parts: [TextPart('{')])  // First chunk
// Then stream normal Anthropic response chunks
```

### Unsupported Providers

#### Mistral
- **Status**: Not implemented - throws exception when `outputSchema` is provided
- **Issue**: While Mistral's API documentation suggests support for `response_format` with JSON schema, testing reveals unreliable behavior (returns arrays instead of objects)
- **Package Limitation**: mistralai_dart package doesn't support `response_format` parameter
- **Current Implementation**: Throws `Exception('JSON schema support is not yet implemented for Mistral.')`
- **Future**: Requires investigation into Mistral's actual structured output capabilities

```dart
// Current implementation
if (outputSchema != null) {
  throw Exception('JSON schema support is not yet implemented for Mistral.');
}
```

## System Prompt Ownership Principle

### Core Principle
**System prompts belong to developers, not the library.** The typed output system must never modify or inject content into developer-owned system prompts.

### Developer Responsibilities
When using structured output, developers should enhance their system prompts with schema guidance:

```dart
// Developer-owned system prompt enhancement
final systemPrompt = '''
You are a helpful assistant that provides accurate information.

IMPORTANT: When responding with structured data, ensure your JSON output 
strictly follows the provided schema format. Do not include additional 
text or explanations outside the JSON structure.
''';

final agent = Agent('openai:gpt-4o', systemPrompt: systemPrompt);
```

### Guidance Reference
Developers should refer to the `prompt_helper` example for best practices on crafting system prompts that work effectively with structured output.

### Library Boundaries
- ✅ **Allowed**: Using native API parameters for structured output
- ✅ **Allowed**: Converting schemas to provider-specific formats  
- ❌ **Forbidden**: Modifying or appending to system prompts
- ❌ **Forbidden**: Injecting schema instructions into user messages

## Error Handling and Validation

### Agent Layer Validation
The Agent layer automatically validates JSON output through `jsonDecode()`:

```dart
// In Agent.runFor<T>()
final outputJson = jsonDecode(response.output); // Throws if invalid
```

### Error Propagation
- **Provider Errors**: Bubble up directly without modification
- **JSON Parse Errors**: Thrown by Agent layer when output is not valid JSON
- **Schema Violations**: Depend on provider capabilities (strict mode vs. best effort)

### Exception Consistency
Each provider handles structured output limitations differently:
- **Native Support**: API-level validation and error reporting
- **Tool-Based**: Tool execution error handling
- **Unsupported**: Immediate exception with clear messaging

## Implementation Patterns

### Schema Conversion Pattern
Each provider implements schema conversion appropriate to their API:

```dart
// Provider-specific schema conversion
switch (provider) {
  case 'openai': 
    return ResponseFormat.jsonSchema(schema: jsonSchema.schemaMap);
  case 'google':
    return GenerationConfig(responseSchema: convertToGeminiSchema(jsonSchema));
  case 'ollama':
    return format: jsonSchema.schemaMap;
  case 'anthropic':
    return Tool.custom(inputSchema: jsonSchema.schemaMap);
  case 'mistral':
    throw Exception('JSON schema support is not yet implemented for Mistral.');
}
```

### JSON Extraction Pattern
Providers that don't return JSON directly must extract it:

```dart
// Anthropic: Tool response → JSON text
if (toolCall.name == 'structured_output') {
  return TextPart(json.encode(toolCall.arguments));
}
```

## Future Extensibility

### Adding New Providers
When adding structured output support for new providers:

1. **Assess API Capabilities**: Determine native vs. instruction-based approach
2. **Implement Schema Conversion**: Create provider-specific schema mapping
3. **Ensure JSON Output**: Guarantee final content is valid JSON for Agent parsing
4. **Follow Ownership Principle**: Never modify system prompts
5. **Document Approach**: Update this specification with new patterns

### Package Evolution
As provider packages evolve to support newer structured output features:

1. **Monitor Updates**: Track package versions for new capabilities
2. **Migrate Implementation**: Replace workarounds with native support
3. **Maintain Compatibility**: Ensure existing code continues to work
4. **Update Documentation**: Reflect improved capabilities

## Testing and Validation

### Integration Testing
The `typed_output.dart` example serves as the primary integration test:

```dart
// Validates end-to-end functionality
final result = await agent.run(
  'What is the Windy City in the US of A?',
  outputSchema: TownAndCountry.schema,
);

final map = jsonDecode(result.output); // Must succeed
assert(map['town'] != null);
assert(map['country'] != null);
```

### Provider-Specific Testing
Each provider should be tested with:
- Simple object schemas
- Complex nested schemas  
- Array and enum schemas
- Invalid schema handling
- Error conditions

## Conclusion

The typed output architecture provides a unified interface for structured LLM responses while respecting each provider's native capabilities and maintaining clear separation of concerns. The system prioritizes reliability through native API features where available and maintains developer control over prompt engineering while ensuring consistent JSON validation across all providers.