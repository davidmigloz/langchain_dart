import 'package:googleai_dart/src/models/prediction/predict_request.dart';
import 'package:test/test.dart';

void main() {
  group('PredictRequest', () {
    test('fromJson creates request with all fields', () {
      final json = {
        'instances': [
          {'prompt': 'Generate a video of a cat'},
        ],
        'parameters': {'temperature': 0.9},
      };

      final request = PredictRequest.fromJson(json);

      expect(request.instances, hasLength(1));
      expect(request.instances[0], isA<Map<String, dynamic>>());
      expect(
        (request.instances[0] as Map<String, dynamic>)['prompt'],
        'Generate a video of a cat',
      );
      expect(request.parameters, isA<Map<String, dynamic>>());
      expect((request.parameters as Map<String, dynamic>)['temperature'], 0.9);
    });

    test('fromJson creates request with minimal fields', () {
      final json = {
        'instances': ['prompt1', 'prompt2'],
      };

      final request = PredictRequest.fromJson(json);

      expect(request.instances, hasLength(2));
      expect(request.instances[0], 'prompt1');
      expect(request.parameters, isNull);
    });

    test('toJson serializes request with all fields', () {
      const request = PredictRequest(
        instances: [
          {'prompt': 'test'},
        ],
        parameters: {'temp': 0.5},
      );

      final json = request.toJson();

      expect(json['instances'], hasLength(1));
      expect(json['parameters'], isA<Map<String, dynamic>>());
    });

    test('toJson omits null parameters', () {
      const request = PredictRequest(instances: ['test']);

      final json = request.toJson();

      expect(json.containsKey('parameters'), isFalse);
      expect(json['instances'], ['test']);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictRequest(
        instances: ['original'],
        parameters: {'key': 'value'},
      );

      final updated = original.copyWith(instances: ['updated']);

      expect(updated.instances, ['updated']);
      expect(updated.parameters, {'key': 'value'});
      expect(original.instances, ['original']);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'instances': [
          {'data': 'test'},
        ],
        'parameters': {'option': true},
      };

      final request = PredictRequest.fromJson(original);
      final serialized = request.toJson();

      expect(serialized['instances'], original['instances']);
      expect(serialized['parameters'], original['parameters']);
    });
  });
}
