import 'dart:io';

import '../../chat/chat_providers/mistral_provider.dart';
import '../../chat/chat_providers/model_info.dart';
import '../../chat/chat_providers/model_kind.dart';
import '../embeddings_model.dart';
import '../embeddings_models/mistral_embeddings/mistral_embeddings_model.dart';
import '../embeddings_models/mistral_embeddings/mistral_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Mistral AI embeddings provider.
class MistralEmbeddingsProvider
    extends EmbeddingsProvider<MistralEmbeddingsModelOptions> {
  /// Creates a new Mistral AI embeddings provider.
  const MistralEmbeddingsProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    super.aliases,
  });

  @override
  EmbeddingsModel<MistralEmbeddingsModelOptions> createModel({
    String? model,
    int? dimensions,
    int? batchSize,
    MistralEmbeddingsModelOptions? options,
  }) => MistralEmbeddingsModel(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    model: model ?? defaultModel,
    dimensions: dimensions ?? options?.dimensions,
    batchSize: batchSize ?? options?.batchSize ?? 100,
    encodingFormat: options?.encodingFormat,
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    // Use the Mistral chat provider's listModels and filter for embeddings
    final mistralChatProvider = MistralProvider(
      name: name,
      displayName: displayName,
      defaultModel: defaultModel ?? 'mistral-embed',
      defaultBaseUrl: defaultBaseUrl,
      apiKeyName: apiKeyName,
    );
    
    final allModels = await mistralChatProvider.listModels();
    return allModels.where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
