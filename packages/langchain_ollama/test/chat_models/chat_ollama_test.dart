// ignore_for_file: avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOllama tests', skip: Platform.environment.containsKey('CI'), () {
    late ChatOllama chatModel;
    const defaultModel = 'llama3.2';
    const visionModel = 'llava:latest';

    setUp(() {
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

    test('Test ChatOllama parameters', () {
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

      var content = '';
      var count = 0;
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
        ChatMessage.humanText('List the numbers from 1 to 9 in order.'),
        ChatMessage.ai('123456789'),
        ChatMessage.humanText(
          'Remove the number "4" from the list. Output only the remaining numbers in ascending order.',
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
                  await File(
                    './test/chat_models/assets/apple.jpeg',
                  ).readAsBytes(),
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

    const tool1 = ToolSpec(
      name: 'get_current_weather',
      description: 'Get the current weather in a given location',
      inputJsonSchema: {
        'type': 'object',
        'properties': {
          'location': {
            'type': 'string',
            'description': 'The city and country, e.g. San Francisco, US',
          },
          'unit': {
            'type': 'string',
            'enum': ['celsius', 'fahrenheit'],
          },
        },
        'required': ['location'],
      },
    );
    const tool2 = ToolSpec(
      name: 'get_historic_weather',
      description: 'Get the historic weather in a given location',
      inputJsonSchema: {
        'type': 'object',
        'properties': {
          'location': {
            'type': 'string',
            'description': 'The city and country, e.g. San Francisco, US',
          },
          'unit': {
            'type': 'string',
            'enum': ['celsius', 'fahrenheit'],
          },
        },
        'required': ['location'],
      },
    );

    test(
      'Test tool calling',
      timeout: const Timeout(Duration(minutes: 1)),
      () async {
        final model = chatModel.bind(
          const ChatOllamaOptions(
            model: defaultModel,
            tools: [tool1],
          ),
        );

        final humanMessage = ChatMessage.humanText(
          "What's the weather like in Boston and Madrid right now in celsius?",
        );
        final res1 = await model.invoke(PromptValue.chat([humanMessage]));

        final aiMessage1 = res1.output;
        expect(aiMessage1.toolCalls, hasLength(2));

        final toolCall1 = aiMessage1.toolCalls.first;
        expect(toolCall1.name, tool1.name);
        expect(toolCall1.arguments.containsKey('location'), isTrue);
        expect(toolCall1.arguments['location'], contains('Boston'));
        expect(toolCall1.arguments['unit'], 'celsius');

        final toolCall2 = aiMessage1.toolCalls.last;
        expect(toolCall2.name, tool1.name);
        expect(toolCall2.arguments.containsKey('location'), isTrue);
        expect(toolCall2.arguments['location'], contains('Madrid'));
        expect(toolCall2.arguments['unit'], 'celsius');

        final functionResult1 = {
          'temperature': '22',
          'unit': 'celsius',
          'description': 'Sunny',
        };
        final functionMessage1 = ChatMessage.tool(
          toolCallId: toolCall1.id,
          content: json.encode(functionResult1),
        );

        final functionResult2 = {
          'temperature': '25',
          'unit': 'celsius',
          'description': 'Cloudy',
        };
        final functionMessage2 = ChatMessage.tool(
          toolCallId: toolCall2.id,
          content: json.encode(functionResult2),
        );

        final res2 = await model.invoke(
          PromptValue.chat([
            humanMessage,
            aiMessage1,
            functionMessage1,
            functionMessage2,
          ]),
        );

        final aiMessage2 = res2.output;

        expect(aiMessage2.toolCalls, isEmpty);
        expect(aiMessage2.content, contains('22'));
        expect(aiMessage2.content, contains('25'));
      },
    );

    test('Test multi tool call', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          "What's the weather in Vellore, India and in Barcelona, Spain?",
        ),
        options: const ChatOllamaOptions(
          model: defaultModel,
          tools: [tool1, tool2],
        ),
      );
      expect(res.output.toolCalls, hasLength(2));
      final toolCall1 = res.output.toolCalls.first;
      expect(toolCall1.name, 'get_current_weather');
      expect(toolCall1.argumentsRaw, isNotEmpty);
      expect(toolCall1.arguments, isNotEmpty);
      expect(toolCall1.arguments['location'], 'Vellore, India');
      expect(toolCall1.arguments['unit'], 'celsius');
      final toolCall2 = res.output.toolCalls.last;
      expect(toolCall2.name, 'get_current_weather');
      expect(toolCall2.argumentsRaw, isNotEmpty);
      expect(toolCall2.arguments, isNotEmpty);
      expect(toolCall2.arguments['location'], 'Barcelona, Spain');
      expect(toolCall2.arguments['unit'], 'celsius');
      expect(res.finishReason, FinishReason.stop);
    });

    test('Test ChatToolChoice.none', () async {
      final res = await chatModel.invoke(
        PromptValue.string("What's the weather in Vellore, India?"),
        options: const ChatOllamaOptions(
          model: defaultModel,
          tools: [tool1],
          toolChoice: ChatToolChoice.none,
        ),
      );
      expect(res.output.toolCalls, isEmpty);
      expect(res.output.content, isNotEmpty);
    });

    test('Test ChatToolChoice.forced', () async {
      final res = await chatModel.invoke(
        PromptValue.string("What's the weather in Vellore, India?"),
        options: ChatOllamaOptions(
          model: defaultModel,
          tools: const [tool1, tool2],
          toolChoice: ChatToolChoice.forced(name: tool2.name),
        ),
      );
      expect(res.output.toolCalls, hasLength(1));
      final toolCall = res.output.toolCalls.first;
      expect(toolCall.name, tool2.name);
    });
  });
}
