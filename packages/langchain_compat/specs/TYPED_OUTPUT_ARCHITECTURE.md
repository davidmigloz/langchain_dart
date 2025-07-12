# Typed Output Architecture

This document specifies how the LangChain Dart compatibility layer handles typed output (structured JSON responses) across different providers.

## Table of Contents
1. [Overview](#overview)
2. [Provider Capabilities](#provider-capabilities)
3. [Implementation Approaches](#implementation-approaches)
4. [Agent-Level Handling](#agent-level-handling)
5. [Provider-Specific Details](#provider-specific-details)
6. [Testing and Validation](#testing-and-validation)

## Overview

Typed output allows constraining LLM responses to specific JSON schemas. The system handles this through a clean separation of concerns:

- **Agent Layer**: Adds return_result tool when needed, validates JSON output
- **Model Layer**: Passes outputSchema to provider APIs
- **Mapper Layer**: Simple message conversion (no special typed output logic)

## Provider Capabilities

### Support Matrix

| Provider   | Typed Output | Method | Simultaneous Tools+Output |
|------------|--------------|--------|---------------------------|
| OpenAI     | ✅          | Native response_format | ✅ |
| Anthropic  | ✅          | return_result tool | ✅ |
| Google     | ✅          | Native responseSchema | ❌ (TODO: add return_result) |
| Ollama     | ✅          | Native format param | ❌ (TODO: add return_result) |
| Groq       | ✅          | Native (OpenAI-compatible) | ✅ |
| Together   | ✅          | Native (OpenAI-compatible) | ✅ |
| Fireworks  | ✅          | Native (OpenAI-compatible) | ✅ |
| NVIDIA     | ✅          | Native (OpenAI-compatible) | ✅ |
| Mistral    | ❌          | Not supported | ❌ |
| Cohere     | ❌          | Not supported | ❌ |

## Implementation Approaches

### Native API Support

Providers with direct API support for structured output handle typed output cleanly without any special handling at the Agent level.

#### OpenAI and Compatible Providers

OpenAI supports both tools and typed output simultaneously with no conflicts:

```dart
// OpenAI uses response_format.json_schema
ResponseFormat.jsonSchema(
  jsonSchema: JsonSchemaObject(
    name: 'response',
    description: 'Generated response following the provided schema',
    schema: outputSchema.schemaMap,
    strict: true,
  ),
)
```

The Agent always adds the return_result tool when outputSchema is provided, regardless of provider. 

**Empirically verified behavior**:
- **OpenAI**: Calls the return_result tool even though it has native response_format support
- **Anthropic**: Calls the return_result tool (no native support)

The Agent's logic handles both cases identically:
- If return_result was called: use that output
- If not: use the model's direct output (fallback for providers that might not call it)

This unified approach works well for providers that support it. OpenAI surprisingly uses the return_result tool even though it has native support, creating consistency with Anthropic.

**Still TODO**: Make Google and Ollama work with the return_result pattern when both tools and typed output are needed.

#### Google/Gemini
```dart
// Google uses GenerationConfig.responseSchema
GenerationConfig(
  responseMimeType: 'application/json',
  responseSchema: convertToGeminiSchema(outputSchema),
)
```

#### Ollama
```dart
// Ollama uses format parameter in HTTP request
{
  "format": outputSchema.schemaMap,
  "model": "...",
  "messages": [...],
}
```

### Tool-Based Approach (return_result pattern)

For providers without native typed output support, the Agent automatically adds a special tool:

```dart
// In Agent.runStream when outputSchema is provided
if (outputSchema != null) {
  final returnResultTool = Tool<Map<String, dynamic>>(
    name: kReturnResultToolName,
    description: 'Return the final result in the required structured format',
    inputSchema: outputSchema,
    inputFromJson: (json) => json,
    onCall: (args) async => json.encode(args),
  );
  
  tools = [...?_tools, returnResultTool];
}
```

## Agent-Level Handling

The Agent handles typed output uniformly across all providers:

### 1. Model Creation
```dart
// Agent.runStream creates model with appropriate tools
final model = _provider.createModel(
  name: _modelName,
  tools: tools,  // Includes return_result if outputSchema provided
  temperature: _temperature,
  systemPrompt: _systemPrompt,
);
```

### 2. Response Processing
```dart
// In Agent.run after streaming completes
if (outputSchema != null) {
  final metadata = <String, dynamic>{};
  
  if (returnResultCalled && returnResultJson != null) {
    // Tool-based approach: use return_result output
    if (finalOutput.isNotEmpty && finalOutput != returnResultJson) {
      metadata['suppressed_text'] = finalOutput;
    }
    finalOutput = returnResultJson;
  } else {
    // Native approach: finalOutput should already be JSON
  }
}
```

### 3. Type Conversion
```dart
// Agent.runFor parses JSON and applies type conversion
final outputJson = jsonDecode(response.output);
final typedOutput = outputFromJson?.call(outputJson) ?? outputJson;
```

## Provider-Specific Details

### OpenAI
- **Method**: Native `response_format.json_schema` parameter
- **Behavior**: When return_result tool is present, calls it instead of using native format
- **Tools**: Can use tools and typed output simultaneously
- **Verified**: Testing shows OpenAI prefers the return_result tool when available

### Anthropic
- **Method**: return_result tool pattern
- **Behavior**: Model calls return_result tool with JSON
- **Tools**: Works naturally since return_result is just another tool
- **Note**: Agent handles this transparently - Anthropic mapper has no special logic

### Google/Gemini
- **Method**: Native `responseSchema` in GenerationConfig
- **Behavior**: Directly returns JSON in response
- **Tools**: Cannot use tools and typed output together
- **Current**: Works for typed output without tools
- **TODO**: Add return_result pattern for simultaneous tools+output

### Ollama
- **Method**: Native `format` parameter
- **Behavior**: Directly returns JSON in response  
- **Tools**: Cannot use tools and typed output together
- **Implementation**: Uses direct HTTP client to access format parameter
- **TODO**: Add return_result pattern for simultaneous tools+output

## Testing and Validation

### Test Coverage

1. **Basic Structured Output**: Simple JSON object generation
2. **Complex Schemas**: Nested objects, arrays, enums
3. **Edge Cases**: Required fields, null handling, type validation
4. **Tool Integration**: Simultaneous tools and typed output (where supported)

### Example Usage

```dart
// Define schema
final schema = JsonSchema.create({
  'type': 'object',
  'properties': {
    'name': {'type': 'string'},
    'age': {'type': 'integer'},
  },
  'required': ['name', 'age'],
});

// Use with any provider
final agent = Agent('anthropic');  // or 'openai', 'google', etc.
final result = await agent.runFor<Person>(
  'Generate a person named John who is 30 years old',
  outputSchema: schema,
  outputFromJson: Person.fromJson,
);
```

### Future Enhancement: Google/Ollama with return_result

Currently, Google and Ollama don't support simultaneous tools and typed output. The plan is to enhance them to use the same return_result pattern as Anthropic:

```dart
// Future: This will work just like Anthropic
final agent = Agent('google', tools: [weatherTool]);
final result = await agent.runFor<Report>(
  'Get weather and format as report',
  outputSchema: reportSchema,
);
// The Agent will add return_result tool automatically
// Google will use the tool instead of native responseSchema when tools are present
```

## Key Design Principles

1. **Provider Transparency**: Agent handles typed output uniformly
2. **Clean Separation**: Mappers don't contain typed output logic
3. **Automatic Handling**: return_result tool added automatically when needed
4. **Flexible Architecture**: Models created on-the-fly with appropriate tools
5. **Error Transparency**: JSON parsing errors bubble up for debugging

## Migration Notes

### From Mapper-Level to Agent-Level (Anthropic)
- **Old**: Complex logic in anthropic_message_mappers.dart
- **New**: Simple tool addition in Agent.runStream
- **Benefits**:
  - 200+ lines of code removed from mapper
  - Cleaner architecture
  - Easier to maintain
  - Consistent across all providers

## Future Considerations

1. **Mistral Support**: Investigate adding typed output support
2. **Cohere Support**: Consider OpenAI-compatible endpoint
3. **Performance**: Optimize JSON parsing and validation
4. **Schema Evolution**: Support for schema versioning