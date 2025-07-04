import '../../chat/chat_providers/chat_provider.dart';
import '../../chat/chat_providers/model_chat_kind.dart';
import '../../chat/chat_providers/model_info.dart';
import '../embeddings_model.dart';
import '../embeddings_models/google_embeddings/google_embeddings_model.dart';
import '../embeddings_models/google_embeddings/google_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Google AI embeddings provider.
class GoogleEmbeddingsProvider
    extends EmbeddingsProvider<GoogleEmbeddingsModelOptions> {
  /// Creates a new Google AI embeddings provider.
  const GoogleEmbeddingsProvider()
    : super(name: 'google', displayName: 'Google AI');

  @override
  EmbeddingsModel<GoogleEmbeddingsModelOptions> createModel({
    String? name,
    GoogleEmbeddingsModelOptions? options,
  }) => GoogleEmbeddingsModel(
    name: name,
    dimensions: options?.dimensions,
    batchSize: options?.batchSize,
  );

  @override
  Stream<ModelInfo> listModels() async* {
    // Use the Google chat provider's listModels and filter for embeddings
    yield* ChatProvider.google.getModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
