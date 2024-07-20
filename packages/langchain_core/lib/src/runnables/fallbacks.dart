import 'runnable.dart';
import 'types.dart';

/// {@template runnable_fallback}
/// Runnable that can fallback to other Runnables if it fails.
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

  ///A sequence of fallbacks to try.
  final List<Runnable<RunInput, RunnableOptions, RunOutput>> fallbacks;

  Iterable<Runnable<RunInput, RunnableOptions, RunOutput>>
      _yeildRunnables() sync* {
    yield mainRunnable;
    for (final runnable in fallbacks) {
      yield runnable;
    }
  }

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    dynamic firstError;
    RunOutput? runnableOutput;
    for (final runnable in _yeildRunnables()) {
      try {
        runnableOutput = await runnable.invoke(
          input,
          options: firstError == null
              ? options
              : runnable.getCompatibleOptions(options),
        );
        break;
      } catch (e) {
        firstError = e;
      }
    }
    if (runnableOutput == null) {
      throw Exception(
        'none of the Runnable returned output, error: $firstError',
      );
    }
    return runnableOutput;
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) async {
    dynamic error;
    List<RunOutput>? runnableOutput;
    for (final runnable in _yeildRunnables()) {
      try {
        runnableOutput = await runnable.batch(
          inputs,
          options: error == null ? options : null,
        );
        break;
      } catch (e) {
        error = e;
      }
    }
    if (runnableOutput == null) {
      throw Exception('none of the Runnable returned output, error: $error');
    }
    return runnableOutput;
  }
}
