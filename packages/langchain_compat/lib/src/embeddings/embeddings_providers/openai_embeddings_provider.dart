import 'package:logging/logging.dart';

import '../../chat/chat_providers/chat_provider.dart';
import '../../chat/chat_providers/model_chat_kind.dart';
import '../../chat/chat_providers/model_info.dart';
import '../embeddings_model.dart';
import '../embeddings_models/openai_embeddings/openai_embeddings_model.dart';
import '../embeddings_models/openai_embeddings/openai_embeddings_model_options.dart';
import 'embeddings_provider.dart';

/// OpenAI embeddings provider.
class OpenAIEmbeddingsProvider
    extends EmbeddingsProvider<OpenAIEmbeddingsModelOptions> {
  /// Creates a new OpenAI embeddings provider.
  const OpenAIEmbeddingsProvider()
    : super(name: 'openai', displayName: 'OpenAI');

  static final _logger = Logger('dartantic.embeddings.providers.openai');

  @override
  EmbeddingsModel<OpenAIEmbeddingsModelOptions> createModel({
    String? name,
    int? dimensions,
    int? batchSize,
    OpenAIEmbeddingsModelOptions? options,
  }) {
    final modelName = name ?? OpenAIEmbeddingsModel.defaultName;
    final modelDimensions = dimensions ?? options?.dimensions;
    final modelBatchSize = batchSize ?? options?.batchSize ?? 512;

    _logger.info(
      'Creating OpenAI embeddings model: $modelName '
      '(dimensions: $modelDimensions, batchSize: $modelBatchSize)',
    );

    return OpenAIEmbeddingsModel(
      name: modelName,
      dimensions: modelDimensions,
      batchSize: modelBatchSize,
      user: options?.user,
    );
  }

  @override
  Stream<ModelInfo> listModels() async* {
    _logger.fine('Fetching OpenAI embedding models from chat provider');

    // Use the OpenAI chat provider's listModels and filter for embeddings
    var modelCount = 0;
    await for (final model in ChatProvider.openai.listModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    )) {
      modelCount++;
      _logger.fine('Found embedding model: ${model.name}');
      yield model;
    }

    _logger.info('Retrieved $modelCount OpenAI embedding models');
  }
}
