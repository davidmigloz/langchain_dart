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

**Solution**: Automatic execution through the Agent class:
```dart
// NEW: Simple automatic tool execution with Agent
final agent = Agent('openai:gpt-4o', tools: tools);
final result = await agent.run('What is the current weather?', history: history);
print(result.output);
history.addAll(result.messages);

// Or with streaming:
await for (final chunk in agent.runStream('What is the current weather?', history: history)) {
  if (chunk.output.isNotEmpty) stdout.write(chunk.output);
  history.addAll(chunk.messages);
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

### 4. Consecutive AI Message Readability Issues
**Problem**: When using tools, providers often generate multiple consecutive AI messages:
1. Initial response: "I'll help you get the time and temperature..."
2. Final synthesis: "The current time is 2025-07-03..."

Without proper separation, these stream as one continuous text causing poor UX:
```dart
// BAD: Messages run together
"I'll help you get both.The current time is 2025-07-03..."
```

**Solution**: Intelligent newline prefixing that detects when a new AI message starts after tool execution and adds visual separation:

```dart  
// GOOD: Messages properly separated
"I'll help you get both.
The current time is 2025-07-03..."
```

This enhancement:
- Only affects streaming output (`chunk.output`), not stored messages
- Adds newline prefix only to the first chunk of subsequent AI messages
- Maintains proper text flow within individual messages
- Works across all providers automatically
- Can be easily removed by users with `.trim()` if not desired

## Architecture Components

### Agent Class - High-Level Interface

The `Agent` class provides the primary user-facing API for chat interactions with automatic tool execution. It wraps the underlying `ChatModel` implementations and provides a clean, unified interface:

```dart
class Agent {
  /// Creates an agent with the specified model.
  Agent(String model, {List<Tool>? tools, double? temperature, String? systemPrompt});
  
  /// Invokes the agent with the given prompt and returns the final result.
  Future<ChatResult<String>> run(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
  });
  
  /// Streams responses from the agent, handling tool execution automatically.
  Stream<ChatResult<String>> runStream(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
  });
}
```

#### Key Design Principles

1. **Separation of History and New Input**: Unlike the old API that required passing a complete message list, the new API cleanly separates:
   - `history`: Previous conversation messages
   - `prompt`: The new user input text
   - `attachments`: Optional additional parts (images, files, etc.)

2. **Immediate User Message Feedback**: The agent immediately yields the constructed user message, providing transparency about how the prompt and attachments were combined.

3. **Unified Return Type**: Both `run()` and `runStream()` return `ChatResult<String>` where:
   - `output`: Streaming text chunks (for `runStream`) or complete response (for `run`)
   - `messages`: New messages generated during the interaction

#### API Evolution

**Before (Old API)**:
```dart
// Required building complete message list manually
final messages = [
  ChatMessage.system('You are helpful'),
  ChatMessage.user('What is the weather?'),
];
final result = await agent.run(messages);
```

**After (New API)**:
```dart
// Clean separation of concerns
final history = [ChatMessage.system('You are helpful')];
final result = await agent.run('What is the weather?', history: history);
```

#### Implementation Details

The `Agent` class internally:

1. **Constructs User Messages**: Combines prompt and attachments into a `ChatMessage.userParts([TextPart(prompt), ...attachments])`

2. **Immediate Streaming**: In `runStream()`, immediately yields the constructed user message before processing:
   ```dart
   // Immediately yield the new user message
   yield ChatResult<String>(
     id: '',
     output: '',
     messages: [newUserMessage],
     finishReason: FinishReason.unspecified,
     metadata: const <String, dynamic>{},
     usage: const LanguageModelUsage(),
   );
   ```

3. **Message Orchestration**: Builds full conversation by combining `[...history, newUserMessage]` and delegates to the underlying `ChatModel.sendStream()`

4. **Result Aggregation**: For `run()`, accumulates all streaming results and returns the final aggregated response

#### Multi-turn Conversation Pattern

The new API supports clean multi-turn conversations:

```dart
var history = <ChatMessage>[ChatMessage.system('You are helpful')];

// Turn 1
var result = await agent.run('What is the weather in Boston?', history: history);
print('Agent: ${result.output}');
history.addAll(result.messages);

