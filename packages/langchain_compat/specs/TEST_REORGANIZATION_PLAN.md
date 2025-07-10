# Test Reorganization Plan

## Testing Principles

All test files created or modified during this reorganization MUST adhere to these core principles:

1. **Exception Transparency**: DO NOT catch exceptions - let them bubble up for diagnosis
2. **Capability-Based Filtering**: DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
3. **No Performance Testing**: DO NOT add performance tests
4. **No Regression Testing**: DO NOT add regression tests
5. **80% Coverage**: Common usage patterns tested across ALL capable providers
6. **Edge Case Isolation**: Rare scenarios tested on Google only to avoid timeouts
7. **Single Responsibility**: Each functionality should only be tested in ONE file - no duplication

**Every test file MUST include the standard testing philosophy header (see TEST_SPEC.md)**

## Current State Analysis

### Existing Test Files
1. **agent_api_test.dart** - Mixed functionality (chat, tools, streaming)
2. **provider_discovery_test.dart** - Provider enumeration and lookup
3. **reliability_features_test.dart** - Edge cases and stress testing
4. **streaming_architecture_test.dart** - Streaming across various scenarios
5. **system_integration_test.dart** - Cross-provider compatibility
6. **tool_calling_test.dart** - Tool functionality
7. **tool_id_coordination_test.dart** - Tool ID generation
8. **typed_output_test.dart** - JSON schema responses
9. **usage_tracking_test.dart** - Token usage tracking

### Duplication Issues Found

1. **Chat functionality tested in multiple files**:
   - agent_api_test.dart (basic chat)
   - streaming_architecture_test.dart (chat with streaming)
   - system_integration_test.dart (chat across providers)
   - SOLUTION: Consolidate into chat_models_test.dart

2. **Tool calling spread across files**:
   - agent_api_test.dart (basic tools)
   - tool_calling_test.dart (detailed tools)
   - tool_id_coordination_test.dart (tool IDs)
   - streaming_architecture_test.dart (tool streaming)
   - SOLUTION: Merge into single tool_calling_test.dart

3. **Streaming tested redundantly**:
   - agent_api_test.dart (basic streaming)
   - streaming_architecture_test.dart (all streaming)
   - tool_calling_test.dart (tool streaming)
   - SOLUTION: Create dedicated streaming_test.dart

4. **Provider testing scattered**:
   - provider_discovery_test.dart (discovery)
   - system_integration_test.dart (compatibility)
   - Multiple files test "all providers"
   - SOLUTION: Keep provider_discovery_test.dart, move integration tests

## Reorganization Actions

### 1. Create New Core Test Files

#### chat_models_test.dart
Extract from: agent_api_test.dart, system_integration_test.dart
- Basic single-turn chat (80%)
- Multi-turn conversations (80%)
- System prompts (80%)
- Empty/null inputs (edge)
- Unicode/emoji handling (edge)

#### streaming_test.dart
Extract from: agent_api_test.dart, streaming_architecture_test.dart
- Basic streaming (80%)
- Multi-turn streaming (80%)
- Tool streaming (80%)
- Stream accumulation edge cases (edge)

#### agent_orchestration_test.dart
Focus on Agent class specifically:
- Message consolidation (80%)
- Agent lifecycle management (80%)
- Error propagation (edge)
- Complex message sequences (edge)

#### message_management_test.dart
New coverage for message APIs:
- ChatMessage construction
- Role handling
- Part types (text, data, tool)
- Message helper functions
- Message conversion

### 2. Consolidate Tool Tests

#### tool_calling_test.dart (merge all tool tests)
Combine from: agent_api_test.dart, tool_calling_test.dart, tool_id_coordination_test.dart
- Single tool calls (80%)
- Multi-tool calls (80%)
- Tool result handling (80%)
- Tools with and without parameters (80%)
- Tools with atomic results, list returns and structured results (80%)
- Tool ID generation (80%)
- Tool validation errors (edge)
- Malformed tool responses (edge)

### 3. Clean Up Existing Files

#### provider_discovery_test.dart
Keep as-is but ensure NO duplication:
- Provider enumeration
- Name/alias lookup
- Model discovery
- Capability detection
Remove: Any actual API calls (move to other tests)

#### typed_output_test.dart
Keep focused on JSON schemas only:
- Basic schemas (80%)
- Nested schemas (80%)
- Array schemas (80%)
- Complex schemas (edge)
Remove: General chat/tool tests

