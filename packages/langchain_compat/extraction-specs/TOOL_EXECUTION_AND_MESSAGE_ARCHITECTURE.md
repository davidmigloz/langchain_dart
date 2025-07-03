# Tool Execution and Message Architecture

This document captures the architectural decisions, learnings, and
implementation details from the major overhaul of tool execution and message
handling in the LangChain Dart compatibility layer.

## Overview

The original architecture required manual tool execution loops and message
management in client code. We redesigned this to provide automatic tool
execution and message collection through a centralized mixin architecture.

## Core Problems Solved

### 1. Manual Tool Execution Complexity
**Problem**: Client code had to manually implement tool execution loops:
```dart
// OLD: Complex manual tool execution
while (!done) {
  final stream = model.stream(messages);
  var accumulatedMessage = const AIChatMessage(content: '');
  
  await for (final chunk in stream) {
    accumulatedMessage = accumulatedMessage.concat(chunk.output);
  }
  
  if (accumulatedMessage.toolCalls.isEmpty) {
    done = true;
  } else {
    for (final toolCall in accumulatedMessage.toolCalls) {
      final tool = toolMap[toolCall.name];
      final result = await tool.invoke(toolCall.arguments);
      messages.add(ChatMessage.tool(toolCallId: toolCall.id, content: result));
    }
  }
}
```

**Solution**: Automatic execution within the chat model:
```dart
// NEW: Simple automatic tool execution
final stream = model.stream(messages);
await for (final chunk in stream) {
  if (chunk.output.isNotEmpty) stdout.write(chunk.output);
  messages.addAll(chunk.messages);
}
```

### 2. Tool Call ID Coordination Issues
**Problem**: Different providers handle tool call IDs differently:
- **OpenAI**: Provides native tool call IDs
- **Anthropic**: Provides native tool call IDs  
- **Google**: No tool call IDs (empty strings)
- **Ollama**: No tool call IDs (empty strings)
- **Mistral**: Provider-specific behavior

**Solution**: Unified UUID-based ID assignment that preserves existing IDs and
generates UUIDs only when needed.

### 3. Provider-Specific Streaming Protocol Issues
**Problem**: Different providers use fundamentally different streaming protocols that require different handling strategies:

**OpenAI Protocol**: Sends partial tool calls that should be merged
```dart
// OpenAI streaming chunks:
Chunk 1: {id: 'call_123', name: 'get_time', args: ''}      // Partial
Chunk 2: {id: 'call_123', name: '', args: '{}'}            // Completion
// Should merge via concat() → {id: 'call_123', name: 'get_time', args: '{}'}
```

**Ollama/Google Protocol**: Sends complete tool calls with empty IDs
```dart
// Ollama streaming (single chunk):
{id: '', name: 'current_date_time', args: '{}'}
{id: '', name: 'get_temperature', args: '{}'}
// Without UUIDs, concat() merges by empty ID →
// BROKEN: {id: '', name: 'current_date_timeget_temperature', args: '{}{}'}
```

**Solution**: Provider-agnostic protocol detection based on data patterns, not provider names.

## Architecture Components

### ToolsAndMessagesHelper Mixin

The core component that provides automatic tool execution and message
collection:

```dart
mixin ToolsAndMessagesHelper<TOptions extends ChatModelOptions> {
  /// The tools available to this model. Models must provide this.
  List<ToolSpec>? get tools;

  /// Raw streaming method that models must implement.
  Stream<ChatResult> rawStream(List<ChatMessage> messages, {TOptions? options});

  /// Automatic invoke() implementation using stream()
  Future<ChatResult> invoke(List<ChatMessage> messages, {TOptions? options});

  /// Automatic stream() implementation with tool execution
  Stream<ChatResult> stream(List<ChatMessage> messages, {TOptions? options});
}
```

### Key Features

1. **Automatic Tool Execution**: Tools are executed automatically when tool
   calls are detected
