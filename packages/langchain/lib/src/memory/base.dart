import 'models/models.dart';

abstract class BaseMemory {
  List<String> get memoryKeys;

  Future<MemoryVariables> loadMemoryVariables(
    final InputValues values,
  );

  Future<void> saveContext(
    final InputValues inputValues,
    final OutputValues outputValues,
  );
}
