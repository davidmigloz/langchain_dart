import 'package:googleai_dart/src/models/batch/batch_state.dart';
import 'package:googleai_dart/src/models/batch/embed_content_batch.dart';
import 'package:googleai_dart/src/models/batch/input_embed_content_config.dart';
import 'package:test/test.dart';

void main() {
  group('EmbedContentBatch', () {
    test('fromJson creates EmbedContentBatch with all fields', () {
      final json = {
        'name': 'batches/embed123',
        'displayName': 'My Embed Batch',
        'model': 'models/text-embedding-004',
        'inputConfig': {
          'fileName': 'gs://bucket/embeds.jsonl',
        },
        'createTime': '2025-01-15T10:30:00Z',
        'endTime': '2025-01-15T10:35:00Z',
        'updateTime': '2025-01-15T10:34:59Z',
        'batchStats': {
          'requestCount': '100',
          'successfulRequestCount': '95',
          'failedRequestCount': '5',
          'pendingRequestCount': '0',
        },
        'state': 'BATCH_STATE_SUCCEEDED',
        'priority': '3',
      };

      final batch = EmbedContentBatch.fromJson(json);

      expect(batch.name, 'batches/embed123');
      expect(batch.displayName, 'My Embed Batch');
      expect(batch.model, 'models/text-embedding-004');
      expect(batch.inputConfig, isNotNull);
      expect(batch.createTime, DateTime.parse('2025-01-15T10:30:00Z'));
      expect(batch.endTime, DateTime.parse('2025-01-15T10:35:00Z'));
      expect(batch.updateTime, DateTime.parse('2025-01-15T10:34:59Z'));
      expect(batch.batchStats, isNotNull);
      expect(batch.batchStats!.requestCount, 100);
      expect(batch.state, BatchState.succeeded);
      expect(batch.priority, 3);
    });

    test('fromJson creates EmbedContentBatch with minimal required fields', () {
      final json = {
        'displayName': 'Minimal Embed',
        'model': 'models/text-embedding-004',
        'inputConfig': {
          'fileName': 'embeds.jsonl',
        },
      };

      final batch = EmbedContentBatch.fromJson(json);

      expect(batch.displayName, 'Minimal Embed');
      expect(batch.model, 'models/text-embedding-004');
      expect(batch.inputConfig, isNotNull);
      expect(batch.name, isNull);
      expect(batch.output, isNull);
      expect(batch.createTime, isNull);
      expect(batch.state, isNull);
    });

    test('toJson creates JSON with all fields', () {
      final batch = EmbedContentBatch(
        displayName: 'Test Embed',
        model: 'models/text-embedding-004',
        inputConfig: const InputEmbedContentConfig(
          fileName: 'embeds.jsonl',
        ),
        name: 'batches/test',
        createTime: DateTime.parse('2025-01-15T10:00:00Z'),
        state: BatchState.running,
        priority: -5,
      );

      final json = batch.toJson();

      expect(json['name'], 'batches/test');
      expect(json['displayName'], 'Test Embed');
      expect(json['model'], 'models/text-embedding-004');
      expect(json['createTime'], '2025-01-15T10:00:00.000Z');
      expect(json['state'], 'BATCH_STATE_RUNNING');
      expect(json['priority'], '-5');
    });

    test('toJson omits null fields', () {
      const batch = EmbedContentBatch(
        displayName: 'Minimal',
        model: 'models/text-embedding-004',
        inputConfig: InputEmbedContentConfig(fileName: 'file.jsonl'),
      );

      final json = batch.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('output'), isFalse);
      expect(json.containsKey('batchStats'), isFalse);
      expect(json.containsKey('state'), isFalse);
    });

    test('round-trip conversion preserves values', () {
      const original = EmbedContentBatch(
        displayName: 'Round Trip',
        model: 'models/text-embedding-004',
        inputConfig: InputEmbedContentConfig(fileName: 'test.jsonl'),
        name: 'batches/test',
        priority: 0,
      );

      final json = original.toJson();
      final converted = EmbedContentBatch.fromJson(json);

      expect(converted.displayName, original.displayName);
      expect(converted.model, original.model);
      expect(converted.name, original.name);
      expect(converted.priority, original.priority);
    });
  });
}
