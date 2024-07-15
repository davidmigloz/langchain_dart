import 'runnable.dart';
import 'types.dart';

class RunnableWithFallback<RunInput extends Object?, RunOutput extends Object?>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  RunnableWithFallback({
    required this.mainRunnable,
    required this.fallbacks,
  }) : super(defaultOptions: const RunnableOptions());

  final Runnable<RunInput, RunnableOptions, RunOutput> mainRunnable;
  final List<Runnable<RunInput, RunnableOptions, RunOutput>> fallbacks;

  Iterable<Runnable<RunInput, RunnableOptions, RunOutput>>
      yeildRunnables() sync* {
    yield mainRunnable;
    for (final runnable in fallbacks) {
      yield runnable;
    }
  }

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    dynamic firstError;
    RunOutput? runnableOutput;
    for (final runnable in yeildRunnables()) {
      if (firstError != null) {
        runnableOutput = await runnable.invoke(
          input,
          options: runnable.getCompatibleOptions(options),
        );
        if (runnableOutput != null) break;
      } else {
        try {
          runnableOutput = await runnable.invoke(input, options: options);
        } catch (e) {
          firstError = e;
        }
      }
    }
    if (runnableOutput == null) {
      throw Exception('none of the Runnable returned output');
    }
    return runnableOutput;
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) {
    return super.batch(inputs, options: options);
  }
}
