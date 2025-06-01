// ignore_for_file: avoid_redundant_argument_values
import 'dart:io';

import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama tests', skip: Platform.environment.containsKey('CI'), () {
    late Ollama llm;
    const defaultModel = 'llama3.2';

    setUp(() {
      llm = Ollama(
        defaultOptions: const OllamaOptions(
          model: defaultModel,
          keepAlive: 1,
        ),
      );
    });

    tearDown(() {
      llm.close();
    });

    test('Test Ollama parameters', () {
      const options = OllamaOptions(
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
        numGpu: 0,
        mainGpu: 18,
        lowVram: true,
        f16KV: true,
        logitsAll: true,
        vocabOnly: true,
        useMmap: true,
        useMlock: true,
        numThread: 21,
      );

      expect(options.model, 'foo');
      expect(options.system, 'system prompt');
      expect(options.template, 'TEMPLATE """');
      expect(options.context, [1, 2, 3]);
      expect(options.format, OllamaResponseFormat.json);
      expect(options.raw, true);
      expect(options.numKeep, 0);
      expect(options.seed, 1);
      expect(options.numPredict, 2);
      expect(options.topK, 3);
      expect(options.topP, 4.0);
      expect(options.tfsZ, 5.0);
      expect(options.typicalP, 6.0);
      expect(options.repeatLastN, 7);
      expect(options.temperature, 8.0);
      expect(options.repeatPenalty, 9.0);
      expect(options.presencePenalty, 10.0);
      expect(options.frequencyPenalty, 11.0);
      expect(options.mirostat, 12);
      expect(options.mirostatTau, 13.0);
      expect(options.mirostatEta, 14.0);
      expect(options.penalizeNewline, false);
      expect(options.stop, ['stop <start_message>', 'stop <stop_message>']);
      expect(options.numa, true);
      expect(options.numCtx, 15);
      expect(options.numBatch, 16);
      expect(options.numGpu, 0);
      expect(options.mainGpu, 18);
      expect(options.lowVram, true);
      expect(options.f16KV, true);
      expect(options.logitsAll, true);
      expect(options.vocabOnly, true);
      expect(options.useMmap, true);
      expect(options.useMlock, true);
      expect(options.numThread, 21);
    });

    test('Test call to Ollama', () async {
      final output = await llm('Say foo:');
      expect(output, isNotEmpty);
    });

    test('Test invoke to Ollama', () async {
      final res = await llm.invoke(
        PromptValue.string('Hello, how are you?'),
      );
      expect(res.output, isNotEmpty);
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
        res.output.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
      expect(res.metadata, isNotNull);
      expect(res.metadata['model'], defaultModel);
      expect(res.metadata['created_at'], isNotNull);
      expect(res.metadata['done'], isTrue);
      expect(res.metadata['context'], isNotEmpty);
      expect(res.metadata['total_duration'], greaterThan(0));
      expect(res.metadata['load_duration'], greaterThan(0));
      expect(res.metadata['eval_count'], greaterThan(0));
      expect(res.metadata['eval_duration'], greaterThan(0));
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
      const stringOutputParser = StringOutputParser<LLMResult>();

      final chain = promptTemplate.pipe(llm).pipe(stringOutputParser);

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

    test('Test raw mode', () async {
      final res = await llm.invoke(
        PromptValue.string(
          '''
<|start_header_id|>system<|end_header_id|>

You are an AI assistant that follows instructions precisely.
<|eot_id|><|start_header_id|>user<|end_header_id|>

List the numbers from 1 to 9 in order. Output ONLY the numbers on one line without any spaces or commas between them.
<|eot_id|><|start_header_id|>assistant<|end_header_id|>
'''
              .trim(),
        ),
        options: const OllamaOptions(raw: true),
      );
      expect(
        res.output.replaceAll(RegExp(r'[\s\n]'), ''),
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
        res.output.replaceAll(RegExp(r'[\s\n]'), ''),
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

      final res2 = await llm.invoke(
        prompt,
        options: options,
      );

      expect(res1.output, res2.output);
    });
  });
}