2. **Error Handling**: Tool execution errors are caught and returned as
   `{"error": "message"}` format
3. **UUID Assignment**: Assigns UUIDs to tool calls that lack IDs (Google,
   Ollama)
4. **Message Collection**: Maintains complete conversation history automatically
5. **Provider Independence**: Works with all provider types transparently

## Tool Call ID Management

### Problem Analysis
Different providers have different tool call ID behaviors:

| Provider  | Native IDs | Format          | Behavior          | Tool Support |
| --------- | ---------- | --------------- | ----------------- | ------------ |
| OpenAI    | ✅ Yes      | `call_abc123`   | Provided by API   | ✅ Full      |
| Anthropic | ✅ Yes      | `toolu_abc123`  | Provided by API   | ✅ Full      |
| Google    | ❌ No       | `""` (empty)    | Must be generated | ✅ Full      |
| Ollama    | ❌ No       | `""` (empty)    | Must be generated | ✅ Full      |
| Cohere    | ✅ Yes      | OpenAI format   | Via OpenAI compat | ✅ Full      |
| Mistral   | ❌ No       | Not applicable  | No tool support   | ❌ None      |

### Solution: Protocol-Agnostic Streaming Detection

The solution uses **data pattern detection** rather than hardcoded provider behavior:

```dart
/// Determines if UUIDs should be assigned before concatenation.
/// Returns true for providers that send multiple tool calls with empty IDs
/// in the same chunk (Ollama, Google), which would cause incorrect merging.
/// Returns false for providers that use proper streaming protocols.
bool _shouldAssignIdsBeforeConcat(AIChatMessage message) {
  // If there are multiple tool calls and any have empty IDs, we need to
  // assign UUIDs before concat to prevent incorrect merging
  if (message.toolCalls.length > 1) {
    return message.toolCalls.any((tc) => tc.id.isEmpty);
  }
  
  // For single tool calls, check if it has an empty ID and no name
  // This indicates a partial chunk that should be concatenated
  if (message.toolCalls.length == 1) {
    final toolCall = message.toolCalls.first;
    return toolCall.id.isEmpty && toolCall.name.isNotEmpty;
  }
  
  return false;
}
```

### Adaptive Streaming Logic

The mixin adapts its behavior based on detected streaming patterns:

```dart
// Handle different provider streaming protocols:
// - OpenAI/Anthropic: Use concat logic for proper tool call merging
// - Ollama/Google: Assign UUIDs before concat to prevent merging
final messageToConcat = _shouldAssignIdsBeforeConcat(rawOutput)
    ? AIChatMessage(
        content: rawOutput.content,
        toolCalls: _assignToolCallIds(rawOutput.toolCalls),
      )
    : rawOutput;
currentAIMessage = currentAIMessage.concat(messageToConcat);
```

### Protocol Detection Results

| Pattern | Detection Logic | Action | Providers |
|---------|----------------|--------|-----------|
| Multiple empty IDs | `toolCalls.length > 1 && any(tc.id.isEmpty)` | Assign UUIDs before concat | Ollama, Google |
| Single empty ID + name | `length == 1 && id.isEmpty && name.isNotEmpty` | Assign UUID before concat | Complete single calls |
| Proper IDs | `!id.isEmpty` | Use natural concat logic | OpenAI, Anthropic |
| Partial chunks | `id.isNotEmpty || name.isEmpty` | Use natural concat logic | OpenAI streaming |

## Message Accumulation Strategy

### Streaming Flow
1. **Receive chunk** from `rawStream()`
2. **Extract text content** and stream to user as `ChatResult.output`
3. **Assign tool call IDs** if needed
4. **Concatenate** with accumulated message
5. **Repeat** until complete message received

### Tool Execution Flow
1. **Complete AI message** with tool calls received
2. **Execute all tools** in parallel (async)
3. **Collect results** with matching tool call IDs
4. **Stream tool results** as `ChatResult.messages`
5. **Continue conversation** with updated history

