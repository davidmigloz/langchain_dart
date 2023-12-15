import 'package:chromadb/chromadb.dart';
import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:uuid/uuid.dart';

import 'models/models.dart';

/// {@template chroma}
/// Vector store for Chroma open-source embedding database.
///
/// Chroma documentation:
/// https://docs.trychroma.com
///
/// This vector stores requires Chroma to be running in client/server mode.
///
/// The server can run on your local computer via docker or be easily deployed
/// to any cloud provider.
///
/// ### Running Chroma in client/server mode
///
/// You can run a Chroma server in two ways:
///
/// #### Using Python client
///
/// The Python client supports spinning up a Chroma server easily:
///
/// ```sh
/// pip install chromadb
/// chroma run --path /db_path
/// ```
///
/// #### Using Docker
///
/// Otherwise, you can run the Chroma server using Docker:
///
/// ```sh
/// docker pull chromadb/chroma
/// docker run -p 8000:8000 chromadb/chroma
/// ```
///
/// If you are interacting with Chroma server from a web browser,
/// you may need to configure the CORS policy. You can do this by
/// passing the following environment variable:
/// ```
/// docker run -p 8000:8000 -e 'CHROMA_SERVER_CORS_ALLOW_ORIGINS=["*"]' chromadb/chroma
/// ```
/// The previous command will allow all origins to access the Chroma server
/// (do not use in production).
///
/// By default, the Chroma client will connect to a server running on
/// `http://localhost:8000`. To connect to a different server, pass the
/// `baseUrl` parameter to the constructor.
///
/// ```dart
/// final vectorStore = Chroma(
///   embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
///   baseUrl: 'http://localhost:8888',
/// );
/// ```
///
/// ### Collections
///
/// Chroma lets you manage collections of embeddings, using the collection
/// primitive.
///
/// You can configure the collection to use in the [collectionName] parameter.
///
/// You can also configure the metadata to associate with the collection in the
/// [collectionMetadata] parameter.
///
/// ### Changing the distance function
///
/// You can change the distance function of the embedding space by setting the
/// value of `hnsw:space` in [collectionMetadata]. Valid options are "l2",
/// "ip", or "cosine". The default is "l2".
///
/// ### Filtering
///
/// Chroma supports filtering queries by metadata and document contents.
/// The `where` filter is used to filter by metadata, and the `whereDocument`
/// filter is used to filter by document contents.
///
/// For example:
/// ```dart
/// final vectorStore = Chroma(...);
/// final res = await vectorStore.similaritySearch(
///   query: 'What should I feed my cat?',
///   config: ChromaSimilaritySearch(
///     k: 5,
///     scoreThreshold: 0.8,
///     where: {'class': 'cat'},
///   ),
/// );
/// ```
///
/// Chroma supports a wide range of operators for filtering. Check out the
/// filtering section of the Chroma docs for more info:
/// https://docs.trychroma.com/usage-guide?lang=js#using-where-filters
/// {@endtemplate}
class Chroma extends VectorStore {
  /// {@macro chroma}
  Chroma({
    this.collectionName = 'langchain',
    this.collectionMetadata,
    required super.embeddings,
    final String tenant = 'default_tenant',
    final String database = 'default_database',
    final String baseUrl = 'http://localhost:8000',
    final Map<String, String> headers = const {},
    final http.Client? client,
  }) : _client = ChromaClient(
          tenant: tenant,
          database: database,
          baseUrl: baseUrl,
          headers: headers,
          client: client,
        );

  /// Name of the collection to use.
  final String collectionName;

  /// Metadata to associate with the collection.
  final Map<String, dynamic>? collectionMetadata;

  /// The Chroma client.
  final ChromaClient _client;

  /// A UUID generator.
  final Uuid _uuid = const Uuid();

  /// The collection to use.
  Collection? _collection;

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final collection = await _getCollection();

    final List<String> ids = [];
    final List<Map<String, dynamic>> metadatas = [];
    final List<String> docs = [];

    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      final id = doc.id ?? _uuid.v4();
      ids.add(id);
      metadatas.add(doc.metadata);
      docs.add(doc.pageContent);
    }

    await collection.upsert(
      ids: ids,
      embeddings: vectors,
      metadatas: metadatas,
      documents: docs,
    );
    return ids;
  }

  @override
  Future<void> delete({
    required final List<String> ids,
  }) async {
    final collection = await _getCollection();
    await collection.delete(ids: ids);
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    final collection = await _getCollection();
    final result = await collection.query(
      queryEmbeddings: [embedding],
      nResults: config.k,
      where: config.filter,
      whereDocument:
          config is ChromaSimilaritySearch ? config.whereDocument : null,
      include: const [
        Include.documents,
        Include.metadatas,
        Include.distances,
      ],
    );
    final ids = result.ids.first;
    final metadatas = result.metadatas?.first;
    final docs = result.documents?.first;
    final distances = result.distances?.first;

    final List<(Document, double)> results = [];
    for (var i = 0; i < ids.length; i++) {
      final distance = distances?[i] ?? 0.0;
      if (config.scoreThreshold != null && distance < config.scoreThreshold!) {
        continue;
      }

      final doc = Document(
        id: ids[i],
        metadata: metadatas?[i] ?? {},
        pageContent: docs?[i] ?? '',
      );
      results.add((doc, distance));
    }
    return results;
  }

  Future<Collection> _getCollection() async {
    if (_collection != null) {
      return _collection!;
    }

    final collection = await _client.getOrCreateCollection(
      name: collectionName,
      metadata: collectionMetadata,
    );

    _collection = collection;
    return collection;
  }
}
