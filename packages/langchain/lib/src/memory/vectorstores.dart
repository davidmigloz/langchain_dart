
import '../../langchain.dart';
import 'utils.dart';

class VectorStoreRetriverMemory implements BaseMemory {
  VectorStoreRetriverMemory({
    required this.vectorStoreRetriever,
    this.inputKey,
    this.outputKey,
    this.memoryKey = 'memory',
    this.returnDocs = false,
  });

  VectorStoreRetriever vectorStoreRetriever;

  String? inputKey;
  String? outputKey;
  String memoryKey;
  bool returnDocs;

  @override
  Future<void> clear() async {
    inputKey = null;
    outputKey = null;
    memoryKey = '';
    returnDocs = false;
  }

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final query = getPromptInputKey(values, memoryKeys);
    final results = await vectorStoreRetriever.getRelevantDocuments(query);
    return {
      memoryKey: returnDocs
          ? results
          : results.map((final e) => e.pageContent).join('\n')
    };
  }

  @override
  Set<String> get memoryKeys => {memoryKey};

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    final List<String> texts = [];

    inputValues.entries
        .where((final element) => element.key != inputKey)
        .toList()
      ..addAll(outputValues.entries.toList())
      ..forEach((final element) {
        texts.add('${element.key}: ${element.value}');
      });

    final String text = texts.join('\n');

    await vectorStoreRetriever.addDocuments([Document(pageContent: text)]);
  }
}
