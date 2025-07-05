import 'package:logging/logging.dart';

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

  static final _logger = Logger('dartantic.embeddings.providers.mistral');

  @override
  EmbeddingsModel<MistralEmbeddingsModelOptions> createModel({
    String? name,
    MistralEmbeddingsModelOptions? options,
  }) {
    final modelName = name ?? MistralEmbeddingsModel.defaultName;
    final modelDimensions = options?.dimensions;
    final modelBatchSize = options?.batchSize ?? 100;

    _logger.info(
      'Creating Mistral embeddings model: $modelName '
      '(dimensions: $modelDimensions, batchSize: $modelBatchSize)',
    );

    return MistralEmbeddingsModel(
      name: modelName,
      dimensions: modelDimensions,
      batchSize: modelBatchSize,
      encodingFormat: options?.encodingFormat,
    );
  }

  @override
  Stream<ModelInfo> listModels() async* {
    _logger.fine('Fetching Mistral embedding models from chat provider');

    // Use the Mistral chat provider's listModels and filter for embeddings
    var modelCount = 0;
    await for (final model in ChatProvider.mistral.getModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    )) {
      modelCount++;
      _logger.fine('Found embedding model: ${model.name}');
      yield model;
    }

    _logger.info('Retrieved $modelCount Mistral embedding models');
  }
}
