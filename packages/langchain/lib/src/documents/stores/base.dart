import '../models/models.dart';

/// {@template doc_store}
/// Interface to access to place that stores documents.
/// {@endtemplate}
abstract interface class DocStore {
  /// {@macro doc_store}
  const DocStore();

  /// Search for document.
  Future<Document> search(final String query);

  /// Adds documents.
  Future<void> add(final Map<String, Document> documents);

  /// Deletes documents by id.
  Future<void> delete(final List<String> ids);
}
