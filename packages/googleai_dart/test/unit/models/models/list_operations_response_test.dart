// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/models/list_operations_response.dart';
import 'package:googleai_dart/src/models/models/operation.dart';
import 'package:test/test.dart';

void main() {
  group('ListOperationsResponse', () {
    test('fromJson creates response with operations and nextPageToken', () {
      final json = {
        'operations': [
          {
            'name': 'operations/op-1',
            'done': true,
          },
          {
            'name': 'operations/op-2',
            'done': false,
          },
        ],
        'nextPageToken': 'next-page-token-123',
      };

      final response = ListOperationsResponse.fromJson(json);

      expect(response.operations, hasLength(2));
      expect(response.operations[0].name, 'operations/op-1');
      expect(response.operations[1].name, 'operations/op-2');
      expect(response.nextPageToken, 'next-page-token-123');
      expect(response.unreachable, isNull);
    });

    test('fromJson creates response with unreachable resources', () {
      final json = {
        'operations': [
          {
            'name': 'operations/op-1',
            'done': true,
          },
        ],
        'nextPageToken': 'token-123',
        'unreachable': ['resource-1', 'resource-2'],
      };

      final response = ListOperationsResponse.fromJson(json);

      expect(response.operations, hasLength(1));
      expect(response.nextPageToken, 'token-123');
      expect(response.unreachable, hasLength(2));
      expect(response.unreachable, contains('resource-1'));
      expect(response.unreachable, contains('resource-2'));
    });

    test('fromJson creates response with empty operations list', () {
      final json = {
        'operations': <Map<String, dynamic>>[],
      };

      final response = ListOperationsResponse.fromJson(json);

      expect(response.operations, isEmpty);
      expect(response.nextPageToken, isNull);
      expect(response.unreachable, isNull);
    });

    test('fromJson handles missing operations field', () {
      final json = <String, dynamic>{};

      final response = ListOperationsResponse.fromJson(json);

      expect(response.operations, isEmpty);
      expect(response.nextPageToken, isNull);
    });

    test('toJson serializes response with all fields', () {
      const response = ListOperationsResponse(
        operations: [
          Operation(
            name: 'operations/op-1',
            done: true,
          ),
        ],
        nextPageToken: 'token-123',
        unreachable: ['resource-1'],
      );

      final json = response.toJson();

      expect(json['operations'], hasLength(1));
      expect(json['operations'][0]['name'], 'operations/op-1');
      expect(json['nextPageToken'], 'token-123');
      expect(json['unreachable'], ['resource-1']);
    });

    test('toJson omits null fields', () {
      const response = ListOperationsResponse(
        operations: [
          Operation(
            name: 'operations/op-1',
            done: true,
          ),
        ],
      );

      final json = response.toJson();

      expect(json.containsKey('nextPageToken'), isFalse);
      expect(json.containsKey('unreachable'), isFalse);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'operations': [
          {
            'name': 'operations/op-1',
            'done': true,
            'metadata': {'key': 'value'},
          },
        ],
        'nextPageToken': 'token-abc',
        'unreachable': ['resource-1'],
      };

      final response = ListOperationsResponse.fromJson(original);
      final serialized = response.toJson();

      expect(serialized['operations'], hasLength(1));
      final originalOperations = original['operations']! as List;
      final originalOperation = originalOperations[0] as Map<String, dynamic>;
      expect(
        (serialized['operations'] as List)[0]['name'],
        originalOperation['name'],
      );
      expect(serialized['nextPageToken'], original['nextPageToken']);
      expect(serialized['unreachable'], original['unreachable']);
    });

    test('copyWith creates copy with replaced values', () {
      const original = ListOperationsResponse(
        operations: [
          Operation(
            name: 'operations/op-1',
            done: true,
          ),
        ],
        nextPageToken: 'token-1',
        unreachable: ['resource-1'],
      );

      final copy = original.copyWith(
        nextPageToken: 'token-2',
        unreachable: ['resource-2'],
      );

      expect(copy.operations, same(original.operations));
      expect(copy.nextPageToken, 'token-2');
      expect(copy.unreachable, ['resource-2']);
    });
  });
}
