/// {@template vector_store_search_type}
/// Vector store search type.
/// {@endtemplate}
sealed class VectorStoreSearchType {
  /// {@macro vector_store_search_type}
  const VectorStoreSearchType({
    required this.k,
  });

  /// The number of documents to return.
  final int k;

  /// Similarity search.
  factory VectorStoreSearchType.similarity({
    final int k = 4,
    final double? scoreThreshold,
  }) {
    return VectorStoreSimilaritySearch(
      k: k,
      scoreThreshold: scoreThreshold,
    );
  }

  /// Maximal Marginal Relevance (MMR) search.
  factory VectorStoreSearchType.mmr({
    final int k = 4,
    final int fetchK = 20,
    final double lambdaMult = 0.5,
  }) {
    return VectorStoreMMRSearch(
      k: k,
      fetchK: fetchK,
      lambdaMult: lambdaMult,
    );
  }
}

/// {@template vector_store_similarity_search}
/// Similarity search.
/// Eg. using Cosine similarity.
/// {@endtemplate}
class VectorStoreSimilaritySearch extends VectorStoreSearchType {
  /// {@macro vector_store_similarity_search}
  const VectorStoreSimilaritySearch({
    super.k = 4,
    this.scoreThreshold,
  });

  /// The minimum relevance score a document must have to be returned.
  /// Range: [0, 1].
  final double? scoreThreshold;
}

/// {@template vector_store_mmr_search}
/// Maximal Marginal Relevance (MMR) search .
///
/// Maximal marginal relevance optimizes for similarity to query
/// AND diversity among selected documents.
/// {@endtemplate}
class VectorStoreMMRSearch extends VectorStoreSearchType {
  /// {@macro vector_store_mmr_search}
  const VectorStoreMMRSearch({
    super.k = 4,
    this.fetchK = 20,
    this.lambdaMult = 0.5,
  });

  /// The number of documents to pass to MMR algorithm.
  final int fetchK;

  /// Number between 0 and 1 that determines the degree of diversity among the
  /// results with 0 corresponding to maximum diversity and 1 to minimum
  /// diversity.
  final double lambdaMult;
}
