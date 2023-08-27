/// Embedding function interface.
///
/// This interface is used to embed text into a vectors. You can create your
/// own implementation using any embedding model you want (e.g. OpenAI, Cohere,
/// PaLM, Instructor, etc.).
abstract interface class EmbeddingFunction {
  /// Generates embeddings for the given texts.
  ///
  /// - [texts] - The texts to embed.
  Future<List<List<double>>> generate(final List<String> texts);
}
