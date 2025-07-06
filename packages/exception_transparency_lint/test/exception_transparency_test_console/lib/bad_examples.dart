// ❌ BAD EXAMPLES - These SHOULD trigger the lint rule

import 'dart:convert';

/// ❌ BAD: Empty catch block - completely swallows exceptions
void emptyCatch() {
  try {
    criticalOperation();
  } on Exception catch (e) {
    // Empty catch - this should be flagged!
  }
}

/// ❌ BAD: Log and continue without rethrow
void logAndContinue() {
  try {
    importantDataProcessing();
  } on Exception catch (e) {
    print('Error occurred: $e');
    // No rethrow - this swallows the exception!
  }
}

/// ❌ BAD: Creates default values on failure
Map<String, dynamic> defaultValueCreation() {
  try {
    return parseImportantData();
  } on Exception catch (e) {
    return {}; // Creates empty map instead of failing - swallowing!
  }
}

/// ❌ BAD: Logger usage without rethrow
void loggerWithoutRethrow() {
  final logger = createLogger();
  try {
    performCriticalTask();
  } on Exception catch (e) {
    logger.severe('Task failed: $e');
    // No rethrow - exception is swallowed!
  }
}

/// ❌ BAD: Silent fallback value creation
String silentFallback() {
  try {
    return fetchUserName();
  } on Exception catch (e) {
    return 'Unknown User'; // Silent fallback - user never knows fetch failed!
  }
}

/// ❌ BAD: Assignment to default on exception
void assignmentDefault() {
  String result;
  try {
    result = complexCalculation();
  } on Exception catch (e) {
    result = 'default'; // Assigns default value - swallowing!
  }
  print('Result: $result');
}

/// ❌ BAD: Multiple statements but still swallowing
void multipleStatementsSwallowing() {
  try {
    networkOperation();
  } on Exception catch (e) {
    print('Network failed: $e');
    final errorTime = DateTime.now();
    print('Error occurred at: $errorTime');
    // Multiple statements but still no rethrow - swallowing!
  }
}

/// ❌ BAD: Creating result structure that looks like tool handling but isn't
Map<String, dynamic> fakeToolHandling() {
  try {
    return processUserInput();
  } on Exception catch (e) {
    // This looks like tool error handling but it's just creating default result
    return {'result': 'failed', 'message': e.toString()};
  }
}

/// ❌ BAD: toString() fallback pattern
String toStringFallback() {
  try {
    return jsonEncode(getDataStructure());
  } on Exception catch (e) {
    return e.toString(); // Fallback to string representation - swallowing!
  }
}

/// ❌ BAD: List fallback pattern
List<String> listFallback() {
  try {
    return fetchItemList();
  } on Exception catch (e) {
    return []; // Empty list fallback - swallowing!
  }
}

// Helper functions for examples
void criticalOperation() => throw Exception('Critical failure');
void importantDataProcessing() => throw Exception('Data processing failed');
Map<String, dynamic> parseImportantData() => throw Exception('Parse error');
Logger createLogger() => Logger();
void performCriticalTask() => throw Exception('Task failed');
String fetchUserName() => throw Exception('Network error');
String complexCalculation() => throw Exception('Math error');
void networkOperation() => throw Exception('Connection failed');
Map<String, dynamic> processUserInput() => throw Exception('Invalid input');
Map<String, dynamic> getDataStructure() => throw Exception('Data error');
List<String> fetchItemList() => throw Exception('Fetch failed');

class Logger {
  void severe(String message) => print('SEVERE: $message');
}
