import 'package:googleai_dart/src/models/batch/batch_state.dart';
import 'package:googleai_dart/src/models/batch/generate_content_batch.dart';
import 'package:googleai_dart/src/models/batch/input_config.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateContentBatch', () {
    test('fromJson creates GenerateContentBatch with all fields', () {
      final json = {
        'name': 'batches/abc123',
        'displayName': 'My Test Batch',
        'model': 'models/gemini-pro',
        'inputConfig': {
          'requests': {
            'requests': [
              {
                'request': {
                  'contents': [
                    {
                      'parts': [
                        {'text': 'Hello'},
                      ],
                      'role': 'user',
                    },
                  ],
                },
              },
            ],
          },
        },
        'output': {
          'inlinedResponses': {
            'inlinedResponses': [
              {
                'response': {
                  'candidates': [
                    {
                      'content': {
                        'parts': [
                          {'text': 'Hi there!'},
                        ],
                        'role': 'model',
                      },
                      'finishReason': 'STOP',
                    },
                  ],
                },
              },
            ],
          },
        },
        'createTime': '2025-01-15T10:30:00Z',
        'endTime': '2025-01-15T10:35:00Z',
        'updateTime': '2025-01-15T10:34:59Z',
        'batchStats': {
          'requestCount': '1',
          'successfulRequestCount': '1',
          'failedRequestCount': '0',
          'pendingRequestCount': '0',
        },
        'state': 'BATCH_STATE_SUCCEEDED',
        'priority': '5',
      };

      final batch = GenerateContentBatch.fromJson(json);

      expect(batch.name, 'batches/abc123');
      expect(batch.displayName, 'My Test Batch');
      expect(batch.model, 'models/gemini-pro');
      expect(batch.inputConfig, isNotNull);
      expect(batch.output, isNotNull);
      expect(batch.createTime, DateTime.parse('2025-01-15T10:30:00Z'));
      expect(batch.endTime, DateTime.parse('2025-01-15T10:35:00Z'));
      expect(batch.updateTime, DateTime.parse('2025-01-15T10:34:59Z'));
      expect(batch.batchStats, isNotNull);
      expect(batch.batchStats!.requestCount, 1);
      expect(batch.state, BatchState.succeeded);
      expect(batch.priority, 5);
    });

    test(
      'fromJson creates GenerateContentBatch with minimal required fields',
      () {
        final json = {
          'displayName': 'Minimal Batch',
          'model': 'models/gemini-pro',
          'inputConfig': {
            'fileName': 'gs://bucket/input.jsonl',
          },
        };

        final batch = GenerateContentBatch.fromJson(json);

        expect(batch.displayName, 'Minimal Batch');
        expect(batch.model, 'models/gemini-pro');
        expect(batch.inputConfig, isNotNull);
        expect(batch.name, isNull);
        expect(batch.output, isNull);
        expect(batch.createTime, isNull);
        expect(batch.endTime, isNull);
        expect(batch.updateTime, isNull);
        expect(batch.batchStats, isNull);
        expect(batch.state, isNull);
        expect(batch.priority, isNull);
      },
    );

    test('fromJson handles file-based input config', () {
      final json = {
        'displayName': 'File Batch',
        'model': 'models/gemini-pro',
        'inputConfig': {
          'fileName': 'gs://my-bucket/requests.jsonl',
        },
      };

      final batch = GenerateContentBatch.fromJson(json);

      expect(batch.inputConfig!.fileName, 'gs://my-bucket/requests.jsonl');
      expect(batch.inputConfig!.requests, isNull);
    });

    test('fromJson handles inlined requests input config', () {
      final json = {
        'displayName': 'Inline Batch',
        'model': 'models/gemini-pro',
        'inputConfig': {
          'requests': {
            'requests': [
              {
                'request': {
                  'contents': [
                    {
                      'parts': [
                        {'text': 'Test'},
                      ],
                      'role': 'user',
                    },
                  ],
                },
              },
            ],
          },
        },
      };

      final batch = GenerateContentBatch.fromJson(json);

      expect(batch.inputConfig!.requests, isNotNull);
      expect(batch.inputConfig!.requests!.requests.length, 1);
      expect(batch.inputConfig!.fileName, isNull);
    });

    test('toJson creates JSON with all fields', () {
      final batch = GenerateContentBatch(
        displayName: 'Test Batch',
        model: 'models/gemini-pro',
        inputConfig: const InputConfig(fileName: 'gs://bucket/input.jsonl'),
        name: 'batches/abc123',
        createTime: DateTime.parse('2025-01-15T10:30:00Z'),
        state: BatchState.running,
        priority: 10,
      );

      final json = batch.toJson();

      expect(json['name'], 'batches/abc123');
      expect(json['displayName'], 'Test Batch');
      expect(json['model'], 'models/gemini-pro');
      expect(json['inputConfig'], isNotNull);
      expect(json['createTime'], '2025-01-15T10:30:00.000Z');
      expect(json['state'], 'BATCH_STATE_RUNNING');
      expect(json['priority'], '10');
    });

    test('toJson omits null fields', () {
      const batch = GenerateContentBatch(
        displayName: 'Minimal',
        model: 'models/gemini-pro',
        inputConfig: InputConfig(fileName: 'file.jsonl'),
      );

      final json = batch.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('output'), isFalse);
      expect(json.containsKey('createTime'), isFalse);
      expect(json.containsKey('endTime'), isFalse);
      expect(json.containsKey('updateTime'), isFalse);
      expect(json.containsKey('batchStats'), isFalse);
      expect(json.containsKey('state'), isFalse);
      expect(json.containsKey('priority'), isFalse);
    });

    test('handles negative priority', () {
      const batch = GenerateContentBatch(
        displayName: 'Low Priority',
        model: 'models/gemini-pro',
        inputConfig: InputConfig(fileName: 'file.jsonl'),
        priority: -10,
      );

      final json = batch.toJson();
      final converted = GenerateContentBatch.fromJson(json);

      expect(converted.priority, -10);
    });

    test('round-trip conversion preserves values', () {
      const original = GenerateContentBatch(
        displayName: 'Round Trip',
        model: 'models/gemini-pro',
        inputConfig: InputConfig(fileName: 'test.jsonl'),
        name: 'batches/test123',
        priority: 0,
        state: BatchState.pending,
      );

      final json = original.toJson();
      final converted = GenerateContentBatch.fromJson(json);

      expect(converted.displayName, original.displayName);
      expect(converted.model, original.model);
      expect(converted.name, original.name);
      expect(converted.priority, original.priority);
      expect(converted.state, original.state);
    });
  });
}
