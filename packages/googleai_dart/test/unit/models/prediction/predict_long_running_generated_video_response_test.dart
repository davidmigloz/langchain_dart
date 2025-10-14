import 'package:googleai_dart/src/models/prediction/media.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_generated_video_response.dart';
import 'package:test/test.dart';

void main() {
  group('PredictLongRunningGeneratedVideoResponse', () {
    test('fromJson creates response with all fields', () {
      final json = {
        'generatedSamples': [
          {
            'video': {'uri': 'gs://bucket/video1.mp4'},
          },
          {
            'video': {'uri': 'gs://bucket/video2.mp4'},
          },
        ],
        'raiMediaFilteredCount': 2,
        'raiMediaFilteredReasons': ['inappropriate_content', 'violence'],
      };

      final response = PredictLongRunningGeneratedVideoResponse.fromJson(json);

      expect(response.generatedSamples, hasLength(2));
      expect(
        response.generatedSamples![0].video!.uri,
        'gs://bucket/video1.mp4',
      );
      expect(response.raiMediaFilteredCount, 2);
      expect(response.raiMediaFilteredReasons, hasLength(2));
      expect(response.raiMediaFilteredReasons![0], 'inappropriate_content');
    });

    test('fromJson creates response with minimal fields', () {
      final json = <String, dynamic>{};

      final response = PredictLongRunningGeneratedVideoResponse.fromJson(json);

      expect(response.generatedSamples, isNull);
      expect(response.raiMediaFilteredCount, isNull);
      expect(response.raiMediaFilteredReasons, isNull);
    });

    test('fromJson creates response with only generated samples', () {
      final json = {
        'generatedSamples': [
          {
            'video': {'video': 'base64VideoData'},
          },
        ],
      };

      final response = PredictLongRunningGeneratedVideoResponse.fromJson(json);

      expect(response.generatedSamples, hasLength(1));
      expect(response.generatedSamples![0].video!.video, 'base64VideoData');
      expect(response.raiMediaFilteredCount, isNull);
      expect(response.raiMediaFilteredReasons, isNull);
    });

    test('toJson serializes response with all fields', () {
      const response = PredictLongRunningGeneratedVideoResponse(
        generatedSamples: [
          Media(video: Video(uri: 'gs://test.mp4')),
        ],
        raiMediaFilteredCount: 1,
        raiMediaFilteredReasons: ['reason1'],
      );

      final json = response.toJson();

      expect(json['generatedSamples'], hasLength(1));
      expect(json['raiMediaFilteredCount'], 1);
      expect(json['raiMediaFilteredReasons'], ['reason1']);
    });

    test('toJson omits null fields', () {
      const response = PredictLongRunningGeneratedVideoResponse();

      final json = response.toJson();

      expect(json.containsKey('generatedSamples'), isFalse);
      expect(json.containsKey('raiMediaFilteredCount'), isFalse);
      expect(json.containsKey('raiMediaFilteredReasons'), isFalse);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictLongRunningGeneratedVideoResponse(
        generatedSamples: [
          Media(video: Video(uri: 'original.mp4')),
        ],
        raiMediaFilteredCount: 0,
        raiMediaFilteredReasons: [],
      );

      final updated = original.copyWith(
        raiMediaFilteredCount: 5,
      );

      expect(updated.raiMediaFilteredCount, 5);
      expect(updated.generatedSamples, hasLength(1));
      expect(original.raiMediaFilteredCount, 0);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'generatedSamples': [
          {
            'video': {'uri': 'gs://sample.mp4'},
          },
        ],
        'raiMediaFilteredCount': 3,
        'raiMediaFilteredReasons': ['violence', 'adult_content'],
      };

      final response =
          PredictLongRunningGeneratedVideoResponse.fromJson(original);
      final serialized = response.toJson();

      expect(
        serialized['raiMediaFilteredCount'],
        original['raiMediaFilteredCount'],
      );
      expect(
        serialized['raiMediaFilteredReasons'],
        original['raiMediaFilteredReasons'],
      );
      expect(serialized['generatedSamples'], hasLength(1));
    });
  });
}
