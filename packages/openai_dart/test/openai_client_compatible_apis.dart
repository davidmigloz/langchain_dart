@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GoogleAI OpenAI-compatible API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
        baseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call chat completion API', () async {
      final response = await client.createChatCompletion(
        request: const CreateChatCompletionRequest(
          model: ChatCompletionModel.modelId('gemini-2.0-flash'),
          messages: [
            ChatCompletionMessage.system(
              content: 'Be concise, reply with one sentence.',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(
                'Where does "hello world" come from?',
              ),
            ),
          ],
        ),
      );
      expect(response.choices, isNotEmpty);
      expect(response.choices.first.message.content, isNotEmpty);
    });
  });
}
