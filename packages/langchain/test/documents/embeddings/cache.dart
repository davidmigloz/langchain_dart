import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() async {
  group('CacheBackedEmbeddings', () {
    late InMemoryStore<String, List<double>> store;
    late CacheBackedEmbeddings cacheBackedEmbeddings;

    setUp(() {
      store = InMemoryStore();
      cacheBackedEmbeddings = CacheBackedEmbeddings(
        underlyingEmbeddings: FakeEmbeddings(deterministic: false),
        documentEmbeddingsStore: store,
      );
    });

    test(
        'embedDocuments returns correct embeddings, and fills missing embeddings',
        () async {
      final preStoreRes = await store.get(['testDoc']);
      expect(preStoreRes.first, isNull);
      final res1 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'testDoc')],
      );
      final storeRes1 = await store.get(['testDoc']);
      expect(res1, storeRes1);
      final res2 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'testDoc')],
      );
      expect(res2, storeRes1);
      final newDocStoreRes = await store.get(['newDoc']);
      expect(newDocStoreRes.first, isNull);
      final res3 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'newDoc')],
      );
      final storeRes3 = await store.get(['newDoc']);
      expect(res3, storeRes3);
    });

    test('embedQuery is not cached', () async {
      final result = await cacheBackedEmbeddings.embedQuery('testQuery');
      final storeResult = await store.get(['testQuery']);
      expect(result.first, isNotNull);
      expect(storeResult.first, isNull);
    });
  });

  group('CacheBackedEmbeddings.fromByteStore', () {
    late InMemoryStore<String, Uint8List> store;
    late CacheBackedEmbeddings cacheBackedEmbeddings;

    setUp(() {
      store = InMemoryStore();
      cacheBackedEmbeddings = CacheBackedEmbeddings.fromByteStore(
        underlyingEmbeddings: FakeEmbeddings(),
        documentEmbeddingsStore: store,
      );
    });

    test(
        'embedDocuments returns correct embeddings, and fills missing embeddings',
        () async {
      final res1 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'testDoc')],
      );
      final res2 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'testDoc')],
      );
      expect(res1, res2);
      final res3 = await cacheBackedEmbeddings.embedDocuments(
        [const Document(pageContent: 'newDoc')],
      );
      expect(res3, isNot(res2));
    });

    test('embedQuery is not cached', () async {
      final result = await cacheBackedEmbeddings.embedQuery('testQuery');
      final storeResult = await store.get(['testQuery']);
      expect(result.first, isNotNull);
      expect(storeResult.first, isNull);
    });
  });

  group('EmbeddingsByteStoreEncoder tests', () {
    const namespace = 'test';
    const uuid = Uuid();
    const key = 'key';
    final keyHash = sha1.convert(utf8.encode(key)).toString();
    final expectedEncodedKey = uuid.v5(Uuid.NAMESPACE_URL, keyHash);
    final value = [0.1, 0.2, 0.3];
    final expectedEncodedValue =
        Uint8List.fromList(utf8.encode(json.encode(value)));

    const encoder = EmbeddingsByteStoreEncoder(namespace: namespace);

    test('encodeKey returns encoded key', () {
      final result = encoder.encodeKey(key);
      expect(result, expectedEncodedKey);
    });

    test('encodeValue returns encoded value', () {
      final result = encoder.encodeValue(value);
      expect(result, expectedEncodedValue);
    });

    test('decodeKey throws UnimplementedError', () {
      expect(
        () => encoder.decodeKey('anyKey'),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('decodeValue returns decoded value', () {
      final result = encoder.decodeValue(expectedEncodedValue);
      expect(result, value);
    });
  });
}
