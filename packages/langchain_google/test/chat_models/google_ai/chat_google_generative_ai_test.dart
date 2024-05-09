// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('ChatGoogleGenerativeAI tests', () {
    const defaultModel = 'gemini-pro';

    late ChatGoogleGenerativeAI chatModel;

    setUp(() async {
      chatModel = ChatGoogleGenerativeAI(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
        defaultOptions: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test Text-only input with gemini-pro', () async {
      const models = ['gemini-1.0-pro', 'gemini-1.5-pro-latest'];
      for (final model in models) {
        final res = await chatModel.invoke(
          PromptValue.string(
            'List the numbers from 1 to 9 in order '
            'without any spaces, commas or additional explanations.',
          ),
          options: ChatGoogleGenerativeAIOptions(
            model: model,
            temperature: 0,
          ),
        );
        expect(res.id, isNotEmpty);
        expect(res.finishReason, isNot(FinishReason.unspecified));
        expect(res.metadata['model'], startsWith(model));
        expect(res.metadata['block_reason'], isNull);
        expect(
          res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
      }
    });

    test('Test models prefix', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      expect(res.output.content, isNotEmpty);
    });

    test('Text-and-image input with gemini-pro-vision', () async {
      final res = await chatModel.invoke(
        PromptValue.chat([
          ChatMessage.human(
            ChatMessageContent.multiModal([
              ChatMessageContent.text('What fruit is this?'),
              ChatMessageContent.image(
                mimeType: 'image/jpeg',
                data: base64.encode(
                  await File('./test/chat_models/assets/apple.jpeg')
                      .readAsBytes(),
                ),
              ),
            ]),
          ),
        ]),
        options: const ChatGoogleGenerativeAIOptions(
          model: 'gemini-pro-vision',
        ),
      );

      expect(res.output.content.toLowerCase(), contains('apple'));
    });

    test('Test stop sequence', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          stopSequences: ['4'],
        ),
      );
      final text = res.output.content;
      expect(text, contains('123'));
      expect(text, isNot(contains('456789')));
    });

    test('Test max tokens', () async {
      final res = await chatModel.invoke(
        PromptValue.string('Tell me a joke'),
        options: const ChatGoogleGenerativeAIOptions(
          model: 'gemini-pro',
          maxOutputTokens: 2,
        ),
      );
      expect(res.output.content.length, lessThan(20));
      expect(res.finishReason, FinishReason.length);
    });

    test('Test Multi-turn conversations with gemini-pro', () async {
      final prompt = PromptValue.chat([
        ChatMessage.humanText(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        ChatMessage.ai('123456789'),
        ChatMessage.humanText(
          'Remove the number 4 from the list',
        ),
      ]);
      final res = await chatModel.invoke(
        prompt,
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      expect(
        res.output.content,
        contains('12356789'),
      );
    });

    test('Test streaming', () async {
      final stream = chatModel.stream(
        PromptValue.string(
          'List the numbers from 1 to 100 in order '
          'without any spaces, commas or additional explanations.',
        ),
      );

      String content = '';
      int count = 0;
      await for (final res in stream) {
        content += res.output.content;
        count++;
      }
      expect(count, greaterThan(1));
      expect(content, contains('123456789'));
    });
  });
}
