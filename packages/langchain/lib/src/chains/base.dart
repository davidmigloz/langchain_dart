import 'package:meta/meta.dart';

import '../memory/base.dart';
import '../utils/utils.dart';
import 'models/models.dart';

/// {@template base_chain}
/// Base class that defines a chain.
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

  /// Call method to be implemented by subclasses.
  /// This is where the core logic of the chain should be implemented.
  @protected
  Future<ChainValues> callInternal(final ChainValues inputs);

  /// Call the chain on all inputs in the list.
  Future<List<ChainValues>> apply(final List<ChainValues> inputs) async {
    return Future.wait(inputs.map(call));
  }

  /// Runs the chain as input in, output out.
  ///
  /// The input can be:
  /// - A single value, if the chain has a single input key.
  ///   Eg: `chain.run('Hello world!')`
  /// - A map of key->values, if the chain has multiple input keys.
  ///   Eg: `chain.run({'foo': 'Hello', 'bar': 'world!'})`
  Future<dynamic> run(final dynamic input) async {
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

    if (inputKeysSetLength != inputKeys.length) {
      return false;
    }

    final inputKeysSetDiff = inputKeysSet.difference(inputKeys);
    if (inputKeysSetDiff.isNotEmpty) {
      return false;
    }

    return true;
  }
}
