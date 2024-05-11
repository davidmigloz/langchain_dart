@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Vector Stores API tests',
      timeout: const Timeout(Duration(minutes: 5)), () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() async {
      client.endSession();
    });

    test('Test vector stores', () async {
      final res1 = await client.createVectorStore(
        request: const CreateVectorStoreRequest(
          name: 'test_vs',
        ),
      );
      final id = res1.id;
      expect(res1.id, isNotEmpty);
      expect(res1.createdAt, greaterThan(0));
      expect(res1.name, 'test_vs');
      expect(res1.usageBytes, 0);
      expect(res1.fileCounts.inProgress, 0);
      expect(res1.fileCounts.completed, 0);
      expect(res1.fileCounts.failed, 0);
      expect(res1.fileCounts.cancelled, 0);
      expect(res1.fileCounts.total, 0);
      expect(res1.status, VectorStoreObjectStatus.completed);
      expect(res1.expiresAfter, isNull);
      expect(res1.expiresAt, isNull);
      expect(res1.lastActiveAt, greaterThan(0));
      expect(res1.metadata, isEmpty);

      final res2 = await client.listVectorStores();
      expect(res2.firstId, isNotEmpty);
      expect(res2.lastId, isNotEmpty);
      expect(res2.hasMore, isFalse);
      expect(res2.data, isNotEmpty);
      expect(res2.data.any((vs) => vs.id == id), isTrue);

      final res3 = await client.getVectorStore(vectorStoreId: id);
      expect(res3.id, id);
      expect(res3.name, 'test_vs');

      final res4 = await client.modifyVectorStore(
        vectorStoreId: id,
        request: const UpdateVectorStoreRequest(
          name: 'test_vs_new',
        ),
      );
      expect(res4.id, id);
      expect(res4.name, 'test_vs_new');

      final res5 = await client.getVectorStore(vectorStoreId: id);
      expect(res5.id, id);
      expect(res5.name, 'test_vs_new');

      final res6 = await client.deleteVectorStore(vectorStoreId: id);
      expect(res6.id, id);
      expect(res6.deleted, isTrue);

      final res7 = await client.listVectorStores();
      expect(res7.data.any((vs) => vs.id == id), isFalse);
    });
  });
}
