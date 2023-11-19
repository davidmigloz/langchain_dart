import 'dart:async';

import 'package:meta/meta.dart';

import '../base.dart';
import 'binding.dart';
import 'function.dart';
import 'input_getter.dart';
import 'input_map.dart';
import 'map.dart';
import 'passthrough.dart';
import 'sequence.dart';

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
    CallOptions extends BaseLangChainOptions, RunOutput extends Object?> {
  /// {@macro runnable}
  const Runnable();

  /// Creates a [RunnableSequence] from a list of [Runnable] objects.
  static Runnable fromList(final List<Runnable> runnables) {
    return RunnableSequence.from(runnables);
  }

  /// Creates a [RunnableMap] from a map of [Runnable] objects.
  static Runnable<RunInput, BaseLangChainOptions, Map<String, dynamic>>
      fromMap<RunInput extends Object>(
    final Map<String, Runnable<RunInput, BaseLangChainOptions, Object>> steps,
  ) {
    return RunnableMap<RunInput>(steps);
  }

  /// Creates a [RunnableFunction] from a Dart function.
  static Runnable<RunInput, BaseLangChainOptions, RunOutput>
      fromFunction<RunInput extends Object, RunOutput extends Object>(
    final FutureOr<RunOutput> Function(
      RunInput input,
      BaseLangChainOptions? options,
    ) function,
  ) {
    return RunnableFunction<RunInput, RunOutput>(function);
  }

  /// Creates a [RunnablePassthrough] which takes the input it receives and
  /// passes it through as output.
  static Runnable<RunInput, BaseLangChainOptions, RunInput>
      passthrough<RunInput extends Object>() {
    return RunnablePassthrough<RunInput>();
  }

  /// Creates a [RunnableItemFromMap] which takes a map input it receives and
  /// returns the value of the given key.
  static Runnable<Map<String, dynamic>, BaseLangChainOptions, RunOutput>
      getItemFromMap<RunOutput extends Object>(
    final String key,
  ) {
    return RunnableItemFromMap<RunOutput>(key);
  }

  /// Creates a [RunnableMapFromInput] which output a map with the given key and
  /// the input as value.
  static Runnable<RunInput, BaseLangChainOptions, Map<String, dynamic>>
      getMapFromInput<RunInput extends Object>([final String key = 'input']) {
    return RunnableMapFromInput<RunInput>(key);
  }

  /// Creates a [RunnableMapInput] which allows you to map the input to a
  /// different value.
  static Runnable<RunInput, BaseLangChainOptions, RunOutput>
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

  /// Streams the output of invoking the [Runnable] on the given [input].
  ///
  /// - [input] - the input to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  Stream<RunOutput> stream(
    final RunInput input, {
    final CallOptions? options,
  }) {
    return streamFromInputStream(
      Stream.value(input).asBroadcastStream(),
      options: options,
    );
  }

  /// Streams the output of invoking the [Runnable] on the given [inputStream].
  ///
  /// - [inputStream] - the input stream to invoke the [Runnable] on.
  /// - [options] - the options to use when invoking the [Runnable].
  @protected
  Stream<RunOutput> streamFromInputStream(
    final Stream<RunInput> inputStream, {
    final CallOptions? options,
  }) {
    // By default, it just emits the result of calling invoke
    // Subclasses should override this method if they support streaming output
    return inputStream.asyncMap(
      // ignore: discarded_futures
      (final input) => invoke(input, options: options),
    );
  }

  /// Pipes the output of this [Runnable] into another [Runnable].
  ///
  /// - [next] - the [Runnable] to pipe the output into.
  RunnableSequence<RunInput, NewRunOutput> pipe<NewRunOutput extends Object?,
      NewCallOptions extends BaseLangChainOptions>(
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
    final CallOptions? options,
  ) {
    return RunnableBinding<RunInput, CallOptions, RunOutput>(
      bound: this,
      options: options,
    );
  }
}
