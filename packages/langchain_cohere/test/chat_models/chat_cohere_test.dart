@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_cohere/langchain_cohere.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  final apiKey = Platform.environment['COHERE_API_KEY'];

  group('ChatCohere tests', () {
    test('Test ChatCohere parameters', () {
      const options = ChatCohereOptions(
        model: 'foo',
        temperature: 0.1,
        topP: 0.5,
        topK: 10,
        maxTokens: 10,
        stopSequences: ['STOP'],
        seed: 1234,
        frequencyPenalty: 0.1,
        presencePenalty: 0.2,
      );

      expect(options.model, 'foo');
      expect(options.temperature, 0.1);
      expect(options.topP, 0.5);
      expect(options.topK, 10);
      expect(options.maxTokens, 10);
      expect(options.stopSequences, ['STOP']);
      expect(options.seed, 1234);
      expect(options.frequencyPenalty, 0.1);
      expect(options.presencePenalty, 0.2);
    });

    test('Test tokenize', () async {
      final chatModel = ChatCohere();
      const text = 'antidisestablishmentarianism';

      final tokens = await chatModel.tokenize(
        PromptValue.chat([ChatMessage.humanText(text)]),
      );
      expect(tokens, isNotEmpty);
      chatModel.close();
    });
  });

  group(
    'ChatCohere integration tests',
    skip: apiKey == null || apiKey.isEmpty ? 'COHERE_API_KEY is not set' : null,
    () {
      late ChatCohere chatModel;

      setUp(() {
        chatModel = ChatCohere(apiKey: apiKey);
      });

      tearDown(() {
        chatModel.close();
      });

      test('Test call to ChatCohere', () async {
        final output = await chatModel([ChatMessage.humanText('Say foo:')]);
        expect(output, isA<AIChatMessage>());
        expect(output.content, isNotEmpty);
      });

      test('Test invoke to ChatCohere', () async {
        final res = await chatModel.invoke(
          PromptValue.chat([ChatMessage.humanText('Hello, how are you?')]),
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
        expect(res.metadata['model'], isNotEmpty);
      });

      test('Test streaming', () async {
        final promptTemplate = PromptTemplate.fromTemplate(
          'List the numbers from 1 to {max_num} in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS:',
        );
        const stringOutputParser = StringOutputParser<ChatResult>();

        final chain = promptTemplate.pipe(chatModel).pipe(stringOutputParser);

        final stream = chain.stream({'max_num': '9'});

        var content = '';
        var count = 0;
        await for (final res in stream) {
          content += res.trim();
          count++;
        }
        expect(count, greaterThan(1));
        expect(content, contains('123456789'));
      });
    },
  );
}
