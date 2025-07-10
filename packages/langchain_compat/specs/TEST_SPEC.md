# langchain_compat Test Specification

## Core Testing Philosophy

**CRITICAL: This header MUST appear at the top of EVERY test file:**

```dart
/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication
```

## Complete Functionality Areas (20 total)

Based on comprehensive analysis of lib/langchain_compat.dart and the entire codebase:

ADD: Update each of these functional areas to show the 80% vs. Edge breakdown

### 1. **Chat Models** (lib/src/chat/)
   - Basic chat completions
   - Multi-turn conversations
   - System prompts
   - REMOVE: Temperature/options control

### 2. **Embeddings** (lib/src/embeddings/)
   - Text embeddings generation
   - Document embeddings
   - Similarity calculations
   - Batch processing

### 3. **Tool Calling** (lib/src/tools/)
   - Single tool calls
   - Multiple tool calls in sequence
   - Tool result handling
   - Tool validation
   - ADD: Tools with and without parameters
   - ADD: Tools with atomic results, list returns and structured results

### 4. **Streaming** (Agent and ChatModel streaming)
   - Basic streaming responses
   - Tool call streaming
   - Multi-turn streaming
   - Stream accumulation

### 5. **Provider Discovery** (lib/src/chat/chat_providers/)
   - Provider enumeration
   - Name/alias lookup
   - Capability detection
   - Model listing

### 6. **Message Management** (lib/src/chat/chat_messages.dart)
   - Message construction
   - Role handling
   - Part types (text, data, tool)
   - Message conversion

### 7. **Agent Orchestration** (lib/src/agent.dart)
   - REMOVE: High-level run/runStream -- well tested in other tests
   - REMOVE: Tool execution -- this is covered in the existing tools test
   - Message consolidation
   - Error handling

### 8. **Multi-modal Input** (DataPart support)
   - Image attachments
   - File uploads
   - MIME type handling
   - Base64 encoding

### 9. **Usage Tracking** (LanguageModelUsage)
   - Token counting
   - Usage concatenation
   - Billable character tracking
   - REMOVE: Provider differences

### 10. **Logging** (LoggingOptions)
    - Level filtering
    - REMOVE: Provider filtering
    - ADD: String filtering -- could be by provider or area, e.g. "retry"
    - Custom handlers
    - REMOVE: Structured logging -- what is this?

### 11. **Typed Output** (JSON Schema)
    - Structured responses
    - Schema validation
    - REMOVE: Provider support -- use provider caps to test all providers that support schemas
    - CONSIDER: Complex schemas -- 80% vs. edge

### 12. **HTTP Reliability** (lib/src/http/)
    - Retry logic
    - Rate limiting (429)
    - Retry-After headers
    - Custom HTTP clients

### 13. **Exception Handling** (lib/src/chat_exceptions.dart)
    - EDGE: Provider-specific errors
    - EDGE: Error mapping
    - EDGE: Stack traces
    - EDGE: Error messages

### 14. **Infrastructure Helpers**
    - MessagePartHelpers (lib/src/chat/message_part_helpers.dart)
    - ToolIdHelpers (lib/src/tools/tool_id_helpers.dart)
    - ToolPartHelpers (lib/src/tools/tool_part_helpers.dart)
    - CustomHttpClient (lib/src/custom_http_client.dart)

### 15. **Model Options** (Provider-specific options)
    - OpenAI options
    - Anthropic options
    - Google options
    - Option merging

### 16. **Provider Mappers** (Request/response transformation)
    - Message conversion
    - Tool call mapping
    - Stream parsing
    - Error mapping

### 17. **System Integration**
    - Cross-provider compatibility
    - Provider switching
    - API key handling
    - Environment setup

### 18. **Ollama Support** (Local models)
    - Native Ollama API
    - OpenAI-compatible mode
    - Model discovery
    - Local vs remote

### 19. **Provider Capabilities** (ProviderCaps)
    - Feature detection
    - Capability filtering
    - Provider limitations
    - Dynamic capabilities

### 20. **Finish Reasons** (lib/src/language_models/)
    - REMOVE: Stop reasons
    - REMOVE: Length limits
    - REMOVE: Tool calls
    - REMOVE: Content filtering

## Test Organization Plan

### File Structure (FLAT in test/ directory)

