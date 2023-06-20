import '../documents/models/models.dart';

/// {@template base_retriever}
/// Base Index class. All indexes should extend this class.
/// {@endtemplate}
abstract interface class BaseRetriever {
  /// {@macro base_retriever}
  const BaseRetriever();

  /// Get the most relevant documents for a given query.
  ///
  /// - [query] - The query to search for.
  Future<List<Document>> getRelevantDocuments(final String query);
}
