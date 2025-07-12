# Test Failure Summary - langchain_compat

## Executive Summary
- **Total Tests**: 1,193
- **Passed**: 1,072 (89.9%)
- **Failed**: 118 (9.9%)
- **Skipped**: 3 (0.3%)

While 90% of tests pass, there are systematic issues in critical areas that need immediate attention.

## Priority 1: Critical Infrastructure Issues 🔴

### 1. Streaming Response Parsing (349 failures)
**Problem**: JSON parsing errors when handling streaming responses
```
FormatException: Unexpected character (at character 1)
```
**Affected Providers**: Together AI, Lambda, Fireworks, Cohere, Anthropic
**Root Cause**: Streaming chunks are not being properly accumulated before JSON parsing
**Fix Location**: `lib/src/chat/chat_models/*/provider_mappers.dart`

### 2. Tool Calling Implementation (200+ failures)
**Problem**: Empty tool call arrays when results expected
```
Expected: an object with length of <1>
Actual: []
```
**Affected**: All providers with tool capabilities
**Root Cause**: Tool response parsing or tool ID coordination issues
**Fix Location**: `lib/src/agent.dart` and mapper implementations

## Priority 2: Type Safety Issues 🟡

### 3. Typed Output Validation (244 failures)
**Problem**: Null values returned where typed outputs expected
```
Expected: <Instance of 'bool'>
Actual: <null>
```
**Root Cause**: Type validation failing in streaming contexts
**Fix Location**: `lib/src/agent.dart` (JSON parsing logic)

### 4. Content Validation (175 failures)
**Problem**: Response content not matching expected patterns
```
Expected: contains 'Mushroom Omelette'
Actual: 'lookup_recipe'
```
**Root Cause**: Tool result formatting issues in agent layer
**Fix Location**: `lib/src/agent.dart` (tool result consolidation)

## Priority 3: Error Recovery 🟠

### 5. System Integration Failures (275 failures)
**Problem**: "graceful handling of tool failures" tests failing
**Root Cause**: Error recovery mechanisms not working properly
**Fix Location**: `lib/src/agent.dart` (error handling in runStream)

### 6. Exception Handling (1 failure)
**Problem**: Provider capability validation not throwing expected errors
```
Expected: throws <Instance of 'Exception'>
Actual: returned <Instance of 'Agent'>
```
**Fix Location**: `lib/src/agent.dart` constructor validation

## Actionable Fix Plan

### Day 1 - Streaming Infrastructure
1. **Fix streaming JSON parsing** in all provider mappers
   - Add proper chunk accumulation logic
   - Handle partial JSON in streaming responses
   - Test with `streaming_test.dart`

### Day 2 - Tool Calling
2. **Fix tool response parsing**
   - Debug empty tool call arrays
   - Verify tool ID coordination
   - Test with `tool_calling_test.dart`

### Day 3 - Type Safety
3. **Fix typed output validation**
   - Handle null cases in JSON parsing
   - Add validation before type assertions
   - Test with `typed_output_test.dart`

### Day 4 - Error Recovery
4. **Improve error handling**
   - Fix graceful failure mechanisms
   - Add provider capability validation
   - Test with `system_integration_test.dart`

## Quick Wins 🚀

1. **Exception Handling Test** - Simple fix in Agent constructor
2. **Metadata Test** - JSON parsing issue in Agent.runFor
3. **Provider Capability Validation** - Add missing validation logic

## Testing Strategy

After each fix:
1. Run specific test file: `dart test test/specific_test.dart`
2. Verify no regressions: `dart test --name "provider_name"`
3. Run full suite before moving to next fix

## Expected Outcome

Fixing these issues should bring test pass rate from 90% to >98%, with only provider-specific edge cases remaining.