// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/models/operation.dart';
import 'package:googleai_dart/src/models/prediction/media.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_generated_video_response.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_metadata.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_operation.dart';
import 'package:googleai_dart/src/models/prediction/predict_long_running_response.dart';
import 'package:test/test.dart';

void main() {
  group('PredictLongRunningOperation', () {
    test('fromJson creates operation with all fields', () {
      final json = {
        'name': 'operations/predict-12345',
        'metadata': <String, dynamic>{},
        'done': true,
        'response': {
          'generateVideoResponse': {
            'generatedSamples': [
              {
                'video': {'uri': 'gs://bucket/video.mp4'},
              },
            ],
          },
        },
      };

      final operation = PredictLongRunningOperation.fromJson(json);

      expect(operation.name, 'operations/predict-12345');
      expect(operation.metadata, isNotNull);
      expect(operation.done, true);
      expect(operation.response, isNotNull);
      expect(
        operation.response!.generateVideoResponse!.generatedSamples,
        hasLength(1),
      );
      expect(operation.error, isNull);
    });

    test('fromJson creates operation with error', () {
      final json = {
        'name': 'operations/predict-error',
        'done': true,
        'error': {
          'code': 500,
          'message': 'Internal error',
        },
      };

      final operation = PredictLongRunningOperation.fromJson(json);

      expect(operation.name, 'operations/predict-error');
      expect(operation.done, true);
      expect(operation.error, isNotNull);
      expect(operation.error!.code, 500);
      expect(operation.error!.message, 'Internal error');
      expect(operation.response, isNull);
    });

    test('fromJson creates operation in progress', () {
      final json = {
        'name': 'operations/predict-inprogress',
        'done': false,
        'metadata': <String, dynamic>{},
      };

      final operation = PredictLongRunningOperation.fromJson(json);

      expect(operation.name, 'operations/predict-inprogress');
      expect(operation.done, false);
      expect(operation.response, isNull);
      expect(operation.error, isNull);
    });

    test('fromJson creates operation with minimal fields', () {
      final json = {
        'done': false,
      };

      final operation = PredictLongRunningOperation.fromJson(json);

      expect(operation.name, isNull);
      expect(operation.done, false);
      expect(operation.metadata, isNull);
      expect(operation.response, isNull);
      expect(operation.error, isNull);
    });

    test('toJson serializes operation with all fields', () {
      const operation = PredictLongRunningOperation(
        name: 'operations/test',
        metadata: PredictLongRunningMetadata(),
        done: true,
        response: PredictLongRunningResponse(
          generateVideoResponse: PredictLongRunningGeneratedVideoResponse(
            generatedSamples: [
              Media(video: Video(uri: 'gs://test.mp4')),
            ],
          ),
        ),
      );

      final json = operation.toJson();

      expect(json['name'], 'operations/test');
      expect(json['metadata'], isNotNull);
      expect(json['done'], true);
      expect(json['response'], isNotNull);
      expect(json.containsKey('error'), isFalse);
    });

    test('toJson serializes operation with error', () {
      const operation = PredictLongRunningOperation(
        name: 'operations/error',
        done: true,
        error: OperationError(
          code: 400,
          message: 'Bad request',
        ),
      );

      final json = operation.toJson();

      expect(json['name'], 'operations/error');
      expect(json['done'], true);
      expect(json['error'], isNotNull);
      expect(json['error']['code'], 400);
      expect(json.containsKey('response'), isFalse);
    });

    test('toJson omits null fields', () {
      const operation = PredictLongRunningOperation(
        done: false,
      );

      final json = operation.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('metadata'), isFalse);
      expect(json.containsKey('error'), isFalse);
      expect(json.containsKey('response'), isFalse);
      expect(json['done'], false);
    });

    test('copyWith creates new instance with replaced values', () {
      const original = PredictLongRunningOperation(
        name: 'operations/original',
        done: false,
      );

      final updated = original.copyWith(
        done: true,
        response: const PredictLongRunningResponse(
          generateVideoResponse: PredictLongRunningGeneratedVideoResponse(
            raiMediaFilteredCount: 0,
          ),
        ),
      );

      expect(updated.name, 'operations/original');
      expect(updated.done, true);
      expect(updated.response, isNotNull);
      expect(original.done, false);
      expect(original.response, isNull);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'name': 'operations/roundtrip',
        'metadata': <String, dynamic>{},
        'done': true,
        'response': {
          'generateVideoResponse': {
            'generatedSamples': [
              {
                'video': {'uri': 'gs://video.mp4'},
              },
            ],
            'raiMediaFilteredCount': 1,
          },
        },
      };

      final operation = PredictLongRunningOperation.fromJson(original);
      final serialized = operation.toJson();

      expect(serialized['name'], original['name']);
      expect(serialized['done'], original['done']);
      expect(serialized['metadata'], isNotNull);
      expect(serialized['response'], isNotNull);
    });
  });
}
