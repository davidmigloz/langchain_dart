import 'dart:async';
import '../utils/retry_client.dart';
import 'runnables.dart';

/// {@template runnable_retry}
/// A [Runnable] that automatically retries the operation if it fails.
///
/// You can create a [RunnableRetry] using [Runnable.withRetry], passing in the
/// [RetryOptions].
///
/// When [invoke] or [batch] is called on the runnable, if the initial attempt
/// fails, it will be retried according to the specified [RetryOptions].
///
/// Example usage:
/// ```dart
/// final model = ChatOpenAI(...);
/// final modelWithRetry = model.withRetry(maxRetries: 2);
/// final res = await modelWithRetry.invoke(...);
/// ```
/// {@endtemplate}
class RunnableRetry<RunInput extends Object?, RunOutput extends Object?>
    extends Runnable<RunInput, RunnableOptions, RunOutput> {
  /// {@macro runnable_retry}
  RunnableRetry({
    required this.runnable,
    required super.defaultOptions,
    required this.retryOptions,
  });

  /// Runnable that will be retried on error.
  final Runnable<RunInput, RunnableOptions, RunOutput> runnable;

  /// Options to retry the runnable.
  final RetryOptions retryOptions;

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    return retryClient(
      options: retryOptions,
      fn: () => runnable.invoke(input, options: options),
    );
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) async {
    return retryClient(
      options: retryOptions,
      fn: () => runnable.batch(inputs, options: options),
    );
  }
}
