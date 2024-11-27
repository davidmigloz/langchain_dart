// ignore_for_file: public_member_api_docs, avoid_unused_constructor_parameters
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/vector_stores.dart';

// This is a stub class
class BaseObjectBoxVectorStore<T> extends VectorStore {
  BaseObjectBoxVectorStore({
    required super.embeddings,
    required final Object? box,
    required final Object? createEntity,
    required final Object? createDocument,
    required final Object? getIdProperty,
    required final Object? getEmbeddingProperty,
  });

  @override
  Future<List<String>> addVectors({
    required List<List<double>> vectors,
    required List<Document> documents,
  }) {
    throw UnsupportedError('ObjectBox is not supported on web platform.');
  }

  @override
  Future<void> delete({required List<String> ids}) {
    throw UnsupportedError('ObjectBox is not supported on web platform.');
  }

  Future<void> deleteWhere(final Object condition) {
    throw UnsupportedError('ObjectBox is not supported on web platform.');
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required List<double> embedding,
    VectorStoreSimilaritySearch config = const VectorStoreSimilaritySearch(),
  }) {
    throw UnsupportedError('ObjectBox is not supported on web platform.');
  }
}
