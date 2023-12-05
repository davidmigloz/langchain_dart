import '../../core/core.dart';
import '../models/models.dart';
import 'models/models.dart';

/// {@template base_retriever}
/// Base Index class. All indexes should extend this class.
/// {@endtemplate}
abstract class Retriever<Options extends RetrieverOptions>
    extends Runnable<String, Options, List<Document>> {
  /// {@macro base_retriever}
  const Retriever();

  /// Get the most relevant documents for a given query.
  ///
  /// - [input] - The query to search for.
  /// - [options] - Retrieval options.
  @override
  Future<List<Document>> invoke(
    final String input, {
    final Options? options,
  }) {
    return getRelevantDocuments(input, options: options);
  }

  /// Get the most relevant documents for a given query.
  ///
  /// - [query] - The query to search for.
  /// - [options] - Retrieval options.
  Future<List<Document>> getRelevantDocuments(
    final String query, {
    final Options? options,
  });
}
