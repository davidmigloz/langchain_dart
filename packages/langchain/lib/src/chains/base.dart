import 'package:meta/meta.dart';

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
///   string. This method can only be used for a subset of chains and cannot
///   return as rich of an output as [call].
/// {@endtemplate}
abstract class BaseChain {
  /// {@macro base_chain}
  const BaseChain({
    this.memory,
  });

  /// Memory to use for this chain.
  final BaseMemory? memory;

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
        message: '`run` only supports one key output key. Got $outputKeys',
      );
    }
    return outputKeys.first;
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
    Map<String, dynamic> chainValues;

    final inputKeys =
        this.inputKeys.difference(this.memory?.memoryKeys ?? const {});

    if (inputKeys.isEmpty) {
      chainValues = const {};
    } else if (_isValidInputMap(inputKeys, input)) {
      final inputMap = input as ChainValues;
      if (!returnOnlyOutputs && _hasDuplicatedInputOutputKeys(inputMap)) {
        throw ArgumentError(
          'The same key cannot be used for both input and output key.',
        );
      }
      chainValues = {...inputMap};
    } else if (inputKeys.length == 1) {
      chainValues = {inputKeys.first: input};
    } else {
      throw ArgumentError(
        'This chain ($chainType) requires ${inputKeys.length} input values.',
      );
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

    if (returnOnlyOutputs) {
      return outputValues;
    }

    return {...chainValues, ...outputValues};
  }

  bool _hasDuplicatedInputOutputKeys(final ChainValues values) {
    final inputKeysSet = values.keys.toSet();
    final outputKeysSet = outputKeys.toSet();

    final intersection = inputKeysSet.intersection(outputKeysSet);
    return intersection.isNotEmpty;
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
  /// can only be used for chains that return a single output. If a Chain has
  /// more outputs, or you want to return the inputs/run info along with the
  /// outputs, use [call].
  ///
  /// Returns the chain output.
  ///
  /// The input can be:
  /// - A single value, if the chain has a single input key.
  ///   Eg: `chain.run('Hello world!')`
  /// - A map of key->values, if the chain has multiple input keys.
  ///   Eg: `chain.run({'foo': 'Hello', 'bar': 'world!'})`
  Future<String> run(final dynamic input) async {
    final outputKey = runOutputKey;
    final returnValues = await call(input, returnOnlyOutputs: true);
    return returnValues[outputKey];
  }

  bool _isValidInputMap(final Set<String> inputKeys, final dynamic input) {
    if (input is! Map) {
      return false;
    }

    final inputMap = input as Map<String, dynamic>;
    final inputKeysSet = inputMap.keys.toSet();
    final inputKeysSetLength = inputKeysSet.length;

    if (inputKeysSetLength < inputKeys.length) {
      return false;
    }

    final inputKeysDiff = inputKeys.difference(inputKeysSet);
    if (inputKeysDiff.isNotEmpty) {
      return false;
    }

    return true;
  }
}
