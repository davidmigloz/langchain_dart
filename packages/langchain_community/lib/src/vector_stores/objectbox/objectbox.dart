import 'dart:convert';

import 'package:langchain_core/documents.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:objectbox/objectbox.dart'
    show
        Condition,
        ConflictStrategy,
        Entity,
        HnswIndex,
        Id,
        Property,
        PropertyType,
        Store,
        Unique;

import 'base_objectbox.dart';
import 'objectbox.g.dart' as obxg;
import 'types.dart';

/// Vector store for the [ObjectBox](https://objectbox.io/) on-device database.
///
/// ```dart
/// final embeddings = OllamaEmbeddings(model: 'llama3.2');
/// final vectorStore = ObjectBoxVectorStore(embeddings: embeddings);
/// ```
///
/// This vector stores creates a [Store] with an [ObjectBoxDocument] entity
/// that persists LangChain [Document]s along with their embeddings. If you
/// need more control over the entity or the storeo, you can use the
/// [BaseObjectBoxVectorStore] class instead.
///
/// See documentation for more details:
/// - [LangChain.dart ObjectBox docs](https://langchaindart.com/#/modules/retrieval/vector_stores/integrations/objectbox)
/// - [ObjectBox Vector Search docs](https://docs.objectbox.io/ann-vector-search)
///
/// ### Filtering
///
/// You can use the [ObjectBoxSimilaritySearch] class to pass ObjectBox-specific
/// filtering options.
///
/// [ObjectBoxVectorStore] supports filtering queries by id, content or metadata
/// using ObjectBox's [Condition]. You can define the filter condition in the
/// [ObjectBoxSimilaritySearch] `filterCondition` parameter. Use the
/// [ObjectBoxDocumentProps] class to reference the entity fields to use in the
/// query.
///
/// For example:
/// ```dart
/// final vectorStore = ObjectBoxVectorStore(...);
/// final res = await vectorStore.similaritySearch(
///   query: 'What should I feed my cat?',
///   config: ObjectBoxSimilaritySearch(
///     k: 5,
///     scoreThreshold: 0.8,
///     filterCondition: ObjectBoxDocumentProps.id.equals('my-id')
///         .or(ObjectBoxDocumentProps.metadata.contains('some-text')),
///   ),
/// );
/// ```
class ObjectBoxVectorStore extends BaseObjectBoxVectorStore<ObjectBoxDocument> {
  /// Creates an [ObjectBoxVectorStore] instance.
  ///
  /// Main configuration options:
  /// - [embeddings]  The embeddings model to use.
  /// - [dimensions]  The number of dimensions of the embeddings (vector size).
  ///
  /// ObjectBox-specific options:
  /// - Check the ObjectBox's [Store] documentation for more details on the
  ///   different options.
  ObjectBoxVectorStore._(
    Store store, {
    required super.embeddings,
  })  : _store = store,
        super(
          box: store.box<ObjectBoxDocument>(),
          createEntity: _createObjectBoxDocument,
          createDocument: _createDoc,
          getIdProperty: () => obxg.ObjectBoxDocument_.id,
          getEmbeddingProperty: () => obxg.ObjectBoxDocument_.embedding,
        );

  Store? _store;

  /// The ObjectBox store.
  Store? get store => _store;

  /// Opens the ObjectBox store.
  factory ObjectBoxVectorStore.open({
    required Embeddings embeddings,
    required final int dimensions,
    final String? directory,
    final int? maxDBSizeInKB,
    final int? maxDataSizeInKB,
    final int? fileMode,
    final int? maxReaders,
    final bool queriesCaseSensitiveDefault = true,
    final String? macosApplicationGroup,
  }) {
    final store = obxg.openStore(
      dimensions: dimensions,
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup,
    );

    return ObjectBoxVectorStore._(store, embeddings: embeddings);
  }

  /// Creates an [ObjectBoxDocument] entity.
  static ObjectBoxDocument _createObjectBoxDocument(
    String id,
    String content,
    String metadata,
    List<double> embedding,
  ) =>
      ObjectBoxDocument(0, id, content, metadata, embedding);

  /// Creates a [Document] from an [ObjectBoxDocument] entity.
  static Document _createDoc(ObjectBoxDocument entity) {
    var metadata = const <String, dynamic>{};
    try {
      metadata = jsonDecode(entity.metadata);
    } catch (_) {}
    return Document(
      id: entity.id,
      pageContent: entity.content,
      metadata: metadata,
    );
  }

  /// Closes the ObjectBox store;
  ///
  /// Don't try to call any other methods after the store is closed.
  void close() {
    _store?.close();
    _store = null;
  }
}

/// {@template objectbox_document}
/// The ObjectBox entity representing a LangChain [Document].
/// {@endtemplate}
@Entity()
class ObjectBoxDocument {
  /// {@macro objectbox_document}
  ObjectBoxDocument(
    this.internalId,
    this.id,
    this.content,
    this.metadata,
    this.embedding,
  );

  /// The internal ID used by ObjectBox.
  @Id()
  int internalId = 0;

  /// The ID of the document.
  @Unique(onConflict: ConflictStrategy.replace)
  String id;

  /// The content of the document.
  String content;

  /// The metadata of the document.
  String metadata;

  /// The embedding of the document.
  @HnswIndex(dimensions: 0) // Set dynamically in the ObjectBoxVectorStore
  @Property(type: PropertyType.floatVector)
  List<double> embedding;
}

/// [ObjectBoxDocument] entity fields to define ObjectBox queries.
///
/// Example:
/// ```dart
/// final filterCondition = ObjectBoxDocumentProps.metadata
///     .contains('animal')
///     .or(ObjectBoxDocumentProps.metadata.contains('natural');
/// ```
typedef ObjectBoxDocumentProps = obxg.ObjectBoxDocument_;
