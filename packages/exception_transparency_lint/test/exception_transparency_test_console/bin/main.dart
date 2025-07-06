// Test console application to demonstrate exception transparency lint rule

import 'package:exception_transparency_test_console/bad_examples.dart' as bad;
import 'package:exception_transparency_test_console/good_examples.dart' as good;

void main() {
  print('Exception Transparency Lint Rule Test Console');
  print('==============================================');
  print('');
  print('This project contains examples of good and bad exception handling.');
  print('Run "dart run custom_lint" to see which patterns are flagged.');
  print('');
  print('Good examples (should NOT be flagged):');
  print('- Tool error handling');
  print('- Proper rethrow after logging');
  print('- Exception transformation');
  print('- Retry logic with tracking');
  print('- Cleanup with rethrow');
  print('');
  print('Bad examples (SHOULD be flagged):');
  print('- Empty catch blocks');
  print('- Log and continue without rethrow');
  print('- Creating default values on failure');
  print('- Silent fallback patterns');
  print('');
  print('Run the following commands to test:');
  print('  dart run custom_lint');
  print('  dart analyze');
  _demonstrateGoodExamples();
  _demonstrateBadExamples();
}

// These function calls would normally execute the examples,
// but we just want to demonstrate the lint rule detection
void _demonstrateGoodExamples() {
  // These calls would work but might throw exceptions
  good.toolErrorHandling();
  good.properRethrow();
  good.exceptionTransformation();
}

void _demonstrateBadExamples() {
  // These calls would work but demonstrate bad patterns
  bad.emptyCatch();
  bad.logAndContinue();
  bad.defaultValueCreation();
}
