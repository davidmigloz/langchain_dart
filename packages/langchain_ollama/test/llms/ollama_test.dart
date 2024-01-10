// ignore_for_file: avoid_redundant_argument_values
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama tests', skip: Platform.environment.containsKey('CI'), () {
    late Ollama llm;
    const defaultModel = 'llama2:latest';

    setUp(() async {
      llm = Ollama(
        defaultOptions: const OllamaOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      llm.close();
    });

    test('Test Ollama parameters', () async {
      llm.defaultOptions = const OllamaOptions(
        model: 'foo',
        system: 'system prompt',
        template: 'TEMPLATE """',
        context: [1, 2, 3],
        format: OllamaResponseFormat.json,
        raw: true,
        numKeep: 0,
        seed: 1,
        numPredict: 2,
        topK: 3,
        topP: 4.0,
        tfsZ: 5.0,
        typicalP: 6.0,
        repeatLastN: 7,
        temperature: 8.0,
        repeatPenalty: 9.0,
        presencePenalty: 10.0,
        frequencyPenalty: 11.0,
        mirostat: 12,
        mirostatTau: 13.0,
        mirostatEta: 14.0,
        penalizeNewline: false,
        stop: ['stop <start_message>', 'stop <stop_message>'],
        numa: true,
        numCtx: 15,
        numBatch: 16,
        numGqa: 17,
        numGpu: 0,
        mainGpu: 18,
        lowVram: true,
        f16KV: true,
        logitsAll: true,
        vocabOnly: true,
        useMmap: true,
        useMlock: true,
        embeddingOnly: true,
        ropeFrequencyBase: 19.0,
        ropeFrequencyScale: 20.0,
        numThread: 21,
      );

      expect(llm.defaultOptions.model, 'foo');
      expect(
        llm.defaultOptions.system,
        'system prompt',
      );
      expect(llm.defaultOptions.template, 'TEMPLATE """');
      expect(llm.defaultOptions.context, [1, 2, 3]);
      expect(llm.defaultOptions.format, OllamaResponseFormat.json);
      expect(llm.defaultOptions.raw, true);
      expect(llm.defaultOptions.numKeep, 0);
      expect(llm.defaultOptions.seed, 1);
      expect(llm.defaultOptions.numPredict, 2);
      expect(llm.defaultOptions.topK, 3);
      expect(llm.defaultOptions.topP, 4.0);
      expect(llm.defaultOptions.tfsZ, 5.0);
      expect(llm.defaultOptions.typicalP, 6.0);
      expect(llm.defaultOptions.repeatLastN, 7);
      expect(llm.defaultOptions.temperature, 8.0);
      expect(llm.defaultOptions.repeatPenalty, 9.0);
      expect(llm.defaultOptions.presencePenalty, 10.0);
      expect(llm.defaultOptions.frequencyPenalty, 11.0);
      expect(llm.defaultOptions.mirostat, 12);
      expect(llm.defaultOptions.mirostatTau, 13.0);
      expect(llm.defaultOptions.mirostatEta, 14.0);
      expect(llm.defaultOptions.penalizeNewline, false);
      expect(
        llm.defaultOptions.stop,
        ['stop <start_message>', 'stop <stop_message>'],
      );
      expect(llm.defaultOptions.numa, true);
      expect(llm.defaultOptions.numCtx, 15);
      expect(llm.defaultOptions.numBatch, 16);
      expect(llm.defaultOptions.numGqa, 17);
      expect(llm.defaultOptions.numGpu, 0);
      expect(llm.defaultOptions.mainGpu, 18);
      expect(llm.defaultOptions.lowVram, true);
      expect(llm.defaultOptions.f16KV, true);
      expect(llm.defaultOptions.logitsAll, true);
      expect(llm.defaultOptions.vocabOnly, true);
      expect(llm.defaultOptions.useMmap, true);
      expect(llm.defaultOptions.useMlock, true);
      expect(llm.defaultOptions.embeddingOnly, true);
      expect(llm.defaultOptions.ropeFrequencyBase, 19.0);
      expect(llm.defaultOptions.ropeFrequencyScale, 20.0);
      expect(llm.defaultOptions.numThread, 21);
    });

    test('Test call to Ollama', () async {
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test generate to Ollama', () async {
      final res = await llm.generate('Hello, how are you?');
      expect(res.generations.length, 1);
    });

    test('Test model output contains metadata', () async {
      final res = await llm.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS:',
        ),
      );
      expect(
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['model'], defaultModel);
      expect(res.modelOutput!['created_at'], isNotNull);
      final generation = res.generations.first;
      expect(generation.generationInfo, isNotNull);
      expect(generation.generationInfo!['done'], isTrue);
      expect(generation.generationInfo!['context'], isNotEmpty);
      expect(generation.generationInfo!['total_duration'], greaterThan(0));
      expect(generation.generationInfo!['load_duration'], greaterThan(0));
      expect(generation.generationInfo!['prompt_eval_count'], greaterThan(0));
      expect(generation.generationInfo!['eval_count'], greaterThan(0));
      expect(generation.generationInfo!['eval_duration'], greaterThan(0));
    });

    test('Test stop logic on valid configuration', () async {
      const query = 'write an ordered list of five items';
      final res = await llm(
        query,
        options: const OllamaOptions(
          temperature: 0,
          stop: ['3'],
        ),
      );
      expect(res.contains('2.'), isTrue);
      expect(res.contains('3.'), isFalse);
    });

    test('Test tokenize', () async {
      const text = 'antidisestablishmentarianism';

      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [519, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test different encoding than the model', () async {
      llm.encoding = 'cl100k_base';
      const text = 'antidisestablishmentarianism';

      final tokens = await llm.tokenize(PromptValue.string(text));
      expect(tokens, [519, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test countTokens', () async {
      const text = 'Hello, how are you?';

      final numTokens = await llm.countTokens(PromptValue.string(text));
      expect(numTokens, 6);
    });

    test('Test streaming', () async {
      final promptTemplate = PromptTemplate.fromTemplate(
        'List the numbers from 1 to {max_num} in order. '
        'Output ONLY the numbers in one line without any spaces or commas. '
        'NUMBERS:',
      );
      const stringOutputParser = StringOutputParser<String>();

      final chain = promptTemplate.pipe(llm).pipe(stringOutputParser);

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

    test('Test raw mode', () async {
      final res = await llm.invoke(
        PromptValue.string(
          '[INST] List the numbers from 1 to 9 in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS: [/INST]',
        ),
        options: const OllamaOptions(raw: true),
      );
      expect(
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
    });

    test('Test JSON mode', () async {
      final res = await llm.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order. Respond using JSON.',
        ),
        options: const OllamaOptions(format: OllamaResponseFormat.json),
      );
      expect(
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('[1,2,3,4,5,6,7,8,9]'),
      );
    });

    test('Test response seed', skip: true, () async {
      final prompt = PromptValue.string(
        'Why is the sky blue? Reply in one sentence.',
      );
      const options = OllamaOptions(seed: 9999);

      final res1 = await llm.invoke(
        prompt,
        options: options,
      );
      expect(res1.generations, hasLength(1));
      final generation1 = res1.generations.first;

      final res2 = await llm.invoke(
        prompt,
        options: options,
      );
      expect(res2.generations, hasLength(1));
      final generation2 = res2.generations.first;
      expect(generation1.output, generation2.output);
    });
  });
}
