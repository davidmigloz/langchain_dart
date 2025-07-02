import 'dart:io';

import '../../chat/chat_providers/cohere_openai_provider.dart';
import '../../chat/chat_providers/model_info.dart';
import '../../chat/chat_providers/model_kind.dart';
import '../embeddings_model.dart';
import '../embeddings_models/cohere_embeddings/cohere_embeddings_model.dart';
import '../embeddings_models/cohere_embeddings/cohere_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// Cohere embeddings provider.
class CohereEmbeddingsProvider
    extends EmbeddingsProvider<CohereEmbeddingsModelOptions> {
  /// Creates a new Cohere embeddings provider.
  const CohereEmbeddingsProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
    super.aliases,
  });

  @override
  EmbeddingsModel<CohereEmbeddingsModelOptions> createModel({
    String? model,
    int? dimensions,
    int? batchSize,
    CohereEmbeddingsModelOptions? options,
  }) => CohereEmbeddingsModel(
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    model: model ?? defaultModel,
    dimensions: dimensions ?? options?.dimensions,
    batchSize: batchSize ?? options?.batchSize ?? 96,
    inputType: options?.inputType,
    embeddingTypes: options?.embeddingTypes,
    truncate: options?.truncate,
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    // Use the Cohere chat provider's listModels and filter for embeddings
    final cohereChatProvider = CohereOpenAIProvider(
      name: name,
      displayName: displayName,
      defaultModel: defaultModel ?? 'embed-v4.0',
      defaultBaseUrl: 'https://api.cohere.ai/v1', // Use OpenAI compat endpoint
      apiKeyName: apiKeyName,
      isRemote: isRemote,
    );
    
    final allModels = await cohereChatProvider.listModels();
    return allModels.where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
