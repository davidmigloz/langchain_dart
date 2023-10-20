import 'package:langchain/langchain.dart';

/// {@template pinecone_similarity_search}
/// Pinecone similarity search config.
///
/// Pinecone supports a wide range of operators for filtering. Check out the
/// filtering section of the Pinecone docs for more info:
/// https://docs.pinecone.io/docs/metadata-filtering#metadata-query-language
///
/// Example:
/// ```dart
/// PineconeSimilaritySearch(
///   k: 5,
///   filter: {'style': 'style1'},
///   scoreThreshold: 0.8,
/// ),
/// ```
/// {@endtemplate}
class PineconeSimilaritySearch extends VectorStoreSimilaritySearch {
  /// {@macro pinecone_similarity_search}
  const PineconeSimilaritySearch({
    super.k = 4,
    super.filter,
    super.scoreThreshold,
    this.namespace,
    this.sparseVector,
  });

  /// The namespace of the index (optional).
  ///
  /// If specified, this will override the namespace specified in the
  /// Pinecone constructor.
  final String? namespace;

  /// Sparse vector for hybrid search.
  final PineconeSparseVector? sparseVector;

  /// Creates a [PineconeSimilaritySearch] from a [VectorStoreSimilaritySearch].
  factory PineconeSimilaritySearch.fromBaseConfig(
    final VectorStoreSimilaritySearch config,
  ) {
    if (config is PineconeSimilaritySearch) {
      return config;
    }
    return PineconeSimilaritySearch(
      k: config.k,
      filter: config.filter,
      scoreThreshold: config.scoreThreshold,
    );
  }
}

/// {@template pinecone_sparse_vector}
/// Pinecone sparse vector.
/// {@endtemplate}
class PineconeSparseVector {
  /// {@macro pinecone_sparse_vector}
  const PineconeSparseVector({
    required this.indices,
    required this.values,
  });

  /// The indices of the sparse data.
  final List<int>? indices;

  /// The corresponding values of the sparse data, which must be the same
  /// length as the indices.
  final List<double>? values;
}
