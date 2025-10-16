// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/chunk.dart';
import 'package:googleai_dart/src/models/corpus/chunk_data.dart';
import 'package:googleai_dart/src/models/corpus/chunk_state.dart';
import 'package:googleai_dart/src/models/corpus/document.dart';
import 'package:googleai_dart/src/models/corpus/relevant_chunk.dart';
import 'package:test/test.dart';

void main() {
  group('RelevantChunk', () {
    group('fromJson', () {
      test('creates RelevantChunk with all fields', () {
        final json = {
          'chunkRelevanceScore': 0.95,
          'chunk': {
            'name': 'corpora/c1/documents/d1/chunks/ch1',
            'data': {'stringValue': 'Chunk content'},
            'state': 'STATE_ACTIVE',
          },
          'document': {
            'name': 'corpora/c1/documents/d1',
            'displayName': 'Test Document',
          },
        };

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, 0.95);
        expect(relevantChunk.chunk, isNotNull);
        expect(relevantChunk.chunk!.name, 'corpora/c1/documents/d1/chunks/ch1');
        expect(relevantChunk.chunk!.data.stringValue, 'Chunk content');
        expect(relevantChunk.chunk!.state, ChunkState.active);
        expect(relevantChunk.document, isNotNull);
        expect(relevantChunk.document!.name, 'corpora/c1/documents/d1');
        expect(relevantChunk.document!.displayName, 'Test Document');
      });

      test('creates RelevantChunk with minimal fields', () {
        final json = <String, dynamic>{};

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, isNull);
        expect(relevantChunk.chunk, isNull);
        expect(relevantChunk.document, isNull);
      });

      test('creates RelevantChunk with null fields', () {
        final json = {
          'chunkRelevanceScore': null,
          'chunk': null,
          'document': null,
        };

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, isNull);
        expect(relevantChunk.chunk, isNull);
        expect(relevantChunk.document, isNull);
      });

      test('converts integer to double for relevance score', () {
        final json = {'chunkRelevanceScore': 1};

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, 1.0);
        expect(relevantChunk.chunkRelevanceScore, isA<double>());
      });

      test('creates RelevantChunk with only relevance score', () {
        final json = {'chunkRelevanceScore': 0.87};

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, 0.87);
        expect(relevantChunk.chunk, isNull);
        expect(relevantChunk.document, isNull);
      });

      test('creates RelevantChunk with only chunk', () {
        final json = {
          'chunk': {
            'data': {'stringValue': 'Content only'},
          },
        };

        final relevantChunk = RelevantChunk.fromJson(json);

        expect(relevantChunk.chunkRelevanceScore, isNull);
        expect(relevantChunk.chunk, isNotNull);
        expect(relevantChunk.chunk!.data.stringValue, 'Content only');
        expect(relevantChunk.document, isNull);
      });
    });

    group('toJson', () {
      test('converts RelevantChunk with all fields to JSON', () {
        const relevantChunk = RelevantChunk(
          chunkRelevanceScore: 0.92,
          chunk: Chunk(
            name: 'corpora/c2/documents/d2/chunks/ch2',
            data: ChunkData(stringValue: 'Test content'),
            state: ChunkState.active,
          ),
          document: Document(
            name: 'corpora/c2/documents/d2',
            displayName: 'Another Document',
          ),
        );

        final json = relevantChunk.toJson();

        expect(json['chunkRelevanceScore'], 0.92);
        expect(json['chunk']['name'], 'corpora/c2/documents/d2/chunks/ch2');
        expect(json['chunk']['data']['stringValue'], 'Test content');
        expect(json['chunk']['state'], 'STATE_ACTIVE');
        expect(json['document']['name'], 'corpora/c2/documents/d2');
        expect(json['document']['displayName'], 'Another Document');
      });

      test('converts RelevantChunk with minimal fields to JSON', () {
        const relevantChunk = RelevantChunk();

        final json = relevantChunk.toJson();

        expect(json.containsKey('chunkRelevanceScore'), false);
        expect(json.containsKey('chunk'), false);
        expect(json.containsKey('document'), false);
      });

      test('omits null fields from JSON', () {
        const relevantChunk = RelevantChunk(chunkRelevanceScore: 0.5);

        final json = relevantChunk.toJson();

        expect(json['chunkRelevanceScore'], 0.5);
        expect(json.containsKey('chunk'), false);
        expect(json.containsKey('document'), false);
      });

      test('includes only chunk in JSON', () {
        const relevantChunk = RelevantChunk(
          chunk: Chunk(data: ChunkData(stringValue: 'Only chunk')),
        );

        final json = relevantChunk.toJson();

        expect(json.containsKey('chunkRelevanceScore'), false);
        expect(json['chunk']['data']['stringValue'], 'Only chunk');
        expect(json.containsKey('document'), false);
      });

      test('includes only document in JSON', () {
        const relevantChunk = RelevantChunk(
          document: Document(name: 'corpora/c1/documents/d1'),
        );

        final json = relevantChunk.toJson();

        expect(json.containsKey('chunkRelevanceScore'), false);
        expect(json.containsKey('chunk'), false);
        expect(json['document']['name'], 'corpora/c1/documents/d1');
      });
    });

    test('round-trip conversion with all fields preserves data', () {
      final original = RelevantChunk(
        chunkRelevanceScore: 0.88,
        chunk: Chunk(
          name: 'corpora/c3/documents/d3/chunks/ch3',
          data: const ChunkData(stringValue: 'Roundtrip content'),
          state: ChunkState.active,
          createTime: DateTime.parse('2024-01-15T10:00:00Z'),
        ),
        document: Document(
          name: 'corpora/c3/documents/d3',
          displayName: 'Roundtrip Document',
          createTime: DateTime.parse('2024-01-10T08:00:00Z'),
        ),
      );

      final json = original.toJson();
      final restored = RelevantChunk.fromJson(json);

      expect(restored.chunkRelevanceScore, original.chunkRelevanceScore);
      expect(restored.chunk!.name, original.chunk!.name);
      expect(
        restored.chunk!.data.stringValue,
        original.chunk!.data.stringValue,
      );
      expect(restored.chunk!.state, original.chunk!.state);
      expect(restored.chunk!.createTime, original.chunk!.createTime);
      expect(restored.document!.name, original.document!.name);
      expect(restored.document!.displayName, original.document!.displayName);
      expect(restored.document!.createTime, original.document!.createTime);
    });

    test('round-trip conversion with minimal fields preserves data', () {
      const original = RelevantChunk(chunkRelevanceScore: 0.75);

      final json = original.toJson();
      final restored = RelevantChunk.fromJson(json);

      expect(restored.chunkRelevanceScore, original.chunkRelevanceScore);
      expect(restored.chunk, original.chunk);
      expect(restored.document, original.document);
    });

    group('toString', () {
      test('includes all fields', () {
        const relevantChunk = RelevantChunk(
          chunkRelevanceScore: 0.99,
          chunk: Chunk(data: ChunkData(stringValue: 'Test')),
          document: Document(name: 'corpora/c1/documents/d1'),
        );

        final str = relevantChunk.toString();

        expect(str, contains('RelevantChunk('));
        expect(str, contains('chunkRelevanceScore: 0.99'));
        expect(str, contains('chunk:'));
        expect(str, contains('document:'));
      });

      test('includes null fields', () {
        const relevantChunk = RelevantChunk();

        final str = relevantChunk.toString();

        expect(str, contains('chunkRelevanceScore: null'));
        expect(str, contains('chunk: null'));
        expect(str, contains('document: null'));
      });
    });
  });
}
