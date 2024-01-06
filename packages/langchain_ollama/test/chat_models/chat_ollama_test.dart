// ignore_for_file: avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOllama tests', skip: Platform.environment.containsKey('CI'), () {
    late ChatOllama chatModel;
    const defaultModel = 'llama2:latest';
    const visionModel = 'llava:latest';

    setUp(() async {
      chatModel = ChatOllama(
        defaultOptions: const ChatOllamaOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test ChatOllama parameters', () async {
      chatModel.defaultOptions = const ChatOllamaOptions(
        model: 'foo',
        format: OllamaResponseFormat.json,
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

      expect(chatModel.defaultOptions.model, 'foo');
      expect(chatModel.defaultOptions.format, OllamaResponseFormat.json);
      expect(chatModel.defaultOptions.numKeep, 0);
      expect(chatModel.defaultOptions.seed, 1);
      expect(chatModel.defaultOptions.numPredict, 2);
      expect(chatModel.defaultOptions.topK, 3);
      expect(chatModel.defaultOptions.topP, 4.0);
      expect(chatModel.defaultOptions.tfsZ, 5.0);
      expect(chatModel.defaultOptions.typicalP, 6.0);
      expect(chatModel.defaultOptions.repeatLastN, 7);
      expect(chatModel.defaultOptions.temperature, 8.0);
      expect(chatModel.defaultOptions.repeatPenalty, 9.0);
      expect(chatModel.defaultOptions.presencePenalty, 10.0);
      expect(chatModel.defaultOptions.frequencyPenalty, 11.0);
      expect(chatModel.defaultOptions.mirostat, 12);
      expect(chatModel.defaultOptions.mirostatTau, 13.0);
      expect(chatModel.defaultOptions.mirostatEta, 14.0);
      expect(chatModel.defaultOptions.penalizeNewline, false);
      expect(
        chatModel.defaultOptions.stop,
        ['stop <start_message>', 'stop <stop_message>'],
      );
      expect(chatModel.defaultOptions.numa, true);
      expect(chatModel.defaultOptions.numCtx, 15);
      expect(chatModel.defaultOptions.numBatch, 16);
      expect(chatModel.defaultOptions.numGqa, 17);
      expect(chatModel.defaultOptions.numGpu, 0);
      expect(chatModel.defaultOptions.mainGpu, 18);
      expect(chatModel.defaultOptions.lowVram, true);
      expect(chatModel.defaultOptions.f16KV, true);
      expect(chatModel.defaultOptions.logitsAll, true);
      expect(chatModel.defaultOptions.vocabOnly, true);
      expect(chatModel.defaultOptions.useMmap, true);
      expect(chatModel.defaultOptions.useMlock, true);
      expect(chatModel.defaultOptions.embeddingOnly, true);
      expect(chatModel.defaultOptions.ropeFrequencyBase, 19.0);
      expect(chatModel.defaultOptions.ropeFrequencyScale, 20.0);
      expect(chatModel.defaultOptions.numThread, 21);
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
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('123456789'),
      );
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['model'], defaultModel);
      expect(res.modelOutput!['created_at'], isNotNull);
      final generation = res.generations.first;
      expect(generation.generationInfo, isNotNull);
      expect(generation.generationInfo!['done'], isTrue);
      expect(generation.generationInfo!['total_duration'], greaterThan(0));
      expect(generation.generationInfo!['load_duration'], greaterThan(0));
      expect(generation.generationInfo!['prompt_eval_count'], greaterThan(0));
      expect(generation.generationInfo!['eval_count'], greaterThan(0));
      expect(generation.generationInfo!['eval_duration'], greaterThan(0));
    });

    test('Test stop logic on valid configuration', () async {
      const query = 'write an ordered list of five items';
      final res = await chatModel(
        [ChatMessage.humanText(query)],
        options: const ChatOllamaOptions(
          temperature: 0,
          stop: ['3'],
        ),
      );
      expect(res.content.contains('2.'), isTrue);
      expect(res.content.contains('3.'), isFalse);
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
      const options = ChatOllamaOptions(seed: 9999);

      final res1 = await chatModel.invoke(
        prompt,
        options: options,
      );
      expect(res1.generations, hasLength(1));
      final generation1 = res1.generations.first;

      final res2 = await chatModel.invoke(
        prompt,
        options: options,
      );
      expect(res2.generations, hasLength(1));
      final generation2 = res2.generations.first;
      expect(generation1.output, generation2.output);
    });

    test('Test Multi-turn conversations', () async {
      final prompt = PromptValue.chat([
        ChatMessage.humanText(
          'List the numbers from 1 to 9 in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS:',
        ),
        ChatMessage.ai('123456789'),
        ChatMessage.humanText(
          'Remove the number "4" from the list',
        ),
      ]);
      final res = await chatModel.invoke(
        prompt,
        options: const ChatOllamaOptions(
          temperature: 0,
        ),
      );
      expect(
        res.firstOutputAsString.replaceAll(RegExp(r'[\s\n]'), ''),
        contains('12356789'),
      );
    });

    test('Text-and-image input with llava', () async {
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
        options: const ChatOllamaOptions(
          model: visionModel,
          temperature: 0,
        ),
      );

      expect(res.generations, hasLength(1));
      final outputMsg = res.generations.first.output;
      expect(outputMsg.content.toLowerCase(), contains('apple'));
    });
  });
}
