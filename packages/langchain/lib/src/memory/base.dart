import 'models/models.dart';

/// {@template base_memory}
/// Memory base class.
/// {@endtemplate}
abstract class BaseMemory {
  /// {@macro base_memory}
  const BaseMemory();

  List<String> get memoryKeys;

  Future<MemoryVariables> loadMemoryVariables(
    final InputValues values,
  );

  Future<void> saveContext(
    final InputValues inputValues,
    final OutputValues outputValues,
  );
}
