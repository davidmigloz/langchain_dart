import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ModelInfo tests', () {
    test('deserializes with all fields', () {
      final json = {
        'id': 'claude-haiku-4-5-20251001',
        'type': 'model',
        'display_name': 'Claude 4.5 Haiku',
        'created_at': '2025-10-01T00:00:00Z',
      };
      final model = ModelInfo.fromJson(json);
      expect(model.id, 'claude-haiku-4-5-20251001');
      expect(model.type, ModelInfoType.model);
      expect(model.displayName, 'Claude 4.5 Haiku');
      expect(model.createdAt, '2025-10-01T00:00:00Z');
    });

    test('serializes correctly', () {
      const model = ModelInfo(
        id: 'claude-3-opus-20240229',
        type: ModelInfoType.model,
        displayName: 'Claude 3 Opus',
        createdAt: '2024-02-29T00:00:00Z',
      );
      final json = model.toJson();
      expect(json['id'], 'claude-3-opus-20240229');
      expect(json['type'], 'model');
      expect(json['display_name'], 'Claude 3 Opus');
      expect(json['created_at'], '2024-02-29T00:00:00Z');
    });

    test('round-trip serialization works', () {
      const original = ModelInfo(
        id: 'claude-3-haiku-20240307',
        type: ModelInfoType.model,
        displayName: 'Claude 3 Haiku',
        createdAt: '2024-03-07T00:00:00Z',
      );
      final json = original.toJson();
      final restored = ModelInfo.fromJson(json);
      expect(restored.id, original.id);
      expect(restored.type, original.type);
      expect(restored.displayName, original.displayName);
      expect(restored.createdAt, original.createdAt);
    });

    test('ModelInfoType enum has correct value', () {
      expect(ModelInfoType.values, hasLength(1));
      expect(ModelInfoType.values, contains(ModelInfoType.model));
    });
  });

  group('ListModelsResponse tests', () {
    test('deserializes with all fields', () {
      final json = {
        'data': [
          {
            'id': 'claude-haiku-4-5-20251001',
            'type': 'model',
            'display_name': 'Claude 4.5 Haiku',
            'created_at': '2025-10-01T00:00:00Z',
          },
        ],
        'has_more': true,
        'first_id': 'claude-haiku-4-5-20251001',
        'last_id': 'claude-haiku-4-5-20251001',
      };
      final response = ListModelsResponse.fromJson(json);
      expect(response.data, hasLength(1));
      expect(response.data.first.id, 'claude-haiku-4-5-20251001');
      expect(response.data.first.displayName, 'Claude 4.5 Haiku');
      expect(response.hasMore, isTrue);
      expect(response.firstId, 'claude-haiku-4-5-20251001');
      expect(response.lastId, 'claude-haiku-4-5-20251001');
    });

    test('deserializes with required fields only', () {
      final json = {'data': <Map<String, dynamic>>[], 'has_more': false};
      final response = ListModelsResponse.fromJson(json);
      expect(response.data, isEmpty);
      expect(response.hasMore, isFalse);
      expect(response.firstId, isNull);
      expect(response.lastId, isNull);
    });

    test('deserializes with multiple models', () {
      final json = {
        'data': [
          {
            'id': 'claude-haiku-4-5-20251001',
            'type': 'model',
            'display_name': 'Claude 4.5 Haiku',
            'created_at': '2025-10-01T00:00:00Z',
          },
          {
            'id': 'claude-sonnet-4-5-20250929',
            'type': 'model',
            'display_name': 'Claude 4.5 Sonnet',
            'created_at': '2025-09-29T00:00:00Z',
          },
          {
            'id': 'claude-3-haiku-20240307',
            'type': 'model',
            'display_name': 'Claude 3 Haiku',
            'created_at': '2024-03-07T00:00:00Z',
          },
        ],
        'has_more': true,
        'first_id': 'claude-haiku-4-5-20251001',
        'last_id': 'claude-3-haiku-20240307',
      };
      final response = ListModelsResponse.fromJson(json);
      expect(response.data, hasLength(3));
      expect(response.data[0].id, 'claude-haiku-4-5-20251001');
      expect(response.data[1].id, 'claude-sonnet-4-5-20250929');
      expect(response.data[2].id, 'claude-3-haiku-20240307');
      expect(response.firstId, 'claude-haiku-4-5-20251001');
      expect(response.lastId, 'claude-3-haiku-20240307');
    });

    test('serializes correctly', () {
      const response = ListModelsResponse(
        data: [
          ModelInfo(
            id: 'claude-haiku-4-5-20251001',
            type: ModelInfoType.model,
            displayName: 'Claude 4.5 Haiku',
            createdAt: '2025-10-01T00:00:00Z',
          ),
        ],
        hasMore: false,
        firstId: 'claude-haiku-4-5-20251001',
        lastId: 'claude-haiku-4-5-20251001',
      );
      final json = response.toJson();
      expect(json['data'], hasLength(1));
      final dataList = json['data'] as List<dynamic>;
      expect(
        (dataList.first as Map<String, dynamic>)['id'],
        'claude-haiku-4-5-20251001',
      );
      expect(json['has_more'], false);
      expect(json['first_id'], 'claude-haiku-4-5-20251001');
      expect(json['last_id'], 'claude-haiku-4-5-20251001');
    });

    test('serializes with null optional fields excluded', () {
      const response = ListModelsResponse(data: [], hasMore: false);
      final json = response.toJson();
      expect(json.containsKey('first_id'), isFalse);
      expect(json.containsKey('last_id'), isFalse);
    });

    test('round-trip serialization works', () {
      const original = ListModelsResponse(
        data: [
          ModelInfo(
            id: 'claude-3-opus-20240229',
            type: ModelInfoType.model,
            displayName: 'Claude 3 Opus',
            createdAt: '2024-02-29T00:00:00Z',
          ),
        ],
        hasMore: true,
        firstId: 'claude-3-opus-20240229',
        lastId: 'claude-3-opus-20240229',
      );
      final json = original.toJson();
      final restored = ListModelsResponse.fromJson(json);
      expect(restored.data, hasLength(1));
      expect(restored.data.first.id, original.data.first.id);
      expect(restored.data.first.displayName, original.data.first.displayName);
      expect(restored.hasMore, original.hasMore);
      expect(restored.firstId, original.firstId);
      expect(restored.lastId, original.lastId);
    });
  });
}
