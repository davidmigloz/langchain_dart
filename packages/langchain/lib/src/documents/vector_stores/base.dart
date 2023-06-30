// ignore_for_file: avoid_unused_constructor_parameters
import '../embeddings/base.dart';
import '../models/models.dart';
import '../retrievers/vector_store.dart';
import 'models/models.dart';

/// {@category vector_stores}
/// Interface for vector stores.
/// {@endtemplate}
abstract class VectorStore {
  /// {@macro vector_store}
  const VectorStore({
    required this.embeddings,
  });

  /// The embeddings model used to embed documents.
  final Embeddings embeddings;

  /// Creates a vector store from a list of texts.
  ///
  /// - [texts] is a list of texts to add to the vector store.
  /// - [metadatas] is a list of metadata to add to the vector store.
  /// - [embeddings] is the embeddings model to use to embed the texts.
  factory VectorStore.fromText({
    required final List<String> texts,
    required final List<Map<String, dynamic>> metadatas,
    required final Embeddings embeddings,
  }) {
    throw UnimplementedError(
      'Use the fromText method on a specific vector store.',
    );
  }

  /// Creates a vector store from a list of documents.
  ///
  /// - [documents] is a list of documents to add to the vector store.
  /// - [embeddings] is the embeddings model to use to embed the documents.
  factory VectorStore.fromDocuments({
    required final List<Document> documents,
    required final Embeddings embeddings,
  }) {
    throw UnimplementedError(
      'Use the fromDocuments method on a specific vector store.',
    );
  }

  /// Runs more documents through the embeddings and add to the vector store.
  ///
  /// - [documents] is a list of documents to add to the vector store.
  ///
  /// Returns a list of ids from adding the documents into the vector store.
  Future<List<String>> addDocuments({
    required final List<Document> documents,
  }) async {
    final texts =
        documents.map((final doc) => doc.pageContent).toList(growable: false);
    return addVectors(
      vectors: await embeddings.embedDocuments(texts),
      documents: documents,
    );
  }

  /// Runs more texts through the embeddings and add to the vector store.
  ///
  /// - [vectors] is a list of vectors to add to the vector store.
  /// - [documents] is a list of documents to add to the vector store.
  ///
  /// Returns a list of ids from adding the vectors into the vector store.
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  });

  /// Delete by vector ID.
  ///
  /// - [ids] is a list of ids to delete.
  ///
  /// Returns true if the delete was successful.
  Future<bool> delete({required final List<String> ids});

  /// Returns docs most similar to query using specified search type.
  ///
  /// - [query] is the query to search for.
  /// - [searchType] is the type of search to perform.
  /// - [k] is the number of documents to return.
  Future<List<Document>> search({
    required final String query,
    required final VectorStoreSearchType searchType,
    final int k = 4,
  }) {
    return switch (searchType) {
      VectorStoreSearchType.similarity => similaritySearch(query: query),
      VectorStoreSearchType.mmr => maxMarginalRelevanceSearch(query: query),
    };
  }

  /// Returns docs most similar to query using similarity.
  ///
  /// - [query] is the query to search for.
  /// - [k] is the number of documents to return.
  Future<List<Document>> similaritySearch({
    required final String query,
    final int k = 4,
  }) async {
    final docsWithScores = await similaritySearchWithScores(query: query, k: k);
    return docsWithScores
        .map((final docWithScore) => docWithScore.$1)
        .toList(growable: false);
  }

  /// Returns docs most similar to embedding vector using similarity.
  ///
  /// - [embedding] is the embedding vector to look up documents similar to.
  /// - [k] is the number of documents to return.
  Future<List<Document>> similaritySearchByVector({
    required final List<double> embedding,
    final int k = 4,
  }) async {
    final docsWithScores =
        await similaritySearchByVectorWithScores(embedding: embedding, k: k);
    return docsWithScores
        .map((final docWithScore) => docWithScore.$1)
        .toList(growable: false);
  }

  /// Returns docs and relevance scores in the range [0, 1].
  /// 0 is dissimilar, 1 is most similar.
  ///
  /// - [query] is the query to search for.
  /// - [k] is the number of documents to return.
  ///
  /// Returns a list of tuples of documents and their similarity scores.
  Future<List<(Document, double score)>> similaritySearchWithScores({
    required final String query,
    final int k = 4,
  }) async {
    return similaritySearchByVectorWithScores(
      embedding: await embeddings.embedQuery(query),
      k: k,
    );
  }

  /// Returns docs and relevance scores in the range [0, 1],
  /// 0 is dissimilar, 1 is most similar.
  ///
  /// - [query] is the query to search for.
  /// - [k] is the number of documents to return.
  ///
  /// Returns a list of tuples of documents and their similarity scores.
  Future<List<(Document, double scores)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final int k = 4,
  });

  /// Returns docs selected using the maximal marginal relevance algorithm (MMR)
  /// for the given query.
  ///
  /// Maximal marginal relevance optimizes for similarity to query
  /// AND diversity among selected documents.
  ///
  /// - [query] is the query to search for.
  /// - [k] is the number of documents to return.
  /// - [fetchK] is the number of documents to pass to MMR algorithm.
  /// - [lambdaMult] is a umber between 0 and 1 that determines the degree of
  ///   diversity among the results with 0 corresponding to maximum diversity
  ///   and 1 to minimum diversity.
  Future<List<Document>> maxMarginalRelevanceSearch({
    required final String query,
    final int k = 4,
    final int fetchK = 20,
    final double lambdaMult = 0.5,
  }) async {
    return maxMarginalRelevanceSearchByVector(
      embedding: await embeddings.embedQuery(query),
      k: k,
      fetchK: fetchK,
      lambdaMult: lambdaMult,
    );
  }

  /// Returns docs selected using the maximal marginal relevance algorithm (MMR)
  /// for the given embedding vector.
  ///
  /// Maximal marginal relevance optimizes for similarity to query
  /// AND diversity among selected documents.
  ///
  /// - [embedding] is the embedding vector to look up documents similar to.
  /// - [k] is the number of documents to return.
  /// - [fetchK] is the number of documents to pass to MMR algorithm.
  /// - [lambdaMult] is a umber between 0 and 1 that determines the degree of
  ///   diversity among the results with 0 corresponding to maximum diversity
  ///   and 1 to minimum diversity.
  List<Document> maxMarginalRelevanceSearchByVector({
    required final List<double> embedding,
    final int k = 4,
    final int fetchK = 20,
    final double lambdaMult = 0.5,
  });

  /// Returns a retriever that uses this vector store.
  VectorStoreRetriever asRetriever({
    final VectorStoreSearchType searchType = VectorStoreSearchType.similarity,
    final int k = 4,
  }) {
    return VectorStoreRetriever(
      vectorStore: this,
      searchType: searchType,
      k: k,
    );
  }
}
