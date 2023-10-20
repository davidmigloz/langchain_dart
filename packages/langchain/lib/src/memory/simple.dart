import 'base.dart';
import 'models/models.dart';

/// {@template simple_memory}
/// Simple memory for storing context or other bits of information that
/// shouldn't ever change between prompts.
/// {@endtemplate}
final class SimpleMemory implements BaseMemory {
  /// {@macro simple_memory}
  const SimpleMemory({
    this.memories = const {},
  });

  /// The memories to store.
  final Map<String, dynamic> memories;

  @override
  Set<String> get memoryKeys => memories.keys.toSet();

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    return memories;
  }

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    // Nothing should be saved or changed, my memory is set in stone
  }

  @override
  Future<void> clear() async {
    // Nothing to clear, got a memory like a vault
  }
}
