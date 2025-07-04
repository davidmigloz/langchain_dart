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

  @override
  EmbeddingsModel<OpenAIEmbeddingsModelOptions> createModel({
    String? name,
    int? dimensions,
    int? batchSize,
    OpenAIEmbeddingsModelOptions? options,
  }) => OpenAIEmbeddingsModel(
    dimensions: dimensions ?? options?.dimensions,
    batchSize: batchSize ?? options?.batchSize ?? 512,
    user: options?.user,
  );

  @override
  Stream<ModelInfo> listModels() async* {
    // Use the OpenAI chat provider's listModels and filter for embeddings
    yield* ChatProvider.openai.getModels().where(
      (model) => model.kinds.contains(ModelKind.embedding),
    );
  }
}
