import 'package:logging/logging.dart';

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

  static final _logger = Logger('dartantic.embeddings.providers.google');

  @override
  EmbeddingsModel<GoogleEmbeddingsModelOptions> createModel({
    String? name,
    GoogleEmbeddingsModelOptions? options,
  }) {
    final modelName = name ?? GoogleEmbeddingsModel.defaultName;
    final modelDimensions = options?.dimensions;
    final modelBatchSize = options?.batchSize ?? 100;

    _logger.info(
      'Creating Google embeddings model: $modelName '
      '(dimensions: $modelDimensions, batchSize: $modelBatchSize)',
    );

    return GoogleEmbeddingsModel(
      name: modelName,
      dimensions: modelDimensions,
      batchSize: modelBatchSize,
    );
  }

  @override
  Stream<ModelInfo> listModels() async* {
    _logger.fine('Fetching Google embedding models from chat provider');

    // Use the Google chat provider's listModels and filter for embeddings
    var modelCount = 0;
    await for (final model in ChatProvider.google.listModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    )) {
      modelCount++;
      _logger.fine('Found embedding model: ${model.name}');
      yield model;
    }

    _logger.info('Retrieved $modelCount Google embedding models');
  }
}
