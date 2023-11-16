import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../core/core.dart';
import '../chat_models/models/models.dart';
import '../language_models/models/models.dart';
import 'output_parser.dart';
import 'utils/json.dart';

/// {@template base_output_functions_parser}
/// Base class for parsers that converts the output of a function call into a
/// specified type.
/// {@endtemplate}
abstract class BaseOutputFunctionsParser<
        CallOptions extends BaseLangChainOptions, O extends Object?>
    extends BaseLLMOutputParser<AIChatMessage, CallOptions, O> {
  /// {@macro base_output_functions_parser}
  BaseOutputFunctionsParser();

  LanguageModelResult<ChatMessage>? _lastResult;

  @override
  Future<O> parseResult(
    final List<LanguageModelGeneration<ChatMessage>> result,
  ) async {
    final generation = result.first;
    return _parseChatMessage(generation.output);
  }

  @override
  Stream<O> streamFromInputStream(
    final Stream<LanguageModelResult<ChatMessage>> inputStream, {
    final CallOptions? options,
  }) {
    return inputStream.asyncMap((final input) async {
      final mergedResult = _lastResult?.concat(input) ?? input;
      _lastResult = mergedResult;
      final generation = mergedResult.generations.first;
      return _parseChatMessage(generation.output);
    });
  }

  Future<O> _parseChatMessage(final ChatMessage message) {
    return parseFunctionCall(
      message is AIChatMessage ? message.functionCall : null,
    );
  }

  /// Parses the output of a function call.
  @protected
  Future<O> parseFunctionCall(final AIChatMessageFunctionCall? functionCall);
}

/// {@template output_functions_parser}
/// A parser that returns the output of a function as a JSON [String].
///
/// If [argsOnly] is `true`, then only the arguments of the function call will
/// be returned. Otherwise, the entire function call will be returned as a JSON
/// [String].
/// {@endtemplate}
class OutputFunctionsParser<CallOptions extends BaseLangChainOptions>
    extends BaseOutputFunctionsParser<CallOptions, String> {
  /// {@macro output_functions_parser}
  OutputFunctionsParser({
    this.argsOnly = true,
  });

  /// Whether to return only the arguments of the function call.
  final bool argsOnly;

  @override
  Future<String> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) async {
    if (argsOnly) {
      return functionCall?.argumentsRaw ?? '';
    }
    return json.encode(functionCall?.toMap());
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
///     JsonOutputFunctionsParser();
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
  JsonOutputFunctionsParser();

  Map<String, dynamic>? _lastMap;

  @override
  Future<Map<String, dynamic>> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) async {
    Map<String, dynamic> result;
    if (functionCall?.arguments.isNotEmpty ?? false) {
      result = functionCall!.arguments;
    } else {
      result = parsePartialJson(functionCall?.argumentsRaw ?? '')
              as Map<String, dynamic>? ??
          _lastMap ??
          const {};
    }
    _lastMap = result;
    return result;
  }

  @override
  Stream<Map<String, dynamic>> streamFromInputStream(
    final Stream<LanguageModelResult<ChatMessage>> inputStream, {
    final CallOptions? options,
  }) {
    return super
        .streamFromInputStream(inputStream, options: options)
        .distinct(const MapEquality<String, dynamic>().equals);
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
///     JsonKeyOutputFunctionsParser(keyName: 'setup');
///
/// final res = await chain.invoke({'foo': 'bears'});
/// print(res);
/// // Why don't bears wear socks?
/// ```
/// {@endtemplate}
class JsonKeyOutputFunctionsParser<T extends Object?>
    extends BaseOutputFunctionsParser<BaseLangChainOptions, T> {
  /// {@macro json_key_output_functions_parser}
  JsonKeyOutputFunctionsParser({
    required this.keyName,
  }) : _jsonOutputFunctionsParser = JsonOutputFunctionsParser();

  /// The key to extract from the arguments of the function call.
  final String keyName;

  final JsonOutputFunctionsParser _jsonOutputFunctionsParser;

  @override
  Future<T> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) async {
    final arguments =
        await _jsonOutputFunctionsParser.parseFunctionCall(functionCall);
    return arguments[keyName] as T;
  }

  @override
  Stream<T> streamFromInputStream(
    final Stream<LanguageModelResult<ChatMessage>> inputStream, {
    final BaseLangChainOptions? options,
  }) {
    return super
        .streamFromInputStream(inputStream, options: options)
        .distinct();
  }
}