```
test/
├── chat_models_test.dart              # 1. Chat Models
├── embeddings_test.dart               # 2. Embeddings  
├── tool_calling_test.dart             # 3. Tool Calling
├── streaming_test.dart                # 4. Streaming
├── provider_discovery_test.dart       # 5. Provider Discovery
├── message_management_test.dart       # 6. Message Management
├── agent_orchestration_test.dart      # 7. Agent Orchestration
├── multi_modal_test.dart              # 8. Multi-modal Input
├── usage_tracking_test.dart           # 9. Usage Tracking
├── logging_test.dart                  # 10. Logging
├── typed_output_test.dart             # 11. Typed Output
├── http_reliability_test.dart         # 12. HTTP Reliability
├── exception_handling_test.dart       # 13. Exception Handling
├── infrastructure_helpers_test.dart   # 14. Infrastructure Helpers
├── model_options_test.dart            # 15. Model Options
├── provider_mappers_test.dart         # 16. Provider Mappers
├── system_integration_test.dart       # 17. System Integration
├── ollama_support_test.dart           # 18. Ollama Support
├── provider_capabilities_test.dart    # 19. Provider Capabilities
└── finish_reasons_test.dart           # 20. Finish Reasons
```

## Test Content Guidelines

### 80% Cases (Common Usage - ALL Providers)
- Basic operations that users do frequently
- Tested across ALL capable providers using runProviderTest
- Simple, fast API calls
- Core functionality validation

### Edge Cases (Rare Scenarios - Google Only)
- Stress testing (long conversations, many tools)
- Unicode/emoji handling
- Empty inputs
- Malformed data
- Extreme parameter values

### Test Pattern

```dart
void runProviderTest(
  String description,
  Future<void> Function(ChatProvider provider) testFunction, {
  Set<ProviderCaps>? requiredCaps,
  bool edgeCase = false,
}) {
  final providers = edgeCase 
    ? ['google:gemini-2.0-flash']  // Edge cases on Google only
    : ChatProvider.all
        .where((p) => requiredCaps?.every(p.capabilities.contains) ?? true)
        .map((p) => '${p.name}:${p.defaultModelName}');

  for (final providerModel in providers) {
    test('$providerModel: $description', () async {
      final [providerName, modelName] = providerModel.split(':');
      final provider = ChatProvider.forName(providerName)!;
      await testFunction(provider);
    });
  }
}
```

## Duplication Elimination Rules

1. **Single Responsibility**: Each test file tests ONE functionality area
2. **No Cross-Testing**: Don't test chat in tool_calling_test.dart
3. **Clear Boundaries**: Infrastructure tests separate from feature tests
4. **Provider Tests Once**: Provider discovery only in provider_discovery_test.dart
5. **Helper Tests Isolated**: Test helpers where they're defined

## Missing Test Coverage (To Be Created)

Based on analysis, these files need to be created or have missing coverage:

1. **message_management_test.dart** - Test ChatMessage construction, roles, parts
2. **agent_orchestration_test.dart** - Test Agent class specifically (not just API calls)
3. **multi_modal_test.dart** - Test image/file attachments
4. **logging_test.dart** - Test LoggingOptions and filtering
5. **http_reliability_test.dart** - Test RetryHttpClient behavior
6. **exception_handling_test.dart** - Test error mapping and propagation
7. **infrastructure_helpers_test.dart** - Test all helper utilities
8. **model_options_test.dart** - Test provider-specific options
9. **provider_mappers_test.dart** - Test request/response transformations

10. **ollama_support_test.dart** - Test Ollama-specific functionality
- REMOVE this test file -- local LLMs should be tested alongside cloud LLMs

11.  **provider_capabilities_test.dart** - Test ProviderCaps filtering

12.  **finish_reasons_test.dart** - Test finish reason handling
- REMOVE this test file -- not important to test


## Implementation Priority

1. **High Priority** (Core functionality):
   - infrastructure_helpers_test.dart (foundation)
   - message_management_test.dart (used everywhere)
   - agent_orchestration_test.dart (primary API)

2. **Medium Priority** (Important features):
   - multi_modal_test.dart
   - logging_test.dart
   - http_reliability_test.dart
   - exception_handling_test.dart

3. **Low Priority** (Advanced/specific):
   - model_options_test.dart
   - provider_mappers_test.dart
   - ollama_support_test.dart
   - finish_reasons_test.dart