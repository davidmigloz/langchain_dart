import '../../langchain.dart';
import 'models/models.dart';

/// {@template base_memory}
/// Base interface for memory in chains.
/// {@endtemplate}
abstract interface class BaseMemory {
  /// {@macro base_memory}
  const BaseMemory();

  /// Input keys this memory class will load dynamically.
  List<String> get memoryKeys;

  /// Returns key-value pairs given the [MemoryInputValues].
  /// If empty, returns all memories.
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]);

  /// Save the context of this model run to memory.
  Future<void> saveContext(
    final MemoryInputValues inputValues,
    final MemoryOutputValues outputValues,
  );

  /// Clear memory contents.
  Future<void> clear();
}

/// This function is used by memory classes to select the input value
/// to use for the memory. If there is only one input value, it is used.
/// If there are multiple input values, the inputKey must be specified.
dynamic getMemoryValue(
  final MemoryInputValues values, [
  final String? key,
]) {
  if (key != null) {
    return values[key];
  }
  if (values.length == 1) {
    return values.values.first;
  }
  throw LangChainException(
    message: 'Input values have ${values.length} keys, you must specify an '
        'input key or pass only 1 key as input',
  );
}
