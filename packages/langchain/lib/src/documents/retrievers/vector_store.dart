import '../models/models.dart';
import '../vector_stores/vector_stores.dart';
import 'base.dart';

/// {@template vector_store_retriever}
/// A retriever that uses a vector store to retrieve documents.
/// {@endtemplate}
class VectorStoreRetriever<V extends VectorStore> implements BaseRetriever {
  /// {@macro vector_store_retriever}
  const VectorStoreRetriever({
    required this.vectorStore,
    this.searchType = const VectorStoreSimilaritySearch(),
  });

  /// The vector store to retrieve documents from.
  final V vectorStore;

  /// The type of search to perform.
  final VectorStoreSearchType searchType;

  @override
  Future<List<Document>> getRelevantDocuments(final String query) {
    return vectorStore.search(query: query, searchType: searchType);
  }
}
