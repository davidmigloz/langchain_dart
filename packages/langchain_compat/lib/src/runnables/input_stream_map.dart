// ignore_for_file: unsafe_variance

import 'dart:async';

import 'runnable.dart';
import 'types.dart';

/// {@template runnable_map_input_stream}
/// A [RunnableMapInputStream] allows you to map the input stream to a
/// different stream of values.
///
/// You can create a [RunnableMapInputStream] using the [Runnable.mapInputStream]
/// static method.
///
/// When you call [stream] on a [RunnableMapInputStream], it will take the
/// input stream it receives and returns the output stream returned by the given
/// [inputStreamMapper] function.
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
/// final mapper = Runnable.mapInputStream((Stream<Map<String, dynamic>> inputStream) async* {
///   yield await inputStream.last;
/// });
///
/// final chain = model.pipe(parser).pipe(mapper);
///
/// final stream = chain.stream(
///   PromptValue.string(
///     'Output a list of the countries france, spain and japan and their '
///         'populations in JSON format. Use a dict with an outer key of '
///         '"countries" which contains a list of countries. '
///         'Each country should have the key "name" and "population"',
///   ),
/// );
/// await stream.forEach((final chunk) => print('$chunk|'));
/// // {countries: [{name: France, population: 65273511}, {name: Spain, population: 46754778}, {name: Japan, population: 126476461}]}|
/// ```
/// {@endtemplate}
class RunnableMapInputStream<RunInput extends Object, RunOutput extends Object>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_map_input_stream}
  const RunnableMapInputStream(this.inputStreamMapper)
    : super(defaultOptions: const RunnableOptions());

  /// The stream transformer to run.
  final Stream<RunOutput> Function(Stream<RunInput> inputStream)
  inputStreamMapper;

  /// Invokes the [RunnableMapInputStream] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableMapInputStream] on.
  /// - [options] - not used.
  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) =>
      streamFromInputStream(Stream.value(input), options: options).first;

  /// Streams the [input] through the [RunnableMapInputStream].
  ///
  /// - [input] - the input to stream through the [RunnableMapInputStream].
  /// - [options] - not used.
  @override
  Stream<RunOutput> stream(RunInput input, {RunnableOptions? options}) =>
      streamFromInputStream(Stream.value(input), options: options);

  /// Streams the [inputStream] through the [RunnableMapInputStream].
  ///
  /// - [inputStream] - the input stream to stream through the [RunnableMapInputStream].
  /// - [options] - not used.
  @override
  Stream<RunOutput> streamFromInputStream(
    Stream<RunInput> inputStream, {
    RunnableOptions? options,
  }) => inputStreamMapper(inputStream);
}
