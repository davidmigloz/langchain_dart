// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ListTunedModelsResponse', () {
    test('fromJson creates response with tunedModels and nextPageToken', () {
      final json = {
        'tunedModels': [
          {
            'name': 'tunedModels/my-model-1',
            'displayName': 'My Model 1',
            'state': 'ACTIVE',
          },
          {
            'name': 'tunedModels/my-model-2',
            'displayName': 'My Model 2',
            'state': 'ACTIVE',
          },
        ],
        'nextPageToken': 'next-page-token-123',
      };

      final response = ListTunedModelsResponse.fromJson(json);

      expect(response.tunedModels, hasLength(2));
      expect(response.tunedModels[0].name, 'tunedModels/my-model-1');
      expect(response.tunedModels[1].name, 'tunedModels/my-model-2');
      expect(response.nextPageToken, 'next-page-token-123');
    });

    test('fromJson creates response with empty tunedModels list', () {
      final json = {'tunedModels': <Map<String, dynamic>>[]};

      final response = ListTunedModelsResponse.fromJson(json);

      expect(response.tunedModels, isEmpty);
      expect(response.nextPageToken, isNull);
    });

    test('fromJson handles missing tunedModels field', () {
      final json = <String, dynamic>{};

      final response = ListTunedModelsResponse.fromJson(json);

      expect(response.tunedModels, isEmpty);
      expect(response.nextPageToken, isNull);
    });

    test('toJson serializes response with all fields', () {
      const response = ListTunedModelsResponse(
        tunedModels: [
          TunedModel(
            name: 'tunedModels/my-model',
            displayName: 'My Model',
            state: TunedModelState.active,
          ),
        ],
        nextPageToken: 'token-123',
      );

      final json = response.toJson();

      expect(json['tunedModels'], hasLength(1));
      expect(json['tunedModels'][0]['name'], 'tunedModels/my-model');
      expect(json['nextPageToken'], 'token-123');
    });

    test('toJson omits null nextPageToken', () {
      const response = ListTunedModelsResponse(
        tunedModels: [
          TunedModel(
            name: 'tunedModels/my-model',
            displayName: 'My Model',
            state: TunedModelState.active,
          ),
        ],
      );

      final json = response.toJson();

      expect(json.containsKey('nextPageToken'), isFalse);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'tunedModels': [
          {
            'name': 'tunedModels/my-model',
            'displayName': 'My Model',
            'state': 'ACTIVE',
            'description': 'A test model',
          },
        ],
        'nextPageToken': 'token-abc',
      };

      final response = ListTunedModelsResponse.fromJson(original);
      final serialized = response.toJson();

      expect(serialized['tunedModels'], hasLength(1));
      final originalModels = original['tunedModels']! as List;
      final originalModel = originalModels[0] as Map<String, dynamic>;
      expect(
        (serialized['tunedModels'] as List)[0]['name'],
        originalModel['name'],
      );
      expect(serialized['nextPageToken'], original['nextPageToken']);
    });

    test('copyWith creates copy with replaced values', () {
      const original = ListTunedModelsResponse(
        tunedModels: [
          TunedModel(
            name: 'tunedModels/model-1',
            displayName: 'Model 1',
            state: TunedModelState.active,
          ),
        ],
        nextPageToken: 'token-1',
      );

      final copy = original.copyWith(nextPageToken: 'token-2');

      expect(copy.tunedModels, same(original.tunedModels));
      expect(copy.nextPageToken, 'token-2');
    });
  });
}
