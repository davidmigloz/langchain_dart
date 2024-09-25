import 'dart:convert';

import 'package:langchain_core/documents.dart';
import 'package:langchain_core/vector_stores.dart';
import 'package:objectbox/objectbox.dart'
    show
        Box,
        Condition,
        ObjectWithScore,
        QueryHnswProperty,
        QueryStringProperty;
import 'package:uuid/uuid.dart';

/// {@template base_object_box_vector_store}
/// Base class for ObjectBox vector store.
///
/// The [ObjectBoxVectorStore] class is a pre-configured version of this class,
/// but it can only be used if you don't use ObjectBox for anything else.
///
/// If you need more control over the ObjectBox store, use this class instead.
/// For example, if you are using ObjectBox to store other entities, or if you
/// need to customize the Document entity class.
///
/// Here is an example of how to use this class:
///
/// First, you can define our own Document entity class instead of using the
/// one provided by the [ObjectBoxVectorStore]. In this way, you can customize
/// the entity to your needs. You will need to define the mapping logic between
/// the entity and the LangChain [Document] model.
///
/// ```dart
/// @Entity()
/// class MyDocumentEntity {
///   MyDocumentEntity({
///     required this.id,
///     required this.content,
///     required this.metadata,
///     required this.embedding,
///   });
///
///   @Id()
///   int internalId = 0;
///
///   @Unique(onConflict: ConflictStrategy.replace)
///   String id;
///
///   String content;
///
///   String metadata;
///
///   @HnswIndex(
///     dimensions: 768,
///     distanceType: VectorDistanceType.cosine,
///   )
///   @Property(type: PropertyType.floatVector)
///   List<double> embedding;
///
///   factory MyDocumentEntity.fromModel(
///     Document doc, List<double> embedding,
///   ) => MyDocumentEntity(
///         id: doc.id ?? '',
///         content: doc.pageContent,
///         metadata: jsonEncode(doc.metadata),
///         embedding: embedding,
///       );
///
///   Document toModel() => Document(
///         id: id,
///         pageContent: content,
///         metadata: jsonDecode(metadata),
///       );
/// }
/// ```
///
/// After defining the entity class, you will need to run the ObjectBox
/// generator:
///
/// ```sh
/// dart run build_runner build --delete-conflicting-outputs
/// ```
///
/// Then, you just need to create your custom vector store class that
/// extends [BaseObjectBoxVectorStore] and wire everything up:
///
/// ```dart
/// class MyCustomVectorStore extends BaseObjectBoxVectorStore<MyDocumentEntity> {
///   MyCustomVectorStore({
///     required super.embeddings,
///     required Store store,
///   }) : super(
///           box: store.box<MyDocumentEntity>(),
///           createEntity: (
///             String id,
///             String content,
///             String metadata,
///             List<double> embedding,
///           ) =>
///               MyDocumentEntity(
///             id: id,
///             content: content,
///             metadata: metadata,
///             embedding: embedding,
///           ),
///           createDocument: (MyDocumentEntity docDto) => docDto.toModel(),
///           getIdProperty: () => MyDocumentEntity_.id,
///           getEmbeddingProperty: () => MyDocumentEntity_.embedding,
///         );
/// }
/// ```
///
/// Now you can use the [MyCustomVectorStore] class to store and search documents.
/// {@endtemplate}
class BaseObjectBoxVectorStore<T> extends VectorStore {
  /// {@macro base_object_box_vector_store}
  BaseObjectBoxVectorStore({
    required super.embeddings,
    required final Box<T> box,
    required final T Function(
      String id,
      String content,
      String metadata,
      List<double> embedding,
    ) createEntity,
    required final Document Function(T) createDocument,
    required final QueryStringProperty<T> Function() getIdProperty,
    required final QueryHnswProperty<T> Function() getEmbeddingProperty,
  })  : _box = box,
        _createEntity = createEntity,
        _createDocument = createDocument,
        _getIdProperty = getIdProperty,
        _getEmbeddingProperty = getEmbeddingProperty;

  /// The [Box] to store the entities in.
  final Box<T> _box;

  /// The function to create an entity [T] from the given data.
  final T Function(
    String id,
    String content,
    String metadata,
    List<double> embedding,
  ) _createEntity;

  /// The function to create a [Document] from the given entity [T].
  final Document Function(T) _createDocument;

  /// A getter for the ID query property.
  final QueryStringProperty<T> Function() _getIdProperty;

  /// A getter for the embedding query property.
  final QueryHnswProperty<T> Function() _getEmbeddingProperty;

  /// UUID generator.
  final Uuid _uuid = const Uuid();

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final List<String> ids = [];
    final List<T> records = [];
    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      final id = doc.id ?? _uuid.v4();
      final entity = _createEntity(
        id,
        doc.pageContent,
        jsonEncode(doc.metadata),
        vectors[i],
      );
      ids.add(id);
      records.add(entity);
    }

    _box.putMany(records);
    return ids;
  }

  @override
  Future<void> delete({required final List<String> ids}) {
    return _box.query(_getIdProperty().oneOf(ids)).build().removeAsync();
  }

  /// Delete by condition.
  ///
  /// - [condition] is the condition to delete by.
  Future<void> deleteWhere(final Condition<T> condition) {
    return _box.query(condition).build().removeAsync();
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    var filter =
        _getEmbeddingProperty().nearestNeighborsF32(embedding, config.k);

    final filterCondition = config.filter?.values.firstOrNull;
    if (filterCondition != null && filterCondition is Condition<T>) {
      filter = filter.and(filterCondition);
    }

    final query = _box.query(filter).build();

    Iterable<ObjectWithScore<T>> results = query.findWithScores();

    if (config.scoreThreshold != null) {
      results = results.where((final r) => r.score >= config.scoreThreshold!);
    }

    return results
        .map((r) => (_createDocument(r.object), r.score))
        .toList(growable: false);
  }
}
