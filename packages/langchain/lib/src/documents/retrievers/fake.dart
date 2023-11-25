import '../models/models.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template fake_retriever}
/// A retriever that returns a fixed list of documents.
/// This class is meant for testing purposes only.
/// {@endtemplate}
class FakeRetriever extends Retriever<RetrieverOptions> {
  /// {@macro fake_retriever}
  const FakeRetriever(this.docs);

  /// The documents to return.
  final List<Document> docs;

  @override
  Future<List<Document>> getRelevantDocuments(
    final String query, {
    final RetrieverOptions? options,
  }) {
    return Future.value(docs);
  }
}
