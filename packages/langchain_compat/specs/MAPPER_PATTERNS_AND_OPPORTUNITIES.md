# Mapper Patterns and Opportunities for Centralization

This document analyzes the mapper patterns across all chat model providers in
langchain_compat, identifying common patterns, differences, and opportunities
for centralized helper functions.

## Related Documentation
- [Tool Execution and Message
  Architecture](TOOL_EXECUTION_AND_MESSAGE_ARCHITECTURE.md) - Details on tool
  execution flow and message handling
- [Extraction Summary](EXTRACTION_SUMMARY.md) - Overview of the codebase
  structure

## Table of Contents
1. [Provider-Specific Mapper Analysis](#provider-specific-mapper-analysis)
2. [Common Patterns](#common-patterns)
3. [Key Differences](#key-differences)
4. [Opportunities for Centralization](#opportunities-for-centralization)
5. [Proposed Helper Functions](#proposed-helper-functions)
6. [Recommendations](#recommendations)

## Provider-Specific Mapper Analysis

### OpenAI Provider (openai_chat)

**Mapper Responsibilities:**
- Message format conversion via extension methods on `List<ChatMessage>`
- Streaming tool call accumulation using `StreamingToolCall` helper class
- Deferred JSON parsing - accumulates `argumentsJson` string during streaming
- Complex tool call ID tracking (first chunk has ID, subsequent chunks match by
  position)
- Post-streaming message assembly via `createCompleteMessageWithTools()`

**Model Responsibilities:**
- Maintains streaming state (`accumulatedToolCalls`, `accumulatedTextBuffer`)
- Orchestrates streaming flow
- Yields text immediately, accumulates tools
- Creates final complete message after stream ends

**Key Patterns:**
```dart
// Streaming accumulation pattern
if (toolCall.id != null && toolCall.id!.isNotEmpty) {
  // New tool call with ID
  accumulatedToolCalls.add(StreamingToolCall(...));
} else if (accumulatedToolCalls.isNotEmpty) {
  // Continuation chunk - append to last tool
  final lastTool = accumulatedToolCalls.last;
  lastTool.argumentsJson += toolCall.function!.arguments!;
}
```

**Edge Cases Handled:**
- Null content in streaming responses (Groq compatibility issue)
- Empty tool arguments requiring raw JSON parsing
- Multiple tool calls in single response

### Google Provider (google_chat)

**Mapper Responsibilities:**
- Bidirectional message conversion with special handling for system messages
- Tool result grouping into `Content.functionResponses()`
- No streaming accumulation (Google provides complete responses)
- Tool result type normalization (wraps non-Map results)

**Model Responsibilities:**
- System message extraction for client configuration
- Client recreation when system instruction changes
- Simple passthrough of mapper results

**Key Patterns:**
```dart
// Tool result wrapping pattern
final response = switch (part.result) {
  final Map<String, Object?> map => map,
  _ => <String, Object?>{'result': part.result},
};
```

**Edge Cases Handled:**
- System messages must be extracted and passed separately
- Tool results that aren't Maps are wrapped
- No tool call IDs provided by API

### Anthropic Provider (anthropic_chat)

**Mapper Responsibilities:**
- Event-based streaming with stateful transformer
- Block-based content handling (text blocks, tool use blocks)
- Complex message grouping logic for tool results
- Event type mapping (MessageStart, ContentBlockStart, etc.)

**Model Responsibilities:**
- Prefilling technique for structured output
- Yields synthetic first chunk when prefilling
- Stream transformation using mapper's transformer

**Key Patterns:**
```dart
// Stateful transformer pattern
class MessageStreamEventTransformer {
  String? lastToolCallId;
  
  ChatMessage? transformEvent(MessageStreamEvent event) {
    switch (event) {
      case MessageStartEvent():
        // Initialize message
      case ContentBlockStartEvent():
        // Track tool call ID
        if (block is ToolUseBlock) {
          lastToolCallId = block.id;
        }
    }
  }
}
```

**Edge Cases Handled:**
- Tool results must be grouped in user messages
- System messages require special handling
- Currently ignores streaming tool arguments (InputJsonBlockDelta)

### Mistral Provider (mistral_chat)

**Mapper Responsibilities:**
- Simple text-only message conversion
- Throws errors if tool parts are encountered
- Direct response mapping

**Model Responsibilities:**
- Enforces no-tools limitation in constructor
- Simple passthrough of mapper results

**Key Patterns:**
```dart
// No-tools enforcement
if (tools != null) {
  throw Exception('Tools are not supported by Mistral.');
}
```

### Ollama Provider (ollama_chat)

**Mapper Responsibilities:**
- Message conversion with image encoding
- Tool call conversion without IDs
- Function definition mapping

**Model Responsibilities:**
- Direct HTTP workaround for JSON schema support
- Standard streaming for other requests
- Simple mapper result passthrough

**Key Patterns:**
```dart
// Image encoding pattern
imageBytes != null
  ? 'data:$mimeType;base64,${base64Encode(imageBytes)}'
  : imageUrl!
```

**Edge Cases Handled:**
- No tool call IDs from API
- Base64 image encoding for local images
- JSON schema requires direct HTTP implementation

## Common Patterns

### 1. Message List Extension Methods
All providers use extension methods on `List<ChatMessage>` for conversion:
- `toOpenAIMessages()`, `toGoogleContents()`, `toAnthropicMessages()`, etc.
- Provides clean API at usage site
- Encapsulates provider-specific logic

### 2. Role Mapping
All providers must map between unified roles and provider-specific roles:
- `MessageRole.system` → provider-specific system role
- `MessageRole.user` → provider-specific user role  
- `MessageRole.model` → provider-specific assistant/model role

### 3. Text Content Extraction
Common pattern for extracting text from message parts:
```dart
final text = message.parts
    .whereType<TextPart>()
    .map((p) => p.text)
    .join();
```

### 4. Tool Definition Conversion
All tool-supporting providers convert `Tool` objects to their format:
```dart
tools?.map((tool) => ProviderToolFormat(
  name: tool.name,
  description: tool.description,
  parameters: tool.inputSchema.schemaMap,
)).toList()
```

## Key Differences

### 1. Streaming Accumulation Strategies

**Accumulation Required:**
- **OpenAI**: Complex accumulation with ID tracking and JSON string building
- **Anthropic**: Stateful transformer tracking events

**No Accumulation:**
- **Google**: Complete responses per chunk
- **Ollama**: Complete tool calls per chunk
- **Mistral**: No tool support

### 2. Tool Argument Handling

**JSON String Accumulation:**
- **OpenAI**: Builds `argumentsJson` string across chunks, parses after
  completion

**Pre-parsed Objects:**
- **Google**: Receives arguments as parsed objects
- **Ollama**: Receives complete JSON strings

**Event-based Streaming:**
- **Anthropic**: Arguments via InputJsonBlockDelta (currently ignored)

### 3. Tool Call ID Management

**Provider-supplied IDs:**
- **OpenAI**: IDs in first chunk only
- **Anthropic**: IDs in ContentBlockStart events

**No IDs:**
- **Google**: Mapper provides empty string
- **Ollama**: Mapper provides empty string

### 4. Tool Result Handling

**Separate Tool Messages:**
- **OpenAI**: Each tool result as separate message
- **Ollama**: Each tool result as separate message with role "tool"

**Grouped Results:**
- **Google**: All results in single `Content.functionResponses()`
- **Anthropic**: All results as blocks in user message

### 5. System Message Handling

**In Message Stream:**
- **OpenAI**: System messages inline with other messages
- **Mistral**: System messages inline
- **Ollama**: System messages inline

**Special Handling:**
- **Google**: Must be extracted and set on client
- **Anthropic**: Complex rules about placement

## Opportunities for Centralization

### 1. Message Part Extraction Helpers

**Current Pattern (duplicated across providers):**
```dart
// Text extraction
final text = message.parts.whereType<TextPart>().map((p) => p.text).join();

// Tool call extraction  
final toolCalls = message.parts.whereType<ToolPart>()
    .where((p) => p.kind == ToolPartKind.call);

// Tool result extraction
final toolResults = message.parts.whereType<ToolPart>()
    .where((p) => p.kind == ToolPartKind.result);
```

**Potential Helper:**
```dart
class MessagePartExtractor {
  static String extractText(List<Part> parts) =>
      parts.whereType<TextPart>().map((p) => p.text).join();
      
  static List<ToolPart> extractToolCalls(List<Part> parts) =>
      parts.whereType<ToolPart>()
          .where((p) => p.kind == ToolPartKind.call)
          .toList();
          
  static List<ToolPart> extractToolResults(List<Part> parts) =>
      parts.whereType<ToolPart>()
          .where((p) => p.kind == ToolPartKind.result)
          .toList();
}
```

### 2. Tool Result Serialization Helper

**Current Pattern (duplicated):**
```dart
// OpenAI, Ollama, others
final content = toolResult.result is String
    ? toolResult.result as String
    : json.encode(toolResult.result);
```

**Potential Helper:**
```dart
class ToolResultSerializer {
  static String serialize(dynamic result) =>
      result is String ? result : json.encode(result);
      
  static Map<String, dynamic> ensureMap(dynamic result) =>
      switch (result) {
        final Map<String, dynamic> map => map,
        _ => {'result': result},
      };
}
```

### 3. Streaming Accumulation Base Class

For providers that need to accumulate during streaming:

```dart
abstract class StreamingAccumulator<T> {
  final List<T> accumulated = [];
  
  void addNew(T item);
  void appendToLast(T partial);
  bool shouldAppendToLast(T item);
}

class ToolCallAccumulator extends StreamingAccumulator<StreamingToolCall> {
  @override
  void addNew(StreamingToolCall call) => accumulated.add(call);
  
  @override
  void appendToLast(StreamingToolCall partial) {
    if (accumulated.isNotEmpty) {
      accumulated.last.argumentsJson += partial.argumentsJson;
    }
  }
  
  @override
  bool shouldAppendToLast(StreamingToolCall call) =>
      call.id.isEmpty && accumulated.isNotEmpty;
}
```

### 4. Image Encoding Helper

**Current Pattern (Ollama):**
```dart
imageBytes != null
    ? 'data:$mimeType;base64,${base64Encode(imageBytes)}'
    : imageUrl!
```

**Potential Helper:**
```dart
class ImageEncoder {
  static String encodeOrUrl({
    Uint8List? bytes,
    String? url,
    String? mimeType,
  }) {
    if (bytes != null) {
      return 'data:${mimeType ?? 'image/png'};base64,${base64Encode(bytes)}';
    }
    return url!;
  }
}
```

### 5. Provider Response Validation

**Potential Helper:**
```dart
class ResponseValidator {
  static void validateStreamingChunk(Map<String, dynamic> json) {
    if (json['choices'] == null) {
      throw FormatException('Missing "choices" field in streaming response');
    }
    // Other common validations
  }
  
  static void validateToolCall(ToolCall call) {
    if (call.name.isEmpty) {
      throw FormatException('Tool call missing name');
    }
    // Other validations
  }
}
```

## Areas Where Centralization May Not Help

### 1. Provider-Specific Message Grouping
- Google's function response grouping
- Anthropic's block-based structure
- Too different to meaningfully abstract

### 2. Streaming Protocol Handling
- OpenAI's chunk-based with partial data
- Anthropic's event-based with state machine
- Google's complete responses
- Fundamental architectural differences

### 3. System Message Handling
- Inline vs separate configuration
- Provider-specific rules and limitations
- Would require complex configuration

### 4. Tool Call ID Strategies
- Some providers supply IDs, others don't
- Different ID formats and timing
- ID assignment strategies differ

## Proposed Helper Functions

Based on the analysis, here are the helpers that would provide the most value:

### 1. MessagePartHelpers
Location: `lib/src/chat/chat_models/helpers/message_part_helpers.dart`

Benefits:
- Reduces duplicate code across all providers
- Standardizes part extraction
- Single place to update if Part types change

### 2. ToolResultHelpers  
Location: `lib/src/chat/chat_models/helpers/tool_result_helpers.dart`

Benefits:
- Consistent serialization across providers
- Handles edge cases (null, non-Map types)
- Simplifies mapper code

### 3. StreamingAccumulatorBase
Location: `lib/src/chat/chat_models/helpers/streaming_accumulator.dart`

Benefits:
- Provides tested accumulation logic
- Can be extended for provider-specific needs
- Reduces bugs in streaming handling

### 4. ImageEncodingHelpers
Location: `lib/src/chat/chat_models/helpers/image_encoding_helpers.dart`

Benefits:
- Reusable across providers that support images
- Consistent data URI format
- Handles mime type defaults

## Recommendations

### 1. Start Small
Begin with the simplest, most obviously beneficial helpers:
- MessagePartHelpers
- ToolResultHelpers

These have clear benefits and low risk of over-abstraction.

### 2. Avoid Over-Centralization
Don't try to abstract:
- Provider-specific streaming protocols
- Message grouping logic
- System message handling

These vary too much and would create more complexity than they solve.

### 3. Focus on Debugging
Add logging/debugging capabilities to helpers:
```dart
class MessagePartHelpers {
  static final _logger = Logger('MessagePartHelpers');
  
  static String extractText(List<Part> parts, {String? debugContext}) {
    final text = parts.whereType<TextPart>().map((p) => p.text).join();
    _logger.fine('Extracted text (${debugContext ?? 'unknown'}): '
        '${text.substring(0, math.min(50, text.length))}...');
    return text;
  }
}
```

### 4. Provider-Specific Documentation
Maintain clear documentation about why each provider does things differently:
- Google groups tool results because their API requires it
- Anthropic uses events because of their streaming architecture
- OpenAI accumulates because of their chunk-based protocol

### 5. Migration Strategy
1. Implement helpers alongside existing code
2. Migrate one provider at a time
3. Ensure tests pass at each step
4. Remove old code only after all providers migrated

## Implementation Status

### ✅ Completed Implementations (December 2024)

The following helper functions have been successfully implemented and deployed:

#### 1. MessagePartHelpers - **IMPLEMENTED**
**Location:** `lib/src/chat/chat_models/helpers/message_part_helpers.dart`

**Implementation Details:**
- Converted from extension methods to static class methods to resolve runtime errors
- All mappers updated to use static method calls
- Comprehensive test coverage (42 tests passing)

```dart
class MessagePartHelpers {
  /// Extracts and concatenates all text content from TextPart instances
  static String extractText(List<Part> parts) =>
      parts.whereType<TextPart>().map((p) => p.text).join();

  /// Extracts all tool call parts from the list
  static List<ToolPart> extractToolCalls(List<Part> parts) => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.call)
      .toList();

  /// Extracts all tool result parts from the list
  static List<ToolPart> extractToolResults(List<Part> parts) => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.result)
      .toList();
}
```

#### 2. ToolResultHelpers - **IMPLEMENTED**
**Location:** `lib/src/chat/chat_models/helpers/message_part_helpers.dart`

**Implementation Details:**
- Converted from extension methods to static class methods
- Handles atomic values (strings, numbers, booleans) correctly
- Eliminates "NoSuchMethodError: Class 'String' has no instance method 'serialize()'"

```dart
class ToolResultHelpers {
  /// Serializes the result to a string representation
  static String serialize(dynamic result) =>
      result is String ? result : json.encode(result);

  /// Ensures the result is wrapped in a Map<String, dynamic>
  static Map<String, dynamic> ensureMap(dynamic result) {
    if (result is Map<String, dynamic>) {
      return result;
    }
    return <String, dynamic>{'result': result};
  }
}
```

#### 3. Provider Integration - **COMPLETED**
All chat model providers have been updated to use the static helper methods:

**✅ OpenAI Provider:**
- Updated `openai_message_mappers.dart` to use `MessagePartHelpers.extractText()`, `MessagePartHelpers.extractToolCalls()`, `MessagePartHelpers.extractToolResults()`, and `ToolResultHelpers.serialize()`

**✅ Anthropic Provider:**
- Updated `anthropic_message_mappers.dart` to use `MessagePartHelpers.extractText()` and `ToolResultHelpers.serialize()`

**✅ Google Provider:**
- Updated `google_message_mappers.dart` to use `ToolResultHelpers.ensureMap()`
- Added missing import for helper functions

**✅ Ollama Provider:**
- Updated `ollama_message_mappers.dart` to use all helper methods

**✅ Mistral Provider:**
- Updated `mistral_message_mappers.dart` to use `MessagePartHelpers` methods

#### 4. Test Coverage - **COMPREHENSIVE**
**Location:** `test/message_part_helpers_test.dart`

**Test Results:**
- 42 tests covering all helper methods
- Tests for edge cases (empty lists, null values, unicode, special characters)
- Real-world scenario tests (OpenAI streaming, Google complete calls)
- All tests passing ✅

### Critical Issues Resolved

#### Extension Method Runtime Error
**Problem:** Extension methods on `dynamic` type were causing runtime errors:
```
NoSuchMethodError: Class 'String' has no instance method 'serialize()'
```

**Root Cause:** Tools returning atomic values (strings, numbers, booleans) couldn't access extension methods, as Dart's extension method resolution on `dynamic` is unreliable.

**Solution:** Converted all extension methods to static class methods:
```dart
// Before (problematic):
extension ToolResultHelpers on dynamic {
  String serialize() => this is String ? this : json.encode(this);
}

// After (working):
class ToolResultHelpers {
  static String serialize(dynamic result) =>
      result is String ? result : json.encode(result);
}
```

#### Migration Impact
**Files Modified:** 8 files updated
- 1 helper file (converted extensions to static classes)
- 5 mapper files (updated method calls)
- 1 test file (updated all test cases)
- 1 backup file (test_tools.dart bug fix)

**API Changes:** Breaking change requiring static method calls:
```dart
// Old usage (broken):
parts.extractText()
result.serialize()

// New usage (working):
MessagePartHelpers.extractText(parts)
ToolResultHelpers.serialize(result)
```

### Architecture Benefits Achieved

1. **Reliability:** Eliminated runtime errors caused by extension methods on `dynamic`
2. **Maintainability:** Centralized common patterns across all providers
3. **Testability:** Comprehensive test coverage for all helper functions
4. **Consistency:** Uniform API across all provider mappers
5. **Debuggability:** Clear static method calls vs obscure extension method failures

### Performance Impact
- **Minimal overhead:** Static method calls are efficient
- **Reduced code duplication:** Common patterns centralized
- **Better tree-shaking:** Static methods allow better dead code elimination

## Conclusion

The mapper patterns show both opportunities for centralization and areas where
provider differences are fundamental. The key is to centralize the truly common
patterns (part extraction, result serialization) while respecting the legitimate
differences in streaming protocols and API requirements.

**✅ The core helper functions have been successfully implemented and deployed**, resolving critical runtime errors and significantly improving code maintainability. The implementation demonstrates that centralization of common patterns provides substantial benefits without creating over-abstraction.

The next phase could focus on additional helpers like streaming accumulation base classes and image encoding helpers, but the foundation is now solid and all providers are using the centralized helper functions effectively.