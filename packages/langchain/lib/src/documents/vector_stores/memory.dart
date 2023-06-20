import 'dart:math';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../embeddings/base.dart';
import '../models/models.dart';
import 'base.dart';

/// {@template memory_vector_store}
/// Vector store that stores vectors in memory.
/// {@endtemplate}
class MemoryVectorStore extends VectorStore {
  /// {@macro memory_vector_store}
  MemoryVectorStore({
    required super.embeddings,
    this.similarityFunction = cosineSimilarity,
  });

  /// Similarity function to use when comparing vectors.
  final double Function(List<double> a, List<double> b) similarityFunction;

  /// Vectors stored in memory.
  final List<MemoryVector> memoryVectors = [];

  /// Creates a vector store from a list of texts.
  ///
  /// - [texts] is a list of texts to add to the vector store.
  /// - [metadatas] is a list of metadata to add to the vector store.
  /// - [embeddings] is the embeddings model to use to embed the texts.
  factory MemoryVectorStore.fromText({
    required final List<String> texts,
    required final List<Map<String, dynamic>> metadatas,
    required final Embeddings embeddings,
  }) {
    return MemoryVectorStore(embeddings: embeddings)
      ..addDocuments(
        documents: texts
            .mapIndexed(
              (final i, final text) => Document(
                pageContent: text,
                metadata: i < metadatas.length ? metadatas[i] : const {},
              ),
            )
            .toList(growable: false),
      );
  }

  /// Creates a vector store from a list of documents.
  ///
  /// - [documents] is a list of documents to add to the vector store.
  /// - [embeddings] is the embeddings model to use to embed the documents.
  factory MemoryVectorStore.fromDocuments({
    required final List<Document> documents,
    required final Embeddings embeddings,
  }) {
    return MemoryVectorStore(embeddings: embeddings)
      ..addDocuments(documents: documents);
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
          content: doc.pageContent,
          embedding: vector,
          metadata: doc.metadata,
        );
      }),
    );
    return const [];
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final int k = 4,
  }) async {
    final searches = memoryVectors
        .asMap()
        .map(
          (final key, final value) => MapEntry(
            key,
            similarityFunction(embedding, value.embedding),
          ),
        )
        .entries
        .sorted((final a, final b) => (a.value > b.value ? -1 : 1))
        .take(k);

    return searches
        .map(
          (final search) => (
            Document(
              pageContent: memoryVectors[search.key].content,
              metadata: memoryVectors[search.key].metadata,
            ),
            search.value,
          ),
        )
        .toList(growable: false);
  }

  @override
  List<Document> maxMarginalRelevanceSearchByVector({
    required final List<double> embedding,
    final int k = 4,
    final int fetchK = 20,
    final double lambdaMult = 0.5,
  }) {
    throw UnsupportedError('MRR not supported for memory vector store.');
  }
}

/// {@template memory_vector}
/// Represents a vector in memory.
/// {@endtemplate}
@immutable
class MemoryVector {
  /// {@macro memory_vector}
  const MemoryVector({
    required this.content,
    required this.embedding,
    required this.metadata,
  });

  final String content;
  final List<double> embedding;
  final Map<String, dynamic> metadata;
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