#### usage_tracking_test.dart
Keep focused on usage only:
- Token counting (80%)
- Usage concatenation (80%)
- Missing usage data (edge)
Remove: General chat functionality

### 4. Create Missing Infrastructure Tests

#### infrastructure_helpers_test.dart
Test all helper utilities:
- MessagePartHelpers basic operations (80%)
- ToolIdHelpers generation (80%)
- ToolPartHelpers conversion (80%)
- CustomHttpClient creation (80%)
- Helper error conditions (edge)
- Null/empty input handling (edge)

#### multi_modal_test.dart
Image and file handling:
- Image attachments PNG, JPEG (80%)
- Base64 encoding (80%)
- Unsupported MIME types (edge - use OpenAI)
- Two images (edge - use OpenAI)

#### logging_test.dart
Logging functionality:
- Level filtering (80%)
- String filtering by provider or area (80%)
- Custom handlers (80%)
- Complex filter combinations (edge)

#### http_reliability_test.dart
HTTP client behavior:
- Basic retry logic (80%)
- Rate limiting 429 handling (80%)
- Retry-After headers (edge)

### 5. Exception Handling Tests

#### exception_handling_test.dart
New file for exception scenarios:
- Provider-specific errors (edge)
- Error mapping (edge)
- Stack traces (edge)
- Error messages (edge)
Note: All exception handling is edge case testing

### 6. Additional New Test Files

#### model_options_test.dart
Provider-specific options:
- Basic option setting (80%)
- Option merging (80%)
- Invalid option values (edge)

#### provider_mappers_test.dart
Request/response transformation:
- Message conversion (80%)
- Tool call mapping (80%)
- Stream parsing edge cases (edge)
- Error mapping (edge)

#### provider_capabilities_test.dart
ProviderCaps functionality:
- Feature detection (80%)
- Capability filtering (80%)
- Provider limitations (edge)
- Dynamic capabilities (edge)

### 7. Rename/Refactor

- Rename reliability_features_test.dart → edge_cases_test.dart (clearer purpose)
- Delete agent_api_test.dart after extracting (redundant with new structure)
- Delete streaming_architecture_test.dart after extracting
- Keep system_integration_test.dart but focus on cross-provider scenarios only

## Migration Steps

1. **Create new test files with proper headers** (include the 7-point testing philosophy comment)
2. **Extract and move tests to appropriate files**
3. **Remove duplicated test cases**
4. **Update test descriptions for clarity**
5. **Ensure runProviderTest pattern everywhere**
6. **Apply 80%/edge case split consistently**
7. **Verify no functionality is lost**
8. **Delete redundant files**
9. **Confirm all principles are followed** (no exception catching, no arbitrary filtering, etc.)

## Final Test Structure

```
test/
├── chat_models_test.dart              # Basic chat functionality
├── embeddings_test.dart               # Embeddings (create new)
├── tool_calling_test.dart             # All tool functionality (consolidated)
├── streaming_test.dart                # All streaming scenarios (consolidated)
├── provider_discovery_test.dart       # Provider enumeration (existing, cleaned)
├── message_management_test.dart       # Message APIs (new)
├── agent_orchestration_test.dart      # Agent class behavior (new)
├── multi_modal_test.dart              # Images/files (new)
├── usage_tracking_test.dart           # Usage tracking (existing, focused)
├── logging_test.dart                  # Logging (new)
├── typed_output_test.dart             # JSON schemas (existing, focused)
├── http_reliability_test.dart         # HTTP retry (new)
├── exception_handling_test.dart       # Errors (new)
├── infrastructure_helpers_test.dart   # Utilities (new)
├── edge_cases_test.dart              # All edge cases (renamed)
├── system_integration_test.dart       # Cross-provider only (refocused)
├── model_options_test.dart            # Provider-specific options (new)
├── provider_mappers_test.dart         # Request/response transformation (new)
└── provider_capabilities_test.dart    # Provider caps (new)
```

## Success Criteria

1. **No duplication**: Each test case exists in exactly ONE file
2. **Clear ownership**: Each file has a single, clear responsibility
3. **80/20 split**: Common cases on all providers, edge cases on Google only
4. **Fast execution**: 80% cases are simple and quick
5. **No hidden errors**: All exceptions bubble up
6. **Complete coverage**: All 18 functionality areas have tests