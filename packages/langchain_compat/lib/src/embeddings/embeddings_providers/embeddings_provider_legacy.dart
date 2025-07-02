import '../embeddings_result.dart';

/// Interface for embeddings providers.
abstract interface class EmbeddingsProvider {
  /// The display name of the embeddings provider.
  String get displayName;

  /// Embed texts and return results with usage data.
  Future<BatchEmbeddingsResult> embedDocuments(List<String> texts);

  /// Embed query text and return result with usage data.
  Future<EmbeddingsResult> embedQuery(String query);

  /// Legacy method: Embed texts returning raw vectors (deprecated).
  /// Use [embedDocuments] for usage tracking.
  @Deprecated('Use embedDocuments() for usage tracking')
  Future<List<List<double>>> embedDocumentsRaw(List<String> texts);

  /// Legacy method: Embed query returning raw vector (deprecated).
  /// Use [embedQuery] for usage tracking.
  @Deprecated('Use embedQuery() for usage tracking')
  Future<List<double>> embedQueryRaw(String query);
}
