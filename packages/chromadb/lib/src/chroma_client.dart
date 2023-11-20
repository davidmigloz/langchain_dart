import 'package:http/http.dart' as http;

import 'collection.dart';
import 'embeddings/embedding_function.dart';
import 'generated/client.dart';
import 'generated/schema/schema.dart';
import 'loaders/data_loader.dart';

/// {@template chroma_client}
/// Chroma open-source embedding database API client.
/// {@endtemplate}
class ChromaClient {
  /// {@macro chroma_client}
  ChromaClient({
    this.tenant = 'default_tenant',
    this.database = 'default_database',
    final String baseUrl = 'http://localhost:8000',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : _api = ChromaApiClient(
          baseUrl: baseUrl,
          headers: headers ?? const {},
          queryParams: queryParams ?? const {},
          client: client,
        );

  /// The API client.
  final ChromaApiClient _api;

  /// The tenant name.
  final String tenant;

  /// The database name.
  final String database;

  /// Get the current time in nanoseconds since epoch.
  /// Used to check if the server is alive.
  /// Returns the current time in nanoseconds since epoch.
  Future<int> heartbeat() async {
    final res = await _api.heartbeat();
    return res['nanosecond heartbeat'] ?? 0;
  }

  /// Lists all collections.
  Future<List<CollectionType>> listCollections() {
    return _api.listCollections(
      tenant: tenant,
      database: database,
    );
  }

  /// Creates a new collection with the specified properties.
  ///
  /// - [name] - The name of the collection.
  /// - [metadata] - Optional metadata associated with the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  ///   collection.
  /// - [dataLoader] - Optional data loader for the collection. It is used to
  ///   load the data from a stored URI when needed.
  Future<Collection> createCollection({
    required final String name,
    final Map<String, dynamic>? metadata,
    final EmbeddingFunction? embeddingFunction,
    final DataLoader<Loadable>? dataLoader,
  }) async {
    final res = await _api.createCollection(
      tenant: tenant,
      database: database,
      request: CreateCollection(
        name: name,
        metadata: metadata,
      ),
    );
    return Collection(
      name: res.name,
      id: res.id,
      metadata: res.metadata,
      tenant: tenant,
      database: database,
      embeddingFunction: embeddingFunction,
      dataLoader: dataLoader,
      api: _api,
    );
  }

  /// Gets or creates a collection with the specified properties.
  ///
  /// - [name] - The name of the collection.
  /// - [metadata] - Optional metadata associated with the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  ///   collection.
  /// - [dataLoader] - Optional data loader for the collection. It is used to
  ///   load the data from a stored URI when needed.
  Future<Collection> getOrCreateCollection({
    required final String name,
    final Map<String, dynamic>? metadata,
    final EmbeddingFunction? embeddingFunction,
    final DataLoader<Loadable>? dataLoader,
  }) async {
    final res = await _api.createCollection(
      tenant: tenant,
      database: database,
      request: CreateCollection(
        name: name,
        metadata: metadata,
        getOrCreate: true,
      ),
    );
    return Collection(
      name: res.name,
      id: res.id,
      metadata: res.metadata,
      tenant: tenant,
      database: database,
      embeddingFunction: embeddingFunction,
      dataLoader: dataLoader,
      api: _api,
    );
  }

  /// Gets a collection with the specified name.
  ///
  /// - [name] - The name of the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  ///   collection.
  /// - [dataLoader] - Optional data loader for the collection. It is used to
  ///   load the data from a stored URI when needed.
  Future<Collection> getCollection({
    required final String name,
    final EmbeddingFunction? embeddingFunction,
    final DataLoader<Loadable>? dataLoader,
  }) async {
    final res = await _api.getCollection(
      collectionName: name,
      tenant: tenant,
      database: database,
    );
    return Collection(
      name: res.name,
      id: res.id,
      metadata: res.metadata,
      tenant: tenant,
      database: database,
      embeddingFunction: embeddingFunction,
      dataLoader: dataLoader,
      api: _api,
    );
  }

  /// Deletes a collection with the specified name.
  ///
  /// - [name] - The name of the collection.
  Future<void> deleteCollection({
    required final String name,
  }) async {
    await _api.deleteCollection(
      collectionName: name,
      tenant: tenant,
      database: database,
    );
  }

  /// Resets the database. This will delete all collections and entries.
  /// Returns true if the database was reset successfully.
  Future<bool> reset() {
    return _api.reset();
  }

  /// Returns the version of the Chroma API.
  Future<String> version() async {
    final version = await _api.version();
    return version.replaceAll('"', '');
  }
}
