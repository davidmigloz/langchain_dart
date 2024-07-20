// ignore_for_file: avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOllama tests', skip: Platform.environment.containsKey('CI'), () {
    late ChatOllama chatModel;
    const defaultModel = 'llama3:latest';
    const visionModel = 'llava:latest';

    setUp(() async {
      chatModel = ChatOllama(
        defaultOptions: const ChatOllamaOptions(
          model: defaultModel,
          keepAlive: 1,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test ChatOllama parameters', () async {
      const options = ChatOllamaOptions(
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
      expect(options.format, OllamaResponseFormat.json);
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
        res.output.content.replaceAll(RegExp(r'[\s\n-]'), ''),
        contains('123456789'),
      );
      expect(res.finishReason, FinishReason.stop);
      expect(res.metadata, isNotNull);
      expect(res.metadata['model'], defaultModel);
      expect(res.metadata['created_at'], isNotNull);
      expect(res.metadata['done'], isTrue);
      expect(res.metadata['total_duration'], greaterThan(0));
      expect(res.metadata['load_duration'], greaterThan(0));
      expect(res.metadata['prompt_eval_count'], greaterThan(0));
      expect(res.metadata['eval_count'], greaterThan(0));
      expect(res.metadata['eval_duration'], greaterThan(0));
    });

    test('Test stop logic on valid configuration', () async {
      final res = await chatModel.invoke(
        PromptValue.string('write an ordered list of five items'),
        options: const ChatOllamaOptions(
          temperature: 0,
          stop: ['3'],
        ),
      );
      expect(res.output.content.contains('2.'), isTrue);
      expect(res.output.content.contains('3.'), isFalse);
      expect(res.finishReason, FinishReason.stop);
    });

    test('Test max tokens', () async {
      final res = await chatModel.invoke(
        PromptValue.string('write an ordered list of five items'),
        options: const ChatOllamaOptions(
          numPredict: 2,
        ),
      );
      expect(res.finishReason, FinishReason.length);
    });

    test('Test tokenize', () async {
      final tokens = await chatModel.tokenize(
        PromptValue.string('antidisestablishmentarianism'),
      );
      expect(tokens, [519, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test different encoding than the model', () async {
      chatModel.encoding = 'cl100k_base';
      final tokens = await chatModel.tokenize(
        PromptValue.string('antidisestablishmentarianism'),
      );
      expect(tokens, [519, 85342, 34500, 479, 8997, 2191]);
    });

    test('Test countTokens', () async {
      final numTokens = await chatModel.countTokens(
        PromptValue.string('Hello, how are you?'),
      );
      expect(numTokens, 6);
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

      final res2 = await chatModel.invoke(
        prompt,
        options: options,
      );
      expect(res1.output, res2.output);
    });

    test('Test Multi-turn conversations', () async {
      final prompt = PromptValue.chat([
        ChatMessage.humanText('List the numbers from 1 to 9 in order. '),
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
        res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
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

      expect(res.output.content.toLowerCase(), contains('apple'));
    });
  });
}
