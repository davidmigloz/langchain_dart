@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOpenAI tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test ChatOpenAI parameters', () async {
      final chat = ChatOpenAI(
        apiKey: openaiApiKey,
        model: 'foo',
        temperature: 0.1,
        topP: 0.1,
        n: 10,
        maxTokens: 10,
        presencePenalty: 0.1,
        frequencyPenalty: 0.1,
        logitBias: {'foo': 1.0},
      );
      expect(chat.model, 'foo');
      expect(chat.maxTokens, 10);
      expect(chat.temperature, 0.1);
      expect(chat.topP, 0.1);
      expect(chat.n, 10);
      expect(chat.presencePenalty, 0.1);
      expect(chat.frequencyPenalty, 0.1);
      expect(chat.logitBias, {'foo': 1.0});
    });

    test('Test call to ChatOpenAI', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await chat([ChatMessage.human('Hello')]);
      expect(res.content, isNotEmpty);
    });

    test('Test generate to ChatOpenAI', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey);
      final res = await chat.generate(
        [
          ChatMessage.human('Hello, how are you?'),
          ChatMessage.ai('I am fine, thank you.'),
          ChatMessage.human('Good, what is your name?'),
        ],
      );
      expect(res.generations.first.output.content, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await chat.generate(
        [ChatMessage.human('Hello, how are you?')],
      );
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['id'], isNotEmpty);
      expect(res.modelOutput!['created'], isNotNull);
      expect(res.modelOutput!['model'], chat.model);
    });

    test('Test stop logic on valid configuration', () async {
      final query = ChatMessage.human('write an ordered list of five items');
      final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
      final res = await chat([query], stop: ['3']);
      expect(res.content.contains('2.'), isTrue);
      expect(res.content.contains('3.'), isFalse);
    });

    test('Test ChatOpenAI wrapper with system message', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final systemMessage = ChatMessage.human('You are to chat with the user.');
      final humanMessage =
          ChatMessage.human('write an ordered list of five items');
      final res = await chat([systemMessage, humanMessage]);
      expect(res.content, isNotEmpty);
    });

    test('Test ChatOpenAI wrapper with multiple completions', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10, n: 5);
      final humanMessage = ChatMessage.human('Hello');
      final res = await chat.generate([humanMessage]);
      expect(res.generations.length, 5);
      for (final generation in res.generations) {
        expect(generation.output.content, isNotEmpty);
      }
    });
  });
}
