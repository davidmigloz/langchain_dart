import 'dart:async';

import '../utils/chunk.dart';
import '../utils/retry_client.dart';
import 'binding.dart';
import 'fallbacks.dart';
import 'function.dart';
import 'input_map.dart';
import 'input_stream_map.dart';
import 'map.dart';
import 'passthrough.dart';
import 'retry.dart';
import 'router.dart';
import 'sequence.dart';
import 'types.dart';

/// {@template runnable}
/// A Runnable is a generic unit of work that can be invoked, batched,
/// streamed, and/or transformed. It is the basic building block of the
/// LangChain Expression Language (LCEL).
///
/// It is implemented by most of the LangChain components (prompt templates,
/// models, retrievers, output parsers, etc.) which makes it easy to define
/// custom chains as well as making it possible to invoke them in a standard
/// way.
///
/// The standard interface exposed includes:
/// - [stream] stream back chunks of the response.
/// - [invoke] call the chain on an input.
/// - [batch] call the chain on a list of inputs.
///
/// There are also several useful primitives for working with runnables:
/// - [pipe] allows you to chain runnables together (alternatively, you can use
///  the `|` operator or the [fromList] static method.
/// - [fromMap] allows you to run multiple runnables concurrently on the same
///  input returning a map of the results.
/// - [passthrough] takes the input it receives and passes it through as output.
/// - [mapInput] allows you to map the input to a different value.
/// - [mapInputStream] allows you to map the input stream to a different stream
///  of values.
/// - [getItemFromMap] allows you to get a value from the input.
/// - [getMapFromInput] allows you to output a map with the given key and the
///  input as value.
/// - [fromFunction] allows you to run a Dart function as part of a chain.
/// - [fromRouter] takes the input it receives and routes it to the runnable
///  returned by the router function.
/// - [bind] allows you to bind the runnable to a set of options.
/// {@endtemplate}
abstract class Runnable<
  RunInput extends Object?,
  CallOptions extends RunnableOptions,
  RunOutput extends Object?
