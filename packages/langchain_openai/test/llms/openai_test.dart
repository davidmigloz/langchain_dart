@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI tests', () {
    const defaultModel = 'gpt-3.5-turbo-instruct';
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    late OpenAI llm;

    setUp(() async {
      llm = OpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const OpenAIOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      llm.close();
    });

    test('Test OpenAI parameters', () async {
      final llm = OpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const OpenAIOptions(
          model: defaultModel,
          maxTokens: 10,
          temperature: 0.1,
          topP: 0.1,
          n: 10,
          presencePenalty: 0.1,
          frequencyPenalty: 0.1,
          bestOf: 10,
          logitBias: {'foo': 1},
          user: 'foo',
        ),
      );
      expect(llm.apiKey, openaiApiKey);
      expect(llm.defaultOptions.model, defaultModel);
      expect(llm.defaultOptions.maxTokens, 10);
      expect(llm.defaultOptions.temperature, 0.1);
      expect(llm.defaultOptions.topP, 0.1);
      expect(llm.defaultOptions.n, 10);
      expect(llm.defaultOptions.presencePenalty, 0.1);
      expect(llm.defaultOptions.frequencyPenalty, 0.1);
      expect(llm.defaultOptions.bestOf, 10);
      expect(llm.defaultOptions.logitBias, {'foo': 1.0});
      expect(llm.defaultOptions.user, 'foo');
    });

    test('Test call to OpenAI', () async {
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test close OpenAI', () async {
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
      llm.close();
      expect(() => llm('Say foo:'), throwsA(isA<OpenAIClientException>()));
    });

    test('Test invoke to OpenAI', () async {
      final res = await llm.invoke(
        PromptValue.string('Hello, how are you?'),
      );
      expect(res.output, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final res = await llm.invoke(
        PromptValue.string('Hello, how are you?'),
      );
      expect(res.id, isNotEmpty);
      expect(res.metadata, isNotNull);
      expect(res.metadata['created'], isNotNull);
      expect(res.metadata['model'], llm.defaultOptions.model);
    });

    test('Test stop logic on valid configuration', () async {
      final res = await llm.invoke(
        PromptValue.string('write an ordered list of five items'),
        options: const OpenAIOptions(
          stop: ['3'],
          temperature: 0,
        ),
      );
      expect(res.output.contains('2.'), isTrue);
      expect(res.output.contains('3.'), isFalse);
    });

    test('Test tokenize', () async {
      final text = PromptValue.string('Hello, how are you?');
      final tokens = await llm.tokenize(text);
      expect(tokens, [9906, 11, 1268, 527, 499, 30]);
    });

    test('Test different encoding than the model', () async {
      llm.encoding = 'cl100k_base';
      const text = 'Hello, how are you?';
      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [9906, 11, 1268, 527, 499, 30]);
    });

    test('Test countTokens', () async {
      const text = 'Hello, how are you?';
      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, 6);
    });

    test('Test streaming', () async {
      final promptTemplate = PromptTemplate.fromTemplate(
        'List the numbers from 1 to {max_num} in order without any spaces or commas',
      );
      const stringOutputParser = StringOutputParser<LLMResult>();

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
      const options = OpenAIOptions(
        model: defaultModel,
        temperature: 0,
        seed: 9999,
      );

      final res1 = await llm.invoke(prompt, options: options);
      final res2 = await llm.invoke(prompt, options: options);

      expect(
        res1.metadata['system_fingerprint'],
        res2.metadata['system_fingerprint'],
      );
      expect(res1.output, res2.output);
    });

    test('Test batch with same options for all inputs', () async {
      const count = 10;
      final prompts = List.generate(
        count,
        (final i) => PromptValue.string('Output the following number: $i'),
      );

      final res = await llm.batch(
        prompts,
        options: [const OpenAIOptions(concurrencyLimit: count ~/ 2)],
      );

      expect(res.length, count);
      for (int i = 0; i < count; i++) {
        expect(res[i].id.endsWith(':${i % (count ~/ 2)}'), isTrue);
        expect(res[i].output.contains('$i'), isTrue);
      }
    });

    test('Test batch with different options per input', () async {
      const count = 10;
      final prompts = List.generate(
        count,
        (final i) => PromptValue.string('Output the following number: $i'),
      );
      final options = List.generate(
        count,
        (final i) => OpenAIOptions(
          temperature: 0 + (i / 10),
        ),
      );

      final res = await llm.batch(prompts, options: options);

      expect(res.length, count);
      for (int i = 0; i < count; i++) {
        expect(res[i].id.endsWith(':0'), isTrue);
        expect(res[i].output.contains('$i'), isTrue);
      }
    });
  });
}
