import '../../chat/chat_providers/model_info.dart';
import '../embeddings_models/embeddings_models.dart';
import 'cohere_embeddings_provider.dart';
import 'google_embeddings_provider.dart';
import 'mistral_embeddings_provider.dart';
import 'openai_embeddings_provider.dart';

/// Provides a unified interface for accessing embeddings providers.
/// Follows the same pattern as ChatProvider for consistency.
abstract class EmbeddingsProvider<TOptions extends EmbeddingsModelOptions> {
  /// Creates a new embeddings provider instance.
  const EmbeddingsProvider({
    required this.name,
    required this.displayName,
    this.aliases = const [],
  });

  /// The canonical provider name (e.g., 'openai', 'google').
  final String name;

  /// Alternative names for lookup.
  final List<String> aliases;

  /// Human-readable name for display.
  final String displayName;

  /// Creates an embeddings model instance for this provider.
  EmbeddingsModel<TOptions> createModel({String? name, TOptions? options});

  /// OpenAI embeddings provider.
  static const openai = OpenAIEmbeddingsProvider();

  /// Google AI embeddings provider.
  static const google = GoogleEmbeddingsProvider();

  /// Mistral AI embeddings provider.
  static const mistral = MistralEmbeddingsProvider();

  /// Cohere embeddings provider.
  static const cohere = CohereEmbeddingsProvider();

  /// Returns a list of all available providers.
  static List<EmbeddingsProvider> get all => [openai, google, mistral, cohere];

  /// Looks up a provider by name or alias (case-insensitive).
  static EmbeddingsProvider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );

  /// Returns all available models for this provider.
  Stream<ModelInfo> listModels();
}
