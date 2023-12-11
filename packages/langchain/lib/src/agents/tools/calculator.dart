import 'dart:async';

import 'package:math_expressions/math_expressions.dart';

import 'base.dart';
import 'models/models.dart';

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
/// final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
/// final executor = AgentExecutor(agent: agent);
/// final res = await executor.run('What is 40 raised to the 0.43 power? ');
/// print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
/// ```
/// {@endtemplate}
final class CalculatorTool extends Tool<ToolOptions> {
  /// {@macro calculator_tool}
  CalculatorTool()
      : super(
          name: 'calculator',
          description: 'Useful for getting the result of a math expression '
              'that could be executed by a simple calculator.',
          inputDescription: 'A valid mathematical expression to evaluate',
        );

  final _parser = Parser();

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final ToolOptions? options,
  }) {
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