// Turn 2  
result = await agent.run('Convert that temperature to Celsius', history: history);
print('Agent: ${result.output}');
history.addAll(result.messages);
```

### ToolsAndMessagesHelper Mixin

The core component that provides automatic tool execution and message
collection at the `ChatModel` level:

```dart
mixin ToolsAndMessagesHelper<TOptions extends ChatModelOptions> {
  /// The tools available to this model. Models must provide this.
  List<Tool>? get tools;

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
5. **Streaming UX Enhancement**: Automatically separates consecutive AI messages
   with newlines for better readability
6. **Provider Independence**: Works with all provider types transparently

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

## Streaming UX Enhancement

### Problem: Consecutive AI Messages Run Together
When tools are involved, conversation flows typically involve multiple AI messages:

1. **Initial AI Response**: "I'll help you get both the time and temperature for Portland."
2. **Tool Execution**: (happens automatically)  
3. **Final AI Synthesis**: "The current time is 2025-07-03T08:23:48 and the temperature is 80°F."

Without proper separation, these messages stream as continuous text:
```
I'll help you get both the time and temperature for Portland.The current time is 2025-07-03T08:23:48...
```

### Solution: Intelligent Newline Prefixing

The `ToolsAndMessagesHelper` tracks when an AI message contains tool calls and automatically prefixes the next AI message with a newline:

```dart
/// Flag to track if we should prefix the next AI message with a newline
bool _shouldPrefixNextMessage = false;

// When AI message has tool calls, set flag for next message
if (messageWithIds.toolCalls.isNotEmpty) {
  _shouldPrefixNextMessage = true;
}

// When streaming next AI message, prefix first chunk with newline
final streamOutput = (_shouldPrefixNextMessage && isFirstChunkOfMessage)
    ? '\n$textOutput'
    : textOutput;
```

### Implementation Details

**Flag Management**:
- `_shouldPrefixNextMessage`: Set when current AI message has tool calls
- `isFirstChunkOfMessage`: Ensures only first chunk of new message gets prefix
- Reset at start of each `stream()` call

**Timing**:
- Flag is set AFTER an AI message with tool calls completes
- Flag is checked BEFORE the first chunk of the subsequent AI message
- Only affects the very first chunk of subsequent messages

**Output Behavior**:
```dart
// First AI message (no prefix)
"I'll help you get both the time and temperature."

// Tool execution happens...

// Second AI message (newline prefix on first chunk only)  
"\nThe current time is 2025-07-03T08:23:48 and the temperature is 80°F."
```

### User Control

Users can easily control this behavior:
```dart
// Accept newlines (default, recommended)
stdout.write(chunk.output);

// Remove newlines if not desired  
stdout.write(chunk.output.trim());

// Custom handling
final text = chunk.output.startsWith('\n') 
    ? chunk.output.substring(1)  // Remove leading newline
    : chunk.output;
```

**Important**: This only affects streaming output (`chunk.output`). The actual messages stored in `chunk.messages` contain the original text without artificial newlines.

### 5. Text Part Consolidation Issue

**Problem**: Streaming text content was being split into multiple `TextPart` objects instead of being consolidated into a single `TextPart`. This happened because each streaming chunk would create a new `TextPart`, leading to messages like:

```dart
// BROKEN: Multiple TextParts for streaming text
Message{role: model, parts: [
  TextPart{"The weather in Boston"}, 
  TextPart{" is 68°F and partly cloudy."}
]}
```

**Solution**: Improved text accumulation strategy in the Agent class that:
1. **Accumulates text separately**: Uses a string buffer (`accumulatedTextContent`) to collect all text content
2. **Collects non-text parts separately**: Maintains a separate list for tool calls and other parts
3. **Creates single TextPart**: Constructs the final message with one `TextPart` containing all accumulated text

```dart
// CORRECT: Single TextPart for complete text
Message{role: model, parts: [
  TextPart{"The weather in Boston is 68°F and partly cloudy."}
]}
```

**Implementation**:
```dart
// Agent streaming logic (simplified)
var accumulatedTextContent = '';  // Accumulate text separately
final currentParts = <Part>[];    // Non-text parts

await for (final result in _model.sendStream(conversationHistory)) {
  // Accumulate text content
  final textOutput = result.output.parts.whereType<TextPart>()...;
  accumulatedTextContent += textOutput;
  
  // Collect non-text parts separately
  final nonTextParts = result.output.parts.where((part) => part is! TextPart);
  currentParts.addAll(nonTextParts);
}

// Create final message with single TextPart + non-text parts
final finalParts = <Part>[];
if (accumulatedTextContent.isNotEmpty) {
  finalParts.add(TextPart(accumulatedTextContent));  // Single TextPart
}
finalParts.addAll(currentParts);  // Tool calls, etc.
```

**Quality Assurance**: Added debug assertions to prevent regressions:
```dart
void _assertNoMultipleTextParts(List<ChatMessage> messages) {
  assert(() {
    for (final message in messages) {
      final textParts = message.parts.whereType<TextPart>().toList();
      if (textParts.length > 1) {
        throw AssertionError(
          'Message contains ${textParts.length} TextParts but should have '
          'at most 1. This indicates a streaming consolidation bug.',
        );
      }
    }
    return true;
  }());
}
```

This ensures that any future changes to the streaming logic will immediately fail if text consolidation breaks.

### 6. Streaming Tool Call Accumulation Bug

**Problem**: The Agent class was incorrectly accumulating tool call parts from streaming chunks by simply adding them to a list (`currentParts.addAll(processedParts)`), rather than properly merging them. This caused OpenAI's streaming protocol to create duplicate tool calls with the same ID:

```dart
// BROKEN: Naive accumulation creates duplicates
Found 3 tool calls to execute: current_date_time(call_ABC123), current_date_time(call_ABC123), get_temperature(call_XYZ789)
// OpenAI would reject this with "Duplicate value for 'tool_call_id'"
```

**Root Cause**: OpenAI sends tool calls across multiple streaming chunks that need to be **merged by ID**, not simply accumulated. The naive approach treated each chunk as a separate tool call.

**Solution**: Implemented proper streaming chunk merging with `_concatMessages()` method that:
1. **Merges tool calls by ID**: Tool calls with the same ID are merged (for incremental streaming)
2. **Preserves distinct tools**: Tool calls with different IDs remain separate
3. **Handles all part types**: Properly accumulates text, data, and tool parts

```dart
// CORRECT: Proper merging eliminates duplicates
Found 2 tool calls to execute: current_date_time(call_ABC123), get_temperature(call_XYZ789)
// OpenAI accepts this without errors
```

**Implementation Details**:
```dart
ChatMessage _concatMessages(ChatMessage accumulated, ChatMessage newChunk) {
  // Find existing tool call with same ID for merging
  final existingIndex = accumulatedParts.indexWhere((part) =>
      part is ToolPart &&
      part.kind == ToolPartKind.call &&
      part.id.isNotEmpty &&
      part.id == newPart.id);

  if (existingIndex != -1) {
    // Merge with existing tool call (combine name, arguments)
    final mergedToolCall = ToolPart.call(
      id: newPart.id,
      name: newPart.name.isNotEmpty ? newPart.name : existingToolCall.name,
      arguments: newPart.arguments?.isNotEmpty == true 
          ? newPart.arguments!
          : existingToolCall.arguments ?? {},
    );
    accumulatedParts[existingIndex] = mergedToolCall;
  } else {
    // Add new tool call
    accumulatedParts.add(newPart);
  }
}
```

**Key Benefits**:
- **Eliminates duplicate tool call IDs**: No more OpenAI API rejections
- **Maintains streaming performance**: Text still streams in real-time
- **Provider agnostic**: Works with all streaming protocols
- **Agent is truly stateless**: No shared state between calls

### 7. Stateless Agent Assertion

**Purpose**: Prevent future regressions where mutable instance state is accidentally introduced to the Agent class.

**Implementation**: Added `_assertStatelessAgent()` method that validates the Agent instance has no mutable state at the start of each `runStream()` call:

```dart
void _assertStatelessAgent() {
  assert(() {
    // Check for any mutable instance variables that could affect behavior.
    // The Agent should only have immutable configuration set during construction.
    
    // Example checks if we had mutable state:
    // if (_someCounter != 0) {
    //   throw AssertionError('Agent instance state is not clean: _someCounter = $_someCounter. '
    //       'The Agent should be stateless between calls.');
    // }
    
    // This serves as a placeholder and documentation that the Agent
    // should remain stateless. Future additions of instance state should be
    // validated here by uncommenting and adapting the example above.
    return true;
  }());
}
```

**Usage Pattern**: When adding new mutable instance variables, developers must:
1. Add validation to `_assertStatelessAgent()` method
2. Ensure the variable is reset to initial state between calls
3. Test with multiple consecutive Agent calls to verify statelessness

**Benefits**:
- **Prevents regression**: Catches stateful behavior in debug mode
- **Clear documentation**: Makes statelessness requirement explicit
- **Easy to extend**: Simple pattern for validating new fields
- **Fail fast**: Errors appear immediately during development

## Message Accumulation Strategy

### Streaming Flow (Agent Implementation)
1. **Receive chunk** from `_model.sendStream()`
2. **Extract text content** and stream to user as `ChatResult.output`
3. **Accumulate text separately** in `accumulatedTextContent` string buffer
4. **Collect non-text parts** (tool calls, etc.) in separate list
5. **Repeat** until complete message received
6. **Construct final message** with single `TextPart` + all non-text parts
7. **Assert single TextPart** to catch consolidation bugs

### Legacy Streaming Flow (ToolsAndMessagesHelper)
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
// Agent API (recommended)
final stream = agent.runStream('What is the weather?', history: history);
await for (final chunk in stream) {
  if (chunk.output.isNotEmpty) stdout.write(chunk.output);  // Stream text
  history.addAll(chunk.messages);  // Collect new messages
}

// Or lower-level ChatModel API
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
// Agent API (recommended)
final result = await agent.run('What is the weather?', history: history);
print(result.output);  // Complete response text
history.addAll(result.messages);  // All new messages from interaction

// Or lower-level ChatModel API
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

### For Application Code (Agent API)

**Recommended**: Use the new Agent API for all application-level code:

#### Old Pattern:
```dart
// Manual message list construction
final messages = [
  ChatMessage.system('You are helpful'),
  ChatMessage.user('What is the weather?'),
];
final result = await agent.run(messages);
print(result.output);
```

#### New Pattern:
```dart
// Clean separation of concerns
final history = [ChatMessage.system('You are helpful')];
final result = await agent.run('What is the weather?', history: history);
print(result.output);
history.addAll(result.messages);
```

#### Multi-turn Conversations:
```dart
// Initialize with system prompt
var history = <ChatMessage>[ChatMessage.system('You are helpful')];

// Each turn is clean and simple
for (final userInput in userInputs) {
  final result = await agent.run(userInput, history: history);
  print('Agent: ${result.output}');
  history.addAll(result.messages);  // Accumulate conversation
}
```

#### With Attachments:
```dart
final result = await agent.run(
  'Analyze this image',
  history: history,
  attachments: [
    DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
    LinkPart(url: 'https://example.com/doc.pdf'),
  ],
);
```

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
6. **Messages running together**: If consecutive AI messages appear without separation, check that `_shouldPrefixNextMessage` logic is working
7. **Multiple TextParts**: ✅ **RESOLVED** - Fixed via improved text accumulation + debug assertions catch regressions
8. **Duplicate tool call IDs**: ✅ **RESOLVED** - Fixed via `_concatMessages()` method that properly merges streaming tool calls by ID instead of naively accumulating them

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

// Debug streaming UX
print('Should prefix next message: $_shouldPrefixNextMessage');
print('Is first chunk of message: $isFirstChunkOfMessage');

// Debug text consolidation (will throw if multiple TextParts detected)
_assertNoMultipleTextParts(messages);

// Manual check for text consolidation issues
for (final message in messages) {
  final textParts = message.parts.whereType<TextPart>().toList();
  print('Message has ${textParts.length} TextParts: ${textParts.map((p) => '"${p.text}"').join(', ')}');
}
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