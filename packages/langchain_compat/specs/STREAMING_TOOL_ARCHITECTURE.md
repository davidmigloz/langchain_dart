# Streaming Tool Architecture

This document provides a comprehensive overview of how the LangChain Dart compatibility layer handles streaming messages and tool calls across different providers. It explains the roles and interactions between the Agent, mapper helpers, and tool ID helpers.

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Component Responsibilities](#component-responsibilities)
3. [Streaming Message Flow](#streaming-message-flow)
4. [Tool Call Processing](#tool-call-processing)
5. [Provider-Specific Handling](#provider-specific-handling)
6. [Helper Functions](#helper-functions)
7. [Implementation Status](#implementation-status)

## Architecture Overview

The streaming tool architecture consists of three main layers:

```
┌─────────────────────────────────────────────────────────────┐
│                         Agent Layer                          │
│  - User-facing API (run/runStream)                          │
│  - Tool execution orchestration                             │
│  - Message accumulation and streaming UX                     │
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
│  - Argument parsing and validation                          │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      Helper Layer                            │
│  - MessagePartHelpers: Extract text/tools from messages     │
│  - ToolResultHelpers: Serialize tool results                │
│  - ToolIdHelpers: Generate UUIDs for tool calls             │
└─────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

### Agent Layer
The `Agent` class provides the high-level interface for users:

**Responsibilities:**
- Constructs user messages from prompts and attachments
- Orchestrates conversation flow
- Executes tools automatically when detected
- Handles streaming UX enhancements (newline prefixing)
- Accumulates messages for conversation history

**What it does NOT do:**
- Generate tool IDs (delegates to mappers)
- Parse tool arguments (uses pre-parsed arguments from mappers)
- Handle provider-specific protocols (relies on mappers)

### ChatModel Layer
Each provider has a `ChatModel` implementation:

**Responsibilities:**
- Implements `sendStream()` method that returns `ChatMessage` objects
- Delegates to mapper for protocol handling
- Passes through mapper results to Agent

### Mapper Layer
Provider-specific mappers handle protocol details:

**Responsibilities:**
- Convert between unified `ChatMessage` format and provider APIs
- Assign tool IDs for providers that don't provide them (Google, Ollama)
- Handle streaming accumulation (OpenAI, Anthropic)
- Parse tool arguments from raw JSON strings
- Populate both `arguments` and `argumentsRawString` fields

**Key Patterns:**
```dart
// OpenAI mapper assigns IDs when provider gives empty ones
if (toolCall.id!.isEmpty) {
  final toolId = ToolIdHelpers.generateToolCallId(
    toolName: toolCall.function?.name ?? '',
    providerHint: 'openai',
    index: i,
  );
}

// Parse arguments and provide both parsed and raw versions
parts.add(
  ToolPart.call(
    id: toolCall.id,
    name: toolCall.function.name,
    arguments: parsedArguments,  // Map<String, dynamic>
    argumentsRawString: rawArgs,  // Original JSON string
  ),
);
```

### Helper Layer
Centralized utilities used by mappers:

**MessagePartHelpers:**
- `extractText(parts)` - Get text content from message parts
- `extractToolCalls(parts)` - Get tool call parts
- `extractToolResults(parts)` - Get tool result parts

**ToolResultHelpers:**
- `serialize(result)` - Convert any result to string
- `ensureMap(result)` - Wrap non-Map results

**ToolIdHelpers:**
- `generateToolCallId()` - Create UUID for tool calls
- Pure UUID generation (no complex formatting)

## Streaming Message Flow

### 1. User Invocation
```dart
final agent = Agent('openai:gpt-4o', tools: tools);
await for (final chunk in agent.runStream('What is the weather?')) {
  stdout.write(chunk.output);  // Streaming text
  history.addAll(chunk.messages);  // Complete messages
}
```

### 2. Agent Processing
```dart
// Agent.runStream() internally:
1. Creates user message from prompt
2. Yields user message immediately
3. Calls _model.sendStream(conversationHistory)
4. For each chunk:
   a. Extracts text → streams to user
   b. Accumulates complete message using _concatMessages()
   c. When message complete → yields it
   d. If tool calls present → executes tools → yields results
```

### 3. Model Delegation
```dart
// ChatModel.sendStream() internally:
1. Converts messages to provider format using mapper
2. Calls provider API
3. For each response chunk:
   a. Mapper converts to ChatMessage
   b. Yields ChatMessage to Agent
```

### 4. Mapper Protocol Handling

#### OpenAI-Style Streaming (Partial Chunks)
```dart
// Chunk 1: {id: 'call_123', name: 'get_weather', args: ''}
// Chunk 2: {id: 'call_123', name: '', args: '{"city"'}  
// Chunk 3: {id: 'call_123', name: '', args: ': "Boston"}'}

// Mapper accumulates across chunks:
if (toolCall.id != null && toolCall.id!.isNotEmpty) {
  // New tool call
  accumulatedToolCalls.add(StreamingToolCall(
    id: toolCall.id!,
    name: toolCall.function?.name ?? '',
    argumentsJson: toolCall.function?.arguments ?? '',
  ));
} else {
  // Continuation - append to last
  accumulatedToolCalls.last.argumentsJson += toolCall.function!.arguments!;
}

// After stream completes, parse and create final message
final arguments = json.decode(accumulatedToolCall.argumentsJson);
```

#### Google/Ollama-Style (Complete Chunks)
```dart
// Single chunk with complete tool calls but no IDs:
// {id: '', name: 'get_weather', args: '{"city": "Boston"}'}

// Mapper assigns IDs immediately:
final toolId = ToolIdHelpers.generateToolCallId(
  toolName: 'get_weather',
  providerHint: 'google',
);

// Parse complete arguments
final arguments = json.decode(toolCall.arguments);
```

#### Anthropic-Style (Event-Based)
```dart
// Event sequence:
// 1. ContentBlockStart: {type: 'tool_use', id: 'toolu_123', name: 'get_weather'}
// 2. InputJsonBlockDelta: '{"ci'
// 3. InputJsonBlockDelta: 'ty": "Bos'
// 4. InputJsonBlockDelta: 'ton"}'
// 5. ContentBlockStop

// Stateful transformer accumulates:
case ContentBlockStartEvent():
  if (block is ToolUseBlock) {
    lastToolCallId = block.id;
    lastToolName = block.name;
  }

case ContentBlockDeltaEvent():
  if (delta is InputJsonBlockDelta && lastToolCallId != null) {
    _toolArgumentsAccumulator[lastToolCallId]!.write(delta.partialJson);
  }

case ContentBlockStopEvent():
  final argsJson = _toolArgumentsAccumulator[lastToolCallId]!.toString();
  final arguments = json.decode(argsJson);
```

## Tool Call Processing

### 1. Tool ID Assignment (Mapper Layer)

**Providers with IDs:** OpenAI, Anthropic, Cohere
- Mapper preserves provider-supplied IDs

**Providers without IDs:** Google, Ollama  
- Mapper generates UUIDs using ToolIdHelpers

```dart
// In mapper (e.g., Google):
final toolId = toolCall.id.isEmpty 
  ? ToolIdHelpers.generateToolCallId(toolName: toolCall.name)
  : toolCall.id;
```

### 2. Message Accumulation (Agent Layer)

The Agent's `_concatMessages()` method handles streaming protocol differences:

```dart
ChatMessage _concatMessages(ChatMessage accumulated, ChatMessage newChunk) {
  // For OpenAI/Anthropic: Merge tool calls with same ID
  if (existingIndex != -1) {
    final mergedToolCall = ToolPart.call(
      id: newPart.id,
      name: newPart.name.isNotEmpty ? newPart.name : existingToolCall.name,
      arguments: newPart.arguments?.isNotEmpty ?? false 
          ? newPart.arguments!
          : existingToolCall.arguments ?? {},
      argumentsRawString: newPart.argumentsRawString ??
          existingToolCall.argumentsRawString,
    );
    accumulatedParts[existingIndex] = mergedToolCall;
  } else {
    // For Google/Ollama: Add as new tool call
    accumulatedParts.add(newPart);
  }
}
```

### 3. Tool Execution (Agent Layer)

**Critical: Argument Parsing Fallback**

The Agent must handle cases where OpenAI-compatible providers send empty `arguments: {}` during streaming by parsing `argumentsRawString`:

```dart
// Agent detects tool calls in complete message
final toolCalls = messageWithIds.parts
    .whereType<ToolPart>()
    .where((p) => p.kind == ToolPartKind.call)
    .toList();

// Execute each tool
for (final toolPart in toolCalls) {
  final tool = toolMap[toolPart.name];
  
  // CRITICAL: Parse argumentsRaw when arguments is empty
  var args = toolPart.arguments ?? {};
  if (args.isEmpty && (toolPart.argumentsRawString?.isNotEmpty ?? false)) {
    try {
      final parsed = json.decode(toolPart.argumentsRawString!);
      if (parsed is Map<String, dynamic>) {
        args = parsed;
      } else if (parsed == null || parsed == 'null') {
        // Handle Cohere edge case where it sends "null" for no params
        args = <String, dynamic>{};
      }
    } catch (_) {
      // Use empty map on parse failure
      args = <String, dynamic>{};
    }
  }
  
  final result = await tool.invoke(args);
  
  // Create tool result message with matching ID
  final toolResultMessage = ChatMessage(
    role: MessageRole.user,
    parts: [
      ToolPart.result(
        id: toolPart.id,  // Same ID as tool call
        name: toolPart.name,
        result: resultString,
      ),
    ],
  );
}
```

## Provider-Specific Handling

### OpenAI-Compatible Providers
**Providers:** OpenAI, OpenRouter, Groq, Together AI, Fireworks, Cohere

**Streaming Pattern:**
- Tool calls split across multiple chunks
- First chunk has ID, subsequent chunks matched by position
- Arguments accumulated as JSON string

**Mapper Handling:**
```dart
// openai_message_mappers.dart
class StreamingToolCall {
  String id;
  String name;
  String argumentsJson;  // Accumulated across chunks
}

// Accumulate during streaming
// Parse after completion
// Assign UUIDs if provider gives empty IDs
```

### Google Provider
**Streaming Pattern:**
- Complete tool calls in single chunk
- No tool IDs provided
- Arguments as complete JSON

**Mapper Handling:**
```dart
// google_message_mappers.dart
// Generate UUID immediately
final toolId = ToolIdHelpers.generateToolCallId(
  toolName: call.name,
  providerHint: 'google',
);

// Parse complete arguments
final arguments = call.args as Map<String, dynamic>;
```

### Anthropic Provider
**Streaming Pattern:**
- Event-based streaming
- Tool IDs in ContentBlockStart
- Arguments via InputJsonBlockDelta events

**Mapper Handling:**
```dart
// anthropic_message_mappers.dart
class MessageStreamEventTransformer {
  // Stateful tracking across events
  String? lastToolCallId;
  final Map<String, StringBuffer> _toolArgumentsAccumulator = {};
  
  // Accumulate arguments across deltas
  // Create complete tool call on block stop
}
```

### Ollama Provider
**Streaming Pattern:**
- Complete tool calls per chunk
- No tool IDs
- Native Ollama format

**Mapper Handling:**
```dart
// ollama_message_mappers.dart
// Similar to Google - generate UUIDs
// Handle both native and OpenAI-compatible endpoints
```

## Helper Functions

### MessagePartHelpers
Used by all mappers to extract content from messages:

```dart
// Extract text for conversion
final text = MessagePartHelpers.extractText(message.parts);

// Get tool calls for processing
final toolCalls = MessagePartHelpers.extractToolCalls(message.parts);

// Get tool results for grouping
final toolResults = MessagePartHelpers.extractToolResults(message.parts);
```

### ToolResultHelpers
Used to handle tool execution results:

```dart
// Serialize any result type to string
final resultString = ToolResultHelpers.serialize(toolResult);

// Ensure result is wrapped in Map (for Google)
final resultMap = ToolResultHelpers.ensureMap(toolResult);
```

### ToolIdHelpers
Used by mappers for providers without IDs:

```dart
// Generate deterministic UUID
final toolId = ToolIdHelpers.generateToolCallId(
  toolName: 'weather_tool',
  providerHint: 'google',
);
// Result: "550e8400-e29b-41d4-a716-446655440000" (pure UUID)
```

## Implementation Status

### ✅ Completed (December 2024)

1. **Centralized Tool ID Generation**
   - Pure UUID generation in ToolIdHelpers
   - Used by Google and Ollama mappers
   - Removed from Agent layer

2. **Helper Functions**
   - MessagePartHelpers: Static methods for part extraction
   - ToolResultHelpers: Static methods for result handling
   - ToolIdHelpers: UUID generation and validation

3. **Provider Support**
   - OpenAI, Google, Anthropic, Ollama: Full tool support
   - Cohere: Via OpenAI compatibility
   - Mistral: No tool support

4. **Streaming Protocols**
   - OpenAI: Chunk accumulation with merging
   - Google/Ollama: Complete chunks with ID generation
   - Anthropic: Event-based with argument accumulation

### ✅ Recently Fixed Issues (December 2024)

1. **Missing argumentsRawString in Mappers**
   - Added `argumentsRawString` to Google, Ollama, and Anthropic mappers
   - All mappers now provide raw JSON for Agent's streaming fallback

2. **Agent Argument Parsing Fallback**
   - Agent now parses `argumentsRawString` when `arguments` is empty
   - Handles OpenAI-compatible providers during streaming
   - Handles Cohere edge case where it sends "null" for no params

3. **Tool Error Handling**
   - Agent catches tool exceptions and returns error results to LLM
   - Allows LLM to handle failures gracefully
   - Uses `// ignore: exception_hiding` since this is intentional

4. **Duplicate Agent Implementation**
   - Deleted `agent_message.dart`
   - Updated all imports to use main Agent

### ⚠️ Remaining Issues

1. **Architecture Violations**
   - Google model contains schema conversion logic that belongs in mapper
   - Some providers (OpenRouter, Cohere) may have tool ID uniqueness issues

### Key Design Principles

1. **Separation of Concerns**
   - Agent: Orchestration and execution
   - Mappers: Protocol handling and ID assignment
   - Helpers: Common utilities

2. **Provider Agnostic Agent**
   - Agent doesn't know about provider protocols
   - All provider logic in mappers
   - Unified message format

3. **Robust ID Management**
   - Mappers ensure all tool calls have IDs
   - Pure UUIDs for consistency
   - ID matching for call/result pairs

4. **Streaming UX**
   - Text streams immediately
   - Tool execution transparent
   - Message boundaries preserved

## Debugging

### Common Issues and Solutions

1. **Missing Tool IDs**
   - Check mapper assigns IDs for providers without them
   - Verify ToolIdHelpers.generateToolCallId() usage

2. **Tool Arguments Not Parsed**
   - Check mapper parses argumentsRaw/argumentsJson
   - Verify both arguments and argumentsRawString populated

3. **Duplicate Tool Calls**
   - Check Agent._concatMessages() merging logic
   - Verify mapper not creating duplicates

4. **Streaming Text Issues**
   - Check text accumulation in Agent
   - Verify single TextPart per message

### Debug Patterns

```dart
// Log tool call processing
print('Tool calls: ${toolCalls.map((tc) => '${tc.name}(${tc.id})').join(', ')}');

// Check ID generation
print('Generated ID: ${ToolIdHelpers.generateToolCallId(toolName: 'test')}');

// Verify argument parsing
print('Arguments: ${toolPart.arguments}');
print('Raw: ${toolPart.argumentsRawString}');

// Check message accumulation
_assertNoMultipleTextParts(messages);
```

## Conclusion

The streaming tool architecture achieves clean separation of concerns:

- **Agent**: High-level orchestration without provider knowledge
- **Mappers**: Provider-specific protocol handling and ID management  
- **Helpers**: Reusable utilities for common patterns

This design supports all major providers while maintaining a simple, unified API for users. The architecture is extensible for new providers and robust against provider-specific quirks.