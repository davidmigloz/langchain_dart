@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('TogetherAI tests', () {
    late ChatOpenAI chatModel;

    setUp(() async {
      chatModel = ChatOpenAI(
        apiKey: Platform.environment['TOGETHER_AI_API_KEY'],
        baseUrl: 'https://api.together.xyz/v1',
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test invoke TogetherAI API with different models', () async {
      final models = [
        'mistralai/Mixtral-8x7B-Instruct-v0.1',
        'mistralai/Mistral-7B-Instruct-v0.2',
        'NousResearch/Nous-Hermes-2-Yi-34B',
        'openchat/openchat-3.5-1210',
        'togethercomputer/llama-2-70b-chat',
        'togethercomputer/falcon-40b-instruct',
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
        await Future<void>.delayed(const Duration(seconds: 1)); // Rate limit
      }
    });

    test('Test stream TogetherAI API with different models', () async {
      final models = [
        'mistralai/Mixtral-8x7B-Instruct-v0.1',
        'mistralai/Mistral-7B-Instruct-v0.2',
        'NousResearch/Nous-Hermes-2-Yi-34B',
        'openchat/openchat-3.5-1210',
        'togethercomputer/llama-2-70b-chat',
        'togethercomputer/falcon-40b-instruct',
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
        await Future<void>.delayed(const Duration(seconds: 1)); // Rate limit
      }
    });

    test('Test countTokens', () async {
      final models = [
        'mistralai/Mixtral-8x7B-Instruct-v0.1',
        'mistralai/Mistral-7B-Instruct-v0.2',
        'NousResearch/Nous-Hermes-2-Yi-34B',
        'openchat/openchat-3.5-1210',
        'togethercomputer/llama-2-70b-chat',
        'togethercomputer/falcon-40b-instruct',
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
