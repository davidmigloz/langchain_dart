import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('FunctionCall', () {
    group('fromJson', () {
      test('creates FunctionCall with all fields', () {
        final json = {
          'id': 'call_123',
          'name': 'get_weather',
          'args': {'city': 'London', 'units': 'celsius'},
        };

        final call = FunctionCall.fromJson(json);

        expect(call.id, 'call_123');
        expect(call.name, 'get_weather');
        expect(call.args, {'city': 'London', 'units': 'celsius'});
      });

      test('creates FunctionCall without id', () {
        final json = {
          'name': 'get_weather',
          'args': {'city': 'London'},
        };

        final call = FunctionCall.fromJson(json);

        expect(call.id, isNull);
        expect(call.name, 'get_weather');
        expect(call.args, {'city': 'London'});
      });

      test('creates FunctionCall with only required fields', () {
        final json = {'name': 'simple_function'};

        final call = FunctionCall.fromJson(json);

        expect(call.id, isNull);
        expect(call.name, 'simple_function');
        expect(call.args, isNull);
      });
    });

    group('toJson', () {
      test('includes all fields when present', () {
        const call = FunctionCall(
          id: 'call_456',
          name: 'test_function',
          args: {'param': 'value'},
        );

        final json = call.toJson();

        expect(json['id'], 'call_456');
        expect(json['name'], 'test_function');
        expect(json['args'], {'param': 'value'});
      });

      test('omits null fields', () {
        const call = FunctionCall(name: 'minimal_function');

        final json = call.toJson();

        expect(json['name'], 'minimal_function');
        expect(json.containsKey('id'), false);
        expect(json.containsKey('args'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = FunctionCall(
          id: 'call_789',
          name: 'original_function',
          args: {'key': 'value'},
        );

        final copied = original.copyWith();

        expect(copied.id, original.id);
        expect(copied.name, original.name);
        expect(copied.args, original.args);
      });

      test('updates specified fields only', () {
        const original = FunctionCall(
          id: 'call_123',
          name: 'original',
          args: {'a': 1},
        );

        final updated = original.copyWith(name: 'updated');

        expect(updated.id, 'call_123');
        expect(updated.name, 'updated');
        expect(updated.args, {'a': 1});
      });

      test('can set optional values to null', () {
        const original = FunctionCall(
          id: 'call_123',
          name: 'test',
          args: {'a': 1},
        );

        final updated = original.copyWith(id: null, args: null);

        expect(updated.id, isNull);
        expect(updated.name, 'test');
        expect(updated.args, isNull);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = FunctionCall(
        id: 'round_trip_id',
        name: 'round_trip_function',
        args: {
          'nested': {'deep': 'value'},
        },
      );

      final json = original.toJson();
      final restored = FunctionCall.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.args, original.args);
    });

    test('id field is critical for Live API tool call correlation', () {
      // This test documents the importance of the id field
      // for matching tool responses to requests in Live API sessions
      const callWithId = FunctionCall(
        id: 'unique_call_id',
        name: 'tracked_function',
        args: {'input': 'data'},
      );

      final json = callWithId.toJson();

      // The id must be present in serialized form
      expect(json.containsKey('id'), true);
      expect(json['id'], 'unique_call_id');

      // And preserved through round-trip
      final restored = FunctionCall.fromJson(json);
      expect(restored.id, 'unique_call_id');
    });
  });
}
