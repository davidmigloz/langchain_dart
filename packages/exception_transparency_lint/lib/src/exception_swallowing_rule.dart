import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class ExceptionSwallowingRule extends DartLintRule {
  const ExceptionSwallowingRule() : super(code: _code);

  static const _code = LintCode(
    name: 'exception_swallowing',
    problemMessage:
        'Exception swallowing detected: Caught exception is logged but not rethrown. '
        'This violates Exception Transparency - let exceptions bubble up to reveal problems.',
    correctionMessage:
        'Remove the try-catch block or rethrow the exception after logging. '
        'Only catch exceptions when you can meaningfully fix the problem.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addTryStatement((node) {
      _checkTryStatement(node, reporter);
    });
  }

  void _checkTryStatement(TryStatement node, ErrorReporter reporter) {
    for (final catchClause in node.catchClauses) {
      if (_isExceptionSwallowing(catchClause)) {
        reporter.atNode(catchClause, code);
      }
    }
  }

  bool _isExceptionSwallowing(CatchClause catchClause) {
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
      if (_containsLogging(statement)) {
        hasLogging = true;
      }

      // Check for rethrow or throw statements
      if (statement is ExpressionStatement) {
        final expression = statement.expression;
        if (expression is RethrowExpression) {
          hasRethrow = true;
        } else if (expression is ThrowExpression) {
          hasThrow = true;
        }
      }

      // Check for tool error handling pattern (legitimate exception handling)
      if (_isToolErrorHandling(statement)) {
        isToolErrorHandling = true;
      }

      // Check for retry logic patterns (legitimate exception handling)
      if (_isRetryLogic(statement)) {
        isToolErrorHandling = true; // Using same flag to indicate legitimate handling
      }
    }

    // Tool error handling is legitimate - converting exceptions to {'error': message}
    if (isToolErrorHandling) {
      return false;
    }

    // If there's logging but no rethrow/throw, it's likely swallowing
    if (hasLogging && !hasRethrow && !hasThrow) {
      return true;
    }

    // If there are statements but no logging, rethrow, or throw, it might be swallowing
    if (!hasLogging && !hasRethrow && !hasThrow && statements.isNotEmpty) {
      // Check if statements create default/fallback values instead of rethrowing
      return _createsDefaultValues(statements);
    }

    return false;
  }

  bool _containsLogging(Statement statement) {
    final visitor = _LoggingDetector();
    statement.visitChildren(visitor);
    return visitor.hasLogging;
  }

  bool _isToolErrorHandling(Statement statement) {
    // Look for patterns like:
    // toolResults.add(ChatMessage(..., parts: [ToolPart.result(..., result: json.encode({'error': error.toString()}))]))
    final visitor = _ToolErrorDetector();
    statement.visitChildren(visitor);
    return visitor.isToolErrorHandling;
  }

  bool _isRetryLogic(Statement statement) {
    // Look for retry patterns like:
    // - Future.delayed(delay)
    // - attempt++
    // - retry loops
    final visitor = _RetryLogicDetector();
    statement.visitChildren(visitor);
    return visitor.isRetryLogic;
  }

  bool _createsDefaultValues(List<Statement> statements) {
    // Look for statements that create default/fallback values
    for (final statement in statements) {
      if (statement is ReturnStatement) {
        final returnValue = statement.expression?.toString() ?? '';
        // Common default value patterns in return statements
        if (returnValue.contains('{}') ||
            returnValue.contains('[]') ||
            returnValue.contains("{'result':") ||
            returnValue.contains('toString()') ||
            returnValue.contains("'Unknown") ||
            returnValue.contains('"Unknown') ||
            returnValue.contains("'default'") ||
            returnValue.contains('"default"')) {
          return true;
        }
      } else if (statement is ExpressionStatement) {
        final expression = statement.expression;
        if (expression is AssignmentExpression) {
          final rightSide = expression.rightHandSide.toString();
          // Common default value patterns in assignments
          if (rightSide.contains('{}') ||
              rightSide.contains('[]') ||
              rightSide.contains("{'result':") ||
              rightSide.contains('toString()') ||
              rightSide.contains("'default'") ||
              rightSide.contains('"default"')) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

class _LoggingDetector extends RecursiveAstVisitor<void> {
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

class _ToolErrorDetector extends RecursiveAstVisitor<void> {
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

class _RetryLogicDetector extends RecursiveAstVisitor<void> {
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
    if (code.contains('attempt') && code.contains('+=')) {
      isRetryLogic = true;
    }

    super.visitAssignmentExpression(node);
  }
}