import '../models/models.dart';
import '../transformers/text_splitter.dart';

/// @{template base_document_loader}
/// Interface for loading documents.
///
/// Implementations should implement the lazy-loading method using Streams
/// to avoid loading all documents into memory at once.
///
/// The [load] method should be just `lazyLoad().toList()`.
/// @{endtemplate}
abstract class BaseDocumentLoader {
  /// @{macro base_document_loader}
  const BaseDocumentLoader();

  /// Loads documents lazily.
  Stream<Document> lazyLoad();

  /// Loads a list of documents.
  /// This method is not ideal for large datasets, use [lazyLoad] instead.
  Future<List<Document>> load() {
    return lazyLoad().toList();
  }

  /// Load documents and split into chunks.
  /// This method is not ideal for large datasets, use [lazyLoad] instead.
  Future<List<Document>> loadAndSplit({
    final TextSplitter splitter = const CharacterTextSplitter(),
  }) async {
    final docs = await lazyLoad().toList();
    return splitter.splitDocuments(docs);
  }
}
