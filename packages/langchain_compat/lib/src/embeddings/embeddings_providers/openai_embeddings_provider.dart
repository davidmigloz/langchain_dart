import 'dart:io';

import '../../chat/chat_providers/model_info.dart';
import '../../chat/chat_providers/model_kind.dart';
import '../../chat/chat_providers/openai_provider.dart';
import '../embeddings_model.dart';
import '../embeddings_models/openai_embeddings/openai_embeddings_model.dart';
import '../embeddings_models/openai_embeddings/openai_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// OpenAI embeddings provider.
class OpenAIEmbeddingsProvider
    extends EmbeddingsProvider<OpenAIEmbeddingsModelOptions> {
  /// Creates a new OpenAI embeddings provider.
  const OpenAIEmbeddingsProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
    super.aliases,
  });

  @override
  EmbeddingsModel<OpenAIEmbeddingsModelOptions> createModel({
    String? model,
    int? dimensions,
    int? batchSize,
    OpenAIEmbeddingsModelOptions? options,
  }) => OpenAIEmbeddingsModel(
    apiKey: Platform.environment[apiKeyName],
    baseUrl: defaultBaseUrl,
    model: model ?? defaultModel,
    dimensions: dimensions ?? options?.dimensions,
    batchSize: batchSize ?? options?.batchSize ?? 512,
    user: options?.user,
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    // Use the OpenAI chat provider's listModels and filter for embeddings
    final openaiChatProvider = OpenAIProvider(
      name: name,
      displayName: displayName,
      defaultModel: defaultModel,
      defaultBaseUrl: defaultBaseUrl,
      apiKeyName: apiKeyName,
      isRemote: isRemote,
    );
    
    final allModels = await openaiChatProvider.listModels();
    return allModels.where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
