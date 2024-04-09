import 'dart:async';

import '../../utils.dart';
import 'binding.dart';
import 'function.dart';
import 'input_getter.dart';
import 'input_map.dart';
import 'map.dart';
import 'passthrough.dart';
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
/// There are a few special types of [Runnable] that facilitate the creation of
/// custom chains:
/// - [RunnableSequence] allows you to run multiple [Runnable] objects
///   sequentially, passing the output of the previous [Runnable] to the next
///   one. You can create a sequence using the [pipe] method on any [Runnable],
///   the equivalent `|` operator, or the [fromList] static method.
/// - [RunnableMap] allows you to run multiple [Runnable] objects in parallel
///   on the same input returning a map of the results. You can create a
///   [RunnableMap] using the [Runnable.fromMap] static method.
/// - [RunnableFunction] allows you to run a Dart function as part of a chain.
///   You can create a [RunnableFunction] using the [Runnable.fromFunction]
///   static method.
/// - [RunnablePassthrough] takes the input it receives and passes it through
///   as output. You can create a [RunnablePassthrough] using the
///   [Runnable.passthrough] static method.
/// {@endtemplate}
abstract class Runnable<RunInput extends Object?,
    CallOptions extends RunnableOptions, RunOutput extends Object?> {
  /// {@macro runnable}
  const Runnable({
    required this.defaultOptions,
  });

  /// The default options to use when invoking the [Runnable].
  ///
  /// This can be overridden by passing options to the [invoke], [batch], or
  /// [stream] methods.
  final CallOptions defaultOptions;

  /// Creates a [RunnableSequence] from a list of [Runnable] objects.
  static Runnable fromList(final List<Runnable> runnables) {
    return RunnableSequence.from(runnables);
  }

  /// Creates a [RunnableMap] from a map of [Runnable] objects.
  static Runnable<RunInput, RunnableOptions, Map<String, dynamic>>
      fromMap<RunInput extends Object>(
    final Map<String, Runnable<RunInput, RunnableOptions, Object>> steps,
  ) {
    return RunnableMap<RunInput>(steps);
  }

  /// Creates a [RunnableFunction] from a Dart function.
  static Runnable<RunInput, RunnableOptions, RunOutput>
      fromFunction<RunInput extends Object, RunOutput extends Object>(
    final FutureOr<RunOutput> Function(
      RunInput input,
      RunnableOptions? options,
    ) function,
  ) {
    return RunnableFunction<RunInput, RunOutput>(function);
  }

  /// Creates a [RunnablePassthrough] which takes the input it receives and
  /// passes it through as output.
  static Runnable<RunInput, RunnableOptions, RunInput>
      passthrough<RunInput extends Object>() {
    return RunnablePassthrough<RunInput>();
  }

  /// Creates a [RunnableItemFromMap] which takes a map input it receives and
  /// returns the value of the given key.
  static Runnable<Map<String, dynamic>, RunnableOptions, RunOutput>
      getItemFromMap<RunOutput extends Object>(
    final String key,
  ) {
    return RunnableItemFromMap<RunOutput>(key);
  }

  /// Creates a [RunnableMapFromInput] which output a map with the given key and
  /// the input as value.
  static Runnable<RunInput, RunnableOptions, Map<String, dynamic>>
      getMapFromInput<RunInput extends Object>([final String key = 'input']) {
    return RunnableMapFromInput<RunInput>(key);
  }

  /// Creates a [RunnableMapInput] which allows you to map the input to a
  /// different value.
  static Runnable<RunInput, RunnableOptions, RunOutput>
      mapInput<RunInput extends Object, RunOutput extends Object>(
    final RunOutput Function(RunInput input) inputMapper,
  ) {
    return RunnableMapInput<RunInput, RunOutput>(inputMapper);
  }

  /// Invokes the [Runnable] on the given [input].
  ///
  /// - [input] - the input to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  Future<RunOutput> invoke(
    final RunInput input, {
    final CallOptions? options,
  });

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
    final List<RunInput> inputs, {
    final List<CallOptions>? options,
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
          (final input) => invoke(
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
    final RunInput input, {
    final CallOptions? options,
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
    final Stream<RunInput> inputStream, {
    final CallOptions? options,
  }) {
    return inputStream.asyncExpand((final input) {
      return stream(input, options: options);
    });
  }

  /// Pipes the output of this [Runnable] into another [Runnable].
  ///
  /// - [next] - the [Runnable] to pipe the output into.
  RunnableSequence<RunInput, NewRunOutput> pipe<NewRunOutput extends Object?,
      NewCallOptions extends RunnableOptions>(
    final Runnable<RunOutput, NewCallOptions, NewRunOutput> next,
  ) {
    return RunnableSequence<RunInput, NewRunOutput>(
      first: this,
      last: next,
    );
  }

  /// Binds the [Runnable] to the given [options].
  ///
  /// - [options] - the [CallOptions] to bind the [Runnable] with.
  RunnableBinding<RunInput, CallOptions, RunOutput> bind(
    final CallOptions options,
  ) {
    return RunnableBinding<RunInput, CallOptions, RunOutput>(
      bound: this,
      options: options,
    );
  }

  /// Returns the given [options] if they are compatible with the [Runnable],
  /// otherwise returns `null`.
  CallOptions? getCompatibleOptions(
    final RunnableOptions? options,
  ) {
    return options is CallOptions ? options : null;
  }
}