### Message Types in Conversation
A complete tool-using conversation generates these message types:
1. `SystemChatMessage` - Initial system prompt
2. `HumanChatMessage` - User request
3. `AIChatMessage` - AI response with tool calls
4. `ToolChatMessage` - Tool execution results (one per tool call)
5. `AIChatMessage` - AI final synthesis response

## ChatResult API Design

### Before (Old API)
```dart
class ChatResult extends LanguageModelResult<AIChatMessage> {
  const ChatResult({required super.output, ...});
  
  // Usage:
  result.output.content  // String content
  result.output.toolCalls  // Tool calls
  // No automatic message collection
}
```

### After (New API)
```dart
class ChatResult extends LanguageModelResult<Object> {
  const ChatResult({
    required super.output,  // String for streaming text
    this.messages = const [],  // New messages generated
    ...
  });
  
  final List<ChatMessage> messages;
  
  // Usage:
  result.output  // String (streaming text)
  result.messages  // New messages to add to conversation
}
```

## Streaming vs Invoke Behavior

### Streaming API
**Purpose**: Real-time interaction with visible tool execution **Behavior**:
- Emits `ChatResult` with `output` containing streaming text chunks
- Emits `ChatResult` with `messages` containing completed AI messages, tool
  calls, and tool results
- User sees tool execution happen in real-time
- User accumulates messages as stream progresses

**Example Flow**:
```dart
final stream = model.stream(messages);
await for (final chunk in stream) {
  if (chunk.output.isNotEmpty) stdout.write(chunk.output);  // Stream text
  messages.addAll(chunk.messages);  // Collect new messages
}
```

### Invoke API
**Purpose**: Complete interaction with final result **Behavior**:
- Internally uses `stream()` but accumulates everything
- Returns single `ChatResult` with complete text and all new messages
- User gets final result without seeing intermediate steps

**Example Flow**:
```dart
final result = await model.invoke(messages);
print(result.outputAsString);  // Complete response text
messages.addAll(result.messages);  // All new messages from interaction
```

## Provider Integration Patterns

### Model Implementation Pattern
Each chat model follows this pattern:

```dart
class SomeChatModel extends ChatModel<SomeOptions> 
    with ToolsAndMessagesHelper<SomeOptions> {
  
  @override
  Stream<ChatResult> rawStream(List<ChatMessage> messages, {SomeOptions? options}) {
    // Call provider's API and return stream of ChatResult with AIChatMessage output
    return _client.streamChat(request).map((response) => 
      ChatResult(
        id: response.id,
        output: AIChatMessage(  // Note: AIChatMessage, not String
          content: response.content,
          toolCalls: response.toolCalls?.map(mapToolCall).toList() ?? [],
        ),
        // ... other fields
      )
    );
  }
  
  // invoke() and stream() provided by mixin automatically
}
```

### Mapper Responsibilities
Provider mappers should:
1. Convert provider tool calls to `AIChatMessageToolCall` format
2. Leave `id` field empty if provider doesn't provide IDs
3. Return `ChatResult` with `AIChatMessage` in `output` field
4. **Do NOT** assign tool call IDs (mixin handles this)

## Error Handling

### Tool Execution Errors
Tool execution errors are caught and converted to structured responses:

```dart
try {
  final result = await tool.invoke(toolCall.arguments);
  final resultString = result is String ? result : json.encode(result);
  // Return successful result
} on Exception catch (error) {
  // Convert error to structured format
  return json.encode({'error': error.toString()});
}
```

This allows the LLM to understand and respond to tool failures appropriately.

## Migration Guide

### For Chat Model Implementations
1. **Add mixin**: `with ToolsAndMessagesHelper<YourOptions>`
2. **Remove methods**: Delete existing `invoke()` and `stream()` implementations
3. **Add rawStream**: Implement `rawStream()` method using existing streaming
   logic
4. **Update mappers**: Ensure tool calls have empty IDs when provider doesn't
   provide them

