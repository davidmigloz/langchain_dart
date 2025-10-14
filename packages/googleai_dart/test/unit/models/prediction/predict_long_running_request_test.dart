import 'package:googleai_dart/src/models/prediction/predict_long_running_request.dart';
import 'package:test/test.dart';

void main() {
  group('PredictLongRunningRequest', () {
    test('fromJson creates request with all fields', () {
      final json = {
        'instances': [
          {'prompt': 'Generate a long video'},
        ],
        'parameters': {'duration': 30},
      };

      final request = PredictLongRunningRequest.fromJson(json);

      expect(request.instances, hasLength(1));
      expect(request.instances[0], isA<Map<String, dynamic>>());
      expect(
        (request.instances[0] as Map<String, dynamic>)['prompt'],
        'Generate a long video',
      );
      expect(request.parameters, isA<Map<String, dynamic>>());
      expect((request.parameters as Map<String, dynamic>)['duration'], 30);
    });

    test('fromJson creates request with minimal fields', () {
      final json = {
        'instances': ['prompt1'],
      };

      final request = PredictLongRunningRequest.fromJson(json);

      expect(request.instances, hasLength(1));
      expect(request.parameters, isNull);
    });

    test('toJson serializes request with all fields', () {
      const request = PredictLongRunningRequest(
        instances: [
          {'prompt': 'test'},
        ],
        parameters: {'aspectRatio': '16:9'},
      );

      final json = request.toJson();

      expect(json['instances'], hasLength(1));
      expect(json['parameters'], isA<Map<String, dynamic>>());
    });

    test('toJson omits null parameters', () {
      const request = PredictLongRunningRequest(
        instances: ['test'],
      );

      final json = request.toJson();

      expect(json.containsKey('parameters'), isFalse);
      expect(json['instances'], ['test']);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictLongRunningRequest(
        instances: ['original'],
        parameters: {'key': 'value'},
      );

      final updated = original.copyWith(
        instances: ['updated'],
      );

      expect(updated.instances, ['updated']);
      expect(updated.parameters, {'key': 'value'});
      expect(original.instances, ['original']);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'instances': [
          {'videoPrompt': 'test'},
        ],
        'parameters': {'quality': 'high'},
      };

      final request = PredictLongRunningRequest.fromJson(original);
      final serialized = request.toJson();

      expect(serialized['instances'], original['instances']);
      expect(serialized['parameters'], original['parameters']);
    });
  });
}
