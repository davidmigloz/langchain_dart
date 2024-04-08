import 'runnable.dart';
import 'types.dart';

/// {@template runnable_sequence}
/// A [RunnableSequence] allows you to run multiple [Runnable] objects
/// sequentially, passing the output of the previous [Runnable] to the next one.
///
/// You can create a [RunnableSequence] in several ways:
///
/// - Calling [Runnable.pipe] method which takes another [Runnable] as an
/// argument. E.g.:
///
/// ```dart
/// final chain = promptTemplate.pipe(chatModel);
/// ```
///
/// - Using the `|` operator. This is a convenience method that calls
/// [Runnable.pipe] under the hood (note that it offers less type safety than
/// [Runnable.pipe] because of Dart limitations). E.g.:
///
/// ```dart
/// final chain = promptTemplate | chatModel;
/// ```
///
/// - Using the [Runnable.fromList] static method with a list of [Runnable],
/// which will run in sequence when invoked. E.g.:
///
/// ```dart
/// final chain = Runnable.fromList([promptTemplate, chatModel]);
/// ```
///
/// When you call [invoke] on a [RunnableSequence], it will invoke each
/// [Runnable] in the sequence in order, passing the output of the previous
/// [Runnable] to the next one. The output of the last [Runnable] in the
/// sequence is returned.
///
/// You can think of [RunnableSequence] as the replacement for
/// [SequentialChain].
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {topic}',
/// );
///
/// // The following three chains are equivalent:
/// final chain1 = promptTemplate | model | StringOutputParser();
/// final chain2 = promptTemplate.pipe(model).pipe(StringOutputParser());
/// final chain3 = Runnable.fromList(
///   [promptTemplate, model, StringOutputParser()],
/// );
///
/// final res = await chain1.invoke({'topic': 'bears'});
/// print(res);
/// // Why don't bears wear shoes? Because they have bear feet!
/// ```
/// {@endtemplate}
class RunnableSequence<RunInput extends Object?, RunOutput extends Object?>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_sequence}
  const RunnableSequence({
    required this.first,
    this.middle = const [],
    required this.last,
  }) : super(defaultOptions: const RunnableOptions());

  /// The first [Runnable] in the [RunnableSequence].
  final Runnable<RunInput, RunnableOptions, Object?> first;

  /// The middle [Runnable]s in the [RunnableSequence].
  final List<Runnable> middle;

  /// The last [Runnable] in the [RunnableSequence].
  final Runnable<Object?, RunnableOptions, RunOutput> last;

  /// Returns a list of all the [Runnable]s in the [RunnableSequence].
  List<Runnable> get steps => [first, ...middle, last];

  /// Creates a [RunnableSequence] from a list of [Runnable]s.
  ///
  /// - [runnables] - the [Runnable]s to create the [RunnableSequence] from.
  static RunnableSequence from(final List<Runnable> runnables) {
    return RunnableSequence(
      first: runnables.first,
      middle: runnables.sublist(1, runnables.length - 1),
      last: runnables.last,
    );
  }

  /// Invokes the [RunnableSequence] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableSequence] on.
  /// - [options] - the options to use when invoking the [RunnableSequence].
  @override
  Future<RunOutput> invoke(
    final RunInput input, {
    final RunnableOptions? options,
  }) async {
    Object? nextStepInput = input;

    for (final step in [first, ...middle]) {
      nextStepInput = await step.invoke(nextStepInput, options: options);
    }

    return last.invoke(nextStepInput, options: options);
  }

  @override
  Stream<RunOutput> stream(
    final RunInput input, {
    final RunnableOptions? options,
  }) {
    return streamFromInputStream(
      Stream.value(input).asBroadcastStream(),
      options: options,
    );
  }

  @override
  Stream<RunOutput> streamFromInputStream(
    final Stream<RunInput> inputStream, {
    final RunnableOptions? options,
  }) {
    Stream<Object?> nextStepStream;
    try {
      nextStepStream = first.streamFromInputStream(inputStream);
    } on TypeError catch (e) {
      _throwInvalidInputTypeStream(e, first);
    }

    for (final step in middle) {
      try {
        nextStepStream = step.streamFromInputStream(nextStepStream);
      } on TypeError catch (e) {
        _throwInvalidInputTypeStream(e, step);
      }
    }

    try {
      return last.streamFromInputStream(nextStepStream);
    } on TypeError catch (e) {
      _throwInvalidInputTypeStream(e, last);
    }
  }

  /// Pipes the output of this [RunnableSequence] into another [Runnable].
  ///
  /// - [next] - the [Runnable] to pipe the output into.
  @override
  RunnableSequence<RunInput, NewRunOutput> pipe<NewRunOutput extends Object?,
      NewCallOptions extends RunnableOptions>(
    final Runnable<RunOutput, NewCallOptions, NewRunOutput> next,
  ) {
    if (next is RunnableSequence<RunOutput, NewRunOutput>) {
      final nextSeq = next as RunnableSequence<RunOutput, NewRunOutput>;
      return RunnableSequence(
        first: first,
        middle: [...middle, last, nextSeq.first, ...nextSeq.middle],
        last: nextSeq.last,
      );
    } else {
      return RunnableSequence(
        first: first,
        middle: [...middle, last],
        last: next,
      );
    }
  }

  /// Provides a better error message for type errors when streaming.
  Never _throwInvalidInputTypeStream(
    final TypeError e,
    final Runnable runnable,
  ) {
    // TypeError: type '_BroadcastStream<X>' is not a subtype of type 'Stream<Y>' of 'inputStream'
    final pattern = RegExp(
      r'_(As)?BroadcastStream<(?<BroadcastType>[^>]+)>.*?Stream<(?<StreamType>[^>]+)>',
    );
    final error = e.toString();
    final match = pattern.firstMatch(error);
    final actualInputType = match?.namedGroup('BroadcastType') ?? 'Unknown';
    final expectedInputType = match?.namedGroup('StreamType') ?? 'Unknown';
    final errorMessage = '''
${runnable.runtimeType} runnable expects an input type of $expectedInputType, but received an instance of type $actualInputType instead.

Please ensure that the output of the previous runnable in the sequence matches the expected input type of the current runnable. 
    ''';
    throw ArgumentError(errorMessage);
  }
}
