// ignore_for_file: public_member_api_docs, avoid_unused_constructor_parameters
import 'base_objectbox_stub.dart';

// This is a stub class
class ObjectBoxVectorStore extends BaseObjectBoxVectorStore<ObjectBoxDocument> {
  ObjectBoxVectorStore({
    required super.embeddings,
    required int dimensions,
    final String? directory,
    final int? maxDBSizeInKB,
    final int? maxDataSizeInKB,
    final int? fileMode,
    final int? maxReaders,
    final bool queriesCaseSensitiveDefault = true,
    final String? macosApplicationGroup,
  }) : super(
          box: null,
          createEntity: null,
          createDocument: null,
          getIdProperty: null,
          getEmbeddingProperty: null,
        );

  void close() {
    throw UnsupportedError('ObjectBox is not supported on web platform.');
  }
}

// This is a stub class
class ObjectBoxDocument {
  ObjectBoxDocument(
    this.internalId,
    this.id,
    this.content,
    this.metadata,
    this.embedding,
  );

  int internalId = 0;
  String id;
  String content;
  String metadata;
  List<double> embedding;
}

// This is a stub class
class ObjectBoxDocumentProps {
  static const internalId = null;
  static const id = null;
  static const content = null;
  static const metadata = null;
  static const embedding = null;
}
