import '../../chat/chat_providers/model_chat_kind.dart';
import '../../chat/chat_providers/model_info.dart';
import '../embeddings_model.dart';
import '../embeddings_models/cohere_embeddings/cohere_embeddings_model.dart';
import '../embeddings_models/cohere_embeddings/cohere_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Cohere embeddings provider.
class CohereEmbeddingsProvider
    extends EmbeddingsProvider<CohereEmbeddingsModelOptions> {
  /// Creates a new Cohere embeddings provider.
  const CohereEmbeddingsProvider()
    : super(name: 'cohere', displayName: 'Cohere');

  @override
  EmbeddingsModel<CohereEmbeddingsModelOptions> createModel({
    String? name,
    CohereEmbeddingsModelOptions? options,
  }) => CohereEmbeddingsModel(
    name: name,
    dimensions: options?.dimensions,
    batchSize: options?.batchSize,
    inputType: options?.inputType,
    embeddingTypes: options?.embeddingTypes,
    truncate: options?.truncate,
  );

  @override
  Stream<ModelInfo> listModels() async* {
    // Use the Cohere chat provider's listModels and filter for embeddings
    yield* EmbeddingsProvider.cohere.listModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
