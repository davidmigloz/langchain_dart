import 'binding.dart';
import 'types.dart';

class RunnableRetry<RunInput extends Object?, RunOutput extends Object?>
    extends RunnableBinding<RunInput, RunnableOptions, RunOutput> {
  RunnableRetry({
    required super.bound,
    required super.options,
    this.maxAttempt = 3,
  });

  final int? maxAttempt;

  @override
  Future<RunOutput> invoke(RunInput input, {RunnableOptions? options}) async {
    Object? error;
    for (int attempt = 0; attempt <= maxAttempt!; attempt++) {
      try {
        return await bound.invoke(input, options: options ?? defaultOptions);
      } catch (e) {
        error = e;
      }
    }
    throw Exception('max retries exceeded: $error');
  }

  @override
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<RunnableOptions>? options,
  }) async {
    Object? error;
    for (int attempt = 0; attempt <= maxAttempt!; attempt++) {
      try {
        return await bound.batch(inputs, options: options);
      } catch (e) {
        error = e;
      }
    }
    throw Exception('max retries exceeded: $error');
  }

  @override
  Stream<RunOutput> stream(RunInput input, {RunnableOptions? options}) {
    // TODO: implement stream
    return super.stream(input, options: options);
  }
}
