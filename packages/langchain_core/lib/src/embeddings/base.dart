import '../documents/document.dart';
import '../language_models/types.dart';

/// {@template embeddings}
/// Interface for embedding models.
/// {@endtemplate}
abstract class Embeddings {
  /// {@macro embeddings}
  const Embeddings();

  /// Embed search docs.
  Future<List<List<double>>> embedDocuments(final List<Document> documents);

  /// Embed query text.
  Future<List<double>> embedQuery(final String query);

  /// Returns a list of available embedding models from this provider.
  ///
  /// This method allows you to programmatically discover which embedding
  /// models are available from the provider. The returned list contains
  /// [ModelInfo] objects with metadata about each model.
  ///
  /// By default, this returns an empty list. Providers that support
  /// model listing will override this method to return the actual
  /// available models.
  ///
  /// Example:
  /// ```dart
  /// final embeddings = OpenAIEmbeddings(apiKey: '...');
  /// final models = await embeddings.listModels();
  /// for (final model in models) {
  ///   print('${model.id} - ${model.displayName ?? ""}');
  /// }
  /// ```
  ///
  /// Note: Not all providers support model listing. For providers that
  /// don't support this feature, this method returns an empty list.
  Future<List<ModelInfo>> listModels() async => [];
}
