import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:rxdart/rxdart.dart' show DoExtensions;

import '../chat_models/types.dart';
import 'base.dart';
import 'types.dart';
import 'utils.dart';

/// {@template tools_output_parser}
/// A parser that returns the list of tool calls returned by the model.
///
/// When streaming, the parser attempts to “auto-complete” the partial json
/// from each chunk into a valid state.
///
/// Example:
/// ```dart
/// const tool = ToolSpec(
///   name: 'joke',
///   description: 'A joke',
///   inputJsonSchema: {
///     'type': 'object',
///     'properties': {
///       'setup': {
///         'type': 'string',
///         'description': 'The setup for the joke',
///       },
///       'punchline': {
///         'type': 'string',
///         'description': 'The punchline to the joke',
///       },
///     },
///     'required': ['location', 'punchline'],
///   },
/// );
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'tell me a long joke about {foo}',
/// );
/// final chat = ChatOpenAI(
///   apiKey: openaiApiKey,
///   defaultOptions: ChatOpenAIOptions(
///     temperature: 0,
///   ),
/// ).bind(
///   ChatOpenAIOptions(
///     tools: [tool],
///     toolChoice: ChatToolChoice.forced(name: 'joke'),
///   ),
/// );
/// final outputParser = ToolsOutputParser();
/// final chain = promptTemplate.pipe(chat).pipe(outputParser);
/// final res = await chain.invoke({'foo': 'bears'});
/// print(res);
/// // [ParsedToolCall{
/// //   id: call_5TU1iYgYO3Z81eAuTe7J23f7,
/// //   name: joke,
/// //   arguments: {
/// //     setup: Why don't bears like fast food restaurants?,
/// //     punchline: Because they can't bear the wait!
/// //   },
/// // }]
/// ```
/// {@endtemplate}
class ToolsOutputParser
    extends
        BaseOutputParser<
          ChatResult,
          OutputParserOptions,
          List<ParsedToolCall>
        > {
  /// {@macro tools_output_parser}
  ToolsOutputParser({this.reduceOutputStream = false})
    : super(defaultOptions: const OutputParserOptions());

  /// When invoking this parser with [Runnable.stream], every item from the
  /// input stream will be parsed and emitted by default.
  ///
  /// If [reduceOutputStream] is set to `true`, the parser will reduce the
  /// output stream into a single String and emit it as a single item.
  ///
  /// Visual example:
  /// - reduceOutputStream = false
  /// 'A', 'B', 'C' -> 'A', 'B', 'C'
  /// - reduceOutputStream = true
  /// 'A', 'B', 'C' -> 'ABC'
  final bool reduceOutputStream;

  ChatResult? _lastResult;
  List<ParsedToolCall> _lastOutput = [];

  @override
  Future<List<ParsedToolCall>> invoke(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) {
    return _parseInvoke(input, options: options);
  }

  @override
  Stream<List<ParsedToolCall>> stream(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) async* {
    yield await _parseStream(input, options: options);
  }

  @override
  Stream<List<ParsedToolCall>> streamFromInputStream(
    final Stream<ChatResult> inputStream, {
    final OutputParserOptions? options,
  }) async* {
    if (reduceOutputStream) {
      await inputStream.forEach(
        (final input) => _parseStream(input, options: options),
      );
      yield _lastOutput;
      _clear();
    } else {
      yield* super
          .streamFromInputStream(inputStream, options: options)
          .distinct(const DeepCollectionEquality().equals)
          .doOnCancel(_clear);
    }
  }

  Future<List<ParsedToolCall>> _parseInvoke(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) async {
    return _parse(input.output.toolCalls);
  }

  Future<List<ParsedToolCall>> _parseStream(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) async {
    final mergedResult = _lastResult?.concat(input) ?? input;
    _lastResult = mergedResult;
    return _lastOutput = _parse(
      mergedResult.output.toolCalls,
      fallback: _lastOutput,
    );
  }

  List<ParsedToolCall> _parse(
    final List<AIChatMessageToolCall>? toolCalls, {
    List<ParsedToolCall> fallback = const [],
  }) {
    final List<ParsedToolCall> output = [];
    for (var i = 0; i < (toolCalls?.length ?? 0); i++) {
      final toolCall = toolCalls![i];
      final arguments = toolCall.arguments.isNotEmpty
          ? toolCall.arguments
          : parsePartialJson(toolCall.argumentsRaw) ??
                (i < fallback.length
                    ? fallback[i].arguments
                    : const <String, dynamic>{});
      output.add(
        ParsedToolCall(
          id: toolCall.id,
          name: toolCall.name,
          arguments: arguments,
        ),
      );
    }
    return output;
  }

  void _clear() {
    _lastResult = null;
    _lastOutput = [];
  }
}
