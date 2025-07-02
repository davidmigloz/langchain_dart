import '../../chat/chat_providers/google_provider.dart';
import '../../chat/chat_providers/model_info.dart';
import '../../chat/chat_providers/model_kind.dart';
import '../embeddings_model.dart';
import '../embeddings_models/google_embeddings/google_embeddings_model.dart';
import '../embeddings_models/google_embeddings/google_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Google AI embeddings provider.
class GoogleEmbeddingsProvider
    extends EmbeddingsProvider<GoogleEmbeddingsModelOptions> {
  /// Creates a new Google AI embeddings provider.
  const GoogleEmbeddingsProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
    super.aliases,
  });

  @override
  EmbeddingsModel<GoogleEmbeddingsModelOptions> createModel({
    String? model,
    int? dimensions,
    int? batchSize,
    GoogleEmbeddingsModelOptions? options,
  }) => GoogleEmbeddingsModel(
    baseUrl: defaultBaseUrl,
    model: model ?? defaultModel,
    dimensions: dimensions ?? options?.dimensions,
    batchSize: batchSize ?? options?.batchSize ?? 100,
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    // Use the Google chat provider's listModels and filter for embeddings
    final googleChatProvider = GoogleProvider(
      name: name,
      aliases: aliases,
      displayName: displayName,
      defaultModel: defaultModel,
      defaultBaseUrl: defaultBaseUrl,
      apiKeyName: apiKeyName,
      isRemote: isRemote,
    );
    
    final allModels = await googleChatProvider.listModels();
    return allModels.where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