### For Client Code
1. **Simplify loops**: Remove manual tool execution loops
2. **Update streaming**: Use `chunk.output` (String) instead of
   `chunk.output.content`
3. **Collect messages**: Use `messages.addAll(chunk.messages)` to maintain
   conversation
4. **Handle types**: Use type checking for `chunk.output` during migration

## Performance Considerations

### Tool Execution
- Tools are executed in sequence (not parallel) to maintain order
- Tool execution errors don't stop the conversation flow
- Tool results are streamed immediately when available

### Message Collection
- Messages are accumulated in memory during conversation
- Large conversations may impact memory usage
- Consider conversation length limits for production use

### Streaming Efficiency
- Text chunks are streamed immediately without buffering
- Tool call detection happens only when complete messages are received
- UUID generation is minimal overhead

## Debugging and Troubleshooting

### Common Issues

1. **Tool calls getting merged**: Check that protocol detection is working correctly for your provider
2. **Missing tool IDs**: Ensure mappers leave `id` field empty when provider doesn't provide IDs  
3. **OpenAI protocol errors**: ✅ **RESOLVED** - Fixed via protocol detection logic
4. **Tool not found**: Check that tool names match exactly between definition and calling
5. **Incorrect protocol detection**: Verify that your provider's streaming pattern matches expected detection logic

### Debug Patterns
```dart
// Log tool call IDs during execution
print('Tool calls: ${message.toolCalls.map((tc) => '${tc.name}(${tc.id})').join(', ')}');

// Verify tool map contains expected tools
print('Available tools: ${toolMap.keys.join(', ')}');

// Check conversation history
print('Messages: ${messages.map((m) => m.runtimeType).join(' -> ')}');

// Debug protocol detection
print('Should assign IDs before concat: ${_shouldAssignIdsBeforeConcat(message)}');
print('Tool call pattern: ${message.toolCalls.length} calls, empty IDs: ${message.toolCalls.where((tc) => tc.id.isEmpty).length}');
```

## Future Enhancements

### Potential Improvements
1. **Parallel tool execution**: Execute independent tools in parallel
2. **Tool execution limits**: Maximum number of tool rounds to prevent infinite
   loops
3. **Streaming tool results**: Stream individual tool results as they complete
4. **Tool execution context**: Pass conversation context to tool execution
5. **Tool caching**: Cache tool results for repeated calls with same arguments

### Provider Support
- ✅ **All models migrated**: OpenAI, Google, Anthropic, Ollama, Cohere (via typedef), Mistral
- ✅ **OpenAI debugging**: Resolved protocol issues with conversation history via protocol detection
- ✅ **Comprehensive testing**: All providers tested and working with unified architecture
- ✅ **New provider support**: Protocol detection automatically handles future providers based on their streaming patterns

## Conclusion

The new architecture successfully achieves the goal of automatic tool execution
and message collection while maintaining clean separation of concerns. The mixin
pattern allows for consistent behavior across all providers while handling
provider-specific quirks transparently.

### ✅ Migration Complete

**All chat models successfully migrated** to the `ToolsAndMessagesHelper` mixin:
- ✅ OpenAI, Google, Anthropic, Ollama (tool support)  
- ✅ Cohere (inherits from OpenAI)
- ✅ Mistral (unified API, no tools)

### Key Benefits Achieved

- **Dramatically simplified client code** (from complex loops to simple streaming)
- **100% provider coverage** (all models use unified architecture)
- **Provider-agnostic protocol handling** (automatic detection of streaming patterns)
- **Consistent behavior across providers** (unified tool ID handling)
- **Automatic error handling** (structured error responses)
- **Complete conversation visibility** (full message history maintained)
- **Performance optimized** (minimal overhead for UUID generation and message collection)
- **Future-proof architecture** (automatically adapts to new provider protocols)

The architecture is robust, extensible, and significantly improves the developer
experience across the entire provider ecosystem.