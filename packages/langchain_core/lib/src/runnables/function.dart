// ignore_for_file: unsafe_variance

import 'dart:async';

import 'runnable.dart';
import 'types.dart';

/// {@template runnable_function}
/// A [RunnableFunction] allows you to run a Dart function as part of a chain.
///
/// You can create a [RunnableFunction] using the [Runnable.fromFunction]
/// static method.
///
/// When you call [invoke] on a [RunnableFunction], it will invoke the
/// function, passing the input to it. The output of the function is returned.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'How much is {a} + {b}?',
/// );
///
/// final chain = Runnable.fromMap({
///       'a': Runnable.fromFunction((
///         final Map<String, String> input,
///         final options,
///       ) async {
///         final foo = input['foo'] ?? '';
///         return '${foo.length}';
///       }),
///       'b': Runnable.fromFunction((
///         final Map<String, String> input,
///         final options,
///       ) async {
///         final foo = input['foo'] ?? '';
///         final bar = input['bar'] ?? '';
///         return '${bar.length * foo.length}';
///       }),
///     }) |
///     promptTemplate |
///     model |
///     StringOutputParser();
///
/// final res = await chain.invoke({'foo': 'foo', 'bar': 'bar'});
/// print(res);
/// // 3 + 9 = 12
/// ```
/// {@endtemplate}
class RunnableFunction<RunInput extends Object, RunOutput extends Object>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_function}
  const RunnableFunction({
    final FutureOr<RunOutput> Function(
      RunInput input,
      RunnableOptions? options,
    )?
    invoke,
    final Stream<RunOutput> Function(
      Stream<RunInput> inputStream,
      RunnableOptions? options,
    )?
    stream,
    super.defaultOptions = const RunnableOptions(),
  }) : _invokeFunc = invoke,
       _streamFunc = stream,
       assert(
         invoke != null || stream != null,
         'Either invoke or stream must be provided',
       );

  /// The function to run.
  final FutureOr<RunOutput> Function(
    RunInput input,
    RunnableOptions? options,
  )?
  _invokeFunc;

  /// The stream transformer to run.
  final Stream<RunOutput> Function(
    Stream<RunInput> inputStream,
    RunnableOptions? options,
  )?
  _streamFunc;

  /// Invokes the [RunnableFunction] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableFunction] on.
  /// - [options] - the options to use when invoking the [RunnableFunction].
  @override
  Future<RunOutput> invoke(
    final RunInput input, {
    final RunnableOptions? options,
  }) async {
    if (_invokeFunc != null) {
      return _invokeFunc(input, options);
    } else {
      return stream(input, options: options).first;
    }
  }

  /// Streams the [input] through the [RunnableFunction].
  ///
  /// - [input] - the input to stream through the [RunnableFunction].
  /// - [options] - the options to use when streaming the [input].
  @override
  Stream<RunOutput> stream(
    final RunInput input, {
    final RunnableOptions? options,
  }) {
    return streamFromInputStream(Stream.value(input), options: options);
  }

  @override
  Stream<RunOutput> streamFromInputStream(
    final Stream<RunInput> inputStream, {
    final RunnableOptions? options,
  }) async* {
    if (_streamFunc != null) {
      yield* _streamFunc(inputStream, options);
    } else {
      yield* inputStream.asyncMap((final input) {
        return invoke(input, options: options);
      });
    }
  }
}
