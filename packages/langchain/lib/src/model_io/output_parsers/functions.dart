import '../chat_models/models/models.dart';
import '../language_models/models/models.dart';
import 'models/models.dart';
import 'output_parser.dart';

/// {@template base_output_functions_parser}
/// A parser that converts the output of a function call into a specified type.
/// {@endtemplate}
abstract class BaseOutputFunctionsParser<O>
    extends BaseLLMOutputParser<ChatMessage, O> {
  /// {@macro base_output_functions_parser}
  const BaseOutputFunctionsParser();

  @override
  Future<O> parseResult(
    final List<LanguageModelGeneration<ChatMessage>> result,
  ) async {
    final generation = result.first;
    final message = generation.output;
    if (message is! AIChatMessage || message.functionCall == null) {
      throw const OutputParserException(
        message: 'No function message returned',
      );
    }
    return parseFunctionArguments(message.functionCall!.arguments);
  }

  Future<O> parseFunctionArguments(final Map<String, dynamic> arguments);
}

/// {@template output_functions_parser}
/// A parser that converts the output of a function call into a [Map] that
/// contains the arguments of the function call.
/// {@endtemplate}
class OutputFunctionsParser
    extends BaseOutputFunctionsParser<Map<String, dynamic>> {
  /// {@macro output_functions_parser}
  const OutputFunctionsParser();

  @override
  Future<Map<String, dynamic>> parseFunctionArguments(
    final Map<String, dynamic> arguments,
  ) async {
    return arguments;
  }
}
