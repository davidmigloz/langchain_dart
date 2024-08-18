import 'dart:async';
import '../../runnables.dart';
import '../utils/retry_client.dart';

class RunnableRetry<RunInput extends Object?, RunOutput extends Object?>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  RunnableRetry({
    required this.runnable,
    required super.defaultOptions,
    required this.retryOptions,
  });

  final Runnable<RunInput, RunnableOptions, RunOutput> runnable;

  final RetryOptions retryOptions;

  @override
  Future<RunOutput> invoke(
    RunInput input, {
    RunnableOptions? options,
  }) async {
    return retryClient(
      options: retryOptions,
      fn: () => runnable.invoke(
        input,
        options: runnable.getCompatibleOptions(options),
      ),
    );
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) async {
    List<RunnableOptions>? currentOptions;
    final compatibleOptions =
        options?.map(runnable.getCompatibleOptions).toList(growable: false);
    final hasNullOptions = compatibleOptions?.any((o) => o == null) ?? false;
    if (!hasNullOptions) {
      currentOptions = compatibleOptions?.cast();
    }
    return retryClient(
      options: retryOptions,
      fn: () => runnable.batch(
        inputs,
        options: currentOptions,
      ),
    );
  }

  @override
  Stream<RunOutput> stream(RunInput input, {RunnableOptions? options}) async*{
    yield* await retryClient(
      options: retryOptions,
      fn: () => runnable.stream(input),
    );
  }
}
