@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:mistralai_dart/mistralai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Mistral AI Models API tests', () {
    late MistralAIClient client;

    setUp(() async {
      client = MistralAIClient(
        apiKey: Platform.environment['MISTRAL_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test list models', () async {
      final res = await client.listModels();
      expect(res.object, 'list');
      expect(res.data, isNotEmpty);
      final model = res.data.first;
      expect(model.id, isNotEmpty);
      expect(model.object, 'model');
      expect(model.created, greaterThan(0));
      expect(model.ownedBy, isNotEmpty);
    });
  });
}
