/// Interface for embeddings providers.
abstract interface class EmbeddingsProvider {
  /// Embed texts.
  Future<List<List<double>>> embedDocuments(List<String> texts);

  /// Embed query text.
  Future<List<double>> embedQuery(String query);
}
