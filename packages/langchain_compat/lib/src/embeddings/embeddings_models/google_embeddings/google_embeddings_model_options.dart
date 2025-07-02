import '../../embeddings_model_options.dart';

/// Google AI-specific embeddings model options.
class GoogleEmbeddingsModelOptions extends EmbeddingsModelOptions {
  /// Creates Google AI embeddings model options.
  const GoogleEmbeddingsModelOptions({super.dimensions, super.batchSize = 100});
}
