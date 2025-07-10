import 'dart:math';

import '../../chat/chat_providers/model_info.dart';
import '../../provider_caps.dart';
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

  /// The capabilities of this provider.
  Set<ProviderCaps> get caps => ProviderCaps.allEmbeddings;

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

  /// Measures the cosine of the angle between two vectors in a vector space.
  /// It ranges from -1 to 1, where 1 represents identical vectors, 0 represents
  /// orthogonal vectors, and -1 represents vectors that are diametrically
  /// opposed.
  static double cosineSimilarity(List<double> a, List<double> b) {
    double p = 0;
    double p2 = 0;
    double q2 = 0;
    for (var i = 0; i < a.length; i++) {
      p += a[i] * b[i];
      p2 += a[i] * a[i];
      q2 += b[i] * b[i];
    }
    return p / sqrt(p2 * q2);
  }

  /// Calculates the similarity between an embedding and a list of embeddings.
  ///
  /// The similarity is calculated using the provided [similarityFunction].
  /// The default similarity function is [cosineSimilarity].
  static List<double> calculateSimilarity(
    List<double> embedding,
    List<List<double>> embeddings, {
    double Function(List<double> a, List<double> b) similarityFunction =
        cosineSimilarity,
  }) => embeddings
      .map((vector) => similarityFunction(vector, embedding))
      .toList(growable: false);

  /// Returns a sorted list of indexes of [embeddings] that are most similar to
  /// the provided [embedding] (in descending order, most similar first).
  ///
  /// The similarity is calculated using the provided [similarityFunction].
  /// The default similarity function is [cosineSimilarity].
  List<int> getIndexesMostSimilarEmbeddings(
    List<double> embedding,
    List<List<double>> embeddings, {
    double Function(List<double> a, List<double> b) similarityFunction =
        cosineSimilarity,
  }) {
    final similarities = calculateSimilarity(
      embedding,
      embeddings,
      similarityFunction: similarityFunction,
    );
    return List<int>.generate(embeddings.length, (i) => i)
      ..sort((a, b) => similarities[b].compareTo(similarities[a]));
  }
}
