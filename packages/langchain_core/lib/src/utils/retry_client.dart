import 'dart:async';
import 'dart:math';

class RetryOptions {
  RetryOptions({
    int? maxRetries,
    bool? addJitter,
    this.retryIf,
    this.delayDurations,
  })  : maxRetries = maxRetries ?? 3,
        addJitter = addJitter ?? false;

  final int maxRetries;
  final FutureOr<bool> Function(Object e)? retryIf;
  final List<Duration?>? delayDurations;
  final bool addJitter;
}

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
