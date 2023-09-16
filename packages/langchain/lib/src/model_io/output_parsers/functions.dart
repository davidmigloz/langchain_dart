import 'dart:convert';

import '../../core/core.dart';
import '../chat_models/models/models.dart';
import '../language_models/models/models.dart';
import 'models/models.dart';
import 'output_parser.dart';

/// {@template base_output_functions_parser}
/// A parser that converts the output of a function call into a specified type.
/// {@endtemplate}
abstract class BaseOutputFunctionsParser<
    CallOptions extends BaseLangChainOptions,
    O extends Object> extends BaseLLMOutputParser<ChatMessage, CallOptions, O> {
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
    return parseFunctionCall(message.functionCall!);
  }

  Future<O> parseFunctionCall(final AIChatMessageFunctionCall functionCall);
}

/// {@template output_functions_parser}
/// A parser that returns the output of a function as a JSON [String].
/// {@endtemplate}
class OutputFunctionsParser<CallOptions extends BaseLangChainOptions>
    extends BaseOutputFunctionsParser<CallOptions, String> {
  /// {@macro output_functions_parser}
  const OutputFunctionsParser({
    this.argsOnly = true,
  });

  /// Whether to return only the arguments of the function call.
  final bool argsOnly;

  @override
  Future<String> parseFunctionCall(
    final AIChatMessageFunctionCall functionCall,
  ) async {
    final map = argsOnly ? functionCall.arguments : functionCall.toMap();
    return json.encode(map);
  }
}

/// {@template json_output_functions_parser}
/// A parser that converts the output of a function call into a [Map] that
/// contains the arguments of the function call.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {foo}',
/// );
///
/// const function = ChatFunction(
///   name: 'joke',
///   description: 'A joke',
///   parameters: {
///     'type': 'object',
///     'properties': {
///       'setup': {
///         'type': 'string',
///         'description': 'The setup for the joke',
///       },
///       'punchline': {
///         'type': 'string',
///         'description': 'The punchline for the joke',
///       },
///     },
///     'required': ['setup', 'punchline'],
///   },
/// );
///
/// final chain = promptTemplate |
///     model.bind(
///       ChatOpenAIOptions(
///         functions: const [function],
///         functionCall: ChatFunctionCall.forced(functionName: function.name),
///       ),
///     ) |
///     const JsonOutputFunctionsParser();
///
/// final res = await chain.invoke({'foo': 'bears'});
/// print(res);
/// // {
/// //   setup: Why don't bears wear shoes?,
/// //   punchline: Because they have bear feet!
/// // }
/// ```
/// {@endtemplate}
class JsonOutputFunctionsParser<CallOptions extends BaseLangChainOptions>
    extends BaseOutputFunctionsParser<CallOptions, Map<String, dynamic>> {
  /// {@macro json_output_functions_parser}
  const JsonOutputFunctionsParser();

  @override
  Future<Map<String, dynamic>> parseFunctionCall(
    final AIChatMessageFunctionCall functionCall,
  ) async {
    return functionCall.arguments;
  }
}

/// {@template json_key_output_functions_parser}
/// A parser that extracts a specific key from the arguments of a function call.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {foo}',
/// );
///
/// const function = ChatFunction(
///   name: 'joke',
///   description: 'A joke',
///   parameters: {
///     'type': 'object',
///     'properties': {
///       'setup': {
///         'type': 'string',
///         'description': 'The setup for the joke',
///       },
///       'punchline': {
///         'type': 'string',
///         'description': 'The punchline for the joke',
///       },
///     },
///     'required': ['setup', 'punchline'],
///   },
/// );
///
/// final chain = promptTemplate |
///     model.bind(
///       ChatOpenAIOptions(
///         functions: const [function],
///         functionCall: ChatFunctionCall.forced(functionName: function.name),
///       ),
///     ) |
///     const JsonKeyOutputFunctionsParser(keyName: 'setup');
///
/// final res = await chain.invoke({'foo': 'bears'});
/// print(res);
/// // Why don't bears wear socks?
/// ```
/// {@endtemplate}
class JsonKeyOutputFunctionsParser<CallOptions extends BaseLangChainOptions,
    T extends Object> extends BaseOutputFunctionsParser<CallOptions, T> {
  /// {@macro json_key_output_functions_parser}
  const JsonKeyOutputFunctionsParser({
    required this.keyName,
  });

  /// The key to extract from the arguments of the function call.
  final String keyName;

  @override
  Future<T> parseFunctionCall(
    final AIChatMessageFunctionCall functionCall,
  ) async {
    return functionCall.arguments[keyName] as T;
  }
}
