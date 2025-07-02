/// {@template embeddings}
/// Interface for embedding models.
/// {@endtemplate}
abstract interface class EmbeddingsProvider {
  /// {@macro embeddings}
  const EmbeddingsProvider();

  /// Embed texts.
  Future<List<List<double>>> embedDocuments(List<String> texts);

  /// Embed query text.
  Future<List<double>> embedQuery(String query);
}
