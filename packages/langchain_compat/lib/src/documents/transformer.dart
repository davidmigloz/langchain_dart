import '../langchain/types.dart';
import '../runnables/runnable.dart';
import 'document.dart';

/// {@template base_document_transformer}
/// Base interface for transforming documents.
/// {@endtemplate}
abstract class BaseDocumentTransformer
    extends Runnable<List<Document>, BaseLangChainOptions, List<Document>> {
  /// {@macro base_document_transformer}
  const BaseDocumentTransformer()
    : super(defaultOptions: const BaseLangChainOptions());

  /// Transform a list of documents.
  ///
  /// - [input] - The documents to transform.
  /// - [options] - Not used.
  @override
  Future<List<Document>> invoke(
    List<Document> input, {
    BaseLangChainOptions? options,
  }) => transformDocuments(input);

  /// Transform a list of documents.
  Future<List<Document>> transformDocuments(List<Document> documents);
}
