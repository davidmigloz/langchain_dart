import 'package:meta/meta.dart';

import '../core/core.dart';
import '../memory/base.dart';
import '../utils/utils.dart';
import 'models/models.dart';

/// {@template base_chain}
/// Base class for creating structured sequences of calls to components.
///
/// Chains should be used to encode a sequence of calls to components like
/// models, document retrievers, other chains, etc., and provide a simple
/// interface to this sequence.
///
/// The [BaseChain] interface makes it easy to create apps that are:
/// - Stateful: add Memory to any Chain to give it state.
/// - Observable: pass Callbacks to a Chain to execute additional functionality,
///   like logging, outside the main sequence of component calls.
/// - Composable: the Chain API is flexible enough that it is easy to combine
///   Chains with other components, including other Chains.
///
/// The main methods exposed by chains are:
///
/// - [call] Chains are callable. The [call] method is the primary way to
///   execute a Chain. This takes inputs as a dictionary and returns a
///   dictionary output.
/// - [run] A convenience method that takes inputs and returns the output as a
///   string. This method can only be used if the Chain has a single string
///   output.
/// {@endtemplate}
abstract class BaseChain<MemoryType extends BaseMemory>
    extends BaseLangChain<ChainValues, ChainOptions, ChainValues> {
  /// {@macro base_chain}
  const BaseChain({
    this.memory,
  });

  /// Memory to use for this chain.
  final MemoryType? memory;

  /// Return the string type key uniquely identifying this class of chain.
  String get chainType;

  /// Input keys for this chain.
  Set<String> get inputKeys;

  /// Output keys for this chain.
  Set<String> get outputKeys;

  /// Output key from where the [run] method needs to take the return value.
  String get runOutputKey {
    if (outputKeys.length != 1) {
      throw LangChainException(
        message: '`chain.run` method can only be used with chains that return '
            'a single string output. $chainType chain returns '
            '${outputKeys.length} output: $outputKeys. '
            'Use `chain.call` method instead.',
      );
    }
    return outputKeys.first;
  }

  /// Default input key for the input of the chain.
  static const String defaultInputKey = 'input';

  /// Default output key for the output of the chain.
  static const defaultOutputKey = 'output';

  /// Runs the core logic of this chain with the given input.
  ///
  /// - [input] is the input to this chain.
  /// - [options] not used.
  @override
  Future<ChainValues> invoke(
    final ChainValues input, {
    final ChainOptions? options,
  }) {
    return call(input);
  }

  /// Runs the core logic of this chain with the given values.
  /// If [memory] is not null, it will be used to load and save values.
  ///
  /// - [inputs] are the inputs to this chain. Assumed to contain all inputs
  /// specified in [inputKeys], including any inputs added by [memory].
  /// - [returnOnlyOutputs] if true the chain will only return the outputs of
  /// this chain. If false, the chain will return all inputs and outputs.
  ///
  /// Returns a dictionary of outputs. It should contain all outputs specified
  /// in [outputKeys].
  Future<ChainValues> call(
    final dynamic input, {
    final bool returnOnlyOutputs = false,
  }) async {
    ChainValues chainValues;

    if (input is Map) {
      chainValues = input.cast();
    } else {
      chainValues = {inputKeys.firstOrNull ?? defaultInputKey: input};
    }

    if (inputKeys.isNotEmpty) {
      if (chainValues.length < inputKeys.length) {
        throw ArgumentError(
          'This chain ($chainType) requires ${inputKeys.length} input values '
          'but only ${chainValues.length} were provided.',
        );
      }
      final chainValuesKeys = chainValues.keys.toSet();
      final inputKeysDiff = inputKeys.difference(chainValuesKeys);
      if (inputKeysDiff.isNotEmpty) {
        throw ArgumentError(
          'This chain ($chainType) also requires $inputKeysDiff input values.',
        );
      }
    }

    final memory = this.memory;
    if (memory != null) {
      final newValues = await memory.loadMemoryVariables(chainValues);
      chainValues.addAll(newValues);
    }

    final outputValues = await callInternal(chainValues);

    if (memory != null) {
      await memory.saveContext(
        inputValues: chainValues,
        outputValues: outputValues,
      );
    }

    if (outputKeys.isNotEmpty) {
      if (outputValues.length < outputKeys.length) {
        throw ArgumentError(
          'This chain ($chainType) expects ${outputKeys.length} output values '
          'but only ${outputValues.length} were returned.',
        );
      }
      final outputValuesKeys = outputValues.keys.toSet();
      final outputKeysDiff = outputKeys.difference(outputValuesKeys);
      if (outputKeysDiff.isNotEmpty) {
        throw ArgumentError(
          'This chain ($chainType) also expects $outputKeysDiff output values.',
        );
      }
    }

    if (returnOnlyOutputs) {
      return outputValues;
    }

    return {...chainValues, ...outputValues};
  }

  /// Call method to be implemented by subclasses (called by [call]).
  /// This is where the core logic of the chain should be implemented.
  @protected
  Future<ChainValues> callInternal(final ChainValues inputs);

  /// Call the chain on all inputs in the list.
  Future<List<ChainValues>> apply(final List<ChainValues> inputs) async {
    return Future.wait(inputs.map(call));
  }

  /// Convenience method for executing chain when there's a single string
  /// output.
  ///
  /// The main difference between this method and [call] is that this method
  /// can only be used for chains that return a single string output. If a
  /// Chain has more outputs, the output is not a string, or you want to return
  /// the inputs/run info along with the outputs, use [call].
  ///
  /// If [run] is called on a chain that does not return a string,
  /// [Object.toString] will be called on the output.
  ///
  /// The input can be:
  /// - A single value, if the chain has a single input key.
  ///   Eg: `chain.run('Hello world!')`
  /// - A map of key->values, if the chain has multiple input keys.
  ///   Eg: `chain.run({'foo': 'Hello', 'bar': 'world!'})`
  Future<String> run(final dynamic input) async {
    final outputKey = runOutputKey;
    final returnValues = await call(input, returnOnlyOutputs: true);
    return returnValues[outputKey].toString();
  }
}
