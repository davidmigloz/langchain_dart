import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../chat_models/types.dart';
import '../language_models/types.dart';
import 'base.dart';
import 'types.dart';
import 'utils.dart';

/// {@template base_output_functions_parser}
/// Base class for parsers that converts the output of a function call into a
/// specified type.
/// {@endtemplate}
abstract class BaseOutputFunctionsParser<
        CallOptions extends OutputParserOptions, ParserOutput extends Object?>
    extends BaseOutputParser<ChatResult, CallOptions, ParserOutput> {
  /// {@macro base_output_functions_parser}
  BaseOutputFunctionsParser({
    final CallOptions? defaultOptions,
  }) : super(
          defaultOptions:
              defaultOptions ?? const OutputParserOptions() as CallOptions,
        );

  LanguageModelResult<ChatMessage>? _lastResult;

  @override
  Future<ParserOutput> invoke(
    final ChatResult input, {
    final CallOptions? options,
  }) {
    return _parseChatMessage(input.output);
  }

  @override
  Stream<ParserOutput> stream(
    final ChatResult input, {
    final CallOptions? options,
  }) async* {
    final mergedResult = _lastResult?.concat(input) ?? input;
    _lastResult = mergedResult;
    yield await _parseChatMessage(mergedResult.output);
  }

  /// Parses the output of a function call.
  @protected
  Future<ParserOutput> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  );

  Future<ParserOutput> _parseChatMessage(final ChatMessage message) {
    return parseFunctionCall(
      message is AIChatMessage ? message.functionCall : null,
    );
  }
}

/// {@template output_functions_parser}
/// A parser that returns the output of a function as a JSON [String].
///
/// If [argsOnly] is `true`, then only the arguments of the function call will
/// be returned. Otherwise, the entire function call will be returned as a JSON
/// [String].
/// {@endtemplate}
class OutputFunctionsParser
    extends BaseOutputFunctionsParser<OutputParserOptions, String> {
  /// {@macro output_functions_parser}
  OutputFunctionsParser({
    this.argsOnly = true,
  }) : super(defaultOptions: const OutputParserOptions());

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
class JsonOutputFunctionsParser extends BaseOutputFunctionsParser<
    OutputParserOptions, Map<String, dynamic>> {
  /// {@macro json_output_functions_parser}
  JsonOutputFunctionsParser()
      : super(defaultOptions: const OutputParserOptions());

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
    final Stream<ChatResult> inputStream, {
    final OutputParserOptions? options,
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
class JsonKeyOutputFunctionsParser<ParserOutput extends Object?>
    extends BaseOutputFunctionsParser<OutputParserOptions, ParserOutput> {
  /// {@macro json_key_output_functions_parser}
  JsonKeyOutputFunctionsParser({
    required this.keyName,
  })  : _jsonOutputFunctionsParser = JsonOutputFunctionsParser(),
        super(defaultOptions: const OutputParserOptions());

  /// The key to extract from the arguments of the function call.
  final String keyName;

  final JsonOutputFunctionsParser _jsonOutputFunctionsParser;

  @override
  Future<ParserOutput> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) async {
    final arguments =
        await _jsonOutputFunctionsParser.parseFunctionCall(functionCall);
    return arguments[keyName] as ParserOutput;
  }

  @override
  Stream<ParserOutput> streamFromInputStream(
    final Stream<ChatResult> inputStream, {
    final OutputParserOptions? options,
  }) {
    return super
        .streamFromInputStream(inputStream, options: options)
        .distinct();
  }
}
