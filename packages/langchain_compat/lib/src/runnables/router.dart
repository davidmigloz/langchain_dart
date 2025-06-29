// ignore_for_file: unsafe_variance

import 'dart:async';

import '../utils/reduce.dart';
import 'runnable.dart';
import 'types.dart';

/// {@template runnable_router}
/// A [RunnableRouter] takes the input it receives and routes it to the runnable
/// returned by the [router] function.
///
/// You can create a [RunnableRouter] using the [Runnable.fromRouter] static
/// method.
///
/// When you call [invoke] on a [RunnableRouter], it will invoke the [router]
/// function, passing the input to it. Then, the returned runnable will be
/// invoked with the input.
///
/// Example:
/// ```dart
/// final router = Runnable.fromRouter((Map<String, dynamic> input, _) {
///   return switch(input['topic'] as String) {
///     'langchain' => langchainChain,
///     'anthropic' => anthropicChain,
///     _ => generalChain,
///   };
/// });
///
/// final fullChain = Runnable.fromMap({
///       'topic': classificationChain,
///       'question': Runnable.getItemFromMap('question'),
///     }).pipe(router);
///
/// final res2 = await fullChain.invoke({
///   'question': 'how do I use Anthropic?',
/// });
/// print(res2);
/// // As Dario Amodei told me, using Anthropic is a straightforward process that...
/// ```
/// {@endtemplate}
class RunnableRouter<RunInput extends Object, RunOutput extends Object>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_router}
  const RunnableRouter(this.router)
    : super(defaultOptions: const RunnableOptions());

  /// The function that will be called to determine the runnable to use.
  final FutureOr<Runnable<RunInput, RunnableOptions, RunOutput>> Function(
    RunInput input,
    RunnableOptions? options,
  )
  router;

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    final runnable = await router.call(input, options);
    return runnable.invoke(input, options: options);
  }

  @override
  Stream<RunOutput> stream(RunInput input, {RunnableOptions? options}) async* {
    final runnable = await router.call(input, options);
    yield* runnable.stream(input, options: options);
  }

  @override
  Stream<RunOutput> streamFromInputStream(
    Stream<RunInput> inputStream, {
    RunnableOptions? options,
  }) async* {
    final input = await inputStream.toList();
    final reduced = reduce<RunInput>(input);
    yield* stream(reduced, options: options);
  }
}
