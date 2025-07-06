// ✅ GOOD EXAMPLES - These should NOT trigger the lint rule

import 'dart:convert';

/// ✅ GOOD: Tool error handling - converts exceptions to structured format for LLM
Map<String, dynamic> toolErrorHandling() {
  try {
    return performToolOperation();
  } on Exception catch (e) {
    // This is legitimate - converting exception to error structure for LLM
    return {'error': e.toString()};
  }
}

/// ✅ GOOD: Proper rethrow after logging
void properRethrow() {
  try {
    dangerousOperation();
  } on Exception catch (e) {
    print('Operation failed: $e');
    rethrow; // Exception still bubbles up
  }
}

/// ✅ GOOD: Exception transformation
void exceptionTransformation() {
  try {
    lowLevelOperation();
  } on Exception catch (e) {
    throw CustomException('High-level operation failed', e);
  }
}

/// ✅ GOOD: Retry logic with proper tracking
Future<String> retryLogic() async {
  int attempt = 0;
  while (attempt < 3) {
    try {
      return await unstableNetworkCall();
    } on Exception catch (e) {
      attempt++;
      if (attempt >= 3) rethrow;
      await Future.delayed(Duration(seconds: attempt));
      // Continues retry loop - this is legitimate
    }
  }
  throw Exception('Max retries exceeded');
}

/// ✅ GOOD: Cleanup with rethrow
void cleanupWithRethrow() {
  try {
    allocateResources();
    doWork();
  } on Exception catch (e) {
    cleanup();
    rethrow; // Still propagates the exception after cleanup
  }
}

/// ✅ GOOD: Tool result creation pattern
void createToolResult() {
  try {
    final result = executeToolCommand();
    print('Tool succeeded: $result');
  } on Exception catch (e) {
    // This pattern is recognized as legitimate tool error handling
    final toolResult = {
      'tool_call_id': 'call_123',
      'result': json.encode({'error': e.toString()}),
    };
    print('Tool failed: $toolResult');
  }
}

// Helper functions for examples
Map<String, dynamic> performToolOperation() => {'result': 'success'};
void dangerousOperation() => throw Exception('Something went wrong');
void lowLevelOperation() => throw Exception('Low level error');
Future<String> unstableNetworkCall() => throw Exception('Network error');
void allocateResources() {}
void doWork() => throw Exception('Work failed');
void cleanup() {}
String executeToolCommand() => throw Exception('Tool error');

class CustomException implements Exception {
  final String message;
  final Object? cause;
  CustomException(this.message, this.cause);

  @override
  String toString() => 'CustomException: $message';
}
