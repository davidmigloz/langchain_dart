# Unified Streaming and Typed Output Architecture

This document provides a comprehensive specification for how the LangChain Dart
compatibility layer handles streaming messages, tool calls, and typed output
across different providers. It consolidates the previous separate specifications
into a unified view.

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Core Concepts](#core-concepts)
3. [Provider Capabilities](#provider-capabilities)
4. [Streaming Architecture](#streaming-architecture)
5. [Typed Output Implementation](#typed-output-implementation)
6. [Tool and Typed Output Interaction](#tool-and-typed-output-interaction)
7. [Implementation Patterns](#implementation-patterns)
8. [Provider-Specific Details](#provider-specific-details)
9. [Testing and Validation](#testing-and-validation)

## Architecture Overview

The system operates through a three-layer architecture that handles streaming,
tools, and typed output:

```
┌─────────────────────────────────────────────────────────────┐
│                         Agent Layer                          │
│  - User-facing API (run/runStream/runFor)                   │
│  - Tool execution orchestration                             │
│  - Message accumulation and streaming UX                     │
│  - JSON validation for typed output                         │
│  - Metadata preservation during message concatenation        │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      ChatModel Layer                         │
│  - Provider-specific implementations                         │
│  - Delegates to mappers for protocol handling               │
│  - Returns ChatMessage objects with tool calls              │
│  - Propagates outputSchema to provider APIs                 │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                       Mapper Layer                           │
│  - Protocol-specific message conversion                      │
│  - Tool ID assignment for providers without IDs             │
│  - Streaming accumulation (provider-specific)               │
│  - return_result tool detection and JSON conversion         │
│  - Metadata attachment to individual messages               │
└─────────────────────────────────────────────────────────────┘
```

## Core Concepts

### Streaming Message Flow
- **Text Streaming**: Immediate output of text chunks to users
- **Tool Accumulation**: Building complete tool calls across chunks
- **Message Boundaries**: Preserving complete messages in history
- **Metadata Preservation**: Attaching processing metadata to messages

### Tool Execution
- **Tool Calls**: LLM-initiated function invocations with structured arguments
- **Tool Results**: Responses from tool execution returned to LLM
- **ID Matching**: Ensuring tool calls and results are properly paired

### Typed Output
- **Schema Enforcement**: Constraining LLM responses to specific JSON schemas
- **Provider Strategies**: Native API support vs. tool-based approaches
- **JSON Validation**: Agent-level parsing and validation of structured
  responses

### Message Metadata
- **Purpose**: Track per-message processing decisions and suppressed content
- **Location**: Attached to individual `ChatMessage` objects, not `ChatResult`
- **Visibility**: Enables debugging exactly where and why content was modified
- **Common Fields**:
  - `suppressed_text`: Text the LLM generated but was filtered out
  - `suppressed_tool_calls`: Tool calls dropped when return_result is used
  - `extra_return_results`: Additional return_result calls beyond the first

## Provider Capabilities

### Capability Matrix

| Provider   | Streaming | Tools | Typed Output | Simultaneous Tools+Output |
|------------|-----------|-------|--------------|--------------------------|
| OpenAI     | ✅        | ✅    | ✅ (native)  | ✅                       |
| Anthropic  | ✅        | ✅    | ✅ (tool)    | ✅                       |
| Google     | ✅        | ✅    | ✅ (native)  | ❌ (requires 2-pass)     |
| Ollama     | ✅        | ✅    | ✅ (native)  | ❌ (requires 2-pass)     |
| Mistral    | ✅        | ❌    | ❌           | ❌                       |
| Cohere     | ✅        | ✅    | ❌           | ❌                       |
| Groq       | ✅        | ✅    | ✅ (native)  | ✅                       |
| Together   | ✅        | ✅    | ✅ (native)  | ✅                       |
| Fireworks  | ✅        | ✅    | ✅ (native)  | ✅                       |
| NVIDIA     | ✅        | ✅    | ✅ (native)  | ✅                       |

### Implementation Approaches

#### Native Typed Output
Providers with direct API support for structured output:
- **OpenAI**: Uses `response_format.json_schema` parameter
- **Google**: Uses `GenerationConfig.responseSchema`
- **Ollama**: Uses `format` parameter with JSON schema
- **OpenAI-compatible**: Groq, Together, Fireworks, NVIDIA use OpenAI's approach

#### Tool-Based Typed Output
Providers using tools to achieve structured output:
- **Anthropic**: Uses `return_result` tool pattern

#### Two-Pass Pattern
For providers that don't support simultaneous tools and typed output:
1. **Pass 1**: Execute with tools to gather information
2. **Pass 2**: Format with typed output (no tools)

## Streaming Architecture

### Message Flow Patterns

#### OpenAI-Style Streaming (Partial Chunks)
```dart
// Chunk 1: {id: 'call_123', name: 'get_weather', args: ''}
// Chunk 2: {id: 'call_123', name: '', args: '{"city"'}  
// Chunk 3: {id: 'call_123', name: '', args: ': "Boston"}'}

// Mapper accumulates across chunks
// Parse complete arguments after stream ends
```

#### Google/Ollama-Style (Complete Chunks)
```dart
// Single chunk with complete tool call but no ID:
// {id: '', name: 'get_weather', args: '{"city": "Boston"}'}

// Mapper assigns ID immediately
```

#### Anthropic-Style (Event-Based)
```dart
// Event sequence:
// 1. ContentBlockStart: {type: 'tool_use', id: 'toolu_123', name: 'get_weather'}
// 2. InputJsonBlockDelta: '{"ci'
// 3. InputJsonBlockDelta: 'ty": "Bos'
// 4. InputJsonBlockDelta: 'ton"}'
// 5. ContentBlockStop
```

### Critical Streaming Features

#### Argument Parsing Fallback
OpenAI-compatible providers often send empty `arguments: {}` during streaming:

```dart
// Agent must parse argumentsRawString when arguments is empty
var args = toolPart.arguments ?? {};
if (args.isEmpty && (toolPart.argumentsRawString?.isNotEmpty ?? false)) {
  try {
    final parsed = json.decode(toolPart.argumentsRawString!);
    if (parsed is Map<String, dynamic>) {
      args = parsed;
    } else if (parsed == null || parsed == 'null') {
      // Handle Cohere edge case
      args = <String, dynamic>{};
    }
  } catch (_) {
    args = <String, dynamic>{};
  }
}
```

## Typed Output Implementation

### Native API Approaches

#### OpenAI and Compatible Providers
```dart
// Direct schema support
ResponseFormat.jsonSchema(
  jsonSchema: JsonSchemaObject(
    schema: outputSchema.schemaMap,
    strict: true,
  ),
)
```

#### Google/Gemini
```dart
// Native schema with type conversion
GenerationConfig(
  responseMimeType: 'application/json',
  responseSchema: convertToGeminiSchema(outputSchema),
)
```

#### Ollama
```dart
// Direct HTTP with format parameter
{
  "format": outputSchema.schemaMap,
  "model": "...",
  "messages": [...],
}
```

### Tool-Based Approach (Anthropic)

The `return_result` tool pattern allows Anthropic to support typed output:

```dart
// When outputSchema is provided, add return_result tool
if (hasStructuredOutput) {
  final returnResultTool = Tool<Map<String, dynamic>>(
    name: kReturnResultToolName,
    description: 'Return the final result in the required structured format',
    inputSchema: outputSchema,
    inputFromJson: (json) => json,
    onCall: (args) async => args,
  );
  allTools.add(returnResultTool);
}
```

The mapper then detects `return_result` tool calls and converts them to JSON
text:

```dart
// In streaming transformer
if (lastToolName == kReturnResultToolName) {
  // Convert tool arguments to JSON text output
  final parsedArgs = argsJson.isNotEmpty ? json.decode(argsJson) : {};
  final jsonOutput = json.encode(parsedArgs);
  
  // Create metadata for the message
  final messageMetadata = <String, dynamic>{};
  if (_suppressedText.isNotEmpty) {
    messageMetadata['suppressed_text'] = _suppressedText.join('');
  }
  if (_suppressedToolCalls.isNotEmpty) {
    messageMetadata['suppressed_tool_calls'] = _suppressedToolCalls;
  }
  if (_extraReturnResults.isNotEmpty) {
    messageMetadata['extra_return_results'] = _extraReturnResults;
  }

  // Return as TextPart with metadata attached to the message
  return ChatResult(
    output: ChatMessage(
      role: MessageRole.model,
      parts: [TextPart(jsonOutput)],
      metadata: messageMetadata,  // Metadata on message, not result
    ),
    messages: const [],
    finishReason: FinishReason.unspecified,
    metadata: const {},  // Result metadata stays empty
    usage: const LanguageModelUsage(),
  );
}
```

### Key Implementation Details

1. **Text Suppression**: When outputSchema is present, text streaming is
   suppressed
2. **Content Warnings**: Dropped text/tools logged as warnings
3. **Metadata Tracking**: Suppressed content attached to individual messages
4. **First Result Wins**: Multiple return_result calls use first, warn about
   others

## Tool and Typed Output Interaction

### Simultaneous Support (OpenAI, Anthropic)

These providers allow tools and typed output in a single call:

```dart
// Single-pass approach
final agent = Agent('openai:gpt-4o', tools: tools);
final result = await agent.runFor<T>(
  prompt,
  outputSchema: schema,
);
```

For Anthropic, this works because `return_result` is just another tool.

### Sequential Support (Google, Ollama)

These providers require separate calls:

```dart
// Two-pass approach
// Pass 1: Tools only
final agent1 = Agent('google:gemini-pro', tools: tools);
final pass1 = await agent1.run(prompt);

// Pass 2: Typed output only (with history)
final agent2 = Agent('google:gemini-pro');
final pass2 = await agent2.runFor<T>(
  'Format as JSON',
  history: pass1.messages,
  outputSchema: schema,
);
```

## Implementation Patterns

### Provider Detection Pattern

```dart
bool providerSupportsToolsAndTypedOutput(ChatProvider provider) =>
    provider.name == 'openai' || 
    provider.name == 'anthropic' ||
    // Other OpenAI-compatible providers
    provider.name == 'groq' ||
    provider.name == 'together' ||
    provider.name == 'fireworks' ||
    provider.name == 'nvidia';
```

### Schema Conversion Pattern

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
    // No conversion needed - handled via return_result tool
    return null;
}
```

### Metadata Enhancement Pattern

Metadata is attached directly to ChatMessage objects to provide visibility into
per-message processing decisions:

```dart
// ChatMessage with metadata
ChatMessage(
  role: MessageRole.model,
  parts: [TextPart(jsonOutput)],
  metadata: {
    "suppressed_text": "Here is the recipe in JSON format:\n\n",
    "suppressed_tool_calls": ["another_tool(args: {...})"],
    "extra_return_results": ["{...}"]  // If multiple return_result calls
  },
)
```

#### Agent Message Concatenation

The Agent's `_concatMessages` method preserves metadata during streaming:

```dart
// Merge metadata from accumulated and new chunks
final mergedMetadata = <String, dynamic>{
  ...accumulated.metadata,
  ...newChunk.metadata,
};

return ChatMessage(
  role: accumulated.role,
  parts: accumulatedParts,
  metadata: mergedMetadata,
);
```

## Provider-Specific Details

### OpenAI
- **Typed Output**: Native `response_format.json_schema`
- **Tools**: Standard function calling
- **Streaming**: Partial chunks with accumulation
- **Simultaneous**: Full support

### Anthropic
- **Typed Output**: `return_result` tool pattern (NEW)
- **Tools**: Native tool support
- **Streaming**: Event-based with InputJsonBlockDelta
- **Simultaneous**: Full support via tool approach
- **Special Handling**: 
  - Text suppression when outputSchema present
  - Metadata attached to messages for debugging
  - Warning logs for dropped content
  - Per-message visibility of suppressed content

### Google
- **Typed Output**: Native `responseSchema`
- **Tools**: Native function calling
- **Streaming**: Complete chunks per message
- **Simultaneous**: Not supported - requires two-pass

### Ollama
- **Typed Output**: Native `format` parameter
- **Tools**: Native tool support
- **Streaming**: Complete chunks
- **Simultaneous**: Not supported - requires two-pass
- **Note**: Direct HTTP used to access format parameter

### Mistral
- **Typed Output**: Not implemented
- **Tools**: Not supported
- **Issue**: Unreliable API behavior, package limitations

## Testing and Validation

### Integration Tests

1. **Single Provider Tests**: Validate each provider's capabilities
2. **Cross-Provider Tests**: Ensure consistent behavior
3. **Edge Case Tests**: 
   - Empty tool arguments
   - Multiple return_result calls
   - Malformed JSON
   - Mixed text and structured output

### Debug Examples

```dart
// debug_typed_output_with_tool_calls.dart
// Tests simultaneous tools + typed output

// test_anthropic_metadata.dart  
// Verifies metadata tracking for suppressed content
```

### Validation Points

1. **JSON Output**: Agent validates via `jsonDecode()`
2. **Tool Execution**: Arguments parsed correctly
3. **Stream Integrity**: No dropped chunks
4. **Metadata Accuracy**: Suppressed content tracked per message

## Key Design Principles

1. **Provider Agnostic Agent**: Agent doesn't know provider internals
2. **Mapper Responsibility**: Protocol handling and special cases
3. **Transparent Errors**: No exception hiding except intentional tool errors
4. **User Control**: System prompts remain developer-owned
5. **Streaming First**: Optimize for real-time user experience

## Migration Notes

### From Prompted Output to Tool Output (Anthropic)
- **Old**: System prompt instructions + prefilling with `{`
- **New**: `return_result` tool automatically added when outputSchema present
- **Benefits**: 
  - Cleaner implementation
  - Better streaming behavior
  - Consistent with tool architecture
  - Per-message metadata for debugging visibility

### Future Considerations

1. **Mistral Support**: Investigate reliable typed output approach
2. **Cohere Support**: Add typed output via OpenAI compatibility
3. **Provider Evolution**: Update as APIs add native features
4. **Performance**: Optimize streaming and accumulation

## Conclusion

This unified architecture provides consistent handling of streaming, tools, and
typed output across all supported providers while respecting each provider's
native capabilities. The system maintains clean separation of concerns,
transparent error handling, and optimal user experience through streaming-first
design.