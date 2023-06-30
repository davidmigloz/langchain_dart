import 'dart:async';

import 'package:math_expressions/math_expressions.dart';

import 'base.dart';

/// {@template calculator_tool}
/// A tool that can be used to calculate the result of a math expression.
/// {@endtemplate}
final class CalculatorTool extends Tool {
  /// {@macro calculator_tool}
  CalculatorTool()
      : super(
          name: 'calculator',
          description: 'Useful for getting the result of a math expression. '
              'The input to this tool should be a valid mathematical '
              'expression that could be executed by a simple calculator.',
        );

  final _parser = Parser();

  @override
  FutureOr<String> runInternalString(final String toolInput) {
    try {
      return _parser
          .parse(toolInput)
          .evaluate(EvaluationType.REAL, ContextModel())
          .toString();
    } catch (e) {
      return "I don't know how to do that.";
    }
  }
}
