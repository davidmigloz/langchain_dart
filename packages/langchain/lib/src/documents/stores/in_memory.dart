import '../../utils/exception.dart';
import '../models/models.dart';
import 'base.dart';

/// {@template in_memory_doc_store}
/// Simple in memory [DocStore] in the form of a map.
/// {@endtemplate}
class InMemoryDocStore implements DocStore {
  /// {@macro in_memory_doc_store}
  InMemoryDocStore({
    final Map<String, Document>? initialDocuments,
  }) : _documents = {...?initialDocuments};

  final Map<String, Document> _documents;

  @override
  Future<Document> search(final String query) async {
    final doc = _documents[query];
    if (doc == null) {
      throw LangChainException(message: 'Document  with id=$query not found');
    }
    return doc;
  }

  @override
  Future<void> add(final Map<String, Document> documents) async {
    _documents.addAll(documents);
  }

  @override
  Future<void> delete(final List<String> ids) async {
    ids.forEach(_documents.remove);
  }
}
