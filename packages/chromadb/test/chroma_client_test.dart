@TestOn('vm')
library; // Uses dart:io

import 'package:chromadb/chromadb.dart';
import 'package:test/test.dart';

// docker run -p 8000:8000 -e "ALLOW_RESET=TRUE" chromadb/chroma
void main() async {
  group('ChromaClient tests', skip: true, () {
    final client = ChromaClient();

    test('it should reset the database', () async {
      await client.reset();
      final collections = await client.listCollections();
      expect(collections, isEmpty);

      await client.createCollection(name: 'test');
      final collections2 = await client.listCollections();
      expect(collections2, hasLength(1));

      await client.reset();
      final collections3 = await client.listCollections();
      expect(collections3, isEmpty);
    });

    test('it should get the version', () async {
      final version = await client.version();
      expect(version, matches(r'^[0-9]+\.[0-9]+\.[0-9]+$'));
    });

    test('it should get the heartbeat', () async {
      final heartbeat = await client.heartbeat();
      expect(heartbeat, greaterThan(0));
    });

    test('it should create and list collections', () async {
      await client.reset();
      final collections = await client.listCollections();
      expect(collections, isEmpty);

      await client.createCollection(name: 'test');
      final collections2 = await client.listCollections();
      expect(collections2, hasLength(1));
      expect(collections2.first.name, 'test');
    });

    test('it should create or get collections', () async {
      await client.reset();
      final collections = await client.listCollections();
      expect(collections, isEmpty);

      await client.getOrCreateCollection(name: 'test');
      final collections2 = await client.listCollections();
      expect(collections2, hasLength(1));

      await client.getOrCreateCollection(name: 'test');
      expect(collections2, hasLength(1));
    });

    test('it should get a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      final collection1 = await client.getCollection(name: 'test');
      expect(collection1.name, collection.name);
      expect(collection1.id, collection.id);
    });

    test('it should delete a collection', () async {
      await client.reset();

      await client.createCollection(name: 'test');
      final collections = await client.listCollections();
      expect(collections, hasLength(1));

      await client.deleteCollection(name: 'test');
      final collections2 = await client.listCollections();
      expect(collections2, isEmpty);
    });

    test('it should add single embeddings to a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = 'test1';
      final embeddings = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      final metadata = {'test': 'test'};
      await collection.add(
        ids: [ids],
        embeddings: [embeddings],
        metadatas: [metadata],
      );
      expect(collection.count(), completion(equals(1)));
    });

    test('it should upsert single embeddings to a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = 'test1';
      final embeddings = [1.0, 2.0, 3.0, 4.0, 5.0];
      final metadata = {'test': 'test'};
      await collection.add(
        ids: [ids],
        embeddings: [embeddings],
        metadatas: [metadata],
      );
      expect(collection.count(), completion(equals(1)));
      await collection.upsert(
        ids: [ids],
        embeddings: [embeddings],
        metadatas: [metadata],
      );
      expect(collection.count(), completion(equals(1)));
    });

    test('it should modify single embeddings to a collection', () async {
      await client.reset();
      var collections = await client.listCollections();
      expect(collections, isEmpty);

      final collection = await client.createCollection(
        name: 'test',
        metadata: {'test': 'test'},
      );
      expect(collection.name, 'test');
      expect(collection.metadata, {'test': 'test'});
      await collection.modify(
        name: 'test2',
        metadata: {'test': 'test2'},
      );

      collections = await client.listCollections();
      expect(collections, hasLength(1));
      final newCollection = await client.getCollection(name: 'test2');
      expect(newCollection.name, 'test2');
      expect(newCollection.metadata, {'test': 'test2'});
    });

    test('it should update embeddings to a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = 'test1';
      final embeddings = [1.0, 2.0, 3.0, 4.0, 5.0];
      final metadata = {'test': 'test'};
      await collection.add(
        ids: [ids],
        embeddings: [embeddings],
        metadatas: [metadata],
      );
      expect(collection.count(), completion(equals(1)));
      final embeddings1 = [5.0, 4.0, 3.0, 2.0, 1.0];
      await collection.update(
        ids: [ids],
        embeddings: [embeddings1],
        metadatas: [metadata],
      );
      expect(collection.count(), completion(equals(1)));
      final getResponse = await collection.get(ids: [ids]);
      expect(getResponse.ids, [ids]);
      expect(getResponse.embeddings, [embeddings1]);
      expect(getResponse.metadatas, [metadata]);
    });

    test('it should add batch embeddings to a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0],
        [6.0, 7.0, 8.0, 9.0, 10.0],
        [11.0, 12.0, 13.0, 14.0, 15.0],
      ];
      final List<Map<String, String>> metadata = [
        {'test': 'test1'},
        {'test': 'test2'},
        {'test': 'test3'},
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
        metadatas: metadata,
      );
      expect(collection.count(), completion(equals(3)));
      final getResponse = await collection.get(ids: ids);
      expect(getResponse.ids, ids);
      expect(getResponse.embeddings, embeddings);
      expect(getResponse.metadatas, metadata);
    });

    test('it should query a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
        [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
        [10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0],
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
      );
      expect(collection.count(), completion(equals(3)));

      final queryResponse = await collection.query(
        queryEmbeddings: [
          [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
        ],
        nResults: 2,
      );
      expect(queryResponse.ids, hasLength(1));
      expect(queryResponse.ids.first, containsAllInOrder(['test1', 'test2']));
    });

    test('it should peek a collection', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0],
        [6.0, 7.0, 8.0, 9.0, 10.0],
        [11.0, 12.0, 13.0, 14.0, 15.0],
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
      );
      expect(collection.count(), completion(equals(3)));

      final peekResponse = await collection.peek(limit: 2);
      expect(peekResponse.ids, containsAllInOrder(['test1', 'test2']));
    });

    test('it should get a collection by id or where', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0],
        [6.0, 7.0, 8.0, 9.0, 10.0],
        [11.0, 12.0, 13.0, 14.0, 15.0],
      ];
      final metadata = [
        {'test': 'test1'},
        {'test': 'test2'},
        {'test': 'test3'},
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
        metadatas: metadata,
      );
      expect(collection.count(), completion(equals(3)));

      final getResponse = await collection.get(ids: ['test1']);
      expect(getResponse.ids, hasLength(1));
      expect(getResponse.ids.first, 'test1');

      final getResponse2 = await collection.get(where: {'test': 'test2'});
      expect(getResponse2.ids, hasLength(1));
      expect(getResponse2.ids.first, 'test2');
    });

    test('it should delete a collection by id or where', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0],
        [6.0, 7.0, 8.0, 9.0, 10.0],
        [11.0, 12.0, 13.0, 14.0, 15.0],
      ];
      final metadata = [
        {'test': 'test1'},
        {'test': 'test2'},
        {'test': 'test3'},
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
        metadatas: metadata,
      );
      expect(collection.count(), completion(equals(3)));

      await collection.delete(ids: ['test1']);
      expect(collection.count(), completion(equals(2)));

      await collection.delete(where: {'test': 'test2'});
      expect(collection.count(), completion(equals(1)));
    });

    test('wrong code returns an error', () async {
      await client.reset();

      final collection = await client.createCollection(name: 'test');
      const ids = ['test1', 'test2', 'test3'];
      final embeddings = [
        [1.0, 2.0, 3.0, 4.0, 5.0],
        [6.0, 7.0, 8.0, 9.0, 10.0],
        [11.0, 12.0, 13.0, 14.0, 15.0],
      ];
      final metadata = [
        {'test': 'test1'},
        {'test': 'test2'},
        {'test': 'test3'},
      ];
      await collection.add(
        ids: ids,
        embeddings: embeddings,
        metadatas: metadata,
      );
      expect(collection.count(), completion(equals(3)));

      expect(
        () => collection.get(
          where: {
            'test': {'$contains': 'hello'},
          },
        ),
        throwsA(isA<ChromaApiClientException>()),
      );
    });
  });
}
