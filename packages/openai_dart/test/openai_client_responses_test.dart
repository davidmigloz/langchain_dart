@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Responses API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test create and retrieve response', () async {
      final request = CreateResponseRequest(
        model: 'gpt-4o',
        input: const CreateResponseRequestInput.string('Hello'),
      );
      final response = await client.createResponse(request: request);
      expect(response.id, isNotEmpty);

      final retrieved = await client.getResponse(responseId: response.id);
      expect(retrieved.id, response.id);
    });
  });
}
