@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenRouter tests', () {
    late ChatOpenAI chatModel;

    setUp(() async {
      chatModel = ChatOpenAI(
        apiKey: Platform.environment['OPEN_ROUTER_API_KEY'],
        baseUrl: 'https://openrouter.ai/api/v1',
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test invoke OpenRouter API with different models', () async {
      final models = [
        'gpt-3.5-turbo',
        'gpt-4',
        'google/gemini-pro',
        'anthropic/claude-2',
        'mistralai/mixtral-8x7b-instruct',
        'mistralai/mistral-small',
        'haotian-liu/llava-13b',
      ];
      for (final model in models) {
        final res = await chatModel.invoke(
          PromptValue.string(
            'List the numbers from 1 to 9 in order. '
            'Output ONLY the numbers in one line without any spaces or commas. '
            'NUMBERS:',
          ),
          options: ChatOpenAIOptions(model: model),
        );

        expect(res.id, isNotEmpty);
        expect(
          res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
        expect(res.modelOutput, isNotNull, reason: model);
        expect(res.modelOutput!['created'], greaterThan(0), reason: model);
        expect(res.modelOutput!['model'], isNotEmpty, reason: model);
        final generation = res.generations.first;
        expect(generation.generationInfo, isNotNull, reason: model);
        expect(generation.generationInfo!['index'], 0, reason: model);
        expect(
          generation.generationInfo!['finish_reason'],
          isNotNull,
          reason: model,
        );
      }
    });

    test('Test stream OpenRouter API with different models', () async {
      final models = [
        'gpt-3.5-turbo',
        'gpt-4',
        // 'google/gemini-pro', // Not supported
        'anthropic/claude-2',
        'mistralai/mixtral-8x7b-instruct',
        'mistralai/mistral-small',
        // 'haotian-liu/llava-13b', // Not supported
      ];
      for (final model in models) {
        final stream = chatModel.stream(
          PromptValue.string(
            'List the numbers from 1 to 9 in order. '
            'Output ONLY the numbers in one line without any spaces or commas. '
            'NUMBERS:',
          ),
          options: ChatOpenAIOptions(model: model),
        );

        String content = '';
        int count = 0;
        await for (final res in stream) {
          content += res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), '');
          count++;
        }
        expect(count, greaterThan(1), reason: model);
        expect(content, contains('123456789'), reason: model);
      }
    });

    test('Test countTokens', () async {
      final models = [
        'gpt-3.5-turbo',
        'gpt-4',
        'google/gemini-pro',
        'anthropic/claude-2',
        'mistralai/mixtral-8x7b-instruct',
        'mistralai/mistral-small',
        'haotian-liu/llava-13b',
      ];
      for (final model in models) {
        const text = 'Hello, how are you?';

        final numTokens = await chatModel.countTokens(
          PromptValue.chat([ChatMessage.humanText(text)]),
          options: ChatOpenAIOptions(model: model),
        );
        expect(numTokens, 13, reason: model);
      }
    });
  });
}
