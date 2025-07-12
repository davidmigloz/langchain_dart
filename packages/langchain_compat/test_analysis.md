# Test Results Analysis

## Summary
- **Total Tests Run**: 1,193 (1,072 passed + 3 skipped + 118 failed)
- **Passed**: 1,072 (89.9%)
- **Failed**: 118 (9.9%)
- **Skipped**: 3 (0.3%)

## Failed Tests by Category

### Most Affected Test Files
1. **streaming_test.dart**: 349 failures
2. **system_integration_test.dart**: 275 failures
3. **typed_output_test.dart**: 244 failures
4. **chat_messages_test.dart**: 175 failures
5. **chat_models_test.dart**: 127 failures

### Failure Types

#### 1. API Request Errors
- **Pattern**: `invalid_request_error` responses from various providers
- **Affected**: Multiple providers including OpenAI-compatible endpoints
- **Root Cause**: Likely API configuration or request format issues

#### 2. Streaming Response Parsing
- **Pattern**: `FormatException: Unexpected character` errors
- **Affected**: Streaming tests across multiple providers
- **Root Cause**: JSON parsing issues with streaming responses

#### 3. Tool Calling Failures
- **Pattern**: Empty tool call arrays when expecting results
- **Symptoms**: 
  - `Expected: an object with length of <1>, Actual: []`
  - Tool outputs not matching expected content
- **Affected**: Tool calling tests, multi-tool scenarios

#### 4. Type Validation Errors
- **Pattern**: Null values where typed outputs expected
- **Examples**:
  - `Expected: <Instance of 'bool'>, Actual: <null>`
  - `Expected: <42>, Actual: <null>`
- **Affected**: Typed output tests, especially with streaming

#### 5. Content Validation Failures
- **Pattern**: Response content not matching expectations
- **Examples**:
  - `Expected: contains '0', Actual: 'Zero.'`
  - `Expected: contains 'Mushroom Omelette', Actual: 'lookup_recipe'`
- **Affected**: Integration tests, agent orchestration

## Provider-Specific Issues

### Streaming Providers
- **Together AI, Lambda, Fireworks, Cohere, Anthropic**: JSON parsing errors in streaming mode
- **Root Cause**: Likely related to streaming response format differences

### Tool Calling Providers
- **Multiple providers**: Empty tool call responses
- **Root Cause**: Tool calling implementation or response parsing issues

## Critical Failures

1. **System Integration Tests**: 
   - "graceful handling of tool failures in workflow" failing consistently
   - Indicates issues with error recovery mechanisms

2. **Streaming Infrastructure**:
   - Widespread streaming failures across providers
   - Suggests fundamental issue with streaming response handling

3. **Type Safety**:
   - Typed output tests failing with null values
   - Type validation not working correctly in streaming scenarios

## Recommendations

1. **Priority 1**: Fix streaming response parsing
   - Review JSON parsing logic for streaming responses
   - Add error handling for malformed JSON chunks

2. **Priority 2**: Debug tool calling implementation
   - Verify tool call response parsing
   - Check if providers are returning expected formats

3. **Priority 3**: Strengthen type validation
   - Ensure typed outputs handle null cases
   - Add validation before type assertions

4. **Priority 4**: Improve error recovery
   - Fix system integration test failures
   - Add better error handling in workflows