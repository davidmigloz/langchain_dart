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

### 3. Streaming Message Concatenation
**Problem**: When providers stream tool calls with empty IDs, the
`AIChatMessage.concat()` method would incorrectly merge separate tool calls:
```dart
// BROKEN: Tool calls get merged due to empty IDs
{id: '', name: 'current_date_time', args: '{}'}
{id: '', name: 'get_temperature', args: '{}'}
// After concat() becomes:
{id: '', name: 'current_date_timeget_temperature', args: '{}{}'}
```

**Solution**: Assign UUIDs immediately upon receiving each chunk, before
concatenation.

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

| Provider  | Native IDs | Format          | Behavior          |
| --------- | ---------- | --------------- | ----------------- |
| OpenAI    | ✅ Yes      | `call_abc123`   | Provided by API   |
| Anthropic | ✅ Yes      | `toolu_abc123`  | Provided by API   |
| Google    | ❌ No       | `""` (empty)    | Must be generated |
| Ollama    | ❌ No       | `""` (empty)    | Must be generated |
| Mistral   | ✅ Yes      | Provider format | Provided by API   |

### Solution: Conditional UUID Assignment

```dart
List<AIChatMessageToolCall> _assignToolCallIds(List<AIChatMessageToolCall> toolCalls) =>
    toolCalls.map((toolCall) {
      // Only assign UUIDs if the tool call has an empty ID
      // Providers like OpenAI already provide proper IDs
      if (toolCall.id.isEmpty) {
        return AIChatMessageToolCall(
          id: _uuid.v4(), // Generate UUID
          name: toolCall.name,
          argumentsRaw: toolCall.argumentsRaw,
          arguments: toolCall.arguments,
        );
      }
      // Return as-is if ID already exists
      return toolCall;
    }).toList();
```

### Critical Timing
UUID assignment must happen **before** message concatenation to prevent tool
call merging:

```dart
// CORRECT: Assign IDs before concat
if (rawOutput is AIChatMessage) {
  final messageWithIds = AIChatMessage(
    content: rawOutput.content,
    toolCalls: _assignToolCallIds(rawOutput.toolCalls), // ID assignment first
  );
  currentAIMessage = currentAIMessage.concat(messageWithIds); // Then concat
}
```

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

1. **Tool calls getting merged**: Check that UUID assignment happens before
   concatenation
2. **Missing tool IDs**: Ensure mappers leave `id` field empty when provider
   doesn't provide IDs
3. **OpenAI protocol errors**: May indicate malformed tool calls in conversation
   history
4. **Tool not found**: Check that tool names match exactly between definition
   and calling

### Debug Patterns
```dart
// Log tool call IDs during execution
print('Tool calls: ${message.toolCalls.map((tc) => '${tc.name}(${tc.id})').join(', ')}');

// Verify tool map contains expected tools
print('Available tools: ${toolMap.keys.join(', ')}');

// Check conversation history
print('Messages: ${messages.map((m) => m.runtimeType).join(' -> ')}');
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
- **Remaining models**: Apply mixin to Anthropic, Mistral, Cohere models
- **OpenAI debugging**: Resolve protocol issues with conversation history
- **Provider testing**: Comprehensive testing across all providers

## Conclusion

The new architecture successfully achieves the goal of automatic tool execution
and message collection while maintaining clean separation of concerns. The mixin
pattern allows for consistent behavior across all providers while handling
provider-specific quirks transparently.

Key benefits:
- **Dramatically simplified client code** (from complex loops to simple
  streaming)
- **Consistent behavior across providers** (unified tool ID handling)
- **Automatic error handling** (structured error responses)
- **Complete conversation visibility** (full message history maintained)
- **Performance optimized** (minimal overhead for UUID generation and message
  collection)

The architecture is robust, extensible, and significantly improves the developer
experience.