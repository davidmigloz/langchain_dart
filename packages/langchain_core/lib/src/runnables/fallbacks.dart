import 'runnable.dart';
import 'types.dart';

/// {@template runnable_with_fallback}
/// A [Runnable] that can fallback to other [Runnable]s if it fails.
///
/// This class allows for the creation of a [Runnable] chain where a main
/// [Runnable] is attempted first, and if it fails, a sequence of fallback
/// [Runnable]s are tried in order. This process continues until one of the
/// [Runnable]s succeeds or all of them fail, in which case an exception is
/// thrown.
///
/// You can create a [RunnableWithFallback] using the [Runnable.withFallbacks]
/// method.
///
/// Example:
/// ```dart
/// final mainChatModel = ChatOpenAI(...);
/// final fallbackChatModel = ChatOpenAI(...);
/// final chatModel = mainChatModel.withFallbacks([fallbackChatModel]);
/// final res = await chatModel.invoke(...);
/// ```
/// {@endtemplate}
class RunnableWithFallback<RunInput extends Object?, RunOutput extends Object?>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_fallback}
  RunnableWithFallback({
    required this.mainRunnable,
    required this.fallbacks,
  }) : super(defaultOptions: const RunnableOptions());

  /// The Runnable to run first.
  final Runnable<RunInput, RunnableOptions, RunOutput> mainRunnable;

  /// A sequence of fallbacks to try if the [mainRunnable] fails.
  final List<Runnable<RunInput, RunnableOptions, RunOutput>> fallbacks;

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    Object? firstError;
    for (final runnable in [mainRunnable, ...fallbacks]) {
      try {
        return await runnable.invoke(
          input,
          options: firstError == null
              ? options
              : runnable.getCompatibleOptions(options),
        );
      } catch (e) {
        firstError ??= e;
      }
    }
    throw Exception('All runnables failed. First error: $firstError');
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) async {
    Object? firstError;
    for (final runnable in [mainRunnable, ...fallbacks]) {
      List<RunnableOptions>? currentOptions;
      if (firstError == null) {
        currentOptions = options;
      } else {
        final compatibleOptions = options
            ?.map(runnable.getCompatibleOptions)
            .toList(growable: false);
        final hasNullOptions =
            compatibleOptions?.any((o) => o == null) ?? false;
        if (!hasNullOptions) {
          currentOptions = compatibleOptions?.cast();
        }
      }

      try {
        return await runnable.batch(
          inputs,
          options: currentOptions,
        );
      } catch (e) {
        firstError ??= e;
      }
    }
    throw Exception('All runnables failed. First error: $firstError');
  }

  @override
  Stream<RunOutput> stream(
    RunInput input, {
    RunnableOptions? options,
  }) async* {
    Object? firstError;
    for (final runnable in [mainRunnable, ...fallbacks]) {
      try {
        final stream = runnable.stream(
          input,
          options: firstError == null
              ? options
              : runnable.getCompatibleOptions(options),
        );
        await for (final output in stream) {
          yield output;
        }
        return;
      } catch (e) {
        firstError ??= e;
      }
    }
    throw Exception('All runnables failed. First error: $firstError');
  }
}
