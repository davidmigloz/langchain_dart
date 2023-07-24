import '../models/models.dart';
import '../transformers/transformers.dart';

/// @{template base_document_loader}
/// Interface for loading documents.
/// @{endtemplate}
abstract class BaseDocumentLoader {
  /// @{macro base_document_loader}
  const BaseDocumentLoader();

  /// Loads documents lazily.
  ///
  /// This is useful for loading large amounts of data, as it allows you to
  /// process each [Document] as it is loaded, rather than waiting for the
  /// entire data set to be loaded in memory.
  Stream<Document> lazyLoad();

  /// Loads a list of documents.
  ///
  /// Under the hood, this method calls [lazyLoad] and collects all the results
  /// into a list. Use this method only with small data sets, as it will load
  /// all the data into memory at once.
  Future<List<Document>> load() {
    return lazyLoad().toList();
  }

  /// Load documents and split into chunks.
  /// This method is not ideal for large datasets, use [lazyLoad] instead.
  Future<List<Document>> loadAndSplit({
    final TextSplitter splitter = const RecursiveCharacterTextSplitter(),
  }) async {
    final docs = await load();
    return splitter.splitDocuments(docs);
  }
}
