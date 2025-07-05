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
- **Implementation**: Uses native `format` parameter with full schema
- **API Feature**: Direct JSON schema support in format field
- **Schema Conversion**: Direct `JsonSchema.schemaMap` to format parameter
- **Reliability**: High - enforced by local model

```dart
// Conceptual implementation
GenerateChatCompletionRequest(
  format: outputSchema.schemaMap, // Full JSON schema
)
```

### Tool-Based Structured Output Providers

#### Anthropic
- **Implementation**: Creates dedicated `structured_output` tool with schema as input
- **API Feature**: Tool calling with forced tool choice
- **Schema Conversion**: `JsonSchema` becomes tool input schema
- **JSON Extraction**: Tool response arguments converted to text content
- **Reliability**: High - enforced through tool contracts

```dart
// Conceptual implementation
Tool.custom(
  name: 'structured_output',
  inputSchema: outputSchema.schemaMap,
)
// Force tool choice: ToolChoice(type: tool, name: 'structured_output')
// Extract JSON: json.encode(toolResponse.arguments) → TextPart
```

### Unsupported Providers

#### Mistral
- **Status**: Not supported - throws exception
- **Reason**: Package version lacks `responseFormat` parameter support
- **Exception**: Same format as tools limitation
- **Future**: Will be updated when package supports native structured output

```dart
if (outputSchema != null) {
  throw Exception('Structured output (JsonSchema) is not supported by Mistral yet.');
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