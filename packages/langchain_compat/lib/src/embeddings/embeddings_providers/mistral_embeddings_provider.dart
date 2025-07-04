import '../../chat/chat_providers/chat_provider.dart';
import '../../chat/chat_providers/model_chat_kind.dart';
import '../../chat/chat_providers/model_info.dart';
import '../embeddings_model.dart';
import '../embeddings_models/mistral_embeddings/mistral_embeddings_model.dart';
import '../embeddings_models/mistral_embeddings/mistral_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Mistral AI embeddings provider.
class MistralEmbeddingsProvider
    extends EmbeddingsProvider<MistralEmbeddingsModelOptions> {
  /// Creates a new Mistral AI embeddings provider.
  const MistralEmbeddingsProvider()
    : super(name: 'mistral', displayName: 'Mistral AI');

  @override
  EmbeddingsModel<MistralEmbeddingsModelOptions> createModel({
    String? name,
    MistralEmbeddingsModelOptions? options,
  }) => MistralEmbeddingsModel(
    name: name,
    dimensions: options?.dimensions,
    batchSize: options?.batchSize,
    encodingFormat: options?.encodingFormat,
  );

  @override
  Stream<ModelInfo> listModels() async* {
    // Use the Mistral chat provider's listModels and filter for embeddings
    yield* ChatProvider.mistral.getModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
