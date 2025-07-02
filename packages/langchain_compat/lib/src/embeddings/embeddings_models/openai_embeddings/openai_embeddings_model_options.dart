import '../../embeddings_model_options.dart';

/// OpenAI-specific embeddings model options.
class OpenAIEmbeddingsModelOptions extends EmbeddingsModelOptions {
  /// Creates OpenAI embeddings model options.
  const OpenAIEmbeddingsModelOptions({
    super.dimensions,
    super.batchSize = 512,
    this.user,
  });

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  final String? user;
}
