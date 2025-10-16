@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Batch API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(apiKey: Platform.environment['OPENAI_API_KEY']);
    });

    tearDown(() {
      client.endSession();
    });

    test('Test create batch job', skip: true, () async {
      const request = CreateBatchRequest(
        inputFileId: 'file-abc123',
        endpoint: BatchEndpoint.v1ChatCompletions,
        completionWindow: BatchCompletionWindow.v24h,
      );
      final res = await client.createBatch(request: request);
      expect(res.id, isNotEmpty);
      expect(res.object, BatchObject.batch);
      expect(res.endpoint, BatchEndpoint.v1ChatCompletions);
      expect(res.errors, isNull);
      expect(res.inputFileId, 'file-abc123');
      expect(res.completionWindow, BatchCompletionWindow.v24h);
      expect(res.status, BatchStatus.inProgress);
      expect(res.createdAt, greaterThan(0));
    });

    test('Test retrieve batch job', skip: true, () async {
      final res = await client.retrieveBatch(batchId: 'batch_abc123');
      expect(res.id, 'batch_abc123');
    });

    test('Test cancel fine-tuning jobs', skip: true, () async {
      final res = await client.cancelBatch(batchId: 'batch_abc123');
      expect(res.status, BatchStatus.cancelled);
    });
  });
}
