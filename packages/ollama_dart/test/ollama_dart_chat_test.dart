import 'dart:io';

import 'package:ollama_dart/ollama_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Ollama Generate Completions API tests',
      skip: Platform.environment.containsKey('CI'), () {
    late OllamaClient client;
    const defaultModel = 'gemma2';
    const visionModel = 'llava';

    setUp(() async {
      client = OllamaClient();
      // Check that the model exists
      final res = await client.listModels();
      expect(
        res.models?.firstWhere((final m) => m.model!.startsWith(defaultModel)),
        isNotNull,
      );
      expect(
        res.models?.firstWhere((final m) => m.model!.startsWith(visionModel)),
        isNotNull,
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call chat API', () async {
      final response = await client.generateChatCompletion(
        request: const GenerateChatCompletionRequest(
          model: defaultModel,
          messages: [
            Message(
              role: MessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: MessageRole.user,
              content: 'Hello!',
            ),
          ],
          keepAlive: 1,
        ),
      );
      expect(response.model, defaultModel);
      expect(response.createdAt, isNotNull);
      expect(
        response.message?.content,
        isNotEmpty,
      );
      expect(response.done, isTrue);
      expect(response.doneReason, DoneReason.stop);
      expect(response.totalDuration, greaterThan(0));
      expect(response.promptEvalCount, greaterThan(0));
      expect(response.evalCount, greaterThan(0));
      expect(response.evalDuration, greaterThan(0));
    });

    test('Test call chat completions streaming API', () async {
      final stream = client.generateChatCompletionStream(
        request: const GenerateChatCompletionRequest(
          model: defaultModel,
          messages: [
            Message(
              role: MessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: MessageRole.user,
              content: 'List the numbers from 1 to 9 in order. '
                  'Output ONLY the numbers in one line without any spaces or commas. '
                  'NUMBERS: ',
            ),
          ],
        ),
      );
      String text = '';
      await for (final res in stream) {
        text += (res.message?.content ?? '').trim();
      }
      expect(text, contains('123456789'));
    });

    test('Test call chat completions API with JSON mode', () async {
      final res = await client.generateChatCompletion(
        request: const GenerateChatCompletionRequest(
          model: defaultModel,
          messages: [
            Message(
              role: MessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: MessageRole.user,
              content: 'List the numbers from 1 to 9 in order. '
                  'Output ONLY the numbers in a JSON list. '
                  'NUMBERS: ',
            ),
          ],
          format: ResponseFormat.json,
        ),
      );
      final generation = res.message?.content.replaceAll(RegExp(r'[\s\n]'), '');
      expect(generation, contains('[1,2,3,4,5,6,7,8,9]'));
    });

    test('Test call chat completions API with stop sequence', () async {
      final res = await client.generateChatCompletion(
        request: const GenerateChatCompletionRequest(
          model: defaultModel,
          messages: [
            Message(
              role: MessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: MessageRole.user,
              content: 'List the numbers from 1 to 9 in order. '
                  'Output ONLY the numbers without spaces or commas.',
            ),
          ],
          options: RequestOptions(stop: ['4']),
        ),
      );
      final generation = res.message?.content.replaceAll(RegExp(r'[\s\n]'), '');
      expect(generation, contains('123'));
      expect(generation, isNot(contains('456789')));
      expect(res.doneReason, DoneReason.stop);
    });

    test('Test call chat completions API with max tokens', () async {
      final res = await client.generateChatCompletion(
        request: const GenerateChatCompletionRequest(
          model: defaultModel,
          messages: [
            Message(
              role: MessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: MessageRole.user,
              content: 'List the numbers from 1 to 9 in order.',
            ),
          ],
          options: RequestOptions(numPredict: 1),
        ),
      );
      expect(res.doneReason, DoneReason.length);
    });

    test('Test call chat completions API with image', () async {
      const request = GenerateChatCompletionRequest(
        model: visionModel,
        messages: [
          Message(
            role: MessageRole.system,
            content: 'You are a helpful assistant.',
          ),
          Message(
            role: MessageRole.user,
            content: 'Describe the contents of the image.',
            images: [
              'iVBORw0KGgoAAAANSUhEUgAAAAkAAAANCAIAAAD0YtNRAAAABnRSTlMA/AD+APzoM1ogAAAAWklEQVR4AWP48+8PLkR7uUdzcMvtU8EhdykHKAciEXL3pvw5FQIURaBDJkARoDhY3zEXiCgCHbNBmAlUiyaBkENoxZSDWnOtBmoAQu7TnT+3WuDOA7KBIkAGAGwiNeqjusp/AAAAAElFTkSuQmCC',
            ],
          ),
        ],
      );

      final res1 = await client.generateChatCompletion(request: request);
      final text1 = res1.message?.content;
      expect(text1, contains('star'));
    });
  });
}
