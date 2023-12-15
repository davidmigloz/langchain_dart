// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('ChatGoogleGenerativeAI tests', () {
    late ChatGoogleGenerativeAI chatModel;

    setUp(() async {
      chatModel = ChatGoogleGenerativeAI(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test Text-only input with gemini-pro', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: 'gemini-pro',
          temperature: 0,
        ),
      );
      expect(res.id, isNotEmpty);
      expect(res.generations, hasLength(1));
      expect(res.modelOutput?['model'], 'gemini-pro');
      expect(res.modelOutput?['block_reason'], isNull);
      expect(
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
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

      expect(res.generations, hasLength(1));
      final outputMsg = res.generations.first.output;
      expect(outputMsg.content.toLowerCase(), contains('apple'));
    });

    test('Test stop sequence', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: 'gemini-pro',
          stopSequences: ['4'],
        ),
      );
      final text = res.firstOutputAsString;
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
      final text = res.firstOutputAsString;
      expect(text.length, lessThan(20));
      expect(
        res.generations.first.generationInfo?['finish_reason'],
        'maxTokens',
      );
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
          model: 'gemini-pro',
          temperature: 0,
        ),
      );
      expect(
        res.firstOutputAsString,
        contains('12356789'),
      );
    });
  });
}
