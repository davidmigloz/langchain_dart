import '../documents/document.dart';
import '../vector_stores/base.dart';
import 'base.dart';
import 'types.dart';

/// {@template vector_store_retriever}
/// A retriever that uses a vector store to retrieve documents.
/// {@endtemplate}
class VectorStoreRetriever<V extends VectorStore>
    extends Retriever<VectorStoreRetrieverOptions> {
  /// {@macro vector_store_retriever}
  const VectorStoreRetriever({
    required this.vectorStore,
    super.defaultOptions = const VectorStoreRetrieverOptions(),
  });

  /// The vector store to retrieve documents from.
  final V vectorStore;

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
