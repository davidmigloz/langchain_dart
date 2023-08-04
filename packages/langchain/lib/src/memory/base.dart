import 'models/models.dart';

/// {@template base_memory}
/// Base interface for memory in chains.
///
/// Memory refers to state in Chains. Memory can be used to store information
/// about past executions of a Chain and inject that information into the
/// inputs of future executions of the Chain. For example, for conversational
/// Chains Memory can be used to store conversations and automatically add them
/// to future model prompts so that the model has the necessary context to
/// respond coherently to the latest input.
/// {@endtemplate}
abstract interface class BaseMemory {
  /// {@macro base_memory}
  const BaseMemory();

  /// Default memory key.
  static const String defaultMemoryKey = 'history';

  /// Input keys this memory class will load dynamically to the prompt.
  Set<String> get memoryKeys;

  /// Returns key-value pairs given the [MemoryInputValues].
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
