import 'package:logging/logging.dart';

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

  static final _logger = Logger('dartantic.embeddings.providers.cohere');

  @override
  EmbeddingsModel<CohereEmbeddingsModelOptions> createModel({
    String? name,
    CohereEmbeddingsModelOptions? options,
  }) {
    final modelName = name ?? CohereEmbeddingsModel.defaultName;
    final modelDimensions = options?.dimensions;
    final modelBatchSize = options?.batchSize ?? 96;

    _logger.info(
      'Creating Cohere embeddings model: $modelName '
      '(dimensions: $modelDimensions, batchSize: $modelBatchSize)',
    );

    return CohereEmbeddingsModel(
      name: modelName,
      dimensions: modelDimensions,
      batchSize: modelBatchSize,
      inputType: options?.inputType,
      embeddingTypes: options?.embeddingTypes,
      truncate: options?.truncate,
    );
  }

  @override
  Stream<ModelInfo> listModels() async* {
    _logger.fine('Fetching Cohere embedding models');

    // Use the Cohere chat provider's listModels and filter for embeddings
    var modelCount = 0;
    await for (final model in EmbeddingsProvider.cohere.listModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    )) {
      modelCount++;
      _logger.fine('Found embedding model: ${model.name}');
      yield model;
    }

    _logger.info('Retrieved $modelCount Cohere embedding models');
  }
}
