import '../models/models.dart';

/// {@template base_document_transformer}
/// Base interface for transforming documents.
/// {@endtemplate}
abstract interface class BaseDocumentTransformer {
  /// {@macro base_document_transformer}
  const BaseDocumentTransformer();

  /// Transform a list of documents.
  Future<List<Document>> transformDocuments(final List<Document> documents);
}
