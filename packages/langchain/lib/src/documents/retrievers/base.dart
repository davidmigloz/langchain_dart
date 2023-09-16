import '../../core/core.dart';
import '../models/models.dart';

/// {@template base_retriever}
/// Base Index class. All indexes should extend this class.
/// {@endtemplate}
abstract class BaseRetriever
    extends Runnable<String, BaseLangChainOptions, List<Document>> {
  /// {@macro base_retriever}
  const BaseRetriever();

  /// Get the most relevant documents for a given query.
  ///
  /// - [input] - The query to search for.
  @override
  Future<List<Document>> invoke(
    final String input, {
    final BaseLangChainOptions? options,
  }) {
    return getRelevantDocuments(input);
  }

  /// Get the most relevant documents for a given query.
  ///
  /// - [query] - The query to search for.
  Future<List<Document>> getRelevantDocuments(final String query);
}
