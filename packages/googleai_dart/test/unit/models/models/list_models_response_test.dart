// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/models/list_models_response.dart';
import 'package:googleai_dart/src/models/models/model.dart';
import 'package:test/test.dart';

void main() {
  group('ListModelsResponse', () {
    test('fromJson creates response with models and nextPageToken', () {
      final json = {
        'models': [
          {
            'name': 'models/gemini-pro',
            'baseModelId': 'gemini-pro',
            'version': '1.0',
            'displayName': 'Gemini Pro',
          },
          {
            'name': 'models/gemini-pro-vision',
            'baseModelId': 'gemini-pro-vision',
            'version': '1.0',
            'displayName': 'Gemini Pro Vision',
          },
        ],
        'nextPageToken': 'next-page-token-123',
      };

      final response = ListModelsResponse.fromJson(json);

      expect(response.models, hasLength(2));
      expect(response.models[0].name, 'models/gemini-pro');
      expect(response.models[1].name, 'models/gemini-pro-vision');
      expect(response.nextPageToken, 'next-page-token-123');
    });

    test('fromJson creates response with empty models list', () {
      final json = {
        'models': <Map<String, dynamic>>[],
      };

      final response = ListModelsResponse.fromJson(json);

      expect(response.models, isEmpty);
      expect(response.nextPageToken, isNull);
    });

    test('fromJson handles missing models field', () {
      final json = <String, dynamic>{};

      final response = ListModelsResponse.fromJson(json);

      expect(response.models, isEmpty);
      expect(response.nextPageToken, isNull);
    });

    test('toJson serializes response with all fields', () {
      const response = ListModelsResponse(
        models: [
          Model(
            name: 'models/gemini-pro',
            baseModelId: 'gemini-pro',
            displayName: 'Gemini Pro',
          ),
        ],
        nextPageToken: 'token-123',
      );

      final json = response.toJson();

      expect(json['models'], hasLength(1));
      expect(json['models'][0]['name'], 'models/gemini-pro');
      expect(json['nextPageToken'], 'token-123');
    });

    test('toJson omits null nextPageToken', () {
      const response = ListModelsResponse(
        models: [
          Model(
            name: 'models/gemini-pro',
            baseModelId: 'gemini-pro',
            displayName: 'Gemini Pro',
          ),
        ],
      );

      final json = response.toJson();

      expect(json.containsKey('nextPageToken'), isFalse);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'models': [
          {
            'name': 'models/gemini-pro',
            'baseModelId': 'gemini-pro',
            'version': '1.0',
            'displayName': 'Gemini Pro',
            'inputTokenLimit': 30720,
          },
        ],
        'nextPageToken': 'token-abc',
      };

      final response = ListModelsResponse.fromJson(original);
      final serialized = response.toJson();

      expect(serialized['models'], hasLength(1));
      final originalModels = original['models']! as List;
      final originalModel = originalModels[0] as Map<String, dynamic>;
      expect((serialized['models'] as List)[0]['name'], originalModel['name']);
      expect(serialized['nextPageToken'], original['nextPageToken']);
    });
  });
}
