import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:pinecone/pinecone.dart';
import 'package:uuid/uuid.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// {@template pinecone}
/// Vector store for Pinecone vector database.
///
/// Pinecone documentation:
/// https://docs.pinecone.io/
///
/// To use Pinecone, you must have an API key. To find your API key, open the
/// Pinecone console and click API Keys.
///
/// Before using this vector store you need to create an index in Pinecone.
/// You can do that in the Pinecone console or using a Pinecone API client.
/// Check out the Pinecone documentation for more information regarding index
/// type and size: https://docs.pinecone.io/docs/choosing-index-type-and-size
///
/// After creating the index, configure the index name in the [indexName]
/// parameter and the cloud region in the [environment] parameter.
///
/// Example:
/// ```dart
/// final vectorStore = Pinecone(
///   apiKey: pineconeApiKey,
///   indexName: 'langchain-dart',
///   environment: 'gcp-starter',
///   embeddings: embeddings,
/// );
/// ```
///
/// Pinecone indexes store records with vector data. Each record in a Pinecone
/// index always contains a unique ID and an array of floats representing a
/// dense vector embedding. It can also contain a sparse vector embedding for
/// hybrid search and metadata key-value pairs for filtered queries.
///
/// When you add documents to the index using this class, the document's page
/// content will be stored in the index's metadata. You can configure the
/// metadata key in the [docPageContentKey] parameter.
///
/// Mind that Pinecone supports 40kb of metadata per vector.
///
/// You can organize the vectors added to an index into partitions, or
/// "namespaces," to limit queries and other vector operations to only one such
/// namespace at a time. You can configure the namespace in the [namespace]
/// parameter.
///
/// ### Filtering
///
/// Metadata filter expressions can be included with queries to limit the
/// search to only vectors matching the filter expression.
///
/// For example:
/// ```dart
/// final vectorStore = VectorStore(...);
/// final res = await vectorStore.similaritySearch(
///   query: 'What should I feed my cat?',
///   config: PineconeSimilaritySearch(
///     k: 5,
///     scoreThreshold: 0.8,
///     filter: {'class: 'cat'},
///   ),
/// );
/// ```
///
/// Pinecone supports a wide range of operators for filtering. Check out the
/// filtering section of the Pinecone docs for more info:
/// https://docs.pinecone.io/docs/metadata-filtering#metadata-query-language
/// {@endtemplate}
class Pinecone extends VectorStore {
  /// {@macro pinecone}
  Pinecone({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String> headers = const {},
    final Map<String, dynamic> queryParams = const {},
    final http.Client? client,
    required this.indexName,
    this.environment = 'gcp-starter',
    this.namespace,
    this.docPageContentKey = 'page_content',
    required super.embeddings,
  }) : _client = PineconeClient(
          apiKey: apiKey ?? '',
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// The name of the index.
  final String indexName;

  /// The cloud region for your project. See the Pinecone console > API keys.
  final String environment;

  /// The namespace of the index (optional).
  final String? namespace;

  /// The metadata key used to store the document's page content.
  final String docPageContentKey;

  /// The Pinecone client.
  final PineconeClient _client;

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  /// The Pinecone index.
  Index? _index;

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final index = await _getIndex();

    final List<String> ids = [];
    final List<Vector> vec = [];

    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      final id = doc.id ?? _uuid.v4();
      final vector = Vector(
        id: id,
        values: vectors[i],
        metadata: {
          ...doc.metadata,
          docPageContentKey: doc.pageContent,
        },
      );
      ids.add(id);
      vec.add(vector);
    }

    await _client.upsertVectors(
      indexName: index.name,
      projectId: index.projectId,
      environment: index.environment,
      request: UpsertRequest(
        namespace: namespace,
        vectors: vec,
      ),
    );
    return ids;
  }

  @override
  Future<void> delete({required final List<String> ids}) async {
    final index = await _getIndex();
    await _client.deleteVectors(
      indexName: index.name,
      projectId: index.projectId,
      environment: index.environment,
      request: DeleteRequest(ids: ids),
    );
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config = const PineconeSimilaritySearch(),
  }) async {
    final pConfig = PineconeSimilaritySearch.fromBaseConfig(config);
    final index = await _getIndex();
    final queryRes = await _client.queryVectors(
      indexName: index.name,
      projectId: index.projectId,
      environment: index.environment,
      request: QueryRequest(
        namespace: pConfig.namespace ?? namespace,
        vector: embedding,
        sparseVector: pConfig.sparseVector?.toSparseVector(),
        topK: pConfig.k,
        filter: pConfig.filter,
        includeMetadata: true,
      ),
    );

    final matches = queryRes.matches;
    if (matches.isEmpty) {
      return const [];
    }

    final List<(Document, double)> results = [];
    for (final match in matches) {
      final score = match.score ?? 0.0;
      if (pConfig.scoreThreshold != null && score < pConfig.scoreThreshold!) {
        continue;
      }

      final id = match.id;
      final metadata = match.metadata ?? <String, dynamic>{};
      final document = Document(
        id: id,
        pageContent: metadata[docPageContentKey] as String? ?? '',
        metadata: {
          for (final entry in metadata.entries)
            if (entry.key != docPageContentKey) entry.key: entry.value,
        },
      );
      results.add((document, score));
    }
    return results;
  }

  Future<Index> _getIndex() async {
    if (_index != null) {
      return _index!;
    }

    final index = await _client.describeIndex(
      indexName: indexName,
      environment: environment,
    );

    _index = index;
    return index;
  }
}