> {
  /// {@macro runnable}
  const Runnable({required this.defaultOptions});

  /// The default options to use when invoking the [Runnable].
  ///
  /// This can be overridden by passing options to the [invoke], [batch], or
  /// [stream] methods.
  final CallOptions defaultOptions;

  /// Creates a [RunnableSequence] from a list of [Runnable] objects.
  ///
  /// A [RunnableSequence] allows you to run multiple [Runnable] objects
  /// sequentially, passing the output of the previous [Runnable] to the next one.
  ///
  /// - [runnables] - the list of [Runnable] objects to run in sequence.
  static Runnable fromList(List<Runnable> runnables) => RunnableSequence.from(runnables);

  /// Creates a [RunnableMap] from a map of [Runnable] objects.
  ///
  /// A [RunnableMap] allows you to run multiple [Runnable] objects in parallel
  /// on the same input returning a map of the results.
  ///
  /// - [steps] - the map of [Runnable] objects to run in parallel.
  static Runnable<RunInput, RunnableOptions, Map<String, dynamic>> fromMap<
    RunInput extends Object
  >(Map<String, Runnable<RunInput, RunnableOptions, Object>> steps) => RunnableMap<RunInput>(steps);

  /// Creates a [RunnableFunction] from a Dart function.
  ///
  /// A [RunnableFunction] allows you to run a Dart function as part of a chain.
  ///
  /// - [function] - the function to run.
  static Runnable<RunInput, RunnableOptions, RunOutput>
  fromFunction<RunInput extends Object, RunOutput extends Object>({
    FutureOr<RunOutput> Function(
      RunInput input,
      RunnableOptions? options,
    )?
    invoke,
    Stream<RunOutput> Function(
      Stream<RunInput> inputStream,
      RunnableOptions? options,
    )?
    stream,
  }) => RunnableFunction<RunInput, RunOutput>(
      invoke: invoke,
      stream: stream,
    );

  /// Creates a [RunnableRouter] from a Dart function.
  ///
  /// A [RunnableRouter] takes the input it receives and routes it to the runnable
  /// returned by the [router] function.
  ///
  /// - [router] - the function that will be called to determine the runnable to use.
  static Runnable<RunInput, RunnableOptions, RunOutput>
  fromRouter<RunInput extends Object, RunOutput extends Object>(
    FutureOr<Runnable<RunInput, RunnableOptions, RunOutput>> Function(
      RunInput input,
      RunnableOptions? options,
    )
    router,
  ) => RunnableRouter<RunInput, RunOutput>(router);

  /// Creates a [RunnablePassthrough].
  ///
  /// A [RunnablePassthrough] takes the input it receives and passes it through
  /// as output.
  static Runnable<RunInput, RunnableOptions, RunInput>
  passthrough<RunInput extends Object>() => RunnablePassthrough<RunInput>();

  /// Creates a [RunnableMapInput] from a function.
  ///
  /// A [RunnableMapInput] allows you to map the input to a different value.
  ///
  /// - [inputMapper] - a function that maps [RunInput] to [RunOutput].
  static Runnable<RunInput, RunnableOptions, RunOutput> mapInput<
    RunInput extends Object,
    RunOutput extends Object
  >(FutureOr<RunOutput> Function(RunInput input) inputMapper) => RunnableMapInput<RunInput, RunOutput>(inputMapper);

  /// Creates a [RunnableMapInputStream] from an asynchronous generator.
  ///
  /// A [RunnableMapInputStream] allows you to map the input stream to a
  /// different stream of values.
  ///
  /// - [inputStreamMapper] - the stream transformer to run.
  static Runnable<RunInput, RunnableOptions, RunOutput>
  mapInputStream<RunInput extends Object, RunOutput extends Object>(
    Stream<RunOutput> Function(Stream<RunInput> inputStream)
    inputStreamMapper,
  ) => RunnableMapInputStream<RunInput, RunOutput>(inputStreamMapper);

  /// Convenience method to return a value from an input map.
  ///
  /// - [key] - the key of the item to get from the input map.
  static Runnable<Map<String, dynamic>, RunnableOptions, RunOutput>
  getItemFromMap<RunOutput extends Object>(String key) => Runnable.mapInput<Map<String, dynamic>, RunOutput>(
      (input) => input[key],
    );

  /// Convenience method to return a map with the given key and the input
  /// as value.
  ///
  /// - [key] - the key where to place the input in the output map.
  static Runnable<RunInput, RunnableOptions, Map<String, dynamic>>
  getMapFromInput<RunInput extends Object>([String key = 'input']) => Runnable.mapInput<RunInput, Map<String, dynamic>>(
      (input) => {key: input},
    );

  /// Invokes the [Runnable] on the given [input].
  ///
  /// - [input] - the input to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  Future<RunOutput> invoke(RunInput input, {CallOptions? options});

  /// Batches the invocation of the [Runnable] on the given [inputs].
  ///
  /// If the underlying provider supports batching, this method will try to
  /// batch the calls to the provider. Otherwise, it will just call [invoke] on
  /// each input concurrently.
  ///
  /// You can configure the concurrency limit by setting the `concurrencyLimit`
  /// field in the [options] parameter.
  ///
  /// - [inputs] - the inputs to invoke the [Runnable] on concurrently.
  /// - [options] - the options to use when invoking the [Runnable]. It can be:
  ///   * `null`: the default options are used.
  ///   * List with 1 element: the same options are used for all inputs.
  ///   * List with the same length as the inputs: each input gets its own options.
  Future<List<RunOutput>> batch(
    List<RunInput> inputs, {
    List<CallOptions>? options,
  }) async {
    // By default, it just calls `.invoke` on each input con
    // Subclasses should override this method if they support batching
    assert(
      options == null || options.length == 1 || options.length == inputs.length,
    );

    final finalOptions = options?.first ?? defaultOptions;
    final concurrencyLimit = finalOptions.concurrencyLimit;

    var index = 0;
    final results = <RunOutput>[];
    for (final chunk in chunkList(inputs, chunkSize: concurrencyLimit)) {
      final chunkResults = await Future.wait(
        chunk.map(
          (input) => invoke(
            input,
            options: options?.length == 1 ? options![0] : options?[index++],
          ),
        ),
      );
      results.addAll(chunkResults);
    }
    return results;
  }

  /// Streams the output of invoking the [Runnable] on the given [input].
  ///
  /// - [input] - the input to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  Stream<RunOutput> stream(
    RunInput input, {
    CallOptions? options,
  }) async* {
    // By default, it just emits the result of calling `.invoke`
    // Subclasses should override this method if they support streaming output
    yield await invoke(input, options: options);
  }

  /// Streams the output of invoking the [Runnable] on the given [inputStream].
  ///
  /// - [inputStream] - the input stream to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  Stream<RunOutput> streamFromInputStream(
    Stream<RunInput> inputStream, {
    CallOptions? options,
  }) => inputStream.asyncExpand((input) => stream(input, options: options));

  /// Pipes the output of this [Runnable] into another [Runnable] using a
  /// [RunnableSequence].
  ///
  /// A [RunnableSequence] allows you to run multiple [Runnable] objects
  /// sequentially, passing the output of the previous [Runnable] to the next one.
  ///
  /// - [next] - the [Runnable] to pipe the output into.
  RunnableSequence<RunInput, NewRunOutput> pipe<
    NewRunOutput extends Object?,
    NewCallOptions extends RunnableOptions
  >(Runnable<RunOutput, NewCallOptions, NewRunOutput> next) => RunnableSequence<RunInput, NewRunOutput>(first: this, last: next);

  /// Binds the [Runnable] to the given [options].
  ///
  /// - [options] - the [CallOptions] to bind the [Runnable] with.
  RunnableBinding<RunInput, CallOptions, RunOutput> bind(
    CallOptions options,
  ) => RunnableBinding<RunInput, CallOptions, RunOutput>(
      bound: this,
      options: options,
    );

  /// Adds fallback runnables to be invoked if the primary runnable fails.
  ///
  /// This method creates a [RunnableWithFallback] instance that wraps the
  /// current [Runnable]. If the initial invocation of the current [Runnable]
  /// fails, the [fallbacks] runnables are attempted in the order they are
  /// provided. This process continues until a runnable succeeds or all
  /// fallbacks fail. The result of the first successful runnable is returned,
  /// or an error is thrown if all runnables fail.
  ///
  /// - [fallbacks] - A list of [Runnable] instances to be used as fallbacks.
  RunnableWithFallback<RunInput, RunOutput> withFallbacks(
    List<Runnable<RunInput, RunnableOptions, RunOutput>> fallbacks,
  ) => RunnableWithFallback<RunInput, RunOutput>(
      mainRunnable: this,
      fallbacks: fallbacks,
    );

  /// Adds retry logic to an existing runnable.
  ///
  /// This method create a [RunnableRetry] instance, if the current [Runnable]
  /// throws an exception during invocation, it will be retried based on the
  /// configuration provided. By default the runnable will be retried 3 times
  /// with exponential delay between each retry.
  ///
  ///  - [maxRetries] - max attempts to retry the runnable.
  ///  - [retryIf] - evaluator function to check whether to retry based the
  ///    exception thrown.
  ///  - [delayDurations] - by default runnable will be retried based on an
  ///    exponential backoff strategy with base delay as 1 second. But you can
  ///    override this behavior by providing an optional list of [Duration]s.
  ///  - [addJitter] - whether to add jitter to the delay.
  RunnableRetry<RunInput, RunOutput> withRetry({
    int maxRetries = 3,
    FutureOr<bool> Function(Object e)? retryIf,
    List<Duration?>? delayDurations,
    bool addJitter = false,
  }) => RunnableRetry<RunInput, RunOutput>(
      runnable: this,
      defaultOptions: defaultOptions,
      retryOptions: RetryOptions(
        maxRetries: maxRetries,
        retryIf: retryIf,
        delayDurations: delayDurations,
        addJitter: addJitter,
      ),
    );

  /// Returns the given [options] if they are compatible with the [Runnable],
  /// otherwise returns `null`.
  CallOptions? getCompatibleOptions(RunnableOptions? options) => options is CallOptions ? options : null;

  /// Cleans up any resources associated with it the [Runnable].
  ///
  /// For example, if the [Runnable] uses a http client internally, it closes
  /// it. If there is no resource to clean up, this method does nothing.
  ///
  /// Don't try to call the [Runnable] after calling this method.
  void close() {
    // Override this method if the Runnable needs to clean up resources
  }
}
