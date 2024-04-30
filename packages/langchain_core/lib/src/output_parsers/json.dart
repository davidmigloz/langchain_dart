import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../runnables/runnable.dart';
import 'base.dart';
import 'string.dart';
import 'types.dart';
import 'utils.dart';

/// {@template json_output_parser}
/// Output parser that returns the output of the previous [Runnable] as a
/// JSON [Map].
///
/// - [ParserInput] - The type of the input to the parser.
///
/// Example:
/// ```dart
/// final model = ChatOpenAI(
///   apiKey: openAiApiKey,
///   defaultOptions: ChatOpenAIOptions(
///     responseFormat: ChatOpenAIResponseFormat(
///       type: ChatOpenAIResponseFormatType.jsonObject,
///     ),
///   ),
/// );
/// final parser = JsonOutputParser<ChatResult>();
/// final chain = model.pipe(parser);
/// final stream = chain.stream(
///   PromptValue.string(
///     'Output a list of the countries france, spain and japan and their '
///     'populations in JSON format. Use a dict with an outer key of '
///     '"countries" which contains a list of countries. '
///     'Each country should have the key "name" and "population"',
///   ),
/// );
/// await stream.forEach((final chunk) => print('$chunk|'));
/// // {}|
/// // {countries: []}|
/// // {countries: [{name: France}]}|
/// // {countries: [{name: France, population: 67076000}, {}]}|
/// // {countries: [{name: France, population: 67076000}, {name: Spain}]}|
/// // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}]}|
/// // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan}]}|
/// // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126476461}]}|
/// ```
/// {@endtemplate}
class JsonOutputParser<ParserInput extends Object?> extends BaseOutputParser<
    ParserInput, OutputParserOptions, Map<String, dynamic>> {
  /// {@macro json_output_parser}
  JsonOutputParser({
    this.reduceOutputStream = false,
  })  : _stringOutputParser = StringOutputParser<ParserInput>(),
        super(defaultOptions: const OutputParserOptions());

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

  final StringOutputParser<ParserInput> _stringOutputParser;

  String _lastInputStr = '';
  Map<String, dynamic> _lastOutputMap = {};

  @override
  Future<Map<String, dynamic>> invoke(
    final ParserInput input, {
    final OutputParserOptions? options,
  }) async {
    final inputStr = await _stringOutputParser.invoke(input, options: options);
    return _parse(inputStr);
  }

  @override
  Stream<Map<String, dynamic>> stream(
    final ParserInput input, {
    final OutputParserOptions? options,
  }) async* {
    yield await _parseStream(input, options: options);
  }

  @override
  Stream<Map<String, dynamic>> streamFromInputStream(
    final Stream<ParserInput> inputStream, {
    final OutputParserOptions? options,
  }) async* {
    if (reduceOutputStream) {
      await inputStream.forEach(
        (final input) => _parseStream(input, options: options),
      );
      yield _lastOutputMap;
      _clear();
    } else {
      yield* super
          .streamFromInputStream(inputStream, options: options)
          .distinct(const DeepCollectionEquality().equals)
          .doOnCancel(_clear);
    }
  }

  Map<String, dynamic> _parse(
    final String input, {
    Map<String, dynamic> fallback = const {},
  }) {
    final result = parsePartialJson(input);
    return result ?? fallback;
  }

  Future<Map<String, dynamic>> _parseStream(
    final ParserInput input, {
    final OutputParserOptions? options,
  }) async {
    final inputStr = await _stringOutputParser.invoke(input, options: options);
    _lastInputStr = '$_lastInputStr$inputStr';
    return _lastOutputMap = _parse(_lastInputStr, fallback: _lastOutputMap);
  }

  void _clear() {
    _lastInputStr = '';
    _lastOutputMap = {};
  }
}
