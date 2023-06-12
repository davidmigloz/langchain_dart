import 'package:meta/meta.dart';

import '../memory/base.dart';
import 'models/models.dart';

/// Base class that defines a chain.
abstract class BaseChain {
  const BaseChain({
    this.memory,
  });

  /// Memory to use for this chain.
  final BaseMemory? memory;

  /// Return the string type key uniquely identifying this class of chain.
  String get chainType;

  /// Input keys for this chain.
  List<String> get inputKeys;

  /// Output keys for this chain.
  List<String> get outputKeys;

  /// Runs the core logic of this chain with the given values.
  /// If [memory] is not null, it will be used to load and save values.
  Future<ChainValues> call(final ChainValues values) async {
    final fullValues = {...values};

    final memory = this.memory;
    if (memory != null) {
      final newValues = await memory.loadMemoryVariables(values);
      fullValues.addAll(newValues);
    }

    final outputValues = await callInternal(fullValues);

    if (memory != null) {
      await memory.saveContext(values, outputValues);
    }

    return outputValues;
  }

  /// Call method to be implemented by subclasses.
  /// This is where the core logic of the chain should be implemented.
  @protected
  Future<ChainValues> callInternal(final ChainValues values);

  /// Call the chain on all inputs in the list.
  Future<List<ChainValues>> apply(final List<ChainValues> inputs) async {
    return Future.wait(inputs.map(call));
  }

  /// Runs the chain as text in, text out.
  Future<String> run(final dynamic input) async {
    final isKeylessInput = inputKeys.length <= 1;
    if (!isKeylessInput) {
      throw ArgumentError(
        'Chain $chainType expects multiple inputs, cannot use `run`',
      );
    }
    final chainValues =
        inputKeys.isNotEmpty ? {inputKeys[0]: input} : <String, dynamic>{};
    final returnValues = await call(chainValues);

    if (returnValues.length == 1) {
      return returnValues.values.first.toString();
    }

    throw Exception(
      'Return values have multiple keys, '
      '`run` only supported when one key currently',
    );
  }
}
