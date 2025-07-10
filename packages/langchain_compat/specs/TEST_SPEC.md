# langchain_compat Test Specification

## Core Testing Philosophy

### Testing Principles

1. **Exception Transparency**: DO NOT catch exceptions - let them bubble up for diagnosis
2. **Capability-Based Filtering**: DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
3. **No Performance Testing**: DO NOT add performance tests
4. **No Regression Testing**: DO NOT add regression tests
5. **80% Coverage**: Common usage patterns tested across ALL capable providers
6. **Edge Case Isolation**: Rare scenarios tested on Google only to avoid timeouts
7. **Single Responsibility**: Each functionality should only be tested in ONE file - no duplication

### Required Test File Header

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

## Complete Functionality Areas (18 total)

Based on comprehensive analysis of lib/langchain_compat.dart and the entire codebase:

### 1. **Chat Models** (lib/src/chat/)
   **80% Cases:**
   - Basic chat completions
   - Multi-turn conversations
   - System prompts
   
   **Edge Cases:**
   - Empty/null inputs
   - Unicode/emoji handling

### 2. **Embeddings** (lib/src/embeddings/)
   **80% Cases:**
   - Text embeddings generation
   - Document embeddings
   - Similarity calculations
   
   **Edge Cases:**
   - Empty text handling

### 3. **Tool Calling** (lib/src/tools/)
   **80% Cases:**
   - Single tool calls
   - Multiple tool calls in sequence
   - Tool result handling
   - Tools with and without parameters
   - Tools with atomic results, list returns and structured results
   
   **Edge Cases:**
   - Tool validation errors
   - Malformed tool responses

### 4. **Streaming** (Agent and ChatModel streaming)
   **80% Cases:**
   - Basic streaming responses
   - Tool call streaming
   - Multi-turn streaming
   
   **Edge Cases:**
   - Stream accumulation edge cases

### 5. **Provider Discovery** (lib/src/chat/chat_providers/)
   **80% Cases:**
   - Provider enumeration
   - Name/alias lookup
   - Capability detection
   - Model listing
   
   **Edge Cases:**
   - Invalid provider names
   - Missing API keys

### 6. **Message Management** (lib/src/chat/chat_messages.dart)
   **80% Cases:**
   - Message construction
   - Role handling
   - Part types (text, data, tool)
   
   **Edge Cases:**
   - Message conversion edge cases
   - Malformed message parts

### 7. **Agent Orchestration** (lib/src/agent.dart)
   **80% Cases:**
   - Message consolidation
   - Agent lifecycle management
   
   **Edge Cases:**
   - Error propagation
   - Complex message sequences

### 8. **Multi-modal Input** (DataPart support)
   **80% Cases:**
   - Image attachments (PNG, JPEG)
   - Base64 encoding
   
   **Edge Cases:** (use OpenAI for this)
   - Unsupported MIME types
   - Two images

### 9. **Usage Tracking** (LanguageModelUsage)
   **80% Cases:**
   - Token counting
   - Usage concatenation
   
   **Edge Cases:**
   - Missing usage data

### 10. **Logging** (LoggingOptions)
    **80% Cases:**
    - Level filtering
    - String filtering (by provider or area, e.g. "retry")
    - Custom handlers
    
    **Edge Cases:**
    - Complex filter combinations

### 11. **Typed Output** (JSON Schema)
    **80% Cases:**
    - Structured responses
    - Basic schema validation
    - Simple nested schemas
    
    **Edge Cases:**
    - Complex schemas (deep nesting, arrays of objects)
    - Schema validation errors

### 12. **HTTP Reliability** (lib/src/http/)
    **80% Cases:**
    - Basic retry logic
    - Rate limiting (429) handling
    
    **Edge Cases:**
    - Retry-After headers

### 13. **Exception Handling** (lib/src/chat_exceptions.dart)
    **80% Cases:**
    - None (all exception handling is edge case testing)
    
    **Edge Cases:**
    - Provider-specific errors
    - Error mapping
    - Stack traces
    - Error messages

### 14. **Infrastructure Helpers**
    **80% Cases:**
    - MessagePartHelpers basic operations
    - ToolIdHelpers generation
    - ToolPartHelpers conversion
    - CustomHttpClient creation
    
    **Edge Cases:**
    - Helper error conditions
    - Null/empty input handling

### 15. **Model Options** (Provider-specific options)
    **80% Cases:**
    - Basic option setting
    - Option merging
    
    **Edge Cases:**
    - Invalid option values

### 16. **Provider Mappers** (Request/response transformation)
    **80% Cases:**
    - Message conversion
    - Tool call mapping
    
    **Edge Cases:**
    - Stream parsing edge cases
    - Error mapping

### 17. **System Integration**
    **80% Cases:**
    - Cross-provider compatibility
    - Provider switching
    
    **Edge Cases:**
    - Missing API keys
    - Environment setup issues

### 18. **Provider Capabilities** (ProviderCaps)
    **80% Cases:**
    - Feature detection
    - Capability filtering
    
    **Edge Cases:**
    - Provider limitations
    - Dynamic capabilities

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
└── provider_capabilities_test.dart    # 18. Provider Capabilities
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
10. **provider_capabilities_test.dart** - Test ProviderCaps filtering


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
   - provider_capabilities_test.dart