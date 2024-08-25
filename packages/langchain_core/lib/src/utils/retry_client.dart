import 'dart:async';
import 'dart:math';

/// {@template retry_options}
/// Options to pass into [retryClient] to control the retry behavior.
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

  /// The maximum number of attempts to retry.
  final int maxRetries;

  /// An evaluator function that can be used to decide if the function should
  /// be retried based on the exception it throws.
  ///
  /// If you decide not to retry on a particular exception, [retryIf] can return
  /// `false` and the retry won't happen. By default [retryIf] is `true` and
  /// all exceptions are retried.
  final FutureOr<bool> Function(Object e)? retryIf;

  /// The function will be retried based on an exponential backoff strategy
  /// with a base delay of 1 second.
  ///
  /// But you can override this behavior by providing an optional list of
  /// [delayDurations]`. Each entry in the list corresponds to a specific
  /// retry attempt, and the corresponding delay from the list will be used
  /// instead of the default exponential delay.
  ///
  /// For example, if you provide a list of `[2, 4, 8]`, the delays between the
  /// first three retries will be 2, 4, and 8 seconds, respectively.
  final List<Duration?>? delayDurations;

  /// Whether to add jitter to the exponential backoff.
  ///
  /// Jitter is a random value added to the delay to prevent multiple clients
  /// from retrying at the same time.
  final bool addJitter;
}

/// A client that handles retry logic for a given function.
///
/// This client takes [RetryOptions] and a function to execute. If the
/// function fails, it will be retried according to the specified options.
/// If it succeeds, the result of the function will be returned.
FutureOr<T> retryClient<T>({
  required RetryOptions options,
  required FutureOr<T> Function() fn,
}) async {
  const defaultDelay = Duration(seconds: 1);

  for (int attempt = 0; attempt < options.maxRetries; attempt++) {
    try {
      return await fn();
    } catch (e) {
      final isLastAttempt = attempt == options.maxRetries - 1;
      final shouldRetry = await options.retryIf?.call(e) ?? true;

      if (isLastAttempt || !shouldRetry) {
        rethrow;
      }

      final duration =
          options.delayDurations?[attempt] ?? defaultDelay * pow(2, attempt);
      await _delay(duration, attempt, options.addJitter);
    }
  }

  // This line should never be reached
  throw StateError('Exhausted all retry attempts');
}

Future<void> _delay(
  final Duration duration,
  final int attempt,
  final bool addJitter,
) async {
  final Duration delay;
  if (addJitter) {
    final random = Random();
    final jitter = random.nextInt(100);
    delay = Duration(milliseconds: duration.inMilliseconds + jitter);
  } else {
    delay = duration;
  }
  await Future<void>.delayed(delay);
}
