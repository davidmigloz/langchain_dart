import 'dart:math';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../embeddings/base.dart';
import '../models/models.dart';
import 'base.dart';
import 'models/models.dart';

/// Vector store that stores vectors in memory.
///
/// By default, it uses cosine similarity to compare vectors.
///
/// It iterates over all vectors in the store to find the most similar vectors.
/// This is not efficient for large vector stores as it has a time complexity
/// of O(vector_dimensionality * num_vectors).
///
/// For more efficient vector stores, see [VertexAIMatchingEngine](https://pub.dev/documentation/langchain_google/latest/langchain_google/VertexAIMatchingEngine-class.html).
///
/// ### Filtering
///
/// You can filter the search space before running the similarity search by
/// providing a [VectorStoreSearchType.filter] that will be matched against the
/// metadata of the documents in the vector store.
///
/// Example:
/// ```dart
/// final vs = MemoryVectorStore(...);
/// final res = await store.similaritySearch(
///   query: 'Test query',
///   config: const VectorStoreSimilaritySearch(
///     filter: {'type': 'foo'},
///   ),
/// );
/// ```
///
/// This query will only consider documents that have a metadata field `type`
/// with value `foo`.
class MemoryVectorStore extends VectorStore {
  /// Main constructor for [MemoryVectorStore].
  ///
  /// - [embeddings] is the embeddings model to use to embed the documents.
  /// - [similarityFunction] is the similarity function to use when comparing
  ///   vectors. By default, it uses cosine similarity.
  /// - [initialMemoryVectors] is an optional list of [MemoryVector] to
  ///   initialize the vector store with. This is useful when loading a vector
  ///   store from a database or file.
  ///
  /// If you want to create and populate a [MemoryVectorStore] from a list of
  /// documents or texts, use [MemoryVectorStore.fromDocuments] or
  /// [MemoryVectorStore.fromText].
  MemoryVectorStore({
    required super.embeddings,
    this.similarityFunction = cosineSimilarity,
    final List<MemoryVector>? initialMemoryVectors,
  }) : memoryVectors = [...?initialMemoryVectors];

  /// Similarity function to use when comparing vectors.
  final double Function(List<double> a, List<double> b) similarityFunction;

  /// Vectors stored in memory.
  final List<MemoryVector> memoryVectors;

  /// UUID generator.
  final Uuid _uuid = const Uuid();

  /// Creates a vector store from a list of documents.
  ///
  /// - [documents] is a list of documents to add to the vector store. If no
  ///   document id is provided, a random uuid will be generated.
  /// - [embeddings] is the embeddings model to use to embed the documents.
  static Future<MemoryVectorStore> fromDocuments({
    required final List<Document> documents,
    required final Embeddings embeddings,
  }) async {
    final vs = MemoryVectorStore(embeddings: embeddings);
    final docs = documents
        .map(
          (final doc) => doc.id == null || doc.id!.isEmpty
              ? doc.copyWith(id: vs._uuid.v4())
              : doc,
        )
        .toList(growable: false);
    await vs.addDocuments(documents: docs);
    return vs;
  }

  /// Creates a vector store from a list of texts.
  ///
  /// - [ids] is a list of ids to add to the vector store. If no id is provided,
  ///   a random uuid will be generated.
  /// - [texts] is a list of texts to add to the vector store.
  /// - [metadatas] is a list of metadata to add to the vector store.
  /// - [embeddings] is the embeddings model to use to embed the texts.
  static Future<MemoryVectorStore> fromText({
    final List<String>? ids,
    required final List<String> texts,
    final List<Map<String, dynamic>>? metadatas,
    required final Embeddings embeddings,
  }) async {
    assert(
      ids == null || ids.length == texts.length,
      'ids and texts must have the same length',
    );
    assert(
      metadatas == null || metadatas.length == texts.length,
      'metadatas and texts must have the same length',
    );
    final vs = MemoryVectorStore(embeddings: embeddings);
    await vs.addDocuments(
      documents: texts
          .mapIndexed(
            (final i, final text) => Document(
              id: ids?[i] ?? vs._uuid.v4(),
              pageContent: text,
              metadata: metadatas?[i] ?? const {},
            ),
          )
          .toList(growable: false),
    );
    return vs;
  }

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    memoryVectors.addAll(
      vectors.mapIndexed((final i, final vector) {
        final doc = documents[i];
        return MemoryVector(
          document: doc,
          embedding: vector,
        );
      }),
    );
    return const [];
  }

  @override
  Future<void> delete({required final List<String> ids}) async {
    memoryVectors.removeWhere(
      (final vector) => ids.contains(vector.document.id),
    );
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    var entries = memoryVectors;
    if (config.filter != null) {
      final filter = config.filter!;
      entries = entries
          .where(
            (final entry) => filter.keys.every(
              (final key) => entry.document.metadata[key] == filter[key],
            ),
          )
          .toList(growable: false);
    }

    var searches = entries
        .map(
          (final entry) => (
            entry.document,
            similarityFunction(embedding, entry.embedding),
          ),
        )
        .sorted((final a, final b) => (a.$2 > b.$2 ? -1 : 1))
        .take(config.k);

    if (config.scoreThreshold != null) {
      searches =
          searches.where((final search) => search.$2 >= config.scoreThreshold!);
    }

    return searches.toList(growable: false);
  }
}

/// {@template memory_vector}
/// Represents an entry of [MemoryVectorStore].
/// {@endtemplate}
@immutable
class MemoryVector {
  /// {@macro memory_vector}
  const MemoryVector({
    required this.document,
    required this.embedding,
  });

  /// Document associated with the vector.
  final Document document;

  /// Vector embedding.
  final List<double> embedding;

  /// Creates a vector from a map.
  factory MemoryVector.fromMap(final Map<String, dynamic> map) {
    return MemoryVector(
      document: Document.fromMap(map['document'] as Map<String, dynamic>),
      embedding: map['embedding'] as List<double>,
    );
  }

  /// Converts the vector to a map.
  Map<String, dynamic> toMap() {
    return {
      'document': document.toMap(),
      'embedding': embedding,
    };
  }

  @override
  bool operator ==(covariant final MemoryVector other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            document == other.document &&
            const ListEquality<double>().equals(embedding, other.embedding);
  }

  @override
  int get hashCode =>
      document.hashCode ^ const ListEquality<double>().hash(embedding);

  @override
  String toString() {
    return 'MemoryVector{'
        'document: $document, '
        'embedding: ${embedding.length}}';
  }
}

/// Measures the cosine of the angle between two vectors in a vector space.
/// It ranges from -1 to 1, where 1 represents identical vectors, 0 represents
/// orthogonal vectors, and -1 represents vectors that are diametrically
/// opposed.
double cosineSimilarity(final List<double> a, final List<double> b) {
  double p = 0;
  double p2 = 0;
  double q2 = 0;
  for (int i = 0; i < a.length; i++) {
    p += a[i] * b[i];
    p2 += a[i] * a[i];
    q2 += b[i] * b[i];
  }
  return p / (sqrt(p2) * sqrt(q2));
}
