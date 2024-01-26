import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

import '../../storage/storage.dart';
import '../models/models.dart';
import 'base.dart';

/// {@template cache_backed_embeddings}
/// Wrapper around an embedder that caches embeddings in a key-value store to
/// avoid recomputing embeddings for the same text.
///
/// When embedding a new document, the method first checks the cache for the
/// embeddings. If the embeddings are not found, the method uses the underlying
/// embedder to embed the documents and stores the results in the cache.
///
/// The factory constructor [CacheBackedEmbeddings.fromByteStore] can be used
/// to create a cache backed embeddings that uses a [EncoderBackedStore] which
/// generates the keys for the cache by hashing the text.
///
/// You can use a [InMemoryStore] (mainly for testing or prototyping),
/// a [LocalFileStore] or your custom implementation of [BaseStore].
///
/// The [CacheBackedEmbeddings.embedQuery] method does not support caching at
/// the moment.
/// {@endtemplate}
class CacheBackedEmbeddings implements Embeddings {
  /// {@macro cache_backed_embeddings}
  const CacheBackedEmbeddings({
    required this.underlyingEmbeddings,
    required this.documentEmbeddingsStore,
  });

  /// The embedder to use for computing embeddings.
  final Embeddings underlyingEmbeddings;

  /// The store to use for caching embeddings.
  final BaseStore<String, List<double>> documentEmbeddingsStore;

  /// Create a cache backed embeddings that uses a [EncoderBackedStore] which
  /// generates the keys for the cache by hashing the text.
  ///
  /// - [underlyingEmbeddings] is the embedder to use for computing embeddings.
  /// - [documentEmbeddingsStore] is the store to use for caching embeddings.
  /// - [namespace] is the namespace to use for the cache. This namespace is
  ///   used to avoid collisions of the same text embedded using different
  ///   embeddings models. For example, you can set it to the name of the
  ///   embedding model used.
  ///
  /// Example:
  /// ```dart
  /// final cacheBackedEmbeddings = CacheBackedEmbeddings.fromByteStore(
  ///   underlyingEmbeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  ///   documentEmbeddingsStore: InMemoryStore(),
  ///   namespace: 'text-embedding-3-small',
  /// );
  factory CacheBackedEmbeddings.fromByteStore({
    required final Embeddings underlyingEmbeddings,
    required final BaseStore<String, Uint8List> documentEmbeddingsStore,
    final String namespace = '',
  }) {
    return CacheBackedEmbeddings(
      underlyingEmbeddings: underlyingEmbeddings,
      documentEmbeddingsStore: EncoderBackedStore(
        store: documentEmbeddingsStore,
        encoder: EmbeddingsByteStoreEncoder(namespace: namespace),
      ),
    );
  }

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final texts =
        documents.map((final doc) => doc.pageContent).toList(growable: false);
    final vectors = await documentEmbeddingsStore.get(texts);
    final missingIndices = [
      for (var i = 0; i < texts.length; i++)
        if (vectors[i] == null) i,
    ];
    final missingDocs =
        missingIndices.map((final i) => documents[i]).toList(growable: false);

    if (missingDocs.isNotEmpty) {
      final missingVectors =
          await underlyingEmbeddings.embedDocuments(missingDocs);
      final missingVectorPairs = missingIndices
          .map((final i) => (texts[i], missingVectors[i]))
          .toList(growable: false);
      await documentEmbeddingsStore.set(missingVectorPairs);
      for (var i = 0; i < missingIndices.length; i++) {
        vectors[missingIndices[i]] = missingVectors[i];
      }
    }
    return vectors.cast();
  }

  /// Embed query text.
  ///
  /// This method does not support caching at the moment.
  ///
  /// Support for caching queries is easily to implement, but might make
  /// sense to hold off to see the most common patterns.
  ///
  /// If the cache has an eviction policy, we may need to be a bit more careful
  /// about sharing the cache between documents and queries. Generally,
  /// one is OK evicting query caches, but document caches should be kept.
  @override
  Future<List<double>> embedQuery(final String query) {
    return underlyingEmbeddings.embedQuery(query);
  }
}

/// {@template embeddings_byte_store_encoder}
/// Encoder that transforms values to and from bytes.
/// {@endtemplate}
class EmbeddingsByteStoreEncoder
    implements StoreEncoder<String, List<double>, String, Uint8List> {
  /// {@macro embeddings_byte_store_encoder}
  const EmbeddingsByteStoreEncoder({
    this.namespace = '',
    this.uuid = const Uuid(),
  });

  /// The namespace to use for the cache keys.
  final String namespace;

  /// The uuid generator to use for generating the cache keys.
  final Uuid uuid;

  @override
  String encodeKey(final String key) {
    final keyHash = sha1.convert(utf8.encode(key)).toString();
    return uuid.v5(Uuid.NAMESPACE_URL, keyHash);
  }

  @override
  Uint8List encodeValue(final List<double> value) {
    return utf8.encoder.convert(json.encode(value));
  }

  @override
  String decodeKey(final String encodedKey) => throw UnimplementedError(
        'Decoding keys is not supported for the _ByteStoreEncoder.',
      );

  @override
  List<double> decodeValue(final Uint8List encodedValue) {
    // ignore: avoid_dynamic_calls
    return json.decode(utf8.decode(encodedValue)).cast<double>();
  }
}
