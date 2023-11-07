@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
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
        logitBias: {'foo': 1},
        user: 'foo',
      );
      expect(llm.model, 'foo');
      expect(llm.maxTokens, 10);
      expect(llm.temperature, 0.1);
      expect(llm.topP, 0.1);
      expect(llm.n, 10);
      expect(llm.presencePenalty, 0.1);
      expect(llm.frequencyPenalty, 0.1);
      expect(llm.bestOf, 10);
      expect(llm.logitBias, {'foo': 1.0});
      expect(llm.user, 'foo');
    });

    test('Test call to OpenAI', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test generate to OpenAI', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await llm.generate('Hello, how are you?');
      expect(res.generations.length, 1);
    });

    test('Test model output contains metadata', () async {
      final llm = OpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await llm.generate('Hello, how are you?');
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['id'], isNotEmpty);
      expect(res.modelOutput!['created'], isNotNull);
      expect(res.modelOutput!['model'], llm.model);
    });

    test('Test stop logic on valid configuration', () async {
      const query = 'write an ordered list of five items';
      final llm = OpenAI(apiKey: openaiApiKey, temperature: 0);
      final res = await llm(query, options: const OpenAIOptions(stop: ['3']));
      expect(res.contains('2.'), isTrue);
      expect(res.contains('3.'), isFalse);
    });

    test('Test OpenAI wrapper with multiple completions', () async {
      final llm = OpenAI(apiKey: openaiApiKey, n: 5, bestOf: 5);
      final res = await llm.generate('Hello, how are you?');
      expect(res.generations.length, 5);
      for (final generation in res.generations) {
        expect(generation.output, isNotEmpty);
      }
    });

    test('Test tokenize', () async {
      final llm = OpenAI(apiKey: openaiApiKey);
      const text = 'Hello, how are you?';

      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [15496, 11, 703, 389, 345, 30]);
    });

    test('Test different encoding than the model', () async {
      final llm = OpenAI(apiKey: openaiApiKey, encoding: 'cl100k_base');
      const text = 'Hello, how are you?';

      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [9906, 11, 1268, 527, 499, 30]);
    });

    test('Test countTokens', () async {
      final llm = OpenAI(apiKey: openaiApiKey);
      const text = 'Hello, how are you?';

      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, 6);
    });

    test('Test streaming', () async {
      final promptTemplate = PromptTemplate.fromTemplate(
        'List the numbers from 1 to {max_num} in order without any spaces or commas',
      );
      final llm = OpenAI(apiKey: openaiApiKey);
      const stringOutputParser = StringOutputParser<String>();

      final chain = promptTemplate.pipe(llm).pipe(stringOutputParser);

      final stream = chain.stream({'max_num': '9'});

      String content = '';
      int count = 0;
      await for (final res in stream) {
        content += res;
        count++;
      }
      expect(count, greaterThan(1));
      expect(content, contains('123456789'));
    });

    test('Test response seed', () async {
      final prompt = PromptValue.string('How are you?');
      final llm = OpenAI(
        apiKey: openaiApiKey,
        temperature: 0,
        seed: 9999,
      );

      final res1 = await llm.invoke(prompt);
      expect(res1.generations, hasLength(1));
      final generation1 = res1.generations.first;

      final res2 = await llm.invoke(prompt);
      expect(res2.generations, hasLength(1));
      final generation2 = res2.generations.first;

      expect(
        res1.modelOutput?['system_fingerprint'],
        res2.modelOutput?['system_fingerprint'],
      );
      expect(generation1.output, generation2.output);
    });
  });
}
