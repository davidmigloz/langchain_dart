import '../../langchain.dart';
import 'utils.dart';

/// {@template vector_store_retriever_memory}
/// Memory backed by a vector store.
/// {@endtemplate}
class VectorStoreMemory implements BaseMemory {
  /// {@macro vector_store_retriever_memory}
  VectorStoreMemory({
    required this.vectorStore,
    this.searchType = const VectorStoreSimilaritySearch(),
    this.memoryKey = defaultMemoryKey,
    this.inputKey,
    this.excludeInputKeys = const {},
    this.returnDocs = false,
  });

  /// VectorStoreRetriever object to connect to.
  final VectorStore vectorStore;

  /// The type of search to perform.
  final VectorStoreSearchType searchType;

  /// Name of the key where the memories are in the map returned by
  /// [loadMemoryVariables].
  final String memoryKey;

  /// The input key to use for the query to the vector store.
  ///
  /// If null, the input key is inferred from the prompt (the input key hat
  /// was filled in by the user (i.e. not a memory key)).
  final String? inputKey;

  /// Input keys to exclude in addition to memory key when constructing the
  /// document.
  final Set<String> excludeInputKeys;

  /// Whether or not to return the result of querying the database directly.
  /// If false, the page content of all the documents is returned as a single
  /// string.
  final bool returnDocs;

  /// Default key for [memoryKey].
  static const String defaultMemoryKey = 'memory';

  @override
  Set<String> get memoryKeys => {memoryKey};

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final promptInputKey = inputKey ?? getPromptInputKey(values, memoryKeys);
    final query = values[promptInputKey];
    final docs = await vectorStore.search(query: query, searchType: searchType);
    return {
      memoryKey: returnDocs
          ? docs
          : docs.map((final doc) => doc.pageContent).join('\n'),
    };
  }

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    final docs = _buildDocuments(inputValues, outputValues);
    await vectorStore.addDocuments(documents: docs);
  }

  /// Builds the documents to save to the vector store from the given
  /// [inputValues] and [outputValues].
  List<Document> _buildDocuments(
    final MemoryInputValues inputValues,
    final MemoryOutputValues outputValues,
  ) {
    final excludeKeys = {memoryKey, ...excludeInputKeys};
    final filteredInputs = {
      for (final entry in inputValues.entries)
        if (!excludeKeys.contains(entry.key)) entry.key: entry.value,
    };
    final inputsOutputs = {...filteredInputs, ...outputValues};
    final pageContent = inputsOutputs.entries.map((final entry) {
      return '${entry.key}: ${entry.value}';
    }).join('\n');
    return [Document(pageContent: pageContent)];
  }

  @override
  Future<void> clear() async {
    // Nothing to clear
  }
}
