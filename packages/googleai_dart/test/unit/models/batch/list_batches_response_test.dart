import 'package:googleai_dart/src/models/batch/list_batches_response.dart';
import 'package:googleai_dart/src/models/models/operation.dart';
import 'package:test/test.dart';

void main() {
  group('ListBatchesResponse', () {
    test('fromJson creates ListBatchesResponse with all fields', () {
      final json = {
        'operations': [
          {'name': 'operations/abc123', 'done': false},
          {
            'name': 'operations/def456',
            'done': true,
            'response': {'@type': 'type.googleapis.com/google.api.Batch'},
          },
        ],
        'nextPageToken': 'token123',
        'unreachable': ['operations/ghi789'],
      };

      final response = ListBatchesResponse.fromJson(json);

      expect(response.operations, isNotNull);
      expect(response.operations!.length, 2);
      expect(response.operations![0].name, 'operations/abc123');
      expect(response.operations![1].name, 'operations/def456');
      expect(response.nextPageToken, 'token123');
      expect(response.unreachable, isNotNull);
      expect(response.unreachable!.length, 1);
      expect(response.unreachable![0], 'operations/ghi789');
    });

    test('fromJson creates ListBatchesResponse with null fields', () {
      final json = <String, dynamic>{};

      final response = ListBatchesResponse.fromJson(json);

      expect(response.operations, isNull);
      expect(response.nextPageToken, isNull);
      expect(response.unreachable, isNull);
    });

    test('fromJson handles empty operations list', () {
      final json = {'operations': <dynamic>[]};

      final response = ListBatchesResponse.fromJson(json);

      expect(response.operations, isNotNull);
      expect(response.operations!.length, 0);
    });

    test('toJson creates JSON with all fields', () {
      const response = ListBatchesResponse(
        operations: [Operation(name: 'operations/abc123', done: false)],
        nextPageToken: 'token123',
        unreachable: ['operations/ghi789'],
      );

      final json = response.toJson();

      expect(json['operations'], isA<List<dynamic>>());
      expect(json['nextPageToken'], 'token123');
      expect(json['unreachable'], ['operations/ghi789']);
    });

    test('toJson omits null fields', () {
      const response = ListBatchesResponse();

      final json = response.toJson();

      expect(json, isEmpty);
    });

    test('round-trip conversion preserves values', () {
      const original = ListBatchesResponse(
        operations: [Operation(name: 'operations/abc', done: true)],
        nextPageToken: 'next',
      );

      final json = original.toJson();
      final converted = ListBatchesResponse.fromJson(json);

      expect(converted.operations!.length, original.operations!.length);
      expect(converted.nextPageToken, original.nextPageToken);
    });
  });
}
