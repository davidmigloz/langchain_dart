import 'models/models.dart';

/// {@template base_memory}
/// Base interface for memory in chains.
/// {@endtemplate}
abstract interface class BaseMemory {
  /// {@macro base_memory}
  const BaseMemory();

  /// Input keys this memory class will load dynamically to the prompt.
  Set<String> get memoryKeys;

  /// Returns key-value pairs given the [MemoryInputValues].
  /// If empty, returns all memories.
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]);

  /// Save the context of this model run to memory.
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  });

  /// Clear memory contents.
  Future<void> clear();
}
