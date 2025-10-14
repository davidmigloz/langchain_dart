import 'package:googleai_dart/src/models/models/tuned_model.dart';
import 'package:test/test.dart';

void main() {
  group('TunedModel', () {
    test('fromJson creates TunedModel with all fields', () {
      final json = {
        'name': 'tunedModels/my-model',
        'displayName': 'My Custom Model',
        'description': 'A fine-tuned model',
        'state': 'ACTIVE',
        'createTime': '2024-01-01T00:00:00Z',
        'updateTime': '2024-01-02T00:00:00Z',
        'baseModel': 'models/gemini-pro',
        'temperature': 0.7,
        'topP': 0.95,
        'topK': 40,
      };

      final model = TunedModel.fromJson(json);

      expect(model.name, 'tunedModels/my-model');
      expect(model.displayName, 'My Custom Model');
      expect(model.description, 'A fine-tuned model');
      expect(model.state, TunedModelState.active);
      expect(model.createTime, isNotNull);
      expect(model.updateTime, isNotNull);
      expect(model.baseModel, 'models/gemini-pro');
      expect(model.temperature, 0.7);
      expect(model.topP, 0.95);
      expect(model.topK, 40);
    });

    test('fromJson creates TunedModel with minimal fields', () {
      final json = <String, dynamic>{};

      final model = TunedModel.fromJson(json);

      expect(model.name, isNull);
      expect(model.displayName, isNull);
      expect(model.state, isNull);
    });

    test('toJson serializes TunedModel with all fields', () {
      final model = TunedModel(
        name: 'tunedModels/my-model',
        displayName: 'My Model',
        state: TunedModelState.creating,
        createTime: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final json = model.toJson();

      expect(json['name'], 'tunedModels/my-model');
      expect(json['displayName'], 'My Model');
      expect(json['state'], 'CREATING');
      expect(json['createTime'], '2024-01-01T00:00:00.000Z');
    });

    test('toJson omits null fields', () {
      const model = TunedModel();

      final json = model.toJson();

      expect(json.containsKey('name'), isFalse);
      expect(json.containsKey('displayName'), isFalse);
      expect(json.containsKey('state'), isFalse);
    });
  });

  group('TunedModelState', () {
    test('tunedModelStateFromString converts all states correctly', () {
      expect(tunedModelStateFromString('CREATING'), TunedModelState.creating);
      expect(tunedModelStateFromString('ACTIVE'), TunedModelState.active);
      expect(tunedModelStateFromString('FAILED'), TunedModelState.failed);
      expect(tunedModelStateFromString('UNKNOWN'), TunedModelState.unspecified);
      expect(tunedModelStateFromString(null), TunedModelState.unspecified);
    });

    test('tunedModelStateToString converts all states correctly', () {
      expect(tunedModelStateToString(TunedModelState.creating), 'CREATING');
      expect(tunedModelStateToString(TunedModelState.active), 'ACTIVE');
      expect(tunedModelStateToString(TunedModelState.failed), 'FAILED');
      expect(
        tunedModelStateToString(TunedModelState.unspecified),
        'STATE_UNSPECIFIED',
      );
    });

    test('state conversion is case-insensitive', () {
      expect(tunedModelStateFromString('creating'), TunedModelState.creating);
      expect(tunedModelStateFromString('Active'), TunedModelState.active);
      expect(tunedModelStateFromString('FAILED'), TunedModelState.failed);
    });
  });
}
