import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('FunctionResponse', () {
    group('fromJson', () {
      test('creates FunctionResponse with all fields', () {
        final json = {
          'id': 'call_123',
          'name': 'get_weather',
          'response': {'temperature': 20, 'conditions': 'sunny'},
        };

        final response = FunctionResponse.fromJson(json);

        expect(response.id, 'call_123');
        expect(response.name, 'get_weather');
        expect(response.response, {'temperature': 20, 'conditions': 'sunny'});
      });

      test('creates FunctionResponse without id', () {
        final json = {
          'name': 'get_weather',
          'response': {'temperature': 25},
        };

        final response = FunctionResponse.fromJson(json);

        expect(response.id, isNull);
        expect(response.name, 'get_weather');
        expect(response.response, {'temperature': 25});
      });
    });

    group('toJson', () {
      test('includes all fields when present', () {
        const response = FunctionResponse(
          id: 'call_456',
          name: 'test_function',
          response: {'result': 'success'},
        );

        final json = response.toJson();

        expect(json['id'], 'call_456');
        expect(json['name'], 'test_function');
        expect(json['response'], {'result': 'success'});
      });

      test('omits null id field', () {
        const response = FunctionResponse(
          name: 'minimal_function',
          response: {'data': 'value'},
        );

        final json = response.toJson();

        expect(json['name'], 'minimal_function');
        expect(json['response'], {'data': 'value'});
        expect(json.containsKey('id'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = FunctionResponse(
          id: 'resp_789',
          name: 'original_function',
          response: {'key': 'value'},
        );

        final copied = original.copyWith();

        expect(copied.id, original.id);
        expect(copied.name, original.name);
        expect(copied.response, original.response);
      });

      test('updates specified fields only', () {
        const original = FunctionResponse(
          id: 'resp_123',
          name: 'original',
          response: {'a': 1},
        );

        final updated = original.copyWith(name: 'updated');

        expect(updated.id, 'resp_123');
        expect(updated.name, 'updated');
        expect(updated.response, {'a': 1});
      });

      test('can set id to null', () {
        const original = FunctionResponse(
          id: 'resp_123',
          name: 'test',
          response: {'a': 1},
        );

        final updated = original.copyWith(id: null);

        expect(updated.id, isNull);
        expect(updated.name, 'test');
        expect(updated.response, {'a': 1});
      });
    });

    test('round-trip conversion preserves data', () {
      const original = FunctionResponse(
        id: 'round_trip_id',
        name: 'round_trip_function',
        response: {
          'nested': {'deep': 'value'},
        },
      );

      final json = original.toJson();
      final restored = FunctionResponse.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.response, original.response);
    });

    test('id field is critical for Live API tool call correlation', () {
      // This test documents the importance of the id field
      // for matching tool responses to the original function call requests
      // in Live API sessions
      const responseWithId = FunctionResponse(
        id: 'unique_call_id',
        name: 'tracked_function',
        response: {'output': 'data'},
      );

      final json = responseWithId.toJson();

      // The id must be present in serialized form
      expect(json.containsKey('id'), true);
      expect(json['id'], 'unique_call_id');

      // And preserved through round-trip
      final restored = FunctionResponse.fromJson(json);
      expect(restored.id, 'unique_call_id');
    });
  });
}
