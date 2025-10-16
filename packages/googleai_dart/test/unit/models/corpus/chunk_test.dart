// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/chunk.dart';
import 'package:googleai_dart/src/models/corpus/chunk_data.dart';
import 'package:googleai_dart/src/models/corpus/chunk_state.dart';
import 'package:googleai_dart/src/models/corpus/custom_metadata.dart';
import 'package:test/test.dart';

void main() {
  group('Chunk', () {
    group('fromJson', () {
      test('creates Chunk with all fields', () {
        final json = {
          'name': 'corpora/c1/documents/d1/chunks/chunk-123',
          'data': {'stringValue': 'This is chunk content'},
          'customMetadata': [
            {'key': 'author', 'stringValue': 'Bob'},
            {'key': 'page', 'numericValue': 42.0},
          ],
          'createTime': '2024-01-15T10:30:00Z',
          'updateTime': '2024-01-16T14:45:00Z',
          'state': 'STATE_ACTIVE',
        };

        final chunk = Chunk.fromJson(json);

        expect(chunk.name, 'corpora/c1/documents/d1/chunks/chunk-123');
        expect(chunk.data.stringValue, 'This is chunk content');
        expect(chunk.customMetadata, hasLength(2));
        expect(chunk.customMetadata![0].key, 'author');
        expect(chunk.customMetadata![0].stringValue, 'Bob');
        expect(chunk.customMetadata![1].key, 'page');
        expect(chunk.customMetadata![1].numericValue, 42.0);
        expect(chunk.createTime, DateTime.parse('2024-01-15T10:30:00Z'));
        expect(chunk.updateTime, DateTime.parse('2024-01-16T14:45:00Z'));
        expect(chunk.state, ChunkState.active);
      });

      test('creates Chunk with minimal required fields', () {
        final json = {
          'data': {'stringValue': 'Required data'},
        };

        final chunk = Chunk.fromJson(json);

        expect(chunk.name, isNull);
        expect(chunk.data.stringValue, 'Required data');
        expect(chunk.customMetadata, isNull);
        expect(chunk.createTime, isNull);
        expect(chunk.updateTime, isNull);
        expect(chunk.state, isNull);
      });

      test('creates Chunk with null optional fields', () {
        final json = {
          'name': null,
          'data': {'stringValue': 'Data value'},
          'customMetadata': null,
          'createTime': null,
          'updateTime': null,
          'state': null,
        };

        final chunk = Chunk.fromJson(json);

        expect(chunk.name, isNull);
        expect(chunk.data.stringValue, 'Data value');
        expect(chunk.customMetadata, isNull);
        expect(chunk.createTime, isNull);
        expect(chunk.updateTime, isNull);
        expect(chunk.state, isNull);
      });

      test('creates Chunk with empty customMetadata list', () {
        final json = {
          'data': {'stringValue': 'Content'},
          'customMetadata': <dynamic>[],
        };

        final chunk = Chunk.fromJson(json);

        expect(chunk.customMetadata, isEmpty);
      });

      test('parses DateTime from ISO 8601 string', () {
        final json = {
          'data': {'stringValue': 'Content'},
          'createTime': '2024-01-15T10:30:00.123Z',
          'updateTime': '2024-01-16T14:45:30.456Z',
        };

        final chunk = Chunk.fromJson(json);

        expect(chunk.createTime, DateTime.parse('2024-01-15T10:30:00.123Z'));
        expect(chunk.updateTime, DateTime.parse('2024-01-16T14:45:30.456Z'));
      });

      test('parses ChunkState correctly', () {
        final json1 = {
          'data': {'stringValue': 'Content'},
          'state': 'STATE_PENDING_PROCESSING',
        };
        final json2 = {
          'data': {'stringValue': 'Content'},
          'state': 'STATE_ACTIVE',
        };
        final json3 = {
          'data': {'stringValue': 'Content'},
          'state': 'STATE_FAILED',
        };

        expect(Chunk.fromJson(json1).state, ChunkState.pendingProcessing);
        expect(Chunk.fromJson(json2).state, ChunkState.active);
        expect(Chunk.fromJson(json3).state, ChunkState.failed);
      });
    });

    group('toJson', () {
      test('converts Chunk with all fields to JSON', () {
        final chunk = Chunk(
          name: 'corpora/c2/documents/d2/chunks/chunk-456',
          data: const ChunkData(stringValue: 'Chunk text content'),
          customMetadata: [
            const CustomMetadata(key: 'category', stringValue: 'tech'),
            const CustomMetadata(key: 'priority', numericValue: 5.0),
          ],
          createTime: DateTime.parse('2024-02-20T08:15:00Z'),
          updateTime: DateTime.parse('2024-02-21T16:30:00Z'),
          state: ChunkState.active,
        );

        final json = chunk.toJson();

        expect(json['name'], 'corpora/c2/documents/d2/chunks/chunk-456');
        expect(json['data']['stringValue'], 'Chunk text content');
        expect(json['customMetadata'], hasLength(2));
        expect(json['customMetadata'][0]['key'], 'category');
        expect(json['customMetadata'][0]['stringValue'], 'tech');
        expect(json['customMetadata'][1]['key'], 'priority');
        expect(json['customMetadata'][1]['numericValue'], 5.0);
        expect(json['createTime'], '2024-02-20T08:15:00.000Z');
        expect(json['updateTime'], '2024-02-21T16:30:00.000Z');
        expect(json['state'], 'STATE_ACTIVE');
      });

      test('converts Chunk with minimal required fields to JSON', () {
        const chunk = Chunk(data: ChunkData(stringValue: 'Required data'));

        final json = chunk.toJson();

        expect(json.containsKey('name'), false);
        expect(json['data']['stringValue'], 'Required data');
        expect(json.containsKey('customMetadata'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
        expect(json.containsKey('state'), false);
      });

      test('omits null fields from JSON', () {
        const chunk = Chunk(
          name: 'corpora/c1/documents/d1/chunks/chunk-123',
          data: ChunkData(stringValue: 'Content'),
        );

        final json = chunk.toJson();

        expect(json['name'], 'corpora/c1/documents/d1/chunks/chunk-123');
        expect(json['data']['stringValue'], 'Content');
        expect(json.containsKey('customMetadata'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
        expect(json.containsKey('state'), false);
      });

      test('includes empty customMetadata list in JSON', () {
        const chunk = Chunk(
          data: ChunkData(stringValue: 'Content'),
          customMetadata: [],
        );

        final json = chunk.toJson();

        expect(json['customMetadata'], isEmpty);
      });

      test('formats DateTime as ISO 8601 string', () {
        final chunk = Chunk(
          data: const ChunkData(stringValue: 'Content'),
          createTime: DateTime.parse('2024-03-10T12:00:00.123Z'),
          updateTime: DateTime.parse('2024-03-11T18:45:30.456Z'),
        );

        final json = chunk.toJson();

        expect(json['createTime'], '2024-03-10T12:00:00.123Z');
        expect(json['updateTime'], '2024-03-11T18:45:30.456Z');
      });

      test('converts ChunkState to string correctly', () {
        const chunk1 = Chunk(
          data: ChunkData(stringValue: 'Content'),
          state: ChunkState.pendingProcessing,
        );
        const chunk2 = Chunk(
          data: ChunkData(stringValue: 'Content'),
          state: ChunkState.active,
        );
        const chunk3 = Chunk(
          data: ChunkData(stringValue: 'Content'),
          state: ChunkState.failed,
        );

        expect(chunk1.toJson()['state'], 'STATE_PENDING_PROCESSING');
        expect(chunk2.toJson()['state'], 'STATE_ACTIVE');
        expect(chunk3.toJson()['state'], 'STATE_FAILED');
      });
    });

    test('round-trip conversion preserves data', () {
      final original = Chunk(
        name: 'corpora/c-abc/documents/d-xyz/chunks/chunk-789',
        data: const ChunkData(stringValue: 'Roundtrip test content'),
        customMetadata: [
          const CustomMetadata(key: 'field1', stringValue: 'value1'),
          const CustomMetadata(key: 'field2', numericValue: 99.9),
        ],
        createTime: DateTime.parse('2024-04-05T10:20:30Z'),
        updateTime: DateTime.parse('2024-04-06T11:21:31Z'),
        state: ChunkState.active,
      );

      final json = original.toJson();
      final restored = Chunk.fromJson(json);

      expect(restored.name, original.name);
      expect(restored.data.stringValue, original.data.stringValue);
      expect(restored.customMetadata, hasLength(2));
      expect(restored.customMetadata![0].key, original.customMetadata![0].key);
      expect(
        restored.customMetadata![0].stringValue,
        original.customMetadata![0].stringValue,
      );
      expect(restored.customMetadata![1].key, original.customMetadata![1].key);
      expect(
        restored.customMetadata![1].numericValue,
        original.customMetadata![1].numericValue,
      );
      expect(restored.createTime, original.createTime);
      expect(restored.updateTime, original.updateTime);
      expect(restored.state, original.state);
    });

    group('toString', () {
      test('includes all fields', () {
        final chunk = Chunk(
          name: 'corpora/c1/documents/d1/chunks/chunk-123',
          data: const ChunkData(stringValue: 'Test content'),
          customMetadata: [
            const CustomMetadata(key: 'test', stringValue: 'value'),
          ],
          createTime: DateTime.parse('2024-05-01T08:00:00Z'),
          updateTime: DateTime.parse('2024-05-02T09:00:00Z'),
          state: ChunkState.active,
        );

        final str = chunk.toString();

        expect(str, contains('Chunk('));
        expect(str, contains('name: corpora/c1/documents/d1/chunks/chunk-123'));
        expect(str, contains('data:'));
        expect(str, contains('customMetadata:'));
        expect(str, contains('createTime:'));
        expect(str, contains('updateTime:'));
        expect(str, contains('state: ChunkState.active'));
      });

      test('includes null fields', () {
        const chunk = Chunk(data: ChunkData(stringValue: 'Content'));

        final str = chunk.toString();

        expect(str, contains('name: null'));
        expect(str, contains('customMetadata: null'));
        expect(str, contains('createTime: null'));
        expect(str, contains('updateTime: null'));
        expect(str, contains('state: null'));
      });
    });
  });
}
