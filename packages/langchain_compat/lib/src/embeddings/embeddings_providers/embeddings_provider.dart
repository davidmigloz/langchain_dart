import '../../chat/chat_providers/model_info.dart';
import '../embeddings_model.dart';
import '../embeddings_model_options.dart';
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
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.apiKeyName,
    this.aliases = const [],
  });

  /// The canonical provider name (e.g., 'openai', 'google').
  final String name;

  /// Alternative names for lookup.
  final List<String> aliases;

  /// Human-readable name for display.
  final String displayName;

  /// The default model for this provider (null means use model's own default).
  final String? defaultModel;

  /// The default API endpoint for this provider.
  final String defaultBaseUrl;

  /// The environment variable for the API key (if any).
  final String apiKeyName;

  /// Creates an embeddings model instance for this provider.
  EmbeddingsModel<TOptions> createModel({
    String? model,
    int? dimensions,
    int? batchSize,
    TOptions? options,
  });

  /// OpenAI embeddings provider.
  static const openai = OpenAIEmbeddingsProvider(
    name: 'openai',
    displayName: 'OpenAI',
    defaultModel: 'text-embedding-3-small',
    defaultBaseUrl: 'https://api.openai.com/v1',
    apiKeyName: 'OPENAI_API_KEY',
  );

  /// Google AI embeddings provider.
  static const google = GoogleEmbeddingsProvider(
    name: 'google',
    displayName: 'Google AI',
    defaultModel: 'text-embedding-004',
    defaultBaseUrl: 'https://generativelanguage.googleapis.com/v1beta',
    apiKeyName: 'GEMINI_API_KEY',
  );

  /// Mistral AI embeddings provider.
  static const mistral = MistralEmbeddingsProvider(
    name: 'mistral',
    displayName: 'Mistral AI',
    defaultModel: 'mistral-embed',
    defaultBaseUrl: 'https://api.mistral.ai/v1',
    apiKeyName: 'MISTRAL_API_KEY',
  );

  /// Cohere embeddings provider.
  static const cohere = CohereEmbeddingsProvider(
    name: 'cohere',
    displayName: 'Cohere',
    defaultModel: 'embed-v4.0',
    defaultBaseUrl: 'https://api.cohere.ai/v2',
    apiKeyName: 'COHERE_API_KEY',
  );

  /// Returns a list of all available providers.
  static List<EmbeddingsProvider> get all => [openai, google, mistral, cohere];

  /// Looks up a provider by name or alias (case-insensitive).
  static EmbeddingsProvider forName(String name) => all.firstWhere(
    (p) =>
        p.name.toLowerCase() == name.toLowerCase() ||
        p.aliases.any((a) => a.toLowerCase() == name.toLowerCase()),
  );

  /// Returns all available models for this provider.
  Future<Iterable<ModelInfo>> listModels();
}
