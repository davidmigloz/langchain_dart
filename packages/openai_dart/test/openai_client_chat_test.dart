@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Chat Completions API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call chat completion API', () async {
      final models = [
        ChatCompletionModels.gpt35Turbo,
        ChatCompletionModels.gpt4,
      ];

      for (final model in models) {
        final request = CreateChatCompletionRequest(
          model: ChatCompletionModel.enumeration(model),
          messages: [
            const ChatCompletionMessage(
              role: ChatCompletionMessageRole.system,
              content: 'You are a helpful assistant.',
            ),
            const ChatCompletionMessage(
              role: ChatCompletionMessageRole.user,
              content: 'Hello!',
            ),
          ],
          temperature: 0,
        );
        final res = await client.createChatCompletion(request: request);
        expect(res.choices, hasLength(1));
        final choice = res.choices.first;
        expect(choice.index, 0);
        expect(choice.finishReason, ChatCompletionFinishReason.stop);
        final message = choice.message;
        expect(message.role, ChatCompletionMessageRole.assistant);
        expect(message.content, isNotEmpty);
        expect(message.functionCall, isNull);
        expect(message.name, isNull);
        expect(res.id, isNotEmpty);
        expect(res.created, greaterThan(0));
        expect(res.model, startsWith('gpt-'));
        expect(res.object, 'chat.completion');
        expect(res.usage?.promptTokens, greaterThan(0));
        expect(res.usage?.completionTokens, greaterThan(0));
        expect(res.usage?.totalTokens, greaterThan(0));
      }
    });

    test('Test call chat completion API with stop sequence', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content:
                'You are a helpful assistant that replies only with numbers '
                'in order without any spaces or commas',
          ),
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'List the numbers from 1 to 9',
          ),
        ],
        maxTokens: 10,
        temperature: 0,
        stop: ChatCompletionStop.string('4'),
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, hasLength(1));
      final message = res.choices.first.message;
      expect(message.content?.trim(), contains('123'));
      expect(message.content?.trim(), isNot(contains('456789')));
      expect(
        res.choices.first.finishReason,
        ChatCompletionFinishReason.stop,
      );
    });

    test('Test call chat completions API with max tokens', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content: 'You are a helpful assistant.',
          ),
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'Tell me a joke',
          ),
        ],
        maxTokens: 2,
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, isNotEmpty);
      expect(
        res.choices.first.finishReason,
        ChatCompletionFinishReason.length,
      );
    });

    test('Test call chat completions API with other parameters', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content: 'You are a helpful assistant.',
          ),
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'Tell me a joke',
          ),
        ],
        maxTokens: 2,
        presencePenalty: 0.6,
        frequencyPenalty: 0.6,
        logitBias: {'50256': -100},
        n: 2,
        temperature: 0,
        topP: 0.2,
        user: 'user_123',
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, hasLength(2));
    });

    test('Test call chat completions streaming API', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content:
                'You are a helpful assistant that replies only with numbers '
                'in order without any spaces or commas',
          ),
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'List the numbers from 1 to 9',
          ),
        ],
      );
      final stream = client.createChatCompletionStream(request: request);
      String text = '';
      ChatCompletionStreamResponseChoice? lastChoice;
      await for (final res in stream) {
        expect(res.id, isNotEmpty);
        expect(res.created, greaterThan(0));
        expect(res.model, startsWith('gpt-3.5-turbo'));
        expect(res.object, 'chat.completion.chunk');
        expect(res.choices, hasLength(1));
        final choice = res.choices.first;
        expect(choice.index, 0);
        text += res.choices.first.delta.content?.trim() ?? '';
        lastChoice = choice;
      }
      expect(lastChoice?.finishReason, ChatCompletionFinishReason.stop);
      expect(text, contains('123456789'));
    });

    test('Test call chat completions API functions', () async {
      const function = ChatCompletionFunction(
        name: 'get_current_weather',
        description: 'Get the current weather in a given location',
        parameters: {
          'type': 'object',
          'properties': {
            'location': {
              'type': 'string',
              'description': 'The city and state, e.g. San Francisco, CA',
            },
            'unit': {
              'type': 'string',
              'description': 'The unit of temperature to return',
              'enum': ['celsius', 'fahrenheit'],
            },
          },
          'required': ['location'],
        },
      );

      final request1 = CreateChatCompletionRequest(
        model: const ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          const ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content: 'You are a helpful assistant.',
          ),
          const ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'What’s the weather like in Boston right now?',
          ),
        ],
        functions: [function],
        functionCall:
            ChatCompletionFunctionCall.chatCompletionFunctionCallOption(
          ChatCompletionFunctionCallOption(name: function.name),
        ),
      );
      final res1 = await client.createChatCompletion(request: request1);
      expect(res1.choices, hasLength(1));

      final choice1 = res1.choices.first;

      final aiMessage1 = choice1.message;
      expect(aiMessage1.role, ChatCompletionMessageRole.assistant);
      expect(aiMessage1.content, isNull);
      expect(aiMessage1.name, isNull);
      expect(aiMessage1.functionCall, isNotNull);

      final functionCall = aiMessage1.functionCall!;
      expect(functionCall.name, function.name);
      expect(functionCall.arguments, isNotEmpty);
      final arguments = json.decode(
        functionCall.arguments,
      ) as Map<String, dynamic>;
      expect(arguments.containsKey('location'), isTrue);
      expect(arguments['location'], contains('Boston'));

      final functionResult = {
        'temperature': '22',
        'unit': 'celsius',
        'description': 'Sunny',
      };

      final request2 = CreateChatCompletionRequest(
        model: const ChatCompletionModel.enumeration(
          ChatCompletionModels.gpt35Turbo,
        ),
        messages: [
          const ChatCompletionMessage(
            role: ChatCompletionMessageRole.system,
            content: 'You are a helpful assistant.',
          ),
          const ChatCompletionMessage(
            role: ChatCompletionMessageRole.user,
            content: 'What’s the weather like in Boston right now?',
          ),
          ChatCompletionMessage(
            role: ChatCompletionMessageRole.function,
            name: function.name,
            content: json.encode(functionResult),
          ),
        ],
        functions: [function],
      );
      final res2 = await client.createChatCompletion(request: request2);
      expect(res2.choices, hasLength(1));

      final choice2 = res2.choices.first;
      expect(choice2.finishReason, ChatCompletionFinishReason.stop);

      final aiMessage2 = choice2.message;
      expect(aiMessage2.role, ChatCompletionMessageRole.assistant);
      expect(aiMessage2.content, contains('22'));
      expect(aiMessage2.functionCall, isNull);
      expect(aiMessage2.name, isNull);
    });
  });
}
