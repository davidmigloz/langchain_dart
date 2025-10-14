// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/prediction/media.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_generated_video_response.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_response.dart';
import 'package:test/test.dart';

void main() {
  group('PredictLongRunningResponse', () {
    test('fromJson creates response with generateVideoResponse', () {
      final json = {
        'generateVideoResponse': {
          'generatedSamples': [
            {
              'video': {'uri': 'gs://bucket/video.mp4'},
            },
          ],
          'raiMediaFilteredCount': 0,
        },
      };

      final response = PredictLongRunningResponse.fromJson(json);

      expect(response.generateVideoResponse, isNotNull);
      expect(response.generateVideoResponse!.generatedSamples, hasLength(1));
      expect(response.generateVideoResponse!.raiMediaFilteredCount, 0);
    });

    test('fromJson creates response without generateVideoResponse', () {
      final json = <String, dynamic>{};

      final response = PredictLongRunningResponse.fromJson(json);

      expect(response.generateVideoResponse, isNull);
    });

    test('toJson serializes response with generateVideoResponse', () {
      const response = PredictLongRunningResponse(
        generateVideoResponse: PredictLongRunningGeneratedVideoResponse(
          generatedSamples: [
            Media(video: Video(uri: 'gs://test.mp4')),
          ],
        ),
      );

      final json = response.toJson();

      expect(json['generateVideoResponse'], isNotNull);
      expect(json['generateVideoResponse']['generatedSamples'], hasLength(1));
    });

    test('toJson omits null generateVideoResponse', () {
      const response = PredictLongRunningResponse();

      final json = response.toJson();

      expect(json.containsKey('generateVideoResponse'), isFalse);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictLongRunningResponse(
        generateVideoResponse: PredictLongRunningGeneratedVideoResponse(
          raiMediaFilteredCount: 0,
        ),
      );

      const updated = PredictLongRunningResponse(
        generateVideoResponse: PredictLongRunningGeneratedVideoResponse(
          raiMediaFilteredCount: 5,
        ),
      );

      final copied = original.copyWith(
        generateVideoResponse: updated.generateVideoResponse,
      );

      expect(copied.generateVideoResponse!.raiMediaFilteredCount, 5);
      expect(original.generateVideoResponse!.raiMediaFilteredCount, 0);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'generateVideoResponse': {
          'generatedSamples': [
            {
              'video': {'uri': 'gs://video.mp4'},
            },
          ],
          'raiMediaFilteredCount': 2,
          'raiMediaFilteredReasons': ['test'],
        },
      };

      final response = PredictLongRunningResponse.fromJson(original);
      final serialized = response.toJson();

      expect(serialized['generateVideoResponse']['raiMediaFilteredCount'], 2);
      expect(
        serialized['generateVideoResponse']['raiMediaFilteredReasons'],
        ['test'],
      );
    });
  });
}
