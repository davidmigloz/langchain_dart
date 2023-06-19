enum VectorStoreSearchType {
  /// Search for documents that are similar to the query.
  /// Eg. using Cosine similarity.
  similarity,

  /// Maximal marginal relevance.
  ///
  /// Maximal marginal relevance optimizes for similarity to query
  /// AND diversity among selected documents.
  mmr,
}
