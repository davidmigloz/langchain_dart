import 'dart:async';

import 'package:langchain_core/tools.dart';
import 'package:math_expressions/math_expressions.dart';

/// {@template calculator_tool}
/// A tool that can be used to calculate the result of a math expression.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final llm = ChatOpenAI(
///   apiKey: openaiApiKey,
///   temperature: 0,
/// );
/// final tool = CalculatorTool();
/// final agent = ToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
/// final executor = AgentExecutor(agent: agent);
/// final res = await executor.run('What is 40 raised to the 0.43 power? ');
/// print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
/// ```
/// {@endtemplate}
final class CalculatorTool extends StringTool<ToolOptions> {
  /// {@macro calculator_tool}
  CalculatorTool()
      : super(
          name: 'calculator',
          description: 'Useful for getting the result of a math expression '
              'that could be executed by a simple calculator.',
          inputDescription: 'A valid mathematical expression to evaluate. '
              'For example: "(x^2 + cos(y)) / 3".',
        );

  final _parser = Parser();

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final ToolOptions? options,
  }) async {
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
