import 'dart:async';
import 'dart:math';

/// {@template retry_options}
/// options to pass into RunnableRetry.
///
/// These parameters will influence retry logic
/// of the runnable
/// {@endtemplate}
class RetryOptions {
  /// {@macro retry_options}
  RetryOptions({
    int? maxRetries,
    bool? addJitter,
    this.retryIf,
    this.delayDurations,
  })  : maxRetries = maxRetries ?? 3,
        addJitter = addJitter ?? false;

  /// The maximum number of attempts to retry the Runnable.
  final int maxRetries;

  /// An Evaluator function that can be used to decide
  /// if runnable should be retried based on the Exception
  /// it throws.
  ///
  /// If you decide not to retry on a particular
  /// Exception, retryIf can be returned false and retry
  /// won't happen. By default retryIf will be true and
  /// all exceptions are retried
  final FutureOr<bool> Function(Object e)? retryIf;

  /// runnable will be retried based on
  /// exponential backoff strategy with base delay as
  /// 1 second.
  ///
  /// But you can override this behavior by providing an optional list of
  /// `delayDurations`. Each entry in the list corresponds to a specific
  /// retry attempt, and the corresponding delay from the list will be used
  /// instead of the default exponential delay.
  ///
  /// For example, if you provide a list of `[2, 4, 8]`, the delays between the
  /// first three retries will be 2 seconds, 4 seconds, and 8 seconds, respectively.
  final List<Duration?>? delayDurations;

  /// Whether to add jitter to the exponential backoff.
  /// by default set to false.
  final bool addJitter;
}

/// A client that handles retry logic for a given function.
///
/// This client takes [RetryOptions] and a function to execute. If the
/// function fails, it will be retried according to the specified [RetryOptions].
/// else output of the function will be returned.
FutureOr<T> retryClient<T>({
  required RetryOptions options,
  required FutureOr<T> Function() fn,
}) async {
  int attempt = 0;
  Object? error;
  const defaultDelay = Duration(seconds: 1);

  while (attempt < options.maxRetries) {
    try {
      return await fn();
    } catch (e) {
      error = e;
      final bool shouldRetry = await (options.retryIf?.call(error) ?? true);

      if (!shouldRetry) {
        throw Exception(
          'Function did not retry, retryIf returned false. Error: $error',
        );
      }
      final duration =
          options.delayDurations?[attempt] ?? defaultDelay * pow(2, attempt);
      await _delay(duration, attempt, options.addJitter);
      attempt++;
    }
  }
  throw Exception(
    'Function failed to return response and max retries exceeded, Error: $error ',
  );
}

Future<void> _delay(Duration duration, int attempt, bool addJitter) async {
  final Duration delay;
  if (addJitter) {
    final random = Random();
    final jitter = random.nextInt(100);
    delay = Duration(milliseconds: duration.inMilliseconds + jitter);
  } else {
    delay = duration;
  }
  await Future.delayed(
    delay,
    () => {print('retry attempt $attempt with delay duration $delay')},
  );
}
