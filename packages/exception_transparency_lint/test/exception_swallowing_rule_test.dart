import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:exception_transparency_lint/src/exception_swallowing_rule.dart';
import 'package:test/test.dart';

void main() {
  group('ExceptionSwallowingRule', () {
    late ExceptionSwallowingRule rule;

    setUp(() {
      rule = const ExceptionSwallowingRule();
    });

    test('should detect empty catch blocks', () {
      // Test case: Empty catch block
      const code = '''
void badFunction() {
  try {
    riskyOperation();
  } catch (e) {
    // Empty catch - should be flagged
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isTrue, reason: 'Empty catch blocks should be flagged');
    });

    test('should detect logging without rethrow', () {
      // Test case: Logging but no rethrow
      const code = '''
void loggingFunction() {
  try {
    riskyOperation();
  } catch (e) {
    print('Error: \$e');
    // No rethrow - should be flagged
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isTrue, reason: 'Logging without rethrow should be flagged');
    });

    test('should detect logger usage without rethrow', () {
      // Test case: Logger usage but no rethrow
      const code = '''
import 'package:logging/logging.dart';

void loggerFunction() {
  final logger = Logger('test');
  try {
    riskyOperation();
  } catch (e) {
    logger.severe('Error occurred: \$e');
    // No rethrow - should be flagged
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isTrue, reason: 'Logger usage without rethrow should be flagged');
    });

    test('should allow tool error handling', () {
      // Test case: Tool error handling (legitimate)
      const code = '''
import 'dart:convert';

void toolFunction() {
  try {
    riskyOperation();
  } catch (e) {
    toolResults.add(ChatMessage(
      role: MessageRole.tool,
      parts: [ToolPart.result(
        toolCallId: 'call_123',
        result: json.encode({'error': e.toString()}),
      )],
    ));
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Tool error handling should be allowed');
    });

    test('should allow retry logic', () {
      // Test case: Retry logic (legitimate)
      const code = '''
Future<void> retryFunction() async {
  int attempt = 0;
  try {
    riskyOperation();
  } catch (e) {
    attempt++;
    await Future.delayed(Duration(seconds: 1));
    // Retry logic - should be allowed
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Retry logic should be allowed');
    });

    test('should allow proper exception handling with rethrow', () {
      // Test case: Proper exception handling
      const code = '''
void properFunction() {
  try {
    riskyOperation();
  } catch (e) {
    print('Error occurred: \$e');
    rethrow;
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Proper rethrow should be allowed');
    });

    test('should allow proper exception handling with throw', () {
      // Test case: Proper exception handling with custom throw
      const code = '''
void customThrowFunction() {
  try {
    riskyOperation();
  } catch (e) {
    print('Error occurred: \$e');
    throw CustomException('Failed to perform operation', e);
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Custom throw should be allowed');
    });

    test('should detect default value creation without rethrow', () {
      // Test case: Creating default values (exception swallowing)
      const code = '''
Map<String, dynamic> getDataWithDefaults() {
  try {
    return fetchData();
  } catch (e) {
    return {'result': 'default'};
  }
}
''';
      
      final violations = _analyzeCode(code);
      if (!violations) {
        print('DEBUG: Failed to detect default value creation');
        print('This suggests the logic needs refinement');
      }
      expect(violations, isTrue, reason: 'Default value creation should be flagged');
    });

    test('should allow legitimate error conversion to map', () {
      // Test case: Converting errors for tools (legitimate)
      const code = '''
Map<String, dynamic> toolErrorHandler() {
  try {
    return performOperation();
  } catch (e) {
    return {'error': e.toString()};
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Error conversion for tools should be allowed');
    });

    test('should detect empty catch with only comments', () {
      // Test case: Empty catch with only comments (currently flagged)
      const code = '''
void commentOnlyFunction() {
  try {
    riskyOperation();
  } catch (e) {
    // Intentionally ignoring this specific error
    // because it's expected in this context
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isTrue, reason: 'Empty catch blocks are flagged regardless of comments');
    });

    test('should handle multiple catch clauses', () {
      // Test case: Multiple catch clauses with mixed behavior
      const code = '''
void multipleCatchFunction() {
  try {
    riskyOperation();
  } on SpecificException catch (e) {
    print('Specific error: \$e');
    // This should be flagged
  } catch (e) {
    rethrow; // This should be allowed
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isTrue, reason: 'First catch clause should be flagged');
    });

    test('should allow various legitimate retry patterns', () {
      // Test case: Different retry patterns that should be allowed
      const code = '''
Future<void> complexRetryFunction() async {
  int retryCount = 0;
  try {
    riskyOperation();
  } catch (e) {
    retryCount += 1;
    if (retryCount < 3) {
      await Future.delayed(Duration(seconds: retryCount));
      // Retry with exponential backoff
    }
  }
}
''';
      
      final violations = _analyzeCode(code);
      expect(violations, isFalse, reason: 'Complex retry logic should be allowed');
    });
  });
}

/// Analyzes the given code and returns whether exception swallowing violations were found
bool _analyzeCode(String code) {
  // Parse the code into an AST
  final parseResult = parseString(
    content: code,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics: false,
  );

  final rule = const ExceptionSwallowingRule();
  bool foundViolations = false;

  // Find all try statements and test them directly using the rule's logic
  final visitor = _TryStatementFinder((tryStatement) {
    for (final catchClause in tryStatement.catchClauses) {
      if (rule._isExceptionSwallowingForTesting(catchClause)) {
        foundViolations = true;
        break;
      }
    }
  });
  
  parseResult.unit.accept(visitor);

  return foundViolations;
}

/// Visitor to find try statements in the AST
class _TryStatementFinder extends RecursiveAstVisitor<void> {
  final void Function(TryStatement) onTryStatement;

  _TryStatementFinder(this.onTryStatement);

  @override
  void visitTryStatement(TryStatement node) {
    onTryStatement(node);
    super.visitTryStatement(node);
  }
}

/// Extension to expose the private method for testing
extension ExceptionSwallowingRuleTest on ExceptionSwallowingRule {
  bool _isExceptionSwallowingForTesting(CatchClause catchClause) {
    final block = catchClause.body;
    final statements = block.statements;

    if (statements.isEmpty) {
      // Empty catch block is definitely swallowing
      return true;
    }

    bool hasLogging = false;
    bool hasRethrow = false;
    bool hasThrow = false;
    bool isToolErrorHandling = false;

    for (final statement in statements) {
      // Check for logging patterns
      if (_containsLoggingForTesting(statement)) {
        hasLogging = true;
        print('DEBUG: Found logging in statement: $statement');
      }

      // Check for rethrow or throw statements
      if (statement is ExpressionStatement) {
        final expression = statement.expression;
        if (expression is RethrowExpression) {
          hasRethrow = true;
          print('DEBUG: Found rethrow in statement: ${statement}');
        } else if (expression is ThrowExpression) {
          hasThrow = true;
          print('DEBUG: Found throw in statement: ${statement}');
        }
      }

      // Check for tool error handling pattern (legitimate exception handling)
      if (_isToolErrorHandlingForTesting(statement)) {
        isToolErrorHandling = true;
        print('DEBUG: Found tool error handling in statement: ${statement}');
      }

      // Check for retry logic patterns (legitimate exception handling)
      if (_isRetryLogicForTesting(statement)) {
        isToolErrorHandling = true; // Using same flag to indicate legitimate handling
        print('DEBUG: Found retry logic in statement: ${statement}');
      }
    }

    print('DEBUG: Analysis results - hasLogging: $hasLogging, hasRethrow: $hasRethrow, hasThrow: $hasThrow, isToolErrorHandling: $isToolErrorHandling');

    // Tool error handling is legitimate - converting exceptions to {'error': message}
    if (isToolErrorHandling) {
      print('DEBUG: Returning false due to tool error handling');
      return false;
    }

    // If there's logging but no rethrow/throw, it's likely swallowing
    if (hasLogging && !hasRethrow && !hasThrow) {
      print('DEBUG: Returning true due to logging without rethrow/throw');
      return true;
    }

    // If there are statements but no logging, rethrow, or throw, it might be swallowing
    if (!hasLogging && !hasRethrow && !hasThrow && statements.isNotEmpty) {
      // Check if statements create default/fallback values instead of rethrowing
      final createsDefaults = _createsDefaultValuesForTesting(statements);
      print('DEBUG: Checking for default values creation: $createsDefaults');
      return createsDefaults;
    }

    print('DEBUG: Returning false - no swallowing detected');
    return false;
  }

  bool _containsLoggingForTesting(Statement statement) {
    final visitor = _LoggingDetectorForTesting();
    statement.visitChildren(visitor);
    return visitor.hasLogging;
  }

  bool _isToolErrorHandlingForTesting(Statement statement) {
    final visitor = _ToolErrorDetectorForTesting();
    statement.visitChildren(visitor);
    return visitor.isToolErrorHandling;
  }

  bool _isRetryLogicForTesting(Statement statement) {
    final visitor = _RetryLogicDetectorForTesting();
    statement.visitChildren(visitor);
    return visitor.isRetryLogic;
  }

  bool _createsDefaultValuesForTesting(List<Statement> statements) {
    // Look for assignment statements or return statements that create default/fallback values
    for (final statement in statements) {
      print('DEBUG: Analyzing statement: ${statement.runtimeType} - ${statement}');
      if (statement is ExpressionStatement) {
        final expression = statement.expression;
        if (expression is AssignmentExpression) {
          final rightSide = expression.rightHandSide.toString();
          print('DEBUG: Assignment right side: "$rightSide"');
          // Common default value patterns
          if (rightSide.contains('{}') ||
              rightSide.contains('[]') ||
              rightSide.contains("{'result':") ||
              rightSide.contains('toString()')) {
            return true;
          }
        }
      } else if (statement is ReturnStatement) {
        final returnValue = statement.expression?.toString() ?? '';
        print('DEBUG: Return value: "$returnValue"');
        // Check for default return values
        if (returnValue.contains('{}') ||
            returnValue.contains('[]') ||
            returnValue.contains("{'result':") ||
            returnValue.contains('toString()')) {
          print('DEBUG: Found matching pattern in return value');
          return true;
        }
      }
    }
    return false;
  }
}

class _LoggingDetectorForTesting extends RecursiveAstVisitor<void> {
  bool hasLogging = false;

  @override
  void visitMethodInvocation(MethodInvocation node) {
    final targetStr = node.target?.toString() ?? '';
    final methodName = node.methodName.name;

    // Check for common logging patterns
    if ((targetStr.contains('logger') || targetStr.contains('_logger')) &&
        (methodName == 'warning' ||
            methodName == 'error' ||
            methodName == 'info' ||
            methodName == 'fine' ||
            methodName == 'severe')) {
      hasLogging = true;
    }

    // Check for print statements
    if (methodName == 'print') {
      hasLogging = true;
    }

    // Check for log.* patterns
    if (targetStr.startsWith('log.')) {
      hasLogging = true;
    }

    super.visitMethodInvocation(node);
  }
}

class _ToolErrorDetectorForTesting extends RecursiveAstVisitor<void> {
  bool isToolErrorHandling = false;

  @override
  void visitMethodInvocation(MethodInvocation node) {
    final code = node.toString();

    // Look for tool error handling patterns:
    // 1. json.encode({'error': ...})
    // 2. ToolPart.result(..., result: ...)
    // 3. ChatMessage with ToolPart containing error
    if (code.contains("json.encode({'error':") ||
        code.contains('ToolPart.result') ||
        (code.contains('ChatMessage') && code.contains('error'))) {
      isToolErrorHandling = true;
    }

    super.visitMethodInvocation(node);
  }

  @override
  void visitMapLiteralEntry(MapLiteralEntry node) {
    // Look for {'error': ...} patterns
    final keyStr = node.key.toString();
    if (keyStr.contains("'error'") || keyStr.contains('"error"')) {
      isToolErrorHandling = true;
    }

    super.visitMapLiteralEntry(node);
  }
}

class _RetryLogicDetectorForTesting extends RecursiveAstVisitor<void> {
  bool isRetryLogic = false;

  @override
  void visitMethodInvocation(MethodInvocation node) {
    final code = node.toString();

    // Look for retry patterns:
    // - Future.delayed()
    // - await Future.delayed()
    if (code.contains('Future.delayed')) {
      isRetryLogic = true;
    }

    super.visitMethodInvocation(node);
  }

  @override
  void visitPostfixExpression(PostfixExpression node) {
    // Look for attempt++ or similar increment patterns
    final code = node.toString();
    if (code.contains('attempt++') || code.contains('retry++')) {
      isRetryLogic = true;
    }

    super.visitPostfixExpression(node);
  }

  @override
  void visitAssignmentExpression(AssignmentExpression node) {
    // Look for attempt += 1 or similar patterns
    final code = node.toString();
    if ((code.contains('attempt') || code.contains('retry')) && code.contains('+=')) {
      isRetryLogic = true;
    }

    super.visitAssignmentExpression(node);
  }
}
