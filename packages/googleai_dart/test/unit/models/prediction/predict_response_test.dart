// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/prediction/predict_response.dart';
import 'package:test/test.dart';

void main() {
  group('PredictResponse', () {
    test('fromJson creates response with predictions', () {
      final json = {
        'predictions': [
          {'videoUri': 'gs://bucket/video1.mp4'},
          {'videoUri': 'gs://bucket/video2.mp4'},
        ],
      };

      final response = PredictResponse.fromJson(json);

      expect(response.predictions, hasLength(2));
      expect(response.predictions[0], isA<Map<String, dynamic>>());
      expect(
        (response.predictions[0] as Map<String, dynamic>)['videoUri'],
        'gs://bucket/video1.mp4',
      );
    });

    test('fromJson creates response with empty predictions', () {
      final json = <String, dynamic>{};

      final response = PredictResponse.fromJson(json);

      expect(response.predictions, isEmpty);
    });

    test('fromJson handles missing predictions field', () {
      final json = <String, dynamic>{};

      final response = PredictResponse.fromJson(json);

      expect(response.predictions, isEmpty);
    });

    test('toJson serializes response', () {
      const response = PredictResponse(
        predictions: [
          {'result': 'success'},
        ],
      );

      final json = response.toJson();

      expect(json['predictions'], hasLength(1));
      expect(json['predictions'][0], {'result': 'success'});
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictResponse(predictions: ['original']);

      final updated = original.copyWith(predictions: ['updated']);

      expect(updated.predictions, ['updated']);
      expect(original.predictions, ['original']);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'predictions': [
          {'video': 'data'},
          {'video': 'more_data'},
        ],
      };

      final response = PredictResponse.fromJson(original);
      final serialized = response.toJson();

      expect(serialized['predictions'], original['predictions']);
    });
  });
}
