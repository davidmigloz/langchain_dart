import 'embeddings_model_options.dart';
import 'embeddings_result.dart';

/// Embeddings model base class.
abstract class EmbeddingsModel<TOptions extends EmbeddingsModelOptions> {
  /// Creates a new embeddings model instance.
  EmbeddingsModel({
    required this.name,
    required this.defaultOptions,
    this.dimensions,
    this.batchSize,
  });

  /// The default options for the embeddings model.
  final TOptions defaultOptions;

  /// The model name to use.
  final String name;

  /// The number of dimensions the resulting output embeddings should have.
  final int? dimensions;

  /// The maximum number of texts to embed in a single request.
  final int? batchSize;

  /// Embed query text and return result with usage data.
  Future<EmbeddingsResult> embedQuery(String query, {TOptions? options});

  /// Embed texts and return results with usage data.
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    TOptions? options,
  });

  /// Disposes the embeddings model.
  void dispose();
}
