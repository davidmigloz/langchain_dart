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
    this.searchType = VectorStoreSearchType.similarity,
    this.k = 4,
  });

  /// The vector store to retrieve documents from.
  final V vectorStore;

  /// The type of search to perform.
  final VectorStoreSearchType searchType;

  /// The number of documents to return.
  final int k;

  @override
  Future<List<Document>> getRelevantDocuments(final String query) {
    return vectorStore.search(query: query, searchType: searchType, k: k);
  }

  /// Runs more documents through the embeddings and add to the vector store.
  ///
  /// - [documents] is a list of documents to add to the vector store.
  ///
  /// Returns a list of ids from adding the documents into the vector store.
  Future<List<String>> addDocuments(final List<Document> documents) {
    return vectorStore.addDocuments(documents: documents);
  }
}
