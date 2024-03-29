/// {@template vector_store_search_type}
/// Vector store search type.
///
/// In general, we provide support two types of search:
/// - Similarity search.
/// - Maximal Marginal Relevance (MMR) search.
///
/// But it depends on the actual implementation of the vector store whether
/// these are supported or not. Vector stores may also provide their own
/// subclasses of this class to support additional configuration options.
/// For example, [VertexAIMatchingEngine](https://pub.dev/documentation/langchain_google/latest/langchain_google/VertexAIMatchingEngine-class.html)
/// provides `VertexAIMatchingEngineSimilaritySearch` which is a subclass of
/// [VectorStoreSimilaritySearch]. Check the documentation of the vector store
/// you are using for more information.
/// {@endtemplate}
sealed class VectorStoreSearchType {
  /// {@macro vector_store_search_type}
  const VectorStoreSearchType({
    required this.k,
    this.filter,
  });

  /// The number of documents to return.
  final int k;

  /// The filter to apply to the search.
  final Map<String, dynamic>? filter;

  /// Similarity search.
  factory VectorStoreSearchType.similarity({
    final int k = 4,
    final Map<String, dynamic>? filter,
    final double? scoreThreshold,
  }) {
    return VectorStoreSimilaritySearch(
      k: k,
      filter: filter,
      scoreThreshold: scoreThreshold,
    );
  }

  /// Maximal Marginal Relevance (MMR) search.
  factory VectorStoreSearchType.mmr({
    final int k = 4,
    final Map<String, dynamic>? filter,
    final int fetchK = 20,
    final double lambdaMult = 0.5,
  }) {
    return VectorStoreMMRSearch(
      k: k,
      filter: filter,
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
    super.filter,
    this.scoreThreshold,
  });

  /// The minimum relevance score a document must have to be returned.
  /// Range: `[0, 1]`.
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
    super.filter,
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
