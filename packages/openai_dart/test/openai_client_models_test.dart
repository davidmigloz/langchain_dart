@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Models API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call list models API', () async {
      final res = await client.listModels();
      expect(res.object, ListModelsResponseObject.list);
      expect(res.data, isNotEmpty);
      final model = res.data.first;
      expect(model.id, isNotEmpty);
      expect(model.object, ModelObject.model);
      expect(model.created, greaterThan(0));
      expect(model.ownedBy, isNotEmpty);
    });

    test('Test call retrieve model API', () async {
      final res = await client.retrieveModel(model: 'gpt-4');
      expect(res.id, 'gpt-4');
      expect(res.object, ModelObject.model);
      expect(res.created, greaterThan(0));
      expect(res.ownedBy, 'openai');
    });

    test('Test call delete fine-tune model API', skip: true, () async {
      final res = await client.deleteModel(
        model: 'ft:gpt-3.5-turbo-0613:langchain::7qTVM5AR',
      );
      expect(res.id, 'ft:gpt-3.5-turbo-0613:langchain::7qTVM5AR');
      expect(res.deleted, true);
      expect(res.object, 'model');
    });
  });
}
