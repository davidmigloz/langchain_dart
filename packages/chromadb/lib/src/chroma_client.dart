import 'package:http/http.dart' as http;

import 'collection.dart';
import 'embeddings/embedding_function.dart';
import 'generated/client.dart';
import 'generated/schema/schema.dart';

/// {@template chroma_client}
/// Chroma open-source embedding database API client.
/// {@endtemplate}
class ChromaClient {
  /// {@macro chroma_client}
  ChromaClient({
    final String host = 'http://localhost:8000',
    final http.Client? client,
  }) : _api = ChromaApiClient(host: host, client: client);

  /// The API client.
  final ChromaApiClient _api;

  /// Resets the state of the object by making an API call to the reset
  /// endpoint.
  Future<bool> reset() {
    return _api.reset();
  }

  /// Returns the version of the Chroma API.
  Future<String> version() {
    return _api.version();
  }

  /// Returns a heartbeat from the Chroma API.
  Future<int> heartbeat() async {
    final res = await _api.heartbeat();
    return res['nanosecond heartbeat'] ?? 0;
  }

  /// Creates a new collection with the specified properties.
  ///
  /// - [name] - The name of the collection.
  /// - [metadata] - Optional metadata associated with the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  ///   collection.
  Future<Collection> createCollection({
    required final String name,
    final Map<String, dynamic>? metadata,
    final EmbeddingFunction? embeddingFunction,
  }) async {
    final res = await _api.createCollection(
      request: CreateCollection(
        name: name,
        metadata: metadata,
      ),
    );
    return Collection(
      name: res.name,
      id: res.id,
      metadata: res.metadata,
      embeddingFunction: embeddingFunction,
      api: _api,
    );
  }

  /// Gets or creates a collection with the specified properties.
  ///
  /// - [name] - The name of the collection.
  /// - [metadata] - Optional metadata associated with the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  Future<Collection> getOrCreateCollection({
    required final String name,
    final Map<String, dynamic>? metadata,
    final EmbeddingFunction? embeddingFunction,
  }) async {
    final res = await _api.createCollection(
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
      embeddingFunction: embeddingFunction,
      api: _api,
    );
  }

  /// Lists all collections.
  Future<List<CollectionType>> listCollections() {
    return _api.listCollections();
  }

  /// Gets a collection with the specified name.
  ///
  /// - [name] - The name of the collection.
  /// - [embeddingFunction] - Optional custom embedding function for the
  ///   collection.
  Future<Collection> getCollection({
    required final String name,
    final EmbeddingFunction? embeddingFunction,
  }) async {
    final res = await _api.getCollection(
      collectionName: name,
    );
    return Collection(
      name: res.name,
      id: res.id,
      metadata: res.metadata,
      embeddingFunction: embeddingFunction,
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
    );
  }
}
