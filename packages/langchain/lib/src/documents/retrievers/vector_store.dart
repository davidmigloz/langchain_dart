import '../models/models.dart';
import '../vector_stores/vector_stores.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template vector_store_retriever}
/// A retriever that uses a vector store to retrieve documents.
/// {@endtemplate}
class VectorStoreRetriever<V extends VectorStore>
    extends Retriever<VectorStoreRetrieverOptions> {
  /// {@macro vector_store_retriever}
  VectorStoreRetriever({
    required this.vectorStore,
    this.defaultOptions = const VectorStoreRetrieverOptions(),
  });

  /// The vector store to retrieve documents from.
  final V vectorStore;

  /// Default options for this retriever.
  VectorStoreRetrieverOptions defaultOptions;

  @override
  Future<List<Document>> getRelevantDocuments(
    final String query, {
    final VectorStoreRetrieverOptions? options,
  }) {
    return vectorStore.search(
      query: query,
      searchType: options?.searchType ?? defaultOptions.searchType,
    );
  }
}
