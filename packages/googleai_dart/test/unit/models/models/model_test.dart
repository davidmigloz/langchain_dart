import 'package:googleai_dart/src/models/models/model.dart';
import 'package:test/test.dart';

void main() {
  group('Model', () {
    test('fromJson creates Model with all fields', () {
      final json = {
        'name': 'models/gemini-pro',
        'baseModelId': 'gemini-pro',
        'displayName': 'Gemini Pro',
        'description': 'The best model for general use cases',
        'version': '001',
        'inputTokenLimit': 30720,
        'outputTokenLimit': 2048,
        'supportedGenerationMethods': ['generateContent', 'countTokens'],
        'temperature': 0.9,
        'maxTemperature': 2.0,
        'topP': 1.0,
        'topK': 1,
        'thinking': true,
      };

      final model = Model.fromJson(json);

      expect(model.name, 'models/gemini-pro');
      expect(model.baseModelId, 'gemini-pro');
      expect(model.displayName, 'Gemini Pro');
      expect(model.description, 'The best model for general use cases');
      expect(model.version, '001');
      expect(model.inputTokenLimit, 30720);
      expect(model.outputTokenLimit, 2048);
      expect(model.supportedGenerationMethods, [
        'generateContent',
        'countTokens',
      ]);
      expect(model.temperature, 0.9);
      expect(model.maxTemperature, 2.0);
      expect(model.topP, 1.0);
      expect(model.topK, 1);
      expect(model.thinking, true);
    });

    test('fromJson creates Model with minimal fields', () {
      final json = {
        'name': 'models/gemini-pro',
        'baseModelId': 'gemini-pro',
        'version': '1.0',
        'displayName': 'Gemini Pro',
      };

      final model = Model.fromJson(json);

      expect(model.name, 'models/gemini-pro');
      expect(model.baseModelId, 'gemini-pro');
      expect(model.displayName, 'Gemini Pro');
      expect(model.version, '1.0');
      expect(model.description, isNull);
      expect(model.inputTokenLimit, isNull);
      expect(model.outputTokenLimit, isNull);
      expect(model.supportedGenerationMethods, isNull);
      expect(model.temperature, isNull);
      expect(model.maxTemperature, isNull);
      expect(model.topP, isNull);
      expect(model.topK, isNull);
      expect(model.thinking, isNull);
    });

    test('toJson serializes Model with all fields', () {
      const model = Model(
        name: 'models/gemini-pro',
        baseModelId: 'gemini-pro',
        displayName: 'Gemini Pro',
        description: 'The best model',
        version: '001',
        inputTokenLimit: 30720,
        outputTokenLimit: 2048,
        supportedGenerationMethods: ['generateContent'],
        temperature: 0.9,
        maxTemperature: 2.0,
        topP: 1.0,
        topK: 1,
        thinking: true,
      );

      final json = model.toJson();

      expect(json['name'], 'models/gemini-pro');
      expect(json['baseModelId'], 'gemini-pro');
      expect(json['displayName'], 'Gemini Pro');
      expect(json['description'], 'The best model');
      expect(json['version'], '001');
      expect(json['inputTokenLimit'], 30720);
      expect(json['outputTokenLimit'], 2048);
      expect(json['supportedGenerationMethods'], ['generateContent']);
      expect(json['temperature'], 0.9);
      expect(json['maxTemperature'], 2.0);
      expect(json['topP'], 1.0);
      expect(json['topK'], 1);
      expect(json['thinking'], true);
    });

    test('toJson omits null fields', () {
      const model = Model(
        name: 'models/gemini-pro',
        baseModelId: 'gemini-pro',
        displayName: 'Gemini Pro',
      );

      final json = model.toJson();

      expect(json.containsKey('description'), isFalse);
      expect(json.containsKey('version'), isFalse);
      expect(json.containsKey('inputTokenLimit'), isFalse);
      expect(json.containsKey('outputTokenLimit'), isFalse);
      expect(json.containsKey('supportedGenerationMethods'), isFalse);
      expect(json.containsKey('temperature'), isFalse);
      expect(json.containsKey('maxTemperature'), isFalse);
      expect(json.containsKey('topP'), isFalse);
      expect(json.containsKey('topK'), isFalse);
      expect(json.containsKey('thinking'), isFalse);
    });

    test('round-trip serialization preserves data', () {
      final original = {
        'name': 'models/gemini-pro',
        'baseModelId': 'gemini-pro',
        'version': '1.0',
        'displayName': 'Gemini Pro',
        'description': 'Test model',
        'inputTokenLimit': 30720,
        'supportedGenerationMethods': ['generateContent', 'countTokens'],
      };

      final model = Model.fromJson(original);
      final serialized = model.toJson();

      expect(serialized['name'], original['name']);
      expect(serialized['displayName'], original['displayName']);
      expect(serialized['description'], original['description']);
      expect(serialized['inputTokenLimit'], original['inputTokenLimit']);
      expect(
        serialized['supportedGenerationMethods'],
        original['supportedGenerationMethods'],
      );
    });
  });
}
