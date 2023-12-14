// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Google AI model info API tests', () {
    late GoogleAIClient client;

    setUp(() async {
      client = GoogleAIClient(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test list models', () async {
      final res = await client.listModels();
      expect(res.models, isNotEmpty);
      final model = res.models!.first;
      expect(model.name, isNotEmpty);
    });

    test('Test get model', () async {
      final res = await client.getModel(modelId: 'gemini-pro');
      expect(res.name, contains('gemini-pro'));
      expect(res.displayName, contains('Gemini'));
      expect(res.description, isNotEmpty);
      expect(res.version, isNotEmpty);
      expect(res.temperature, greaterThan(0));
      expect(res.topK, greaterThan(0));
      expect(res.topP, greaterThan(0));
      expect(res.inputTokenLimit, greaterThan(0));
      expect(res.outputTokenLimit, greaterThan(0));
      expect(res.supportedGenerationMethods, contains('generateContent'));
      expect(res.supportedGenerationMethods, contains('countTokens'));
    });
  });
}
