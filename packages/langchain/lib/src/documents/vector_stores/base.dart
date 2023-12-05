// ignore_for_file: avoid_unused_constructor_parameters
import '../embeddings/base.dart';
import '../models/models.dart';
import '../retrievers/models/models.dart';
import '../retrievers/vector_store.dart';
import 'models/models.dart';

/// {@template vector_store}
/// Interface for vector stores.
/// {@endtemplate}
abstract class VectorStore {
  /// {@macro vector_store}
  const VectorStore({
    required this.embeddings,
  });

  /// The embeddings model used to embed documents.
  final Embeddings embeddings;

  /// Runs more documents through the embeddings and add to the vector store.
  ///
  /// - [documents] is a list of documents to add to the vector store.
  ///
  /// Returns a list of ids from adding the documents into the vector store.
  Future<List<String>> addDocuments({
    required final List<Document> documents,
  }) async {
    return addVectors(
      vectors: await embeddings.embedDocuments(documents),
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
  Future<void> delete({required final List<String> ids});

  /// Returns docs most similar to query using specified search type.
  ///
  /// - [query] is the query to search for.
  /// - [searchType] is the type of search to perform, either
  ///   [VectorStoreSearchType.similarity] (default) or
  ///   [VectorStoreSearchType.mmr].
  Future<List<Document>> search({
    required final String query,
    required final VectorStoreSearchType searchType,
  }) {
    return switch (searchType) {
      final VectorStoreSimilaritySearch config => similaritySearch(
          query: query,
          config: config,
        ),
      final VectorStoreMMRSearch config =>
        maxMarginalRelevanceSearch(query: query, config: config),
    };
  }

  /// Returns docs most similar to query using similarity.
  ///
  /// - [query] the query to search for.
  /// - [config] the configuration for the search.
  Future<List<Document>> similaritySearch({
    required final String query,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    final docsWithScores = await similaritySearchWithScores(
      query: query,
      config: config,
    );
    return docsWithScores
        .map((final docWithScore) => docWithScore.$1)
        .toList(growable: false);
  }

  /// Returns docs most similar to embedding vector using similarity.
  ///
  /// - [embedding] is the embedding vector to look up documents similar to.
  /// - [config] the configuration for the search.
  Future<List<Document>> similaritySearchByVector({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    final docsWithScores = await similaritySearchByVectorWithScores(
      embedding: embedding,
      config: config,
    );
    return docsWithScores
        .map((final docWithScore) => docWithScore.$1)
        .toList(growable: false);
  }

  /// Returns docs and relevance scores in the range `[0, 1]`.
  /// 0 is dissimilar, 1 is most similar.
  ///
  /// - [query] is the query to search for.
  /// - [config] the configuration for the search.
  ///
  /// Returns a list of tuples of documents and their similarity scores.
  Future<List<(Document, double score)>> similaritySearchWithScores({
    required final String query,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    return similaritySearchByVectorWithScores(
      embedding: await embeddings.embedQuery(query),
      config: config,
    );
  }

  /// Returns docs and relevance scores in the range `[0, 1]`,
  /// 0 is dissimilar, 1 is most similar.
  ///
  /// - [query] is the query to search for.
  /// - [config] the configuration for the search.
  ///
  /// Returns a list of tuples of documents and their similarity scores.
  Future<List<(Document, double scores)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  });

  /// Returns docs selected using the maximal marginal relevance algorithm (MMR)
  /// for the given query.
  ///
  /// Maximal marginal relevance optimizes for similarity to query
  /// AND diversity among selected documents.
  ///
  /// - [query] is the query to search for.
  /// - [config] the configuration for the search.
  Future<List<Document>> maxMarginalRelevanceSearch({
    required final String query,
    final VectorStoreMMRSearch config = const VectorStoreMMRSearch(),
  }) async {
    return maxMarginalRelevanceSearchByVector(
      embedding: await embeddings.embedQuery(query),
      config: config,
    );
  }

  /// Returns docs selected using the maximal marginal relevance algorithm (MMR)
  /// for the given embedding vector.
  ///
  /// Maximal marginal relevance optimizes for similarity to query
  /// AND diversity among selected documents.
  ///
  /// - [embedding] is the embedding vector to look up documents similar to.
  /// - [config] the configuration for the search.
  List<Document> maxMarginalRelevanceSearchByVector({
    required final List<double> embedding,
    final VectorStoreMMRSearch config = const VectorStoreMMRSearch(),
  }) {
    throw UnimplementedError('MRR not supported for this vector store');
  }

  /// Returns a [VectorStoreRetriever] that uses this vector store.
  ///
  /// - [defaultOptions] are the default options for the retriever.
  VectorStoreRetriever asRetriever({
    final VectorStoreRetrieverOptions defaultOptions =
        const VectorStoreRetrieverOptions(),
  }) {
    return VectorStoreRetriever(
      vectorStore: this,
      defaultOptions: defaultOptions,
    );
  }
}
