@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';
import 'package:test/test.dart';

void main() {
  group('ChatMistralAI tests', () {
    late ChatMistralAI chatModel;

    setUp(() async {
      chatModel = ChatMistralAI(
        apiKey: Platform.environment['MISTRAL_API_KEY'],
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test ChatMistralAI parameters', () async {
      chatModel.defaultOptions = const ChatMistralAIOptions(
        model: 'foo',
        temperature: 0.1,
        topP: 0.5,
        maxTokens: 10,
        safePrompt: true,
        randomSeed: 1234,
      );

      expect(chatModel.defaultOptions.model, 'foo');
      expect(chatModel.defaultOptions.temperature, 0.1);
      expect(chatModel.defaultOptions.topP, 0.5);
      expect(chatModel.defaultOptions.maxTokens, 10);
      expect(chatModel.defaultOptions.safePrompt, true);
      expect(chatModel.defaultOptions.randomSeed, 1234);
    });

    test('Test call to ChatMistralAI', () async {
      final output = await chatModel([ChatMessage.humanText('Say foo:')]);
      expect(output, isA<AIChatMessage>());
      expect(output.content, isNotEmpty);
    });

    test('Test invoke to ChatMistralAI', () async {
      final res = await chatModel.invoke(
        PromptValue.chat(
          [ChatMessage.humanText('Hello, how are you?')],
        ),
      );
      expect(res.output.content, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final res = await chatModel.invoke(
        PromptValue.chat([
          ChatMessage.humanText(
            'List the numbers from 1 to 9 in order. '
            'Output ONLY the numbers in one line without any spaces or commas. '
            'NUMBERS:',
          ),
        ]),
      );
      expect(
        res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
      expect(res.id, isNotEmpty);
      expect(res.finishReason, isNot(FinishReason.unspecified));
      expect(res.metadata, isNotNull);
      expect(res.metadata['created'], greaterThan(0));
      expect(res.metadata['model'], isNotEmpty);
    });

    test('Test tokenize', () async {
      const text = 'antidisestablishmentarianism';

      final tokens = await chatModel.tokenize(
        PromptValue.chat([ChatMessage.humanText(text)]),
      );
      expect(tokens, [35075, 25, 3276, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test different encoding than the model', () async {
      chatModel.encoding = 'cl100k_base';
      const text = 'antidisestablishmentarianism';

      final tokens = await chatModel.tokenize(
        PromptValue.chat([ChatMessage.humanText(text)]),
      );
      expect(tokens, [35075, 25, 3276, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test countTokens', () async {
      const text = 'Hello, how are you?';

      final numTokens = await chatModel.countTokens(
        PromptValue.chat([ChatMessage.humanText(text)]),
      );
      expect(numTokens, 8);
    });

    test('Test streaming', () async {
      final promptTemplate = PromptTemplate.fromTemplate(
        'List the numbers from 1 to {max_num} in order. '
        'Output ONLY the numbers in one line without any spaces or commas. '
        'NUMBERS:',
      );
      const stringOutputParser = StringOutputParser<AIChatMessage>();

      final chain = promptTemplate.pipe(chatModel).pipe(stringOutputParser);

      final stream = chain.stream({'max_num': '9'});

      String content = '';
      int count = 0;
      await for (final res in stream) {
        content += res.trim();
        count++;
      }
      expect(count, greaterThan(1));
      expect(content, contains('123456789'));
    });

    test('Test response seed', skip: true, () async {
      final prompt = PromptValue.string(
        'Why is the sky blue? Reply in one sentence.',
      );
      const options = ChatMistralAIOptions(
        temperature: 0,
        randomSeed: 9999,
      );

      final res1 = await chatModel.invoke(
        prompt,
        options: options,
      );

      final res2 = await chatModel.invoke(
        prompt,
        options: options,
      );
      expect(res1.output, res2.output);
    });
  });
}
