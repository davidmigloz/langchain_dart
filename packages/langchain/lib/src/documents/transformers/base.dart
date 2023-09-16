import '../../core/core.dart';
import '../models/models.dart';

/// {@template base_document_transformer}
/// Base interface for transforming documents.
/// {@endtemplate}
abstract class BaseDocumentTransformer
    extends Runnable<List<Document>, BaseLangChainOptions, List<Document>> {
  /// {@macro base_document_transformer}
  const BaseDocumentTransformer();

  /// Transform a list of documents.
  ///
  /// - [input] - The documents to transform.
  /// - [options] - Not used.
  @override
  Future<List<Document>> invoke(
    final List<Document> input, {
    final BaseLangChainOptions? options,
  }) {
    return transformDocuments(input);
  }

  /// Transform a list of documents.
  Future<List<Document>> transformDocuments(final List<Document> documents);
}
