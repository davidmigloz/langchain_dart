import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test OpenAI parameters', () async {
      final llm = OpenAI(
        apiKey: openaiApiKey,
        model: 'foo',
        maxTokens: 10,
        temperature: 0.1,
        topP: 0.1,
        n: 10,
        presencePenalty: 0.1,
        frequencyPenalty: 0.1,
        bestOf: 10,
      );
      expect(llm.model, 'foo');
      expect(llm.maxTokens, 10);
      expect(llm.temperature, 0.1);
      expect(llm.topP, 0.1);
      expect(llm.n, 10);
      expect(llm.presencePenalty, 0.1);
      expect(llm.frequencyPenalty, 0.1);
      expect(llm.bestOf, 10);
    });

    test('Test call to OpenAI', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final output = await llm(prompt: 'Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test generate to OpenAI', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await llm.generate(
        prompts: [
          'Hello, how are you?',
          'I am fine, thank you.',
        ],
      );
      expect(res.generations.length, 2);
    });

    test('Test LLM output contains model', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await llm.generate(prompts: ['Hello, how are you?']);
      expect(res.llmOutput, isNotNull);
      expect(res.llmOutput!['model'], llm.model);
    });

    test('Test openai stop logic on valid configuration', () async {
      const query = 'write an ordered list of five items';
      final llm = OpenAI(apiKey: openaiApiKey, temperature: 0);
      final res = await llm(prompt: query, stop: ['3']);
      expect(res.contains('2.'), isTrue);
      expect(res.contains('3.'), isFalse);
    });
  });
}
