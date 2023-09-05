import '../models/models.dart';

/// {@template embeddings}
/// Interface for embedding models.
/// {@endtemplate}
abstract interface class Embeddings {
  /// {@macro embeddings}
  const Embeddings();

  /// Embed search docs.
  Future<List<List<double>>> embedDocuments(final List<Document> documents);

  /// Embed query text.
  Future<List<double>> embedQuery(final String query);
}
