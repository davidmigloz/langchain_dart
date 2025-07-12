# Streaming Tool Call Architecture

This document specifies how the LangChain Dart compatibility layer handles streaming messages and tool calls across different providers.

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Core Concepts](#core-concepts)
3. [Provider Capabilities](#provider-capabilities)
4. [Streaming Patterns](#streaming-patterns)
5. [Tool Call Handling](#tool-call-handling)
6. [Implementation Details](#implementation-details)
7. [Provider-Specific Details](#provider-specific-details)
8. [Testing and Validation](#testing-and-validation)

## Architecture Overview

The system operates through a three-layer architecture:

```
┌─────────────────────────────────────────────────────────────┐
│                         Agent Layer                          │
│  - User-facing API (run/runStream)                          │
│  - Tool execution orchestration                             │
│  - Message accumulation and streaming UX                     │
│  - Tool call/result matching                               │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      ChatModel Layer                         │
│  - Provider-specific implementations                         │
│  - Delegates to mappers for protocol handling               │
│  - Returns ChatMessage objects with tool calls              │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                       Mapper Layer                           │
│  - Protocol-specific message conversion                      │
│  - Tool ID assignment for providers without IDs             │
│  - Streaming accumulation (provider-specific)               │
│  - Argument parsing and raw string preservation             │
└─────────────────────────────────────────────────────────────┘
```

## Core Concepts

### Streaming Message Flow
- **Text Streaming**: Immediate output of text chunks to users
- **Tool Accumulation**: Building complete tool calls across chunks
- **Message Boundaries**: Preserving complete messages in history
- **Streaming UX**: Visual separation between tool calls and responses

### Tool Execution
- **Tool Calls**: LLM-initiated function invocations with structured arguments
- **Tool Results**: Responses from tool execution returned to LLM
- **ID Matching**: Ensuring tool calls and results are properly paired
- **Error Handling**: Tool errors returned to LLM for recovery

## Provider Capabilities

### Tool Support Matrix

| Provider   | Streaming | Tools | Tool IDs | Streaming Format |
|------------|-----------|-------|----------|------------------|
| OpenAI     | ✅        | ✅    | ✅       | Partial chunks   |
| OpenRouter | ✅        | ✅    | ✅       | OpenAI-compatible|
| Anthropic  | ✅        | ✅    | ✅       | Event-based      |
| Google     | ✅        | ✅    | ❌       | Complete chunks  |
| Ollama     | ✅        | ✅    | ❌       | Complete chunks  |
| Mistral    | ✅        | ❌    | N/A      | Text only        |
| Cohere     | ✅        | ✅    | ✅       | Custom format    |
| Groq       | ✅        | ✅    | ✅       | OpenAI-compatible|
| Together   | ✅        | ✅    | ✅       | OpenAI-compatible|
| Fireworks  | ✅        | ✅    | ✅       | OpenAI-compatible|
| NVIDIA     | ✅        | ✅    | ✅       | OpenAI-compatible|

## Streaming Patterns

### OpenAI-Style (Partial Chunks)

Tool calls are built incrementally across multiple chunks:

```dart
// Chunk 1: Tool call starts
{
  tool_calls: [{
    index: 0,
    id: 'call_123',
    function: {name: 'get_weather', arguments: ''}
  }]
}

// Chunk 2: Arguments accumulate
{
  tool_calls: [{
    index: 0,
    function: {arguments: '{"city"'}
  }]
}

// Chunk 3: More arguments
{
  tool_calls: [{
    index: 0,
    function: {arguments: ': "Boston"}'}
  }]
}
```

**Mapper Behavior**:
- Accumulates arguments across chunks
- Preserves raw argument string for Agent parsing
- Merges tool calls with same index

### Google/Ollama-Style (Complete Chunks)

Each chunk contains complete information:

```dart
// Single chunk with complete tool call
{
  functionCalls: [{
    name: 'get_weather',
    args: {city: 'Boston'}  // Already parsed
  }]
}
```

**Mapper Behavior**:
- Assigns UUID for tool call ID
- Converts parsed args to JSON string
- Preserves raw string for consistency

### Anthropic-Style (Event-Based)

Structured event sequence:

```dart
// Event 1: Tool use starts
ContentBlockStart {
  type: 'tool_use',
  id: 'toolu_123',
  name: 'get_weather'
}

// Events 2-4: Arguments streamed
InputJsonBlockDelta { partial_json: '{"ci' }
InputJsonBlockDelta { partial_json: 'ty": "Bos' }
InputJsonBlockDelta { partial_json: 'ton"}' }

// Event 5: Tool use complete
ContentBlockStop
```

**Transformer Behavior**:
- Tracks state across events
- Accumulates arguments in StringBuffer
- Emits complete tool call on ContentBlockStop

## Tool Call Handling

### Agent-Level Tool Execution

The Agent orchestrates tool execution with these key features:

#### 1. Argument Parsing Fallback
```dart
// Handle providers that send empty arguments during streaming
var args = toolPart.arguments ?? {};
if (args.isEmpty && (toolPart.argumentsRawString?.isNotEmpty ?? false)) {
  final parsed = json.decode(toolPart.argumentsRawString!);
  if (parsed is Map<String, dynamic>) {
    args = parsed;
  } else if (parsed == null || parsed == 'null') {
    // Handle Cohere edge case
    args = <String, dynamic>{};
  }
}
```

#### 2. Tool Execution Flow
```dart
// Execute all tools and collect results
final toolResultParts = <Part>[];
for (final toolPart in toolCalls) {
  final tool = toolMap[toolPart.name];
  if (tool != null) {
    try {
      final result = await tool.invoke(args);
      final resultString = result is String ? result : json.encode(result);
      
      toolResultParts.add(
        ToolPart.result(
          id: toolPart.id,
          name: toolPart.name,
          result: resultString,
        ),
      );
    } on Exception catch (error, stackTrace) {
      // Add error result part
      toolResultParts.add(
        ToolPart.result(
          id: toolPart.id,
          name: toolPart.name,
          result: json.encode({'error': error.toString()}),
        ),
      );
    }
  }
}

// Create a single user message with all tool results
final toolResultMessage = ChatMessage(
  role: MessageRole.user,
  parts: toolResultParts,
);

// Add to history and yield
conversationHistory.add(toolResultMessage);
yield ChatResult(messages: [toolResultMessage]);
```

#### 3. Streaming UX Enhancement
```dart
// Add newline before AI response after tool calls
if (shouldPrefixNextMessage && isFirstChunkOfMessage) {
  streamOutput = '\n$textOutput';
}
```

### Message Concatenation

The Agent's `_concatMessages` method handles streaming tool calls:

```dart
ChatMessage _concatMessages(ChatMessage accumulated, ChatMessage newChunk) {
  // Find existing tool call with same ID
  final existingIndex = accumulatedParts.indexWhere(
    (part) =>
        part is ToolPart &&
        part.kind == ToolPartKind.call &&
        part.id.isNotEmpty &&
        part.id == newPart.id,
  );

  if (existingIndex != -1) {
    // Merge with existing tool call
    final existingToolCall = accumulatedParts[existingIndex] as ToolPart;
    final mergedToolCall = ToolPart.call(
      id: newPart.id,
      name: newPart.name.isNotEmpty ? newPart.name : existingToolCall.name,
      arguments: newPart.arguments?.isNotEmpty ?? false
          ? newPart.arguments!
          : existingToolCall.arguments ?? {},
      argumentsRawString:
          newPart.argumentsRawString ?? existingToolCall.argumentsRawString,
    );
    accumulatedParts[existingIndex] = mergedToolCall;
  } else {
    // Add new tool call
    accumulatedParts.add(newPart);
  }
}
```

## Implementation Details

### Tool ID Assignment

For providers without tool IDs (Google, Ollama):

```dart
// In mapper
final toolId = Uuid().v4();
return ToolPart.call(
  id: toolId,
  name: functionCall.name,
  arguments: functionCall.args,
  argumentsRawString: json.encode(functionCall.args),
);
```

### Raw Argument Preservation

All mappers preserve raw argument strings:

```dart
// OpenAI mapper
argumentsRawString: argumentsAccumulator.toString()

// Anthropic transformer
argumentsRawString: json.encode(toolUse.input)

// Google mapper
argumentsRawString: json.encode(functionCall.args)
```

### Error Handling

Tool execution errors are included in the consolidated tool result message:

```dart
catch (error, stackTrace) {
  _logger.warning('Tool ${toolPart.name} execution failed: $error');
  
  // Add error result part to collection
  toolResultParts.add(
    ToolPart.result(
      id: toolPart.id,
      name: toolPart.name,
      result: json.encode({'error': error.toString()}),
    ),
  );
}
```

## Provider-Specific Details

### OpenAI
- **Streaming**: Partial chunks with index-based accumulation
- **Tool IDs**: Provided by API
- **Arguments**: Streamed as raw JSON string
- **Parsing**: Agent handles at execution time

### Anthropic
- **Streaming**: Event-based with explicit stages
- **Tool IDs**: Provided by API
- **Arguments**: Accumulated via InputJsonBlockDelta
- **Special**: ContentBlockStop triggers emission

### Google
- **Streaming**: Complete chunks per message
- **Tool IDs**: Generated by mapper (UUID)
- **Arguments**: Provided as parsed objects
- **Conversion**: Mapper converts to JSON string

### Ollama
- **Streaming**: Complete chunks
- **Tool IDs**: Generated by mapper (UUID)
- **Arguments**: Provided as parsed objects
- **Note**: Both native and OpenAI-compatible endpoints

### Cohere
- **Streaming**: Custom format with <|python_tag|>
- **Tool IDs**: Provided by API
- **Arguments**: Special parsing for "null" string
- **Edge Case**: Sends "null" for parameterless tools

## Testing and Validation

### Key Test Scenarios

1. **Streaming Integrity**: No dropped chunks or text
2. **Tool Accumulation**: Arguments built correctly across chunks
3. **ID Matching**: Tool calls and results properly paired
4. **Error Recovery**: Tool errors handled gracefully
5. **UX Features**: Newline prefixing works correctly
6. **Message History Validation**: User/model alternation maintained
7. **Tool Result Consolidation**: Multiple results in single message

### Debug Examples

```dart
// debug_streaming_tool_calls.dart
// Tests streaming with multiple tool calls

// debug_tool_accumulation.dart
// Verifies argument accumulation across chunks
```

### Edge Cases

1. **Empty Arguments**: Some providers send `arguments: {}`
2. **Parameterless Tools**: Cohere sends `"null"` string
3. **Multiple Same Tools**: Ensure IDs differentiate calls
4. **Streaming Interruption**: Partial tool calls handled

## Key Design Principles

1. **Streaming First**: Optimize for real-time user experience
2. **Provider Abstraction**: Agent doesn't know streaming details
3. **Raw String Preservation**: Keep argumentsRawString for fallback
4. **Error Transparency**: Tool errors returned to LLM
5. **Clean Separation**: Each layer has clear responsibilities

## Migration Notes

### Recent Improvements

1. **Unified Tool Handling**: All providers now follow same pattern
2. **Streaming UX**: Added newline prefixing for readability
3. **Error Handling**: Consistent tool error reporting
4. **Message Concatenation**: Robust merging of streaming chunks
5. **Tool Result Consolidation**: Multiple tool results in single user message
6. **Message Validation**: Comprehensive test validates user/model alternation across all providers

## Future Considerations

1. **Mistral Tools**: Add tool support when API allows
2. **Performance**: Optimize streaming accumulation
3. **Debugging**: Enhanced logging for tool execution
4. **Parallel Tools**: Support concurrent tool execution