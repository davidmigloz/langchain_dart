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
        ChatCompletionModels.gpt4oMini,
        ChatCompletionModels.gpt4,
      ];

      for (final model in models) {
        final request = CreateChatCompletionRequest(
          model: ChatCompletionModel.model(model),
          messages: [
            const ChatCompletionMessage.developer(
              content: ChatCompletionDeveloperMessageContent.text(
                'You are a helpful assistant.',
              ),
            ),
            const ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string('Hello!'),
            ),
          ],
          temperature: 0,
          topLogprobs: 2,
          logprobs: true,
        );
        final CreateChatCompletionResponse res =
            await client.createChatCompletion(request: request);
        expect(res.choices, hasLength(1));
        final choice = res.choices.first;
        expect(choice.index, 0);
        expect(choice.finishReason, ChatCompletionFinishReason.stop);
        expect(choice.logprobs?.content, isNotEmpty);
        final logprob = choice.logprobs!.content!.first;
        expect(logprob.token, isNotEmpty);
        expect(logprob.bytes, isNotEmpty);
        expect(logprob.topLogprobs, hasLength(2));
        final topLogprob = logprob.topLogprobs.first;
        expect(topLogprob.token, isNotEmpty);
        expect(topLogprob.bytes, isNotEmpty);
        final message = choice.message;
        expect(message.role, ChatCompletionMessageRole.assistant);
        expect(message.content, isNotEmpty);
        expect(message.functionCall, isNull);
        expect(res.id, isNotEmpty);
        expect(res.created, greaterThan(0));
        expect(res.model, startsWith('gpt-'));
        expect(res.object, isNotEmpty);
        expect(res.usage?.promptTokens, greaterThan(0));
        expect(res.usage?.completionTokens, greaterThan(0));
        expect(res.usage?.totalTokens, greaterThan(0));
      }
    });

    test('Test call chat completion API with stop sequence', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant that replies only with numbers '
              'in order without any spaces or commas',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'List the numbers from 1 to 9',
            ),
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
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string('Tell me a joke'),
          ),
        ],
        maxCompletionTokens: 2,
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, isNotEmpty);
      expect(
        res.choices.first.finishReason,
        ChatCompletionFinishReason.length,
      );
      expect(
        res.usage?.completionTokensDetails?.reasoningTokens,
        0,
      );
    });

    test('Test call chat completions API with other parameters', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string('Tell me a joke'),
          ),
        ],
        maxCompletionTokens: 2,
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
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant that replies only with numbers '
              'in order without any spaces or commas',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'List the numbers from 1 to 9',
            ),
          ),
        ],
        streamOptions: ChatCompletionStreamOptions(
          includeUsage: true,
        ),
      );
      final stream = client.createChatCompletionStream(request: request);
      var text = '';
      CreateChatCompletionStreamResponse? lastResponse;
      ChatCompletionStreamResponseChoice? lastChoice;
      await for (final res in stream) {
        expect(res.id, isNotEmpty);
        expect(res.created, greaterThan(0));
        expect(res.model, startsWith('gpt-4o-mini'));
        expect(res.object, isNotEmpty);
        if (res.choices.isNotEmpty) {
          expect(res.choices, hasLength(1));
          final choice = res.choices.first;
          expect(choice.index, 0);
          text += res.choices.first.delta?.content?.trim() ?? '';
          lastChoice = choice;
        }
        lastResponse = res;
      }
      expect(lastChoice?.finishReason, ChatCompletionFinishReason.stop);
      expect(text, contains('123456789'));
      expect(lastResponse?.usage?.completionTokens, greaterThan(0));
      expect(lastResponse?.usage?.promptTokens, greaterThan(0));
      expect(lastResponse?.usage?.totalTokens, greaterThan(0));
    });

    test('Test call chat completions API tools', () async {
      const function = FunctionObject(
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
      const tool = ChatCompletionTool(
        type: ChatCompletionToolType.function,
        function: function,
      );

      final request1 = CreateChatCompletionRequest(
        model: const ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          const ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          const ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'What’s the weather like in Boston right now?',
            ),
          ),
        ],
        tools: [tool],
        toolChoice: ChatCompletionToolChoiceOption.tool(
          ChatCompletionNamedToolChoice(
            type: ChatCompletionNamedToolChoiceType.function,
            function: ChatCompletionFunctionCallOption(name: function.name),
          ),
        ),
      );
      final res1 = await client.createChatCompletion(request: request1);
      expect(res1.choices, hasLength(1));

      final choice1 = res1.choices.first;

      final aiMessage1 = choice1.message;
      expect(aiMessage1.role, ChatCompletionMessageRole.assistant);
      expect(aiMessage1.content, isNull);
      expect(aiMessage1.toolCalls, hasLength(1));

      final toolCall = aiMessage1.toolCalls!.first;
      final functionCall = toolCall.function;
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
        model: const ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          const ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          const ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'What’s the weather like in Boston right now?',
            ),
          ),
          aiMessage1,
          ChatCompletionMessage.tool(
            toolCallId: toolCall.id,
            content: json.encode(functionResult),
          ),
        ],
        tools: [tool],
      );
      final res2 = await client.createChatCompletion(request: request2);
      expect(res2.choices, hasLength(1));

      final choice2 = res2.choices.first;
      expect(choice2.finishReason, ChatCompletionFinishReason.stop);

      final aiMessage2 = choice2.message;
      expect(aiMessage2.role, ChatCompletionMessageRole.assistant);
      expect(aiMessage2.content, contains('22'));
      expect(aiMessage2.toolCalls, isNull);
      expect(aiMessage2.functionCall, isNull);
    });

    test('Test call chat completions API tools streaming', () async {
      const function = FunctionObject(
        name: 'joke',
        description: 'A joke',
        parameters: {
          'type': 'object',
          'properties': {
            'setup': {
              'type': 'string',
              'description': 'The setup for the joke',
            },
            'punchline': {
              'type': 'string',
              'description': 'The punchline to the joke',
            },
          },
          'required': ['location', 'punchline'],
        },
      );
      const tool = ChatCompletionTool(
        type: ChatCompletionToolType.function,
        function: function,
      );

      final request1 = CreateChatCompletionRequest(
        model: const ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: const [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'Tell me a long joke about bears',
            ),
          ),
        ],
        tools: [tool],
        toolChoice: ChatCompletionToolChoiceOption.tool(
          ChatCompletionNamedToolChoice(
            type: ChatCompletionNamedToolChoiceType.function,
            function: ChatCompletionFunctionCallOption(name: function.name),
          ),
        ),
      );
      final stream = client.createChatCompletionStream(request: request1);

      var count = 0;
      await for (final res in stream) {
        expect(res.id, isNotEmpty);
        expect(res.created, greaterThan(0));
        expect(
          res.object,
          isNotEmpty,
        );
        expect(res.model, startsWith('gpt-4o-mini'));
        expect(res.choices, hasLength(1));
        final choice = res.choices.first;
        expect(choice.index, 0);
        final delta = choice.delta;
        if (choice.finishReason != ChatCompletionFinishReason.stop) {
          expect(delta?.toolCalls, hasLength(1), reason: 'count: $count');
          final toolCall = delta?.toolCalls!.first;
          expect(toolCall?.function, isNotNull);
          final function = toolCall?.function;
          if (count == 0) {
            expect(toolCall?.id, isNotEmpty);
            expect(
              toolCall?.type,
              ChatCompletionStreamMessageToolCallChunkType.function,
            );
            expect(function?.name, 'joke');
          }
          expect(toolCall?.index, 0);
          expect(function?.arguments, isNotNull);
        }
        count++;
      }
      expect(count, greaterThan(1));
    });

    test('Test jsonObject response format', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant that extracts names from text '
              'and returns them in a JSON array.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'John, Mary, and Peter.',
            ),
          ),
        ],
        temperature: 0,
        responseFormat: ResponseFormat.jsonObject(),
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, hasLength(1));
      final choice = res.choices.first;
      final message = choice.message;
      expect(message.role, ChatCompletionMessageRole.assistant);
      final content = message.content;
      final jsonContent = json.decode(content!) as Map<String, dynamic>;
      final jsonName = jsonContent['names'] as List<dynamic>;
      expect(jsonName, isList);
      expect(jsonName, hasLength(3));
      expect(jsonName, contains('John'));
      expect(jsonName, contains('Mary'));
      expect(jsonName, contains('Peter'));
    });

    test('Test jsonSchema response format', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oMini,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant. That extracts names from text.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'John, Mary, and Peter.',
            ),
          ),
        ],
        temperature: 0,
        responseFormat: ResponseFormat.jsonSchema(
          jsonSchema: JsonSchemaObject(
            name: 'Names',
            description: 'A list of names',
            strict: true,
            schema: {
              'type': 'object',
              'properties': {
                'names': {
                  'type': 'array',
                  'items': {
                    'type': 'string',
                  },
                },
              },
              'additionalProperties': false,
              'required': ['names'],
            },
          ),
        ),
      );
      final res = await client.createChatCompletion(request: request);
      expect(res.choices, hasLength(1));
      final choice = res.choices.first;
      final message = choice.message;
      expect(message.role, ChatCompletionMessageRole.assistant);
      final content = message.content;
      final jsonContent = json.decode(content!) as Map<String, dynamic>;
      final jsonName = jsonContent['names'] as List<dynamic>;
      expect(jsonName, isList);
      expect(jsonName, hasLength(3));
      expect(jsonName, contains('John'));
      expect(jsonName, contains('Mary'));
      expect(jsonName, contains('Peter'));
    });

    test('Test response seed', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4TurboPreview,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string('How are you?'),
          ),
        ],
        temperature: 0,
        seed: 9999999999,
      );
      final res1 = await client.createChatCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;

      final res2 = await client.createChatCompletion(request: request);
      expect(res2.choices, hasLength(1));
      final choice2 = res2.choices.first;

      expect(res1.systemFingerprint, res2.systemFingerprint);
      expect(choice1.message.content, choice2.message.content);
    });

    test('Test multi-modal GPT-4 Vision', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4VisionPreview,
        ),
        messages: [
          ChatCompletionMessage.developer(
            content: ChatCompletionDeveloperMessageContent.text(
              'You are a helpful assistant.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.parts(
              [
                ChatCompletionMessageContentPart.text(
                  text: 'What fruit is this?',
                ),
                ChatCompletionMessageContentPart.image(
                  imageUrl: ChatCompletionMessageImageUrl(
                    url:
                        'https://upload.wikimedia.org/wikipedia/commons/9/92/95apple.jpeg',
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      final res1 = await client.createChatCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;
      expect(choice1.message.content?.toLowerCase(), contains('apple'));
    });

    test('Test audio output from model', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oAudioPreview,
        ),
        modalities: [
          ChatCompletionModality.text,
          ChatCompletionModality.audio,
        ],
        audio: ChatCompletionAudioOptions(
          voice: ChatCompletionAudioVoice.alloy,
          format: ChatCompletionAudioFormat.wav,
        ),
        messages: [
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'Is a golden retriever a good family dog?',
            ),
          ),
        ],
      );
      final res1 = await client.createChatCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;
      expect(choice1.message.content, isNull);
      expect(choice1.message.audio, isNotNull);
      expect(choice1.message.audio!.id, isNotEmpty);
      expect(choice1.message.audio!.expiresAt, greaterThan(0));
      expect(choice1.message.audio!.transcript, contains('golden'));
      expect(choice1.message.audio!.data, isNotEmpty);
    });

    test('Test streaming audio output from model', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oAudioPreview,
        ),
        modalities: [
          ChatCompletionModality.text,
          ChatCompletionModality.audio,
        ],
        audio: ChatCompletionAudioOptions(
          voice: ChatCompletionAudioVoice.alloy,
          format: ChatCompletionAudioFormat.pcm16,
        ),
        messages: [
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'Is a golden retriever a good family dog?',
            ),
          ),
        ],
      );

      var chunks = 0;
      var transcript = '';
      var data = '';
      final stream = client.createChatCompletionStream(request: request);
      await for (final res in stream) {
        expect(res.choices, hasLength(1));
        final choice = res.choices.first;
        transcript += choice.delta?.audio?.transcript ?? '';
        data += choice.delta?.audio?.data ?? '';
        chunks++;
      }
      expect(chunks, greaterThan(1));
      expect(transcript, contains('golden'));
      expect(data, isNotEmpty);
    });

    test('Test audio input to model', () async {
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4oAudioPreview,
        ),
        modalities: [
          ChatCompletionModality.text,
          ChatCompletionModality.audio,
        ],
        audio: ChatCompletionAudioOptions(
          voice: ChatCompletionAudioVoice.alloy,
          format: ChatCompletionAudioFormat.wav,
        ),
        messages: [
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.parts([
              ChatCompletionMessageContentPart.text(
                text: 'Do what the recording says',
              ),
              ChatCompletionMessageContentPart.audio(
                inputAudio: ChatCompletionMessageInputAudio(
                  data:
                      'UklGRoYZAQBXQVZFZm10IBAAAAABAAEAwF0AAIC7AAACABAATElTVBoAAABJTkZPSVNGVA4AAABMYXZmNTguMjkuMTAwAGRhdGFAGQEAEAAMAA0ADgAKABAACwALAAkADgANAAUACAAHAAwACwANAAgABwAHAAIABgACAAMABgAEAAUAAgAEAAIAAwAFAAcABwAFAAIA/f/6//v/AQD7//f/9P/y//X/8//2//L/8//2//P/+f/6//X/8//w//P/8//z//D/8P/v//H/6v/u/+7/7f/r/+j/7f/q/+r/6//s//D/7f/u/+7/7//r/+j/6v/n/+H/3f/c/97/3v/d/9//2//c/9//3f/f/9z/3P/V/9X/2v/S/8n/x//C/8T/yP/G/8H/wP+//8D/xP/I/8j/xf/C/8P/x//I/8f/wv/D/8X/y//K/8n/zf/K/8n/zv/Q/83/zv/J/8//1f/Z/9T/4P/j/+v/+f8DAP//+P/5//r/AAD8//T/6v/j/+b/5f/0/wMACwAMAAwAGAAPAAAA+f/p//X/AAARABgAFQAZAAwAEwAOAAsAGgAZAC0AJQAtACAAFgAtACwANwAyAEAAVwA9AEYAOQAoABYAAgATAB8ALQA1AD4AOQAqABcALwA7AE8AWAA2ADMAFwBDAG8AcgBGAN7/7////xoASwBSAHIAUgApACEAHwAPAAEA6v/3/ygAMgAkAP//CQBaAKAAqwCgAFoAz/90/2L/5v9dAIMAgQAcAPr/3/8tABcA8v/j/2QA8ADBACQAn//X/8X/lP88AIAByAEYAdgAZwHNAAYA3f8sAmcEaQOOArMAfwDJAM8AqQCH/+j/kgALAaQAZAFM/43+vv9CAOsAbwBzAMoBTQF8AbD/w/4m/tD80P8NAucBYAAn/vj8Dv6y/XH/5QBvAdcA4P4+/Wn8JP/jApIC1f8u/dj64P1fAQkEmgOAA74CKgBX/4z9dwBMA1gBQv51/OL9Hf+yAM4B2QCnAIz/Tf9wADkB0QOxBb4Czv70+6b9Vf6s/xH9bf+R/gD8+/2A+br/7wUwAgIAr/2C/l0KiAmjCKsDrvwIAMr+ePMk7sH47wpCIngY9ApI+6z1qvjF9V8A7wbRDZ0Mnv6b95/znvMY+F79EQMKCssEWfmN8s/yrfnF/W0GCwWjBKkCXP21+oz3tP/5ABUHmv/d++X21/Ai93X47v+f/i/7Kftf+rP7Ufyo+1/9PgMnAOH+tv5b/G39cQCC/vf/4gLyAh0CAwIcBJP+Fv7iAd0IrAl3ApAAeP0y/47+Q/wZ+4j8vPsG+mD4Kfoq+FH62vjl8njzIe3S8+L52PaS9rvzava59rz4Hvxl+Sn6M/l2+7MAUgBaAvoC/QWFB/0DAwPbBX0IZwp1CC4G9gaxBFYD0QLoBUUHcAUSB/EImARK/oD6tv8qBD4GGACY/p79OfvC+3j7C/xd+8H7h/2U/mX/Ufp1/wb+dPsa/y7+sADx/Nv////HAwQHOATLAUD/YgduBrwEuwJ5/4IArQOYCcoFEwJ3AIgA0wIOAvwCzAOeBlMC5QLXBNwDZQDr/Hb9oP+JBTUFG/wH++gAUgGf/xX7Cvyw/34F/gN3/H/6v/+kAMb9cgMkApwC6gKmAmoDQwV9BwUF6wCiAVADsQRnByIH6gGLAW0EKgITBKMIcwiPBQoH/wQqBDsAh//XBTgLNQ6VC5oFiwJyA/oD3wOHA44EYwMqBVQFnwSVAk0BtAC5/8cB2wIvBW0ESANfAL/9xABCAc8AkgC7ARQDcgLx/kv8gP2iAN4DxwTXAQ0BQgT0A8MAxP++AlIFiQFMADcD7ATgBWMA3PyxAccDWgED/un9C/5h/2L/NAHRAc0AWALa/2v80/n9+jD+IAJhAAb9ofsP/R38E/uW+1r/MASZAev9Yfj2+34AeQCcAcUBnQBM/wj/hv2T/yICWAP9AhMDegSqAcf9pPh++rsBIAODA0EAD/8GAfb+Nv9f/VT/BQPZAjkDTQLhAT4ATP43/mj+hgDGAWsAIgBBATQCFAP2Ab0B/AHUAtoCtQDuAHD/iwBtBDsFOQawBDcCCAFUAbUBEgJ4Aq8C6gSHBCcCwv++/hgBggNqAOf+ov9h/2QBxwKuAJL+g/9LAToBdf6Q/bP/NAHkAFz+Lvw1ANMC4/+U/l79jABtAg4AJQEXAdkC0QKSAEH/of9jAQkD/QRmBC8EFANDA2IDvwHLAPH+lv4G/hD+If/v/2//kPzR+hD5KfkV+qL5svkM+7/7mPzQ/W77u/iI9wj51vkK+iH8Kf/C/uT+EP8C/fT6sfiE+eT70v2SAMADagPy/aH6O/qe++L87frv+sf7yPt++2z6R/ly+on6ffqj+Rz4dfdN9zv2lffd+p376/pV9vLyy/Pj93r5Xfoi+mL6FP2u+yX8avwP+w/8gP1T/9UA8QBeAHoAGgCSAbgAEv+N/Bz6r/2mAPECUQL5/wYA6/5V/of97vvk+er5W/tp/ZkAnACeAB3/e/wf/Gv9kf4e/0X/KwAJBCoFvwNvARr///6c/gQAggF6BHkEgQVfA6AAuv8//f4ANgNQBtMHsAZCA3T/c/6P/TT/QgFIBD8GVgXlA5MCSwECALb/qgAuAxoEXgV6BjAFlwJdACcAjv50/hf/Rf/ZAOcCYQUlBrgFLQQ8AnEBgAIFBCAE9gE4AZkDpAUQBukE4QN6AocAMv/z/e39c/5C/5YB2gHFAM7/Zv5M/jz9vP04/sX+3f6L/KP9cgAaBLcEJgMVBGAEbwSjAvD/RP1t/Mf/cwRKB0sG+gSfAlMA5f6N/ZT9x/3s/Zn+QwFtAwgD7gHkAPoAdAEPAdQArAIIA04D4wHWAEUBmf6g/Yz9VP+8Ad0C2AI6/z7+fPwA/Qf9V/2h/uAAVQJoAYgB/AD/AS8CcgK0AoADXQO2Aff/4f/qAW0CKQLG/tv7dv18/LX69Pb291H7Ov56Ae0APAEG/wj9af0I/yIALwDOAAIB6wChAEQBagF6APoAXgGoABv+RftT++P8Jv5Q/Wb/ywA9/bj4R/dM+/L+lQBJAN3/+gAcAwUDbgHG/m79hADwA5IFvAPrA5oD9gQNBbgCFwFnAAwCgAOkA4QBov1++g76jfxWAfsDBAZqBoYGjAbcAq/+MfkM+I372f8hBE0GoAVKAMX5lvi++rL9k/+IAJ8B2gCAAG8BVAELAtIDcwiKClAHJgKh/fz92v8HBMYJPQ3RDAsIJQP//hr7rPqi/f8BYgUhB88IMgd7Ann9VvwD/5kByQHkAb4C6AP3BJoEEAPMAWQAYP9EADsA5v5Q/ogAqwOpBlILNwxtCXgCa/sS+UD2xPYi+YP/VAfaC6sMYArMA9z7ivZX9Uj5ff7iBQ8KlgzqDDMJVwNf/BT69vt//hMCaARpBr0GvQLZ/4/8b/yg/GP8kPpZ+Z79gwEJA68AFf+9ALYECQYyBfoDpQF3/QT6ifwx/6sDYAW0BFoDUgC6/2T8Q/i69Tn1dflK/zsDsQU2B2IHVwWRAV3/Ivw6+Jn09PJX95X+dQRxBRIDbwER/2z8MPtD99L16/cK/ecBngIqAdP/XQAb/5IAmALvAiD+CPm++gL/qwMfBVMIfAlRBV/+v/Ue8+jxO/PU90H9wAGaBdIIogjHA1r/j/0c/tT+Ov94AC//Y/6//9sFPwpODLwJMAWV/zP4k/f090L69/sJ/sEAjQK2BG0DcADq/PL7Xfy0+2b7q/zt/Pv53vix+Tn7Efum+bz7Vv6j/yb+tvum+yX81f9gA6wF+QTUAjgHyw3ID+QK9AOH/zH9IPuj+lL8kf0++9j3d/eb95Xzfur349fmFO8u+lwBmQMWBR8HtAstDi0O1gu+CNgDsQFfA6wD8/3n9ZL0EPmV/Vj+zP4V/TX38e9J7WrwJfQa9zP84AR0Ch4PGRHBDtEHlP5W+4v5jffV9Nz0LvfB+Uz9OgB2Az4Bdv2Y/Fr84vsx+sD78/s+/Rr9xP4xBN0HOgtJCcMFYAC5+kD4uPrY+4z32vPv9Fr7jAGoBCYEAQH8/Ov6bvr1+mD53/ee+t/82/+oADUEjAWdA+sBDQHH//38hvvL+BL51/zjA6QGTASsAQD/A/2H+e33BvvQ/nUBxQM4BQUGvwJG/yX90fxr/Y0AlwQXBWMEPAN7AlL/Pf8FBMIIEQjpAlgAGv4O/k/9cf1bALwFaQ3ZEKAQHAstBE/8K/Vw8x32Jf1XAOoAVgB3AlkGWwm2CioJ1Ag8BiEEPv/2+ar15fS6+wEDmAndDC8QQRBNDrEMCgjHAr35oPE86rPoG+7r9r0Aogi4D74QShBDDMwEFPuN9OT1qPh0+dj45fxW/hf89fip+doA3wU9B1MGeAbOBCECxv9n/yECGQOlBdwHuQmsCxkKbAJL92fw1+0w7yfyE/iLALUGjAnbCHMH8wT5AfYAowNXCCAIIAMA/Uv6WfkD+Yz8IwSyDB4QUw49CFYBC/uC93f1zvN893P+jQNDA5cA5v7k/Ub9Nf2h/kYA+gEZAqoAIP4G/BEAEwigEIwU4xK4DvwFmPkX7Zbngedk7JT00/7qCrwQwhG7D5UMsAmwBZ4BUf2++t34WPhL+RX8FgG4BRwK7w5KESQR6wyNBbX91/et9LzzB/cd/LoDewlVDDkOvw1gCt4CDfs59ZPyGfFh8PrxLPX6+cwBlAkODhQPJQ1rC9wHWv9t92j0e/WR+LL7z/5BAUsCPwECAasAuf5N/i38+vk1+E34Yvmy+xT+TgF4BWkE/wAn+hTyaO1b7HXvcPGB9e/8MQYeCyMJmAYsAjL+XfkF9nb1b/YU+ST7pv2G/ucASAEoASYCPQMQA5P/ifr39evylPJV9jP7kv0s/rv91P4XAhMG5gkaDFkMAwxzC8YIgwM8/2H+TgLuBgMLwA5rDhkK0wPV/2f9MfsY+OX3mvmz/LoAMwWlCfMLcQwBDasOYA/QDt8K+QUuAMD7Tvmd/LUARgQgCM0MPhJrE7gQigwnCX4ETAGc/4H+Pf7K/bn++AASA4AFtwkzDMkMBAzzCAYERf81+zX5Dvj6+RQAUgcHChYLygqEB1r/d/Rz7c3rLe337ezwJvTT+HX9TALXBn4KDwwxCp4GfAG+/IP4lPPO74HtkO/g9Tz9Y/8k/F74Y/X29Abz+PEf8hHzs/Ob9Z36Y/90BKQESgQmBKQExAU6Bq8Bw/ie8THtmew26pXp7O1N9wIAxQZLDLUP+hGKDr8J6QWQBYMFxgPA/5v7tfqw+e/6vf3IAsoIZQ7gEB4PeAsrB+cFqQZ3BwAJvwsoDq8QnxFwEBcPIA2JCvgJrwkrCYsHaQPh/z3/xQAkBB8JLg1BEbIUORcMGlcbYhiMEh8MpAbjBO0CAgJaARABeAEWArkBhwE/AV0A/f8I/o/8xPr5+Df3evdH+Rz71vuf+3X92/8eAcf/Dv0q+eH1wfIk8Uzxc/Fh8ur06/ca+gv6YPiw9cvywvAG8FzxpvFf8DHv7u9Z7yHuY+si69Xto/A98wj1Dfb19NTwFerL5S/mU+kk68Lqtux88Yv2+fdq+JT7nQClBJsFQAbkB+EIYgXW/8j7mPx0/40BfAOyBWgHlQexB/QHJQlCCsAN4xE0ErMMggXsAuUDKwVdBCkEZwVhBvMEcwM2BOUHawyjEP4UohiMGasVaA/mClIKuQtjDcMOiBA9EpQSzRDUDcgLeApkCREI/Aa0BiAFuAG7/d/7OP1EAS8H8wzEEUwUJBa3FT4UARGsDRcKDQWe/1D67/Ya9DjzRfNk9o775ABCBLkEWQPM/+X7zfdo9tT2g/hf+eP4jvYO8V7rEudn5fnjcOMZ46DlA+pu7ijyDfVH+Jz6LPzR+xX7KPfQ73TmRN/j26zaZtpU2+veC+OO6AjtlPBT8eDvWu5N743yAvZS+cH7df4wAGUAKgGCA2QGsgiqCOYH5AaqBkUGgAZjBnoHGQnICpMM/A1yD8UNpwnkA58AAwADASkCnQI1BOcE9QUGBwkKPw3aECEU5RgEHeEdpBvYFpoSyA7JDKoLEAzyC90Lzws4DGwO6xHvFIAXVRnkGQUZ2RWZEt8PrQ0QC9UJGgmNCEsGGQPY/+T9AP3h/In+7wDNBI8HqQmfCkIMVg4KEI8PSA1VCp8HeAXmAo0B8AB8AX8CsAMbBBMD0ACe/VH5HPSq7gTqMeY94jTf1N1p4DjnOvBO+N79jABZARoAJP2G+eH1evLk7lbsHOon6Grl5+F93xreMd5x3bXcE9sY2izZ7tn33cLlF+829wn/ZgYCD/AUNBjXFfoR9gt3BaP+5/f48/nwqO9D7xj08fp7ASMEwAQVBssHzgg/CEIHfQRnAZH+9P4IAcYD+wb/CaANmBBBExcTehD6DMIKVgquCZoIFgj9B9sI0glxC4cMqw2hDowPaxCDEYwUxhbeFsMToxDjDSgMTwohCS4J8whSCcMJIApqCSgIWQhFCtkN0hC9EgwScQ4QCdsCTv4n/BH9NgDYA3QH0wk9C+QKBQr/CDUJdAlvCW4H1QPQ/tP4MvOV7X/pfObM5dnmtun07LrvkfGm8izzc/Mn9M70g/Wg9QL1CvPK8DDt++i74znetdi51N/RrtCg0EjTiNgu4ZDqoPS0/nIHcw5QEv8U3RWgFQwSxgwZBsn/PPpe9WzyKvEy8jv0WPg8/KcAOAMgBG8DNQK3AKH/mv/M/20ATwG9A2cH7wtoEKIUFRjVGZgazRmYGEsVnRDtCcADk/55/JL7Ofzo/cYA+wSZCcUPaBRKGMsYuhirFgUUmhAJDaEJogUdAzsCsgSpB70LBg9zEmMU5xTtEi0PPgowBQMC6gA/AhAEXAWtBQQGuQYFB3wGLgY7B7UIAQqkCdUHNwSA/8b6c/ei9r/2gffG9gH1pfGU7jbsI+sY62Ds+e5/8hL1e/ap9u32gPa59Tzz3u9066/lZN1X0sTH2MCrwFLGM9A33E/pKPZcAe8LHhXbHG0hiSLzHwgbCxRnCyACvvg38mvvF/H19If5nv18ATkEKgVnBFICtwBx/+L+kP5E/93/XgBMADAB0QQqC6AS2hgJHaoeix5uHAAZzhNcDUkGk/+h+pX4dflB/J7/iQOhCFIPlRXqGdUaphkdF4YUuBESD+EMaAuFCtoJ1wneCngM6g20DnAPng+zDggMKQjlA4wApv4M/qH97/y9/Ez+DwKtBwkOtRPAFrgW6ROeD24KogQB/6j5svS77/TqkebG49LihuP55MPmQ+pM77nzXvWI9TT2JfjL+Zb5DvdN8cHnCtyE0QDKq8bfxuzKbtL92xfn0fLZ/lYJIRIMGY4eZCKdIdccYhMZCooAxfn88+TxYPLb9AP4ffr5/Pn9QP8NALoBWQJ5Av4BfgH6/4n+Qf7oAJsEPwgvC0oPdBT+GLEbNhswGY8VsxH5DMgHRwJc/TX6rfgS+pj9UgMbCf4NSREwE/kThBN5EjsRvxCYEDAQmQ5yDAMLvAp6CwgMzgwRDUkNOAxqCogHIQTx/8v70PgU+D/5M/uj/fgAAAXeCEgLmwyODWkO8Q0BDN0IjATK/rf3P/GW7OLpUOeh5DzjueSJ6KDr6ezU7cbw7PSr+H75S/dd8uDqM+IR2QXResv8yIbJTMy40hncfui786T9jwfEEScbHiCPIWof8BsNFNAKEgLm+yD4s/Q+8zbzuPXg95D6avxn/noAKgKeA9kDiQITAV//lv4X/kz/0gErBkoLZBBJFVwYUBq0GaoXxBPkD64LDgcPAi/9UPrJ+ZX7//6bA5kI+AzADxoR+BEKE68TihMIElIQuQ4TDukNEg5rDeQL9Am1CHAIYAimB6MFWAJ0/s/6jPjC9+74FvztAP8F5AlQDAoOyQ/OEGsQdg1ACm8GPgO3/cr2Xe7O6MPkJeMn4trihOQb5q3nzeow8Zj3kfyt/I75GPMF66zhHtiyzjbH4sMJxZ3KRNJ73KrnnvT8AN8NIxmyIsQn9ScrJGgdCxVwC2kCD/to9gX05fN09XP3B/mK+hj9YwH1BC4H7AbYBY8D2ADO/Yz72/rY+8//JwXeC48RWRZaGQAbYRtWGmgY+xOYDsUHBALi/Fv5uvcp+UT9nAK9B6kLug4PEagS4RP5FPwVEhZ9FSwUHxN+EUoPXAzUCaUIPggvCDYHigW0AkX/uPvY+Gf3ifcY+U/7dv1JAF0DRQebCSULHQuaDFkNNg2FCWoDvPxd9xPzJfAD7W7pCuXw4LjeB+GT5tbtsPOK9mL2i/Pi7f7le9zt0vbLHci0x93J982Z1PDdNum59rUFEBXiIT8qayyxKugkmhyrEq8I2gBG+4v4sPZg9tD1z/by+PD8IQIkB+8KHQwXC4cHtgOD/0v8Vfpy+q79PwNkCY8OLRL9FBUXbhhrGJwX9xRJEfcLbQZDAXD9Lvtm+wj+ogKCB20Lrw01Dx8QahHREgcUkRQyFDAT4hFYEDIOsgsHCUEHRwbKBQsFpwM7AQb+/fqP+Pb3x/j0+qr9WgArA9wFlAgHCisK0Ah0CBEI7AaoAt771fTl717sgerL6DnnReV+46XibOVT6tXvPPPd8sbvNOoA4xHb3NIZzJrIYMk2zY7TDdqA4qHs1PfGA8kPcxv8I84nPCXNHxMYng+JBxAAsPsl+dz4z/jq+TL6oPv8/RMCRAcqCxUNSwyNCdwEuQAL/aj7+fsR/oACTwgeDpcSQRXRFrEXAxgmF8kVCxJxDZYHVgKE/kn8Ivwg/mcCJAdMC+4NuQ++EUkTnhR5Ff8VrhUeFF8RMQ46Cx8IZgVEA3cCogLRAhwCgQCt/tH8Hfzg+/v8uv7MAH4CdwNVBFUF+QbyB+MHhAbxBEUDWAGZ/VL4hfJA74Dt5OwW64HoP+Y45PzkoeaK6tfrIurb5I7eEtmU0zDQCs3EzajQV9ZT3ozmC/Am+L4BAAvHFFUcDyBAIM8bJRZEDhoI9gKB/x3+CP6o/34AWwHTAaIDUQbICHcLSQxtC+sHyQKL/qv7DPuC+1L+TAKsBygNXhFtFG0VFxa3FisXzxWiEo0OEAqLBngDcQJXA+4FEQkLDL8OnhC5EdYRcRKDE6UUshQnE1UQywxGCR0G8QMfAuYAMgBOAKAAbQCj/6T+S/7J/iEAEQKGA60E7gS1BAUEJANzAk0CPQKZAScAQv1++jT44PU68/Lvou1Q7Wnt6uuL6QPn++Up5tLl+eQQ47jeVNnb0yvPhs3vzvrS/thm30zna/BB+tABGAhGDVwSmxe1GF4XuRFTDYYIDwYpA7QB6gJPBEkHwQfrCAYJfQqvCuAKFgp5CGAHNwXVAWD+hfz6/SwBpASMB10LkA+5ElsUjxMKE9ERaRADDj0LvghdB4QH6wepCdcLeQ4kEfwSkhT8FIEV9xREFFcTXBJDERMPZgzmCWAIrgccBxgG6QQOBDIDNAL8AJP/YP6E/RD9Nf17/j//XgBkAPUAlwElAlAC5gFaAfv/pf5F/Mr5n/eN9Q3zifDw7XjsSOvc6i/oEuZS4xTjIeP+3yvb/NO70XbQzdL70wjXmtpN32znlO1E9cH5+/57A0kHBgpQCvoJ8QZWBecDZAQ2Bl0HVgkfCs0LEA3+DZANlwyqC7MKAgpQCBEGXwMuAWsAbgFFA5gFaAiNC00Odw+fD9wOYw4tDQIMoAqqCawJ1gkRC5oL4QyqDloSHhXhFvwWUhb4FScVaRQUE2ESMxIPEroRRxDiDncMSgsjCkIJCwgCBjgEdwIuAZr/6P7f/Z79JP5q/+cAtQFWAWkAmv90/ub94vzT+436q/kK+Gj2M/QG81Ty0fD071jutu3j7JrrH+mr5TLjuOAn4HXcQNhl1R3VBNmt2x3f/uAK5Y7qXfAr9fD21vnI+97+PADO/17/bv5O/2oArALNBGUHgwqiCzUN2QzeDSANIgzOCqwJSQnvBxEHnAUdBb8FGwdOCeAK0gxBDkwPug4PDRoLIAlOCEYH9AZWBh8HnQi9CkQM4A0qEL8SuBSfFVgVahRpE5cSBBJbESYRhxHNEmgToBNXEv0QqA9mDpINtgsRCq8HDAZpA3kB1v/t/qr++f4SAHAAAwECAH3/3P3Q/Nf7Ovu++qD5U/ja9nj10/Pv8tbxpfGY8bPxTvC+7oPswep/6XLn8+Q24bDeqdzZ26vahtnp2nXe3+Sa6OLqi+vh7ITw+PMp9tn12fVn9mv4uPlS+jn7Ov2TAdgF9wkRC20L5QqwCigLLgqHCnAITgi5B3gIdgkLCe8JzQm2DMINdQ9eDpMMVgu0CY0JXQcRBwMGXQfXCIgK5gvnC8ENpw7aEDQRXhHWEIgQoxDmDwEQ+A6qD3IQBBIQE0cTLBNJEroRXxBLD4oN+wu8CrIJoAiJB50GCAa2BYEF2gVbBdUEZwSJA8MCcAGX/6P9APzt+un5f/k7+bH4jfi69yD3M/aE9Uz1WfRh9P3yHvJo8LPuj+027C3sY+rQ6ePntOfC5yLnbudS5rrojuqV7pXvWO+g7+rv7vLM8qjzy/EQ8if04fW391f3l/jN+bb9HgB5Ae4BWgFXAgICXwNkAkoCrQLfAq8EkQU/B4oHFAiuCC0JSgrYCSsJpwdTBycHmQeyB7EGLAexB/0JBguQCx8Lfwo3C1YLQAuMCUEI7wZfB4gH2we+B40Izgr5C2UOfA0oDU0LKQsSCnYI+wdlBUoGlQSRBRUFaAW0BZ0ESgUbBAIF+gOXA3cA6f4U/m39U/7+/FX78Puq/X3+z/76/BH7MPpw++f6tfiz9yz3nfct+eT5QPgf+bX5nvlI+qX4ofam9M70K/Q784PzjfLz82D1v/aP9uX1IffP9m34Mfc39aD0ofTP9S71sfXU9Hz2Bvlx+j77qfp5+y37C/0//J76bfra+ab7xvz5/eX9yf7vACMCBQNCAkQC1QHLAksDFQJHAtkBvwLhAkkD/QK1AgME5gMlBUYEcgRmBIcEXAU0BDEEAwPNA/ADQgTlA2wDYATOBMEF4QS7BDEEWQR0BNQD0wN1A38D4QPrA4cDUgM6AwgD1gIfAwYDbAKeAoUCmQJQAgQCZAEsAWYBHQEDAcsA+QAAAWoBmwEgAXAB3QC3AGMALwCo/zz/Yf8U/8z/j/8VAPj/cACbAGAAKwBW/zP/ov5w/rD99/2E/f/96f3+/Rz+BP6c/un9pP7e/SP+rP2l/U/9+Pxg/cP8Sf3n/DH9tPzr/OX8wPxB/VD91v1N/sn+/P7+/vT+y/6z/n/+9P38/ej9QP6q/gD/Mf9n/4b/df89/9r+rf5L/rb+Y/6e/pv+0P4j/zX/6v9Z/yEAv//8/4j/iP+U//f+GABk/0QAOgDdAKMAhwAFAef/dwCw/wEAUv+7/xgAZ/9UAP3/fwCbAA0B4QDEAAkBVgCBAB8ABADN/9r/MAAUAJwAswDDAMoA5wDJAHQAegANAAcA+//a/+3/xP/5/xgAUABbAGoAYABDACkA/P+8/2H/LP8O/wL/F/8s/0T/gf/A/+H/9v/a/6X/hv9k/0H/Df8G//j+FP9B/2//mP+0/+P/6v8PAOP/2P+U/3z/cP9P/1j/Pv9j/2H/o/+T/6//nv+Z/6//j/+1/2j/nP92/5f/tv+Z/9v/lP/0/9//9v8aAPX/KwAOAFYAMwBaAGAAVwCRAHEAqAB2AKcAlACjANEArADWALAA7QDLAN8A4QC1ANEAsgDKAKsAvgCoAKkAxQCtAMcApAC0ALcAuADXALYAyADIAMgA8wC+ANAArgCxAKoAkgCeAGAAewBiAIYAZABuAF0ATQB6AEQAbwADADcAGAD0/ycA0v8JAND/CgDc//L/+v/M/93/w//t/7L/4/+f/6v/sP+0/93/ev/S/4T/sv/P/5D/rP9W/5X/Yf+O/2r/NP9H/zj/fv8y/1P/Ff9J/2b/bv9b/xD/Yv8X/1b/Ef8X/wL/Ef9Y/xT/Yf83/37/cf+O/3H/bP+h/3D/tf9g/5X/jv+w/8b/m//w/8v/DwAVAOf/FwAAAB0ANAAFAAcAKgAjAD0AJQAYAD0APABmAEIAMwBKAC0AWAAhABAAKAAWAEkAKQAsADYAGgBRACQAGgAUAAUAFQAAAPn/7f/2/+z//f/l/+z/6P/f//z/1P/s/87/6f/e/9b/4//J/9z/zv/b/8r/z//V/9T/4//X/93/0v/a/83/y//M/8b/0f/W/9H/3P/R/9X/1v/N/+D/zv/c/+z/1//6//D/7v/z//H/6P/u//X/4//8/+3/BQD8/xwAAwARACwA+v8xABYAKgA8AD4AUQBSAGgAXwBnAGoAcAB6AIkAhwCgAKIApACvAKwAtQCaALwAlADEAMEAwgDcAMkA4wDUAPEA3QDyAOcA7ADyAO4ABwH2ABIBBQEWAQ0BEQEJAQ4BCQH5AA4B6QALAfAA/wD4APMA9QDcAPUA1wDxAO4A5ADoAO4AzADcANoAtADcALgAwQDKALYAyQCsAMcArACvAKwAoACiAKYApQCUALkAkACqAI8AlgB9AIgAfgB1AJAAeQCcAIkAqACGAJ0AgACDAHkAbAByAF8AeABYAHgAWwBtAFwAYABeAFQAawBMAGAAVwBjAE8AawBeAFMAeABhAHIAcAByAGcAfgBuAGQAggBhAH4AbwCCAHUAfgCIAGYAewB2AHkAZACQAFsAdQB+AEkAlABQAHkAbABqAHUAWgBvAFQAZABGAGMAOwBPAE0AIgBCABcAEwATAAQA8P8JAAEA7/8JAOv/6v/3/8//6f/X/8j/1//E/8f/tf/L/63/zf+//8X/2P+//8X/t/+x/6L/qf+b/5j/pv+V/6r/pP+h/6j/mf+Z/5f/lv+R/5X/lv+T/6n/j/+t/47/ov+Y/5n/of9+/6f/hf+g/5T/nP+h/6H/pP+P/7P/gv+1/5//sv/M/7T/yf+r/9//kP/i/5H/v//V/63/+P+p/wMAtP8EAMf/1P/3/8b/BgDQ//n/0f8WAL7//f/k/8//CQCz/wEA0v8DAPD//v8TAA8AHQD6/wQAAwAuABcAGQASABEAPQAHAPv/2P/y/wAA+f/e/wAAFAAWAP//1f/l//z/6//f/8f/0P/5/8X/z//E/9//5f///8v/8v/J/7r/uf+Q/9D/ov/Q/9L/BgAVAAUA4f/U//T/yv/I/6H/sf++/7X/lP+u/7j/yP/U/67/1f/b//7/yv/g/93/7P8DALX/zf/D/8b/sP+v/5b/2P/e/6X/5v+T/+v/3f+l/+v/2/8pABYADADj/xAA9//8/w8Azv82APf/GQASAO3/FQANAD8AFwBOACMAPgA1AO//HAAQAHAAYwCeAJgAjwCmACsALgDa/+z/+/88AHYAkACoAI8AxQCmAJEAVQBeAG0AnAC9AJ0AngBiAG4AYgAfAAsAGQBVAKYAugCpALwAmgCCAF8ADQA0AEUAqgDPAMMAqQB2ADUACAD+/9r/DgA2AJEAvwCLABwABAAZAG4ApwBwAI4AhwCXAKUAWQArAPv/OwBpAGoAgACnAAkB/wDOAH8ASgBfAJ0AqACjAKoApQDeAK8AfgBjAGEAngD8AO8AnwBtACgAhQCEABcADwAOALQANAH+AMQAbgASAAcA6v+0/7H/uf8HAJYAYwBXAIIAewB0AGoAXQAQAH8AfwBSAcIBBQHMAMH/nv8KAI8A1wDVADEBEQHsAB4A2f/D/4H/BQCjABsB8wDQAIQANwBlAML/sv9H/77+DACpAA4BpQCS/wT/fv50/iz/2/9CAHgAcABmAOn/ef+s/3X/+/6u/qD+PP+V/8b/KABdAG8AVwBRAOb/l/8x/+T+M/+1/18AaQD9/wMAsf+o/7H/OwBcASUBCwH9/1//lv8n/+H/q//a/x4ApgAlADD/6/5V/kv/nv9X//f/iwD5AM8A6f+q/xkACAC5AOkA2f88/zv+Gf/WAJoArwHrACUBfAD5/jX/Qf96AYkBagAkAMf/LQATAR0A2v77/yP/nQA3ADT+1v3N/B//CwBQ/zkDlgE6AlcCR/yZ/wwBr/47Bd4A2/4pBMX94/+x+8P1ivva/dQARAVOAWAGBQXIALP7vfZT/R3/mwIo/nf+8wBABIEBRv5w/eH7z/4t/uf9g/2+AvgCkga+BUMCTgTH/5r94vs2/XgB/gStAzwDdwGn/dT3nu1X8RH80Qv8FJYN7gJH9hfwQ+8J8SP3EP8rB50I1QO/+6H0tfTz93H+AwTVCEYJawaXAY/+m/0m/sn+xf51AqUChQLGAhgBiwK0/jD9Lv+L/UsCKgLUAU0B/fwP+H/8oP1QAP4FXwOlBTMHOABGAkz9qfsVAMb/jgT7Ae//Ff3i+4D+KQCLAacBJAORBdMG5v82/Uf5b/qbAyYDaAJ2An/8qP1a/jv7r/4A/1wA7QQgAqcEUgMhAAcDEQKMA7sF3AFaAk4B4f4eANT7/v3OASkCUAIy/kH7yP9k/nj9VgJuAMMAXP/s/c3+WP93AE8Abv5Q/mL+vP2Y/fP9oP2H/h0By/97/s/+4PzJ+gYA8wB6Ar7/R/q//O385AH5BJsEEQTCBDUFSwLV/8v+6v7bAZgE0Qd7CG8HfgQzAv0AXQBvA6EEUQYgA30BJwH8/wcANf4Q/7EAAQOi/0v9Kvr5++H+jwDH/iz92v/0/Wz/avyd+sz9AP99AO//sv00/hn++fxJ/3cAO/9Y/m3+ev0z/xT+Af8aAqECHQQAAVUAf/5W/jX/HwS2A3QA+v7w/iD+0/7D/cEASwU7BJQDGfrz/EIAS/1dAE3/JP5w/9v/W//5ABb/xf+l/woBpgQM/+b9cPod+hUABP/7/vf8O/2NAIT9EQFyAPv9KQL0/uAAuQWgA/oBU/6d/P7+nf+qAB0BJv+//9gC1QF1/kgAOwDRAnMDmwDcAOP76PqQAEgCkgbiArH9/vt0/P/+Rf+VAFEDYQZEBBT/Evo4/cECfwYtA/f+GANmACQCRAWQ/n4D2QTGBjgEYfyg/aYD0QW5A7b/QPXo/wME/v9CAaP8dACeAV/6uvs//M78GgBC/bT8Yv41/iEAdQJ9AikDmALbA4AEEANnBVADuwAuADcBiQJuBBIGrwGr/X7+ZwBNAyMDeAKHBI8BRADcAMX+xP6lAFACn/+m/GX7HgEFAIgAqwC//e0At/4B/Yr8i/3tAP8FOQaI/T/5mPolAOACDAMvAHb+mf4B/d376Pl9AaAF2gMPAbz/AAD1/xv8BftnAmQDzwNSAPH42/he/mz9NgDu/fn63QHQ+SD93P2z+xEAkf5u/wf/pf9K/ez8HvpAAYAB3v+R+xH13v9NAYgDOQEf/AsAqv0u//EB2wGm/tP8tP2Z+7UCUAJbBKEC6/s+/fMAxgJ7AA7+Vf3mA/oEAgFl/1j9kgIdAfD9cf8IAzcBpAQVAcj+SQDs+3UB0QGVAd8EIwQ/AcP+gf++AOwBXABEAXMDkf50/oUAngH+AxECiQA2AqL9D/+NA9sAUgCbAdEEAQHg/dH9hfzv/kn/9QG0BEwEqQA6/Uz73wBOBl4GRQJK/9YDeQb/AAD8ewDcB+UHLAO//ab8Jv0hBLgJEQXzAKEBsAHm/7oAKP+HAH4C6gG7/Ov7gv/MAtECHvvE/eIBSwVAA1/8yfmq+roBBwJIAUz7XP2/BHEBPv43/AYBgARfApD6cfxHAK3/WATU/vT/SwMB/nL8sP8bAIYETgRL/wj/a/1YATEFUgBW/Nb+IwJcAmkDK/wB+ev+EwCs/nwARP+D//cCZf6u/jP/TP/tAPf/ZQH3//b+kQF5AOb+vP83/U7/igaGBD79yvcj/nABvANyA8j7EAFuA/78xvwY/pUBGAVaAcT8KPw6/rQAkv8q/QsD6gWYAU35vfdv/vkFTwU1/XkA+QKy/wP8FfmO+v8EiQi6AYD61PW9/TkDNQO9/ij6w/1DAf/9VPqFAFIBegHA/t35SvvN/2gE7AG3/NH7q/3BATsACf0X/3EB8QFk+4X76gKcBBMD4/+o/b3/U/88/tP/HQWrA3j8Tv04AGACcALR/839jP+nAjYBZf6u/NIAOgWMAb78Qvu4/+YDKQC1+hf9IwNEBeD+c/uT/ycAvQC8/5z+LP5Z/4QC7QDX/mj+Uv+LAqgC8/0o/VwA9gIKA4oAavwN/0kC/QDHAMH+IAGEA0oCdv69/C8CBAWiBcEADvzY/w4BMQLS/7/+lAHRAjYBNwFbALoAnQC5/P784v9pA68BlwFKAuoB4v8p/Mb8dv8nAWEDdAOLBKQDaP15/cf9QQECBKYDaAKK//0BtwJ4ATP/Bv1IAMwGKwPi/Ff+CwN8Awn/vwCr/3YApAGhACgBvv87AJ4AnwCIADf+6Pw0ADYBPQBOAPsA4QBu/Wj+ef80AfYB8/6W/tf+ZQFt/2/9jwCoANUAdQLy/mz9xP73/zgCBQKpATUBNv9H/Mz9GwGaBGECs/12/W/+dQAz/r3/sABRAVQCmv0J/of9PP3q/gIAwgBxAOv/0P7s/GH9Lv7B/00A8v9YAX//sP17/M790f6nAHP/OP9VAdX/JgD5/QP+Lv8TAfQByP/u/5wAzAEnAA3/BwHiAeQB9wG8AM7/IgJ4AgoCfwFdAJ0AJgB8ARsCMAIxAZv+vv92/zkBiwHE/jAA9//g/8L/I/9z/xP/4f4oAJEAsQAp/3T97P5zAKkCBQEl/8D/JP6A/5z/Qv8XAagAkABuADgAtP/k/wP/of5TAYsCLwJFAEb/+P8K/+/9jP6hAPMBbAFBAIb/of7C+7L7lf8PAZ4Ajf7G/CD+JP8gALX/p/4XAOj+qP1b/fT7jf1VAPcAcv8x/sT+Yv05/O39jv2RAEQAEv6K/d363P36/Jf9RwCL/qX9Mf3q/Sr+bv7Z/mL+1P1z/nD+nv5e/rL+1f5k/54AY/+PAIQA+/+4/vv97gBuAKoAfAJBAmYDNgPZAGgBBwKmAv0DHAQBBjIG2wVGBccDoQPFA+UEOwWJBgcHHAe1BycGdwZiBTADHwTrAx4GHgj8BrgGPQRzA9MDJQK4AlQEfwMpBJQD+wHrAAr/jv/q/TX/VwBPACoBdP+8/XH76vtQ/JT8MPwN/U/8tvt+/KD6gvu4+vD5A/nv+PL4gve198D3gvhW99j2j/Rm8hbym/Cv8lDz3/UD9SzyWPLi7iLxMvET8WHzDvRZ9o31TvNO8zH1R/dg+Sr5gvzG/yv/cwDb/+oBjwQzBiUINAqVDKAMow1NDsURbBSEFYkXUxZeFogXpBjoGakcnh5LHg8e5RthGlYZnhkOGhIajBpfGb0WjRJ+ESAP8Q1TD1INUg76C/MIawe9A7AEPATkAn4ENwKx/13/yfqT+lj7n/uO/pD9o/2w+mD5uPh+94n3hPcv+BL4t/mQ9xP2W/Ny83ry6PDW76juWu+477vztO8i8Dzq/+GL4KnceOA14GTjx+Rt4n3j9N7n2rLXn9VS2GrdHuJV4ini3OJl4mnm/uZm6Dnrl+1H9Kr17ft0//8AdgazB/8Lpw6OEe0TVxZfHQwigiUHJkkkkCPXIsQlSif1JhAoOCbTI40iMh69GmcX2BUPFr4UcRNZEFUMeAntBw8G0wTqAuEARv2i/Ab87vn8+sD5kPoW/Ej+rPzw+mv4R/fJ+ub8ggHlAJYCyARgBGQEwQVHBq4Hmgt/CHcMdAnxCVIIhQR+CYwFRAl7BdEECANMARMBvfze/Cb4pPe38srzZ/HF8Cbw9+t87O7nU+eJ5ZDiV+Qc5onkFuhe5OXhYeED3ovent2i3kDgpuQ+5xbrpujR5proMuYI7Lvv6fIt+GD8fwB+AoIGjAYPBgUI5wp3DoITVhYhGR4b4h1mHxEeQR/BHIsc3xxzHVkfaB7hHY8b5xjjFhQTuw5XDGUK1Ar0CpcJUghKBMkBkv9h/lf+bvzW+9T6Y/oT/aL8CP0Q/qL8QP2g/c/8cf1p/ov/XAQ/BsUIDgwWC98Lkgt2Cm0LmQznDcMPSxAIE1ARCxEhEHwOvw0+Cx8LMgfmBiMDtQCb/1H+Ef7I+1v7LviY9tzxFe7K6u7odelO6Wzqv+nj5/zl2+Mm48Tia+JW5IfjYegh6ODmyOb3457lEubB6C/o5+rj6WrrXOqu7N3y0vEO+2n9z/9UAy4CwADaASYHXwm9DKcP2RFAEzMW1RcdF7sYohgCGHQYERluGboXyBdzGgUZiBkxFm8RVxA/DVwMcgn1CNMHUAUKBGsCHwEu/xn+5/1g/hb9Pvyk+T35k/t7+s37oPw+/dH+tv5UAIgAHAIDA98DRQf6B2gJgQl4CtEMvg1gDiIOdA10Di4OPQ3UDQoN4wxgDEwLWwrvB00HtgTwArsCOQBJ/nv71fjM9vL0hPNp8d7vPu+57Wvt1ewm673phedz5prlD+b+5nfmqOj36GzpE+n3557odOiX6VHqn+l06ozsz+va61/sCet77Abtue6i7+DwmvMh9Qv4aP15AVsCagihCY4J9gg0BxUHNQwvEg0UkBeuFtcZRxmvGWUbZxeXGZEW1xX9FVASbBIDD2ER4BKFEXQPwAkhBosCIgFi/sf9DvzW+hz8x/p//Av7xfr3+hb7f/uL+Xj4xveZ+dX6l/5fAFsCAwV3BdsH+AjXCR0JVwozC0MNVg65DhkQ7xB+E7wTbhSkEncQaw5nC9MK7QomCU0INQi0Bf8ESAPx/4j9DPyO+An2hPPB8GDvce2b7tjt7+zO7HzqPekd6cvn0eb95svnFejE6LDpTuoX68vst+077aHthOzF7Hrsje157vLtD+8g8Fzv/u+b8A/wEPGz8FrytvL19Hf3t/mD/uECzQaICO0LFw3ADIwOkQzbDAsPXhBSFB8XZxpsGhoaXhszGwQcrRiaFgETBxHLEMANAw2CDHMMrAtwC3EJeQZVA2YA6/3g+3P7Z/ma+IH58Pqd/Kn9Pv4K/sT+5P5T/mz9Ef24/RH/CQJ9BJsG3ghjCrkMoQ7TD2UPIw80ENgP9hBOEGUPVBCZD9IQxxBJEGUP1wwZCwMJ5AbhA1wCtQC6/mz9fPsE+lv5Nviy9kf12/OG8fnuMe1r7KLrUOsm6xfrsOsf67HrqOv47HLuku5W7ifutO097e7tMe3k7VnumO+y7/fve/A374vwTPDT8OHwVPBm71vuk+/m7zDyf/GN9Bv2lPca/QT+rAKMB18LgwzQDWsOKAyyDZ4OVQ8HExsU+RR+FksYwhvtGzYcLxupGW4YPBVOEyQPCA5zDHUK+QrVCPgHTQZgBVsEmwOHASD+6Pz9+nL6Jvq6+W75MPrP++f81P6E/yUA/gDaAfkCFAP3AjgDHQUoB4wJAQyLDC0OHhA1ER0TThQ2FDIT+REVEc4P5Q7QDXUMLgznC8gKYwjbBpYFvwPZAh4BqP5g/Dj6MfeH9Tr16PPz8uvxSfGl8A3wdO/F7bftt+0s7Yvs3euh6zzr0Ost7Ujute+W8HHwMfGN8W/xL/EZ8F3wSPDM77Hv7+6677PvQ/FN8Wrxe/LK8ADyyfAi8q7y5fLc823zTvcG+Fj7H/+YAjgIFwtDDZMN5A73DmQPVxGdEeESCBLAEUAT3BR/FwcYCRnXGb4ZbhnQFoUVIxN9EJsOyQsNCrAHegVqA40DogNRA44CZAAoAEH/NP/T/uD9Tv3c+4b79fqa+8D8B/1e/vz/IQFGAgsD0QODBZYHTwnpCTsKSAq1CnILsgxjDg8Png96D44PxA9aD1IOywwLDPUKjwnaB8QFKATFAnIB7ADE/3D+2/w1+xv6JPkq+GP2C/Uy9BzzN/J28X/wMPA38PnvJPCr7xvveu7n7S7uue5I72/vf+/N7wbwffA+8ATwQ/AB8C7wje9371LvGu+K7/Du8e8/8CHw5O/h77vw7O9S8TXxkfFy8yzz+PMD9l/59PuI/38DwgZ6CRULxws/DUcPCxB9EPkQrhGHEbQRkhIQFB8WKhepF9cXPRgLGPMW3hX4FNUSWRB4DYIKswhwBo4EPQPQAnkCQgE4AOD/fADfAKoAGAA3/8/+kf3q/Dz9c/3y/Xf9cv2x/uL/ZgHAArMEKgfMCMkJbgpxC/MLsww5DVwNyg0MDa0MxAytDScOcw0zDV4M+gt8C/AJnQg6B10FdgOnAdP/Nf6q/CT7VfpT+Vz4Uvci9iP2rfUa9Wr03/L88XPx8PCX8Hjw5O+L74PvTe8H8H3wgfCq8Dfx2/Gw8ZPxO/FB8YnxLPFU8Lzvyu+H74nvl+9877XvX++Z73vwGvEa8TbwBvBK8MvwtfER8RLyavOy9KX3UPol/tcAZwPdBR0IKwt5C9IMug0wD2QQuA/DD28PwBD4EfQSSRS+FEkVLBWHFUcWEBbdFFcTChGMD30N4ArZCIUGSAUIBN8CkQHcAHoAhwBQAX0BfAG+AOX/J/8z/3L/0v4p/oD9kf3g/Y7+Yv+TAJcCRASqBegGjwgJCh8LVgwLDYkNYA2ODDEMaAzIDJgMDQybC80KwwoSCo4JggmCCPEHawbZBI8D6AFvAPD+rP1N/I/69fi49wj3JveI9s31SPXp9Mn0V/Te84PzjvPM8vHxKfHn8BHxY/Bn8Jjw3/Dc8EnwkPBi8cbxafHW8DvwNPC87+XuVO8r7xXvzO7V7SrvKO9W797uIO9K8EXvKfBI7szvgPEu8rT0vPVQ+Vn7df7hAeUE1wchCcIKXAzlDvwPcxAqEK4QdxGPEUESwRLgExsUlhQhFegVTxaEFeoUohQbFHASTBBADVcLtwmbB+cF/wOQAvMAbABYALcA/ABNAFwARwBvAPr/qv9P/yD/Zf+u/rn+iP4f/+D/2AD3AhMEPQUsBsEHkwncCx8NSg1MDqoN1Q25DZMNjA3BDMwLwQrRCscJNgmOCG4Iowh+B1EGpwTxA5gC3QHAABP/5v2U+9H5nvhP+If3pvby9Vn1S/UT9QP1AfWi9Yr1bPUS9X30NPS+82rzCvMh82Py0fF/8STxk/Gy8U/xm/B+8Brwt+/J7w/vIO/07nju9e367T3uo+0E7lDtNu397CPsfeur6z/tDe297i7wjPK29k356vzh/zcDsgXVB4wKwwzpDmEPfw87EK8QHBElEboRFBP4E48UuhSmFVoW4xbfFuoW4xauFKcSIBB7DrIMHgqGB8sEgwM8AUIA6P+W/y8ACABpAHQAxABYAOz/tQB0ALUA5//B/iD/SP8FAMcAtQGUAloDwQQDBk0IWQoCDF8Nbg5KD14PQw/SDi8P/Q5bDkYNigu9CsYJgAlcCe4IKwi2BrMF6gRvBGMDJAIEAX//Mv4y/Dn6+vhG+K33D/et9rP1MPUm9W31QPaB9jf2sfVY9Q319PS+9CX0rPMe85nyDPKc8TXxsPCq8P3vl+/a7pzt+uxY7JLs0OtP65Hqtukv6qzqPOuT693rmOq46o3qu+ow6zrqEepV6pzsHe6T8fj0UPiD/LD/iAPVBmoLvQ20ELsSZRMHFE4TSBP7EmgUHhT2E68T9RKOE1AULxVZFUAWCxUFFN4S1RAND9oMAwpAB0gF9AGG/6z93vzX/Df9kv1u/Uj+Rv5f/34ARQFMAeIApQBVAEwBSAHdAaoCJAMrBIAFJQerCK4KigzSDo0QZhGtESkSpBKYEjcSNBEWEK0Obw1XDDoMwAt6CpgJ0QhhCLEH0QZJBa0EmQO1AV8Adf4A/cn71/r8+Y35xfjf95j3rfcy+HH4qvh/+GX4Lvjj98H3S/f59oL2bPbw9RP1mvRp9D30/fMw8x7y+/Cf71zuC+2N7LLr3OmO6ADobeeT59TnNOeN6CHpkOgU6InnNeez5m/nuOUw5i/n0eYi6pLuuPP99yH8TP6rAgYI2Au7D5QRFBPoEhIUvRPzE5EVKRSYFGcUlxQhFREVKhUPFZwVSBX0E+cRlQ9IDXMLKQn8BYQDNwDp/Un8BftO+x37Ffu7+pP7wfy5/cX+Mv8KALsAWgHVAAgBIwLqAo8EkwXPBh8IBwrgC+8NxhAlEk8TFRRBFLwUpxQZFKwSshF3ELgOSQ2OC/kKiQqtCfAITwjrB44HAweQBWsENwMxAYH/Uf7+/Hn7uvol+j/6GPtL+5H7rfzD/Uv+m/5K/oj9fv2F/MT7pvun+uT57PhN+Nz3l/fn9hP2ovXx9M/zx/H37+HtS+z/6QTopOaW5MzjyuH04cri3+Iw47jjPeUa5p7mQOVY5NfkTOVH5KzkU+QY5enoyesp9GL6tv66A5kGZQyMEYYUYRZBF9oYLRhGF8AX1RUEF30WsRaQGCYXVxa7FDcUZBQeEyoQngw/CewFxwLeAMz+uvx3+q741vgB+W75Ofkf+o/72vyv/Wv93v10/kz/4QCyAjMENQUcBqAIeAuODhIRJBJaFMAVkRfZF80X+RfQFs4WSxUSFBgSCBBgDm0NdA02DBgLBgn6B1MGnwToA7YC4AEQALv+Ff0Z/Dz8qfrW+gr8CPzu/I/9uf6cALICtgOeBA8GugQjBDYDrgJCA80B3f8v/kT+df3r/Mj8nPw9/NH6WPla97n1JPL57njrkuj75n/iQd9I3tTcGtx03TjdTt6R3rfe6ODI4vLkaOO44jXideNP40Xi1OOH5Fbmuuij7TvyDvtgAaUG+Q6OERYT6hFFEgAVfBf4F8UUvxJTEnYThRT5FnwYrhf3FfUSQxHiDn4KQQW9ALn+A/3X+pr30fV397H4RvtO/G77X/vo+iX7Cfx9/Rf9a/yQ/Dr+uwFfBCkHNQohDqgRrBVvF1cXRhjVFywY2RfwF4AVXhPOE4wSQRMyExcS2xDJD0UO7wuvCfoFhgOVAOL+Hv3o+oT48vaQ+fH5vvwn/pD9OP/+/xkBfwG6ApcCGQM9BGYF1gegCSwLnwzDDsQO+g5ZDroLQQvNCQkHSQVEAsH/PP3x+1P7cPmp+Xj2Y/QL8ijuaus/51/kS+FL3/XbwNqP2f/YLNve22DfHeAv4hHjSuPd5inlSubL5AnkXeVR5A7n7ua+61DupvKo9tn77wOoBaMMJw6CEFkR4g+DD4UOmhHKEBYSbRKFEvESHhEgE0ETQRN0D/sKJwZzAjgB3vq5+fj3X/e794f3K/mc+a77Afyr/UL+qP0O/G76afyw/kkBCwLYBAUI1QrUDvsQSxSRFpoXdhcdFhIW9hTsFOIUohXqFqQVdhRuE2YSjBFZEWgNBQv/B0ADZgGr/W39T/wQ+8/6Ofuh+yj7GPxo+7r8+v2S/vn8QP6Y/7T/SASNBU0IhAsPDcgPsRGcEpwSxBEWEP8PCA4MDKUKSgnJB0IHIwaEBG8DegEM/8n7NfoL9hv0+fAm7aXqDeeH5LXhXeF24Abhz9/X30XfnN5+4GTgjeIS5PrkoeSB5HjmIuex5/Pn1ehW6iDtGe5H7sTw7PMx9r/4q/sY//j+UQG0AR0GOgyQD5sUsBFQF+4T3A96DsoL6wwkCvsLLwaxBx0GbwWgBZEHJwpVBcgBWfsA+p/3FPft9n/1QfiE+vH7p/6ZAqQDogS0BSgGcAWUA2wCTwJEBnsKlg6CEEcSpBX+FoAYKxokGY0X1hWYE0sRHxCDD9YOww8gEXgRFg9SDZ4KDAdIBRgCTgDp/C382Pq++f78af1u/jf/SQAnAY4B0wDu//3/sQHeBNkF2AhsC4ENHxG9EogUIhQ6E30Qdg4ADqYMXgtECRsJuwiJCd0HdQRAA48Ag/3o+XT1JPOy8O7uu+tp6XHoP+eQ5qjl2eX74xHi4N8N373f/uAt4mPhZOOt5QLnP+hJ6F7pYekg6lLpaund6krtfu7c7tTyNvRf9uf2FfgU+7r8LgBZAY8GUw1WErIUuxJFEzkP3QsGCZwHGAcyCIAJ2QhvCzoK1QoACMcJ6wh5A2f+qPbn9f30TfeK+P747fwt/8kBHQPbA30CbQCpAC0B9wBwAGwAZgICCUYPDxNeFUgVIBb1FDIUOBRPEgESnBE+EUITHhQVFScVlxVbFrATVw8FCpEFnwHTAMX//f/zAHsBHQITAucDHgNUARQAXf29/RP9CP0M/4YAIwakCTENYQ7aD38QshCMEaQPgQ90DbIMVAw/DkkPExCQEJANNQ5nCi0I2gMSAB7+Uflp+WT1ZPbi9Bz0cPKz7gDuc+oX6YTlqORV4hXhY+Hj32LiHOJd5CvlP+W255Pll+Yx5l3mtecq5sLnt+ef6l7sMe0R7xDwXvI48jX0QfX99mH5lfqx/mUErAtjD3YS8hRzE3EQIwr9BBcECgfwCioNyA7wDi0MEQqyCZkKDArLA5L9xfgh+JD6KfiZ+F/7Tf8fA9AAGP9N/GH60/mJ+jv8Cf/6/m7/hgIoB2cOwg3PD20Pyw69D+ULvgwnDZMRVBUqFxwZPxjgFwUVGhUjE7URVQ5MCswILwZoBw4GOgdLB/UGXwaqAg0B4Pzx+qX6E/vW/cP+ywChASYDtwV/BTQHUAZ5BgAH/wc+C8gM7Q+bEbYSYhPeEqERABBsDWALsAlOCJcJmQdsB0wG0AMJA0H+pfsE+HD1KfNu71btTesv62HqqOkU6IXmouSm4t7gQ9/B3wHfPOCW4W7ideOg5KDkyOUq5mTlZuUp5pHodOly6zvrcO1N7krwWvKV8sz2Evej+nb+KwOqCMMMPBEWEi0SnQ3FCIUEygW+B7kLaRAPEI8R4wvrCcMHogcuByoDef+r+178q/v5+i78kvwH/40AC/7H/OX3wvcR9+f4sv6n/gcC0wCfAXwG2wb0Ct8JvwkTDPgJrAzwC14PYhRrFuAZrxiMF2YU8hI8ELER+xJNEtwSkw7jD04MjwzHChYHeQd3AxkD4wBXAGoA8gArAjAD8wKeAS0B4/4DAAMBDAIEBaUGIQpZDBUPURDdDz0QWw2NDcEMDg6NDx4QexISEO4Q4g1pC5YJ6AVXBToCVQEQ/4r8ffoi+Dr2y/Ta8v/vyu0R6q/nReZu5GvkQ+Qm40ziduAw4NffyODA4cTip+SW4yzki+Ha4jfkMuVq6GLoPesm65jrxOwI7/3vi/Ls85X29fzt/RcGxgXADfASuw6bEUAHlQb9BIcGsw2UEM8VfRM3ENYM6At8CJ4GnQWsAPAE5ABJASv+JPuG//77HwDz/Or4Sffs8/70lvb5+oj92P56/vf/QP/0ALUC7gH5BqUIGwuqC2oL3Q5qEC4UrhawF7gXxhcxFf0UCRaqFTIYEhZ4FzkV3RKzEDkMSwunCCoIZAgBB70GiAUlAzgDzwF7ADwA6P0H/kX+V/6u/48BhASVBlsJiAk6CfwJkQgYCYAJlQvVDtkQDxOHEqARgA+GDdELkQpkCvUJbgmZCKkHCgWYAmz+gPty+bz2F/Y28gnw/u1W6wHrregU5yblHuP94IrfNd+038ngbuCr4EThDeFq4JXfLN5A4K7ho+LH5eXniune6gfrFer27bvt4fDI9Qb5GwIuAjAIcQu3DvcRewwsDHkFWAcJCy8N+xVNF88WxBMWD6QKQQniBmAGRQj3BUAJiATQAeH+8vnE/D/74Pyk+KX1pvXe8yX4f/i2+aj6jfr9+Kz5aPtx/L4ANQKeBkwIbQn1CRkILguDDf4RpBW+Fi4YRBeTF00YqRf1F+YXjBdFFkQWDxX5Ep8Rqw6LDX8MXAoKCacHwwaABoUEVQKhAXP/P/4h/RH9eP6n/3YBqAJfBXYF5AXfA/QCpgWeBXgIAQv6DZUPMhAFD5wLkwvHCc0JjAoNDNcMtgq6CoQH2QQKAvX+OvyC+uP59Pe39QbzNvEJ7Qvrt+nn5W3lSeMf4eXgzuD34VbgAd8m3+Pchd4m3pbb+N0G3QfgCeKG4pvnPOZP6HHp3+c46x7s3e9N9kX8ogSfBswIBwqYCIsLwwlrCPcIIQrPDpoURhc7GR8VdRBeDegIrgvKCGMK0wmXCDkKxgRYA6H9GPqC+fX4jfnC+O74s/Ya9qf1cvSP8+H0hPTV9Uf4D/kV/e785v6qANIAmAPdA44GTAlWDaoQchEDFCYVbxZ+F80WxxaTFosWHxhtGP0YMRkIF/8UaRJFD6oNXQz/DMEO9w1wDFkI4QPRACz/aP/X/54BOwJRAjQC2gGbAf//cABUAHwBqAPOBCkGxAasCUkKAAr1CWQIsQeWB+UIeAm8C/UMZgz/CugHtAX6AYQALAGy/5f/bP2U+Rz31/MA8rHvJe2n7PzpoejD6AfmDeW54VHgmt+/36jgEd6n3ZfcEdxY3LjdFd4b4bTii+N35fniouXZ5KbozPBz9v//sgGnA3ABEwGsAzwFCQl4C7sN/BBLFAAWYBbeFJoSLBHwDzoQVRCODhwPTQ1ODT0LkwfPA2H+8vzI+r/7OPwQ+xz7+vfX9Y3zqvG/8Pnw0vJd9B32ovbO9xb4yflK+0H8Av5Q/9QCkQQVCMELzQ06EEkRYBKGEm4TWxTfFE8XiBkMG4ka+RjWFp4UHhSNE2IU1RPdFJQT5Q/GDVQIeQYpBfQErAb7BSwGngS5AkAB1P/Z/vf+gQDYAMgBTwFqAfoB/wKwBH8EugWFA2oDcQRGBXcIRwnuCf4IoAe6BcwEPgTCBKIFmQSfAzABi/3m+mr4r/Yl9hb1R/QW887xke6F6/TnH+Xp5Wnk4eQP5InhJOET3tzfbd2k3+revdyH3mraKN9i3Lzfj+cW7Pv1i/dW9S3yRvGQ82b7VgAaCSUL+AxJD54MQA6lDJwN0hCIE60ZyRlFF1UVng/dD5YPAA/IDRkLygkFCeIHrwaeA/L/Av5U+w36ifhS96f2sva79zP3//b39PXyC/KZ8mr14Pdj+m/8C/17/+wAqAGyApoDDQfLCUENJw8hD9QQWRLlE70VXRZIFZoVORXQFl0YdBhdGbcWGhadFLQRgRACDuINRQ7TDkcOowvjCCMG+QNiA4wDcwO7BGUEhQMvAlEASv99//3/XgFoAY0BvgHBASEDmwM5BBQEmwMNA2QCJgItA/oD9wTEBYoERgNHAWz+gvyi+rH6/fn/+WX55Pdd9przjvBZ7aLro+us68nql+qs5/HltuQe4tDhWOAT4ETgUN6L3x7dy9yz32fkZOqX7+LweO577VjtN/HK9PD6Uv8dAwQIGwp9Cm8JkQlsCjEOqxNAFrEXGhd0FXMUzxJPEwYR4A8/EBQPuQ8dDpoLGgedA6MB3P9X/9v9IPzp+eL4fvjl9n72w/Q487ry1vKV83zzOPRM9ef3v/n++zf8WPzn/Zr/cwLBBPIHwQmkC5YNHA5kD2AQlREAFLoV/xfsGCoYexdCFhgWaRZSFvUVbRRgFGETFhLWESIPFw5iDCIKngkOCLMHxwZxBakELAMoA4AC/AF9Ab8A2/+Q/+/+vf/MAN4BWgNFAiwC5gA7AEAAqQAHAgYDEQRrBOECkAHM/879S/0w/K/8MPyV/Nv61Pjz9nPzq/MR8V3wxu/K7ULtWusE6tnns+ct5V/lFOSz4YbhQNri2rTc3OA56jXrTOtL6D/msOcA6aruIfMS90P93v98AcEAdv+S/1kCKArgDycVzRbvFCISbw9DEJoPeRKDFH0VcBfyFaETvw0UCrAHsgbsB+oH7wV2A44Am/x0+9353/gy9yn1W/Q28+byePLN8V7yF/Sh9F/0RPNg8qbyE/Ze+cv8HACFAFcBxwF4AhsEKAY6COcLbg5vERYT0xKEE5QSJBMXFOoUvRWxFQAWshXmFUYWWRWTFBYTjA8zDk8MPwzPDaUMRQyNCXYH5QVeAzACRQFKAT8CGgOsAkcCcQD6/tr9lP3n/mr/eAEUAlgC/wLbAUIBrgBtANEAMwG8AdsBtAGKAQEB6AANAPf+mf3s+z373/ll+K33Nvbb9qL29fRK8xTuiezq6kvrc+0P6r7nFeFD3rXfo+AU5YzmjOYQ6FPnUOWX48rhaONL6dDwWvn2/N78tPmN9a71CPkX/zYFMgxmD1cSfhKPEF4OkAt7DjcQWRUzGJwX3hZVE7kRJQ/ZDjEOGg1gDKcKnAjhBbUDsQAKAH7/4f5P/br5YPcA9Qz1mfan9kD3vPbn9Ab0gfIG8nzyG/S092P6Tv3r/Xr9qP1i/s8A8wKpBY0H5AiNCtsL0gwfDioPZBBTEpIT1hS5FNsTfBPBElMTYxSsFKkUpxMDEs8QPw/5DW8M7AqlCs8JVwkQCBMGawRcAnIBbwDK/0b/rP4z/rT9bf1Z/Of7xvu++zP8Uvxu/Ff9p/54/28AnP93/wv/uf7R/7P/4wBzAc4CqANtA30C7f+y/kj9lP69/sT/SP8E/iD97Pod+2r3kfZD8znxMPH/7uLu4uuJ6orppOkG6vzpNuec5GniHuGf46Dlxuhm6+vtLO9Z70vu3ey67bLw/fUc/P0A8QOwBCsEEQTJBF8H9grdDpkR4ROZFAoU1hN1EhUSIBPGEysV1xQcE2QRLw6DDIAKmgj5BxIGfgQCAvT+sPzL+lX6K/qX+af4zfaa9H3yyPDK78/vtPDS8SPzzfPy8+HzIfQa9bj2R/lw+479E//T/8sAmAHbAjsExAV3B/YIWwpaC0IMSA1IDkMPmg+tD7cP0Q9vEA8ReRFLEQ0RQhBiD0YOmgzoClsJZQjrB6QH/Qb/BW0EAgO2AdcATgDA/y//cP7d/cb94v38/Uj+9v2O/iz/wP9wACAAWwCXAGMBygKrA1oE0ATZBCkFfgWrBTAG7gX8BX0FWwU+BnsGZAd2B7cHpAdfB7oGaQSJAsAAkQCDAaECkQIiAcD/W/0j/Af6tfeL9c3zgPP+84T0VPSF8xnwyO4P7C/qquqw6Gvpx+mN6lzswuw/7JDrmer86k/tPO7576zwDfDp8ZnzXfWQ+AT63/sp/mf/GgGyAfQB9AIJBDAGZQjBCRYK/gmlCXoJvwo0C+8LqAwGDHcM4gs6C8YKXQlCCRoJQAlKCUQI0gZUBXIECgQNBA0EXwOcAtkB5QCbAAgAHQB7ANwAwQG5AXABzwD1/83/NADPAMwBZQIAA3cD4QNGBEQEUgQTBBkEJwQbBD4E/gPSA9oDkwPHA3QDDwOiAsIBaAHyALEAcgDp/z7/s/4P/rb9DP1t/N/7L/sZ+876tPpM+jP6OfqF+jz7ovsa/Ff8ivy8/C/9bP38/S/+cP77/kj/dABDARgCCANGA7ADqAOHA7QDcAO+A+8DBgQ6BAcErQMvA6IC8wG3AWUBEwGvAKX/2/4+/o/9kf02/ej80Pwd/Pf7Wvvs+pj6Tfp0+qj6QPu2+y78TvxI/D/8gvzM/IP98P1S/v7+Of/o/xAAUwCYAOYAmAERAl8CyQK6AqAC/QK+AlgDQQM7Ay8DVgI+AnEBpADz/+3+Nf7I/Rz9sPwb/Hz7T/uX+s/5APkz+IH3FPeW9lL11fWg9OD05vXb9G738fWd9sT25/Ti9WD0ZPNV88/zMPZc+zD+IAGrAQcBgAIGAw4F4wUaBugGgggOCuELvgzDDBsOJxDqElQVRRZ0FREURRKxETMRmBAOENUOJA6TDQ8N/wvYCk0Jkgg3CPIHZAdrBWYDIwHy/5v/qf/A/2r/OP+X/nn+//24/Yn9Sv2J/aL98P37/e/92/1j/hP/kADEAc8CiAOUAwsE6gNyBM8EZQUNBkcGvQaKBpAGQQYcBgYGAgb4Bc0FHAVKBBgD9gF3Aa0A5ABjAOH/G/+B/Yv89Prf+ez4pPf+9vf1FvVN9CXzX/KR8RvxSPE18Uvx//BE8O7vTe9272bvj+8H8EHwM/HI8a/ykPNV9GD1fvaw9wz5Dvr7+tj7ivzB/b/+FQBCAU0CdwNuBKIFtAbIB9IIpwl/CjMLywsqDFEMWgwvDAQM1wtuCwQLTgp+Ca8Iwgf5BvcF+wTYA6UCigFnAFv/V/5T/Vb8c/uT+rH55/g2+I/3HPe99of2cvZQ9mv2iPbK9kT3uvdj+Pf4k/lD+t76oPtT/BP92/2J/k3//f+yAFsB/gGOAiQDoQMRBFQEegSFBGUEUwQoBAUE0wOJA0gD9gKlAmICAwK0AVcB9QCdACUAtv8y/6z+Ov7Q/YT9V/0h/Qb98vz4/A39MP1w/bX9A/5T/pn+7v44/37/3v8fAIgA4gBTAcQBKgKoAhkDnwMWBJsE/QRlBagF5gX0BQQGAQbkBckFhQVmBRUFzgR8BBYExANVA/gCkwIlAsIBWAHnAHwAFgCw/1H/6f6Q/jL+7/2x/Xf9Wf05/TH9Kf1E/Wz9of3f/Sn+d/7P/jH/jP/5/1wAywAzAZgB/QFdArkCCQNUA6ID5wMmBF0EjgSxBMkE2ATZBMgEqwR6BEIE+QOgAzgD0AJSAuIBYAHjAGUA5/9w/+v+f/4I/qX9Pf3i/Hn8NvzM+4f7O/v++tz6pfqc+oL6hvqX+qr61PoM+037qvv5+138vvwb/Y798/1o/sT+Kv+V/+z/RACRANcAHQFeAYkBvwHTAQYCEAIpAjECKgI3AhoCFQLuAeABrwGEAUgBDgHAAIkATAAKAMn/dv9N/+/+0P6C/mr+M/4T/vH90/3H/bL9uf2f/bL9rv3K/cL94f3s/Q7+Jv5L/nL+mf7D/uX+Hv9F/4D/lv/T//P/IAA8AGwAiACgALgA0wDlAOYA+gD4AA8B+AAMAfAA9wDYAMEAwwCaAJIAXQBjADEAJAAJAO//4//C/8n/ov+p/5P/mP+J/3b/c/9i/3H/XP9t/17/cf9v/3r/iP+Q/6v/uf/X/+P/CAAQADIAPwBaAGkAcQCHAIUAmACTAKoAnQClAKUAtwC1ALoAxgC/AMcAvwDUAMEAzQDEAMwAvAC/ALcArQCiAJYAjgCEAH8AcABtAF0AWQBJAEgARQA6ADAANAAtAC8AJQAiACMAKAAkACAAHgAaABwAFwAjAAwAGAABAAgAAAD5//f/5P/t/9D/2v/B/8z/vP+7/67/pP+n/5b/pf+U/5//k/+T/5D/jv+P/5P/k/+a/5z/ov+k/6v/u//C/9D/2v/v//j/+/8HACMAKQA4AEIATgBZAFwAXQBwAHIAdgBzAIIAfwBzAHEAcwB0AGMAWwBXAE4AMwAmAB4AGQAEAPj/9//w/9X/yP/C/7f/sP+c/5z/j/+J/33/ef94/27/ZP9g/2r/YP9j/2X/df9w/3H/h/+O/5r/lP+w/7j/vP/H/9b/4P/j/+v/8f/9/wAABAAQABwAFQAWAB8ALQAsACkAMAA9ADsAJwAuADUAMQAbACMAIQANAPf/AAD//+v/0v/M/83/sf+i/5b/mv+B/3L/af9o/1r/Qv9H/0H/OP8l/zH/Lf8m/x3/Lv8y/y3/Kv80/zr/Of84/0P/T/9P/1b/W/9u/2z/fv9+/4z/mv+m/6z/s//B/8f/2f/U/+L/6v/y//H/+/8IAAMACgAKABMADwATABYAGAAVABkAHgAfABwAGAAVABcAEwAaABcAEQAPAAkACwAMAAsAAgALAAYACQADAAsADQAHAAYABgACAAIABwAGAAsACQAPAAgACgACAAUADAALAAMA+//8//P/9P/t/+3/4//X/9T/1f/U/8f/x//C/8T/vf+8/7r/vf+7/7b/v/+//8b/w//K/87/0v/T/9j/4v/f/+z/4//5//f//P8BAAAACAACABEABwAQAAoAEQASABMAFQAOABkADAAUAAwAFQAKABEACAATAA0ACQARAAwAEgAAABEACQAQAAgACgAOAAcADgAGABAACQARAAwACgAOAAsAFQAJABUABwAUAAgAEQARAA4AEwAHABYAEQAnABgAIQAfACcAMwAuADcANQA/AEAASQBYAFEAXwBaAG0AdQCAAIIAfgCSAIkAmgCJAKcAlwCvAKAArQCmALAAsgCpALUApgC9AKEAtQCTAK0AmgCmAJcAlACaAIkAmAB9AI8AdQCFAHYAdQB0AHAAeQBkAHsAZwB1AGAAbwBfAGMAYwBiAGIAVwBoAFgAXgBWAFgAUgBQAEoASQBCAEIAPAA1ADAAKQAjACIAFwAPAA8ABgD+//H/9f/l/+T/0v/V/8n/wP/B/7T/sv+e/6n/kP+c/5L/hP+A/4T/ev92/3b/b/9u/3L/bP9w/3D/cv9v/3z/f/+H/4j/lv+Y/63/of/A/7v/0P/E/+H/3f/m//D/8f8FAP7/DwAIABUAFgAXABoAHQAjACIAIAApACgALgAvADQAMQAtADgALQBBAC4APgAuAEQANwA9AEMAQABHADsAQwA2AD8APQA2ADkAMgA0ACYALAAuABUAHAACABEA8v8DAOP/7f/c/9H/1P+v/8z/nf+w/47/nP+P/3//hf9h/3//VP9z/0v/Xf9Q/07/T/88/0//N/9O/zr/Rv9C/0D/Rv9A/07/Q/9L/0v/UP9Z/1b/Zv9W/27/X/9x/2r/dP94/3j/g/92/4z/g/+Q/4b/kv+X/5v/o/+n/6v/rf+5/7r/vv/K/9H/2//k/93/5f/g//r/7P/y//T/8P/7/+b/+P/Y/+7/y//a/7v/vf+t/5//of+H/4b/a/9z/1r/Y/9P/1j/T/9J/0r/UP9b/1j/Zf9l/3X/f/+N/5r/pf+2/8n/4v/x////FgAlAEAAUgBtAIAAmQCvAMIA4gD6ABoBMgFVAWsBiwGsAcMB6QEAAh0CMQJMAl0CfQKJAp0CoAKnAq4CqgKpAp4CjgKAAmsCTwIyAhEC6gHJAZ8BcAFKARsB7wC2AJ4AZwA/ABYA8f/U/6b/mP9t/2X/RP9B/zL/I/8m/xP/IP8K/xz/Cf8U/xP/D/8T/wH/Df/1/gT/9f76/vD+6v7y/uj++f7w/v3+//4V/x7/K/9L/1//gv+V/8f/5/8UADwAZACWAK4A5gD8ACkBPgFjAXQBhQGRAZABmgGOAY0BcwFmAVEBMgEcAe8A0wCnAIsAYwBFACAAAADa/8v/pv+V/3r/af9X/0T/Of8c/x//A/8D/+X+4/7V/sT+tv6m/pb+fv5r/ln+RP4s/hL++f3o/c39wP2o/Zv9i/15/W/9YP1g/VP9Vf1O/VH9WP1W/V79Yf1w/Xz9i/2g/aX9w/3G/eX9/P0S/i7+Ov5p/nf+nf62/t/+Cv8g/1X/av+l/8X/+P8nAEQAgQCXAN4A8AAvAU4BdAGjAb4B7wH2AScCNgJXAmQCcgKKAocCnwKVAqICkwKgApUCjgKTAn4CgwJtAmwCWgJQAk0CNgI3AhwCKAIFAgsC8AHqAeUBxwHYAaUBvgGJAaQBfgF9AXMBUgFoASoBRQEOASEB/QD2AO0AzwDcALQA0gCxAMgAuADMAM4A1wDuAPcAFgEcAUcBUwF4AYQBpQG/Ad8B+QENAiUCLwJGAk4CXAJeAmcCUgJPAkMCMQIYAv0B2QGvAY8BYwFAAQ8B5QC6AJEAYwA7ABkA9P/L/6b/f/9X/zH/Dv/m/rf+h/5T/ij++P3K/Y79ZP0v/f78wPyP/F/8K/z5+8T7lvtm+zj7F/vo+tz6sPq5+pX6q/qn+rn60Prh+ib7NvuU+7H7EfxZ/Lb8KP16/Rf+dv4i/43/PwDIAFkBBgKHAjsDqANKBLgELgWRBd8FNAZYBpUGogaxBqYGlQaBBloGMQYABrwFggU0BfMEkARCBO0DfwMwA7ACXwLYAYcBDQGhAEEAw/97//j+uP5A/vT9mv06/fb8ifxd/PD7rPtW+w77w/pt+jD6y/mP+Tj57/io+FX4JfjS97L3c/dd90T3Lfc99zL3Wvdb95H3tPfp9y34YPi/+PP4XPmr+RP6e/rV+lH7sfsh/Hf83fwv/YL90f0Z/k7+jf6u/u3+9/40/zX/av98/6H/3v/s/zwASQCiAMUAIAFgAaUBCAJKArgCAgNyA8QDJwSLBNYEQAWIBd4FHgZSBpoGnAbeBswG6gbTBscGrQZ2BlsGDgbnBYcFXwUABdUEfgRJBAcE0AOdA2cDRgMMA/sCvwLEAn8CkQJWAmgCRQJOAkECPQJSAjkCXwJFAm4CWgJ1AmwCdAJ0AmoCdgJdAnkCaAKHAnUCkwKYArMCzALeAgIDDwM/A00DcgOSA7ED3AP6AyoERgR1BJoEyQTqBAAFKgU+BW4FcwWVBZoFmwWcBYcFewVRBT8FFQXkBLYEdQREBPYDvANfAwYDpQIzAr8BKAG4ACcApP8C/27+xv0o/Yn84vtI+5T67Pks+Zz4yfcv92v2uPUE9VD0zPMW87byO/IC8sTxsvHD8cDxFPIn8q3y1fJZ87bzK/Sz9B710PU89gr3ifdq+P340vmD+jf7//ua/Fn91P2F/t/+aP+2/xsAXACaANsABwE7AVsBiAGyAecBGAJPApACzwIXA2sDtgMeBHAE5QQ8BacFAwZfBrAG5wYzB0EHaQdeB2UHPAclB/cGwgaNBkoGDgbLBZAFTAUIBdYEiARkBCUEAgTbA7wDrAObA6QDngPBA8cD/QMWBEkEfwSvBPsEHAVyBYQF2AXvBSIGQQZDBmsGUQZxBisGNgbmBcMFeQUbBcUENATcAzEDwwIYAn8B3wArAJv/yf49/nn95/w4/Jj7HPt/+h36m/lM+fL4rPh1+D74Hvj/9+332vfT98/30PfM99v31vfo9+P3/Pf59wf4EPgI+BP4+fcJ+OX33vfO97v3sfeN94b3Z/dW90f3Kvc49yT3Pvc691b3e/eb9/D3EviO+MH4T/mr+S76ufo2++X7ZPwz/cP9kf5B//3/xABgASgCvQJsA/0DiQQVBXkF+wVPBskGFQd+B9IHIwiECL8IDgkuCWgJegmNCX4JawlQCRAJ3AiGCEoI6geZBzQH2QZ8BiQG1wVtBTAFvAR+BA4EwANcA/kClAIYAs0BUgETAagAggA2ACAA+v/0//T/8f8HAAUAKAAsAFwAawCdALUA6wAZAVABnAHcASMCagLMAhkDdQPKAyUEdgTJBBsFbAW7BRIGXgasBvQGRgeNB80HDAg1CGoIcwiMCHUIagg7CAEIvgdVB/4GbAb/BVMFwQQNBFsDogLKARIBKgBp/3n+r/3J/Pn7JftE+oz5sfgY+Fv3w/Yi9p31GPWk9EL05fOc81vzLvMB8+jy0fLW8tDy6PLz8g3zKPNG82PzfvOh87nz4vP78yH0QPRt9Jz02/QW9WD1q/UF9mv21PZW97D3Svix+E35wflV+tj6VPvo+1L86PxG/db9K/6m/vr+W/+9//3/ZwCYAP0AIAF/AasB8QEqAl8CrwLUAjIDTQO1A80DKQRpBKQE/QQrBagFxQVMBncG9gZFB6wHIAhzCAkJUAnuCTIKtAoMC3gL0gsVDHkMkAznDOwMKA0jDS4NLw0RDQcNwwyjDFIMEAytC0QL1ApDCs8JIQmbCOoHWAezBhYGgQXpBHUE7gOJAxMDuAJkAh0C6AGoAYkBWgFFASQBGQH9AOsA3QDNALoAqwCNAIIAWwBCAA8A5P+f/1X/D/+u/mH+7P2R/Q79oPwk/KH7LPuh+kT6u/le+eH4h/gw+Nv3p/da90T3BPcN9+T25/bk9vL2DPcN9zv3SPd+9473vvfh9wH4M/g9+HL4cPia+Jf4qPik+Jn4mPh7+Hv4XfhZ+Df4NPgm+CX4KPg2+FD4Y/iU+Lj4+Pgp+XP5tPkD+k/6o/r++k77svsE/Gf8ufwd/XH90P0j/nL+wf4E/0z/gP/H//P/LgBXAIAAqADFAOYA/QAYASkBOgFOAVkBZwF4AYwBnAG1Ac4B6gEVAkcCfgLGAhMDbwPYAz8EwAQ9BdYFZgYWB7EHZwgdCdUJnApUCy4M2gyyDVUOHw/AD2sQARFzEQQSRRKsErYS8RLbEtASnxJDEvMRWhHkECUQdQ+bDrUNxgzEC8EKowmTCHQHVgY8BR4EDQP7AfkA//8D/yr+Qf14/LH7+fpN+qb5IPmO+DX4xveL90r3Jfci9yb3TPdX9433t/f69zn4efi/+PT4O/lv+ar53vkN+jT6S/pr+nL6ffp7+m76Wfox+hL61vmr+Wb5LPnZ+Jb4R/gA+Mr3g/dR9wX35vay9qH2hvaE9oD2ifam9rv28/Yh9133nffg9yX4aPi0+Pr4Nvl6+a359fkn+mP6l/rK+gX7M/t7+6P78fso/HT8uvwC/Vb9lv32/TL+jf7P/hn/X/+c/+T/GQBfAJUA1gAKATwBcwGRAbwB0gHvAQMCDQIlAh4CNwI6AkkCUAJfAmoCdgKKApkCuwLSAvACEANDA3YDsgP1A0YEpAQBBXAF7AVuBv0GjgcsCM8IeQkxCuUKqAtWDCAN1Q2ODkYP6A+aECERuhEmEooS4RIUE0sTSBNXEyAT/BKgEjQSxBEMEXsQkg/ZDtYN2QzHC5sKeAkfCO4GjwVZBPgCuwFzADz/Hv7u/P376/oj+jL5kvja91f3yvZi9hT2x/Ws9XT1gvVi9Yb1nfXE9fX1HfZr9pL25PYT92r3l/fd9yH4R/iS+J/46vjv+CH5M/k++Vv5Rvlj+Tv5Q/km+Rv5CPng+Ob4q/iy+H/4hfhw+FL4Xfg/+E74N/hH+Ev4SPhW+Fv4afhw+Ir4nfi1+Nz48fgb+UD5c/mj+dj5FPpB+ob6uPoF+zn7hfvC+wT8UfyQ/Nz8G/10/bD9+P04/nT+sv7d/iH/QP9u/4T/pP/A/8//5P/p//T/8v/4//7/9//9//P/+f/x//L/9f/3/w4AFAA4AFIAeAC6APEASgGTAQsCeQIOA5QDSAT1BLYFgQZKB0oIEgkkCgILEAwHDRQOEQ8VEA4RBhIBE8gTsBRMFR8WjBYVF0gXaRdhFyEX2RY7FpMVqxSxE3cSQhHTD2wO3QxOC7oJ+Qd3BrkEQwOVASkAsv5E/f77uPq3+Z/4z/fy9mD20/VV9SL1y/Tc9L708PQQ9Ub1sPXj9XP2tfZM96v3Ifii+Pv4e/m2+TD6YPq4+un6BPs1+xz7Ovv/+gX7xfqh+mv6EfrW+V/5Gfmc+Er42vdz9wP3jvYy9sT1fvUk9ev0oPRw9EL0NPQ39Df0W/Rl9KD0yvQa9XD10/VC9rr2Hfev9yr4wfhV+c/5dvrb+nj79/tx/Pz8Wf2+/QT+UP6O/s3+2P4F/+T+7f7f/rf+wf5w/mb+Cv7w/bD9d/1c/RL9C/2w/K38avxz/Fn8Xvxo/GL8ofye/A/9If2X/c39Nv6b/gT/jf/y/50ACwHaAU8CNwPaA7wEpgVwBoEHXgiICXkKqgvADPcNDg9fEIkRxBIhFCkVixaBF6EYrxllGlMbqRsvHEkcNhwJHGYb2xq5GbgYSxfFFTIUShKMEHAOfwxVClYIMwZCBEMCRwCS/qH8M/uN+VH4C/cD9gr1T/S280vzF/PV8gzz8vJx86DzOvS89Ev1APaa9m73D/jx+HP5P/qs+lX7vvsl/IL8l/zc/L781Pyb/If8IfzW+0r7w/o6+pr5GvlS+Mb35vZO9pL16vRK9IzzBvNP8vPxdvE68fPww/Cu8J3w0fAE8W/xzvFN8sfyffM19Bz1APbc9sb3pvip+aD6o/uP/HH9Mf71/pf/SQDQADwBjQGsAeoB7AEHAuoByAF8ASkBxwBtAA0Ak/8Z/4P+C/6J/S39wfxk/Av8s/uD+2b7bft5+5n7tPvv+0T8rfwn/aD9If6m/kH/3v+UAEAB8QGxAm8DXAQVBRYG7AbdB/AI1wkoCxEMbQ1tDrUP4RAiEnMTqhQCFhkXlBimGR4bNhxLHTUe3h6aH+EfMCDuH3kfpB6BHVccshomGdMWohQJEoAPAA11CuYHLAWQAt7/uP1m+7P5qfcU9m/0CvMw8mDxLfGt8K7wd/C88B/x3fHA8pPzjfQ09V72TPeo+Lb5vvqi+zX8Df2V/Uz+v/7d/tv+hP5Y/gP+kf3//Bf8HvsO+gz5FPgh9wP24vSm85Dyj/Gu8N7v9O4Z7kjtoOwy7PPrveuq64/rvOsL7KXsee1K7k/vPvBr8aryMfS69Uz3zfg8+rH7Lv20/hoAWwFnAiwD5gNgBN4EIgUrBfkEegQBBEQDrALFAeYAyv+W/of9Qfxt+zn6a/lR+HX3sfYQ9sj1VPVN9f30OPVd9fT1mfZK9zb44/ga+g77hvy3/fH+CAAIAS4CPgNiBEcFEwa2BloHCgjXCKMJSgrWCm8LNQwuDT8OWA8rEBER9xEoE6EULRbEFxYZbBrGG3AdGB/2IAEi+yI5I00jWSPwIrMiJCGyHysd1xpWGMsVJRP0D8kMHgkVBuwCngAH/tn7d/lj98f1e/QG9GDzUPMG80rzr/OE9JT1tva/97f40fnt+kT8ZP1u/gn/pv8QAIkA6AAEAcYAQACf/9P+Ev4X/fL7fvr4+Fv37fWI9FnzBfLD8I3vfO647RTtr+w37Pfrpuur677rE+xh7LfsLu2U7Tvu0O6172LwV/Ey8jPzSfRK9Yf2p/fd+Pf5Mvs+/G/9VP5f/x4A0wB2AcABGAIKAg8C2AGQATABlwDy/zH/df66/Q79P/yL+7f6CPqB+ez4qPg3+N/3nfdo92X3cPel98r3Kvhi+PD4efk/+vr61PvD/H39q/5X/18APwHeAbMC9wKBA40DzQPHA9MDtQOkA3oDRwOZA6gDPATXBKwFfAZ9B/8ILgpoDHsOlRAzE20VdxgOG4seTSEDJKgmEij3KZIq1itNKz8rlimRJwYl5CEIHxsb9BcYE18PwQoPB5YDagDa/Qn7J/kS9zf2k/Wc9Qn2jPZ+9434Avq9+1n9Ff9pAMAB9QLUA+cEQQXHBXQFQQWuBOYDJAPfAacA4/5F/Uv7rPnl9zj2fPS08irxo+/W7uXtpO1P7UTtKO1k7dvtcO6J7yrwGfGE8SLyf/Ib87bz9/Nb9B30H/Tf8+/zCvQq9Fv0VfR/9Lb0T/X39dH2fvck+Nr4gflz+if78fs1/Gf8gPxm/Jv8ZPxC/J37Bftp+uX50Pl3+VD55Pij+JH4xPhw+dT5VfqV+r/6FPt4+/P7Ovxi/Az8xvtp+0P7Efvz+rL6V/pE+gj6Svp5+tb6IPuL+9T7Evxf/G/86Pz+/J79m/3X/dn96P10/hf/ewAKASsCnwJTA9MEtgbdCCsLcw3/DpMRdBQ0GHAcqSCwI04mmihKKs4say6LL8cuIi1NKgknaySsIEEdTxgbE5kNmQjPBDwBrP7n+8f5HfiP9/f3FvnA+nz8ZP6/AD8DBQa3CNAKlQyrDbgOZw+mD2EPIA57DEQKTghKBi8EzAHW/t77A/nb9iD1svNi8u/wrO+77n3uzO5z7yHwwfBo8SzyMvNA9FH1H/bA9h/3SPdh9zv3//Z09tb1OPVw9MDz4fIt8oLxHPES8TjxqPEJ8p/yTfMr9C71NvYf99b3bPi++A/5E/kH+bT4Nviv9xj3pfYH9pL1KvX49Av1WfXh9a72qfem+MD5C/uE/Bb+cf9FAL4A0ADHAJ4AMgBx/zb+k/yn+rX4Afe19ZT0n/OB8qXxRfGT8Zny+PN29aj25ffO+Pr5Zfvy/Cj+pf6J/gr+Of6j/q3/9P/d/2H/nv4L/6H/jQEGA8EEqAUNBxkK+w25E4QYKx12IK4jMyfFKsEu6DCnMQ0wVi2WKiwoniXhIbocfxZMEBoLIgfUA4YB3/7r/JH7mPty/fn/IwMkBU0HgQlRDKsPQxLwEyAUtRPYEgUSTxH0D9gNoArWBsIDbgENAHb+T/zr+aj3jfYT9nT2kfaC9u/1E/XF9P30zvU59ib2a/Xf9JH00PT59O/05fSM9JL0UvSx9N/0G/Ub9c307PTb9E/1AvWV9PXzePOW84vzxvNt8zXz4/Kr8gnzp/ON9Pv0EvWv9Ln0LfXY9Un2UvYm9o/1UfX79Af1DvUh9Rj1v/T29EX1e/ac9w35ovoj/NP9EP9NABsB1AEVAsYBFAG+/wz+4fts+eH2ovRy8jrw/e0u7Brr4OqT67rsUO428DHyKvR/9vj4vfuo/c/+sP5v/pv+jP70/ib+kP0j/KP6c/nr+NX5Zfp++y/70ftW/V4BaAZgDGUSAhecHHwgRiaYKoMvVDJPMh0xfi0SK0InLiQRH2sZNBN7DHcHHwOAAeL/t/9d/ywAngIKBn0KOw4GEskU4xaZGDYZnhkjGVIX1BQ1ESIODQtPCH4FgAKsACD/+f4D/3z/IwDxAN8BfAJ5A9kDPAQ0A5YBNv///MX69PdP9Rny1u/T7X3sXOyz7Arud+868bXzrvYT+u38BP9PAPAAUAGqAKL/n/3f+pn3vvNp8IHtpev56aroyOeQ5/no7+rM7cDwx/MF95H52fsw/Wj+Df/P/sP9pPti+b72+/N18Xnvde4P7h3uq+4K8Jry//Xl+bX9JgHyA7gF7gZoB3UHdQb7A6AAOfw6+Dn0ovBk7UHq9+dR5j3mXOew6Y/sh++e8ln1lvi3+5j+NAB6ABv/Hv1l+yj5bvfS9Gfyt+/G7fHsuO2e8L7yqPVF9qT4q/v9/+4Exgc3C9QMRxEMFaEapR+sInUlSCU0J74nFir/KU0oyiRsH3kcxRhgF0QU5RCIDEAIFgY4BU8HEgmLC4gMew2EDzgSJhaEGHEaMBp8GcIXpxUIFNIRShCHDeYKzAdGBcoDrAIOA54DAQWuBdMFiQVRBdUFVgaMBl0FDgO8/2j8dvk49531BvQ58jjw6O7q7pnwIvMK9tL4Z/sS/mIApAI/BAsFrQQRA8EAiP0M+v/1BPKL7pXr3um56JboJemB6gntRfBC9Lv3ufrO/Ej+Tf9G/6P+3fx4+iL3lvNL8MDt3usn6jzp7uhx6tPsRfAH9AD4D/xD/1kCrATlBvAHlgdsBSoCtv7f+or3BvQY8RTuautx6bboqOma6yHub/Cd8ln06PWU90z5+PrK+1r7wvmj9zD1ffMn8orx6fDn7jbtOevH6zvtQPDB8zr2tviP+Kr5zPob/vMAIALJARcAOwC1ANoEMAkRELwVmBlrHZsgRSb5Kd0t+S17LcoqJiafIGgaEhaiEewNPAmgBYwDrgJBA1EFwQlXD4EUhBiqGuEcoh4LIBsgqh4FHJMX0xKGDdgJ/gb3BBgDjAFBAXACDgUXCPgKEQ2xDoEPJRA2D34N1QkrBSsAFvsx94/z4/Bg7vvsVu1t73PzDvjx/E4BWwX/CNoLwg3pDUwM1QhmBJH/s/oX9gnxlOwh6bXnb+iH6qbtrPAf9Hf3Ofvp/gYCqAMnA5AACv2J+YH2nPM58M3svum85wvnr+fR6efsUPCb84L2z/mm/O7+7P8iADYAlv9T/s/7T/nQ9gP1hPMA83HzU/Ts9KH01vRU9QL3PvgD+ev4mffj9a7zLvI08c7wTvB776LuDO4M7mjvt/DT8SjyBPJE8m7y9/GQ8Efvte3W7WbtwO658LPy2vPM8ib0cfby+yD//v+2/8j++AAABCsKqRHtGMAcEh6/HpQhJifaKpIrICmTJKAeMRkwFAkRUA/vDG8JlQbKBeMG0wkJDScRmRUeGg8dYh6yHrQdJhztGb8XGxX2EeANuwm7BiQGfwfjCXIMDQ5XD3wQOxI/FLUVnhX4ErMOWQkQBDf/4foa97zzPvGz7+3v0vE79YL5If7gAnoHggstDiYPhA7GDDAKBAdGAyL/y/qI9uHyhvAD8Pzw8vIt9YT30flH/HL+MAAnAesAzP9D/Qj6B/Ys8irvMO1/7CTsi+wm7bLu9/Dn80P3RPq//Cv9u/wp+3756ffl9ezzqPGy8EvwvvAr8vLzq/XB+F37xv1sAEMASgCx/rj7qfnd9Vr0VfEQ7nvrUOdO6GHoY+r37C3uXfJJ8/H09fXK9s33fvfs85Dxbu5O62LpmeaG5Uvktebv5mjp7u0J76fzxfZv+Wf73vxr/Bz7//pT+vT8ewLlCEwOZBIYGLAc6SJrJzsqsCo1KgEmGR9JGsYUzxEpDX8JJwayBYsGnwd7CvcNRRThGMYdeyBOItwirSAcHn4aKxh7FK8QYAxpCWAIVAlVC/oN2RCXEgsUKhSmFFIUEBOCEAwMQQebAQT9FPlm9uj08PNg9GL12fdR+1b/iwOVB9AK1AzpDWgNDwxyCbQGjAO7AO/9BPtS+fb3Pfi5+Er6Hfy7/Rz/Sv94/4P/RP/Y/Wf8avqx+O32XvTu8lry7PPc9Dj2L/ee9xr5S/k2+oH6R/uS+kP42vWP8q7wIe+R7gruSe7r7sfvoPFI9Pv21fmP/Cj+Ff+c/pv97ftr+oT4KfZ89CXy6+/d7XfsOOxj7c3u/O8X8crxLPLr8tDzjfPH8rnxWu8h7tDrX+nx5qblpuQf447kkuXk6E/rOuwZ7TjvM/MW9eX2jvbX9BnzI/HJ70X1QPxzA6UKEQ4jFZgbpSIZJhcpyikKJ3UjExskFp8QZQ3LCIkGiwa6Bw4LggxeENYTqhlXHFIf8CA+IEYfHhpQFiESKRCEDhANyQzYDO8OhxHXFEoYHhtvHP4bsRlJFgkSfQ3GCO0DoP/0+zz5yfeC94H4bPr0/I//3QEbBAYGcQdQCAgIEAfwBS8FhAQYBHMD+ALzAm8DtwSeBdcG6wZbBvIE4AL2AH7+evxA+sX47/ez9973Wvg5+V/6B/zE/XD/IQAgANj+z/yD+mX4yvZy9VL0P/ND8ozxYfGB8Z/yqfOf9CP1//Tk9Kr0MPWy9ZD2ivcb+LX4rvjC+MX4ufjW+I347PfB9h31Q/OM8T7wXe/R7jzusO0a7f3sS+2c7cDtou2r7Qrt4uwM7OPqb+nQ5wvmWORI5JjkmeUJ5vnmp+ZP6Mbqie2M8d3yDPPF7tXtre3A8lf6sAFQCYcNTxXtF04eYyPgJZImjSPiHuUXSxRMDl8LVgnXCBgJ5AoJDk8QFBVcF0kZcRqgG0Ec8ht+G1oYUhVsEi8Qug/nEJASQhToFYsXFBknGigbmhpiGaEW+RKtDmUKaQcPBHkChgD//83/NAD8AOYAswHsAF0B9AB4AZkBmwFSAvABagPTA44FoQYGCF8J5gkyCtwIywdBBesDNAK5AJX/rP1a/B/7hPt7/ML+4gDoAS8CCwGo/yX+Sv1E/Ej73/nR96b1JPTH80j0AvZ097P4IfnN+Hr48ffM9y/3r/Zl9djzpPKm8e7x+fIU9Wb3afnk+iX7+/pI+qr5wvjK9zj2U/R08pzwa++L7izu8e2J7ufupe/e73Hvse6/7RTtP+w07Pfqxelm5xzlf+Iw4W/hJuGR403jC+PC4o7jleWQ6QXvMvCY8JnuYelJ6Zjr1vCM+m4CsgozD9QU3xiiHPohDiNMI44eaBmMEV0MnwkxCCQKHQslDlAOuxGLE/AVeRm9GaMajhjLFmgT7xBvD1sNCA5QDnsPXRFaE00VmRf/GWkbphxuHHEaQRdFExEPugvGCXQIVgjqBx8H5Ab8BVAGwQZaB0sH3wXvA9oA3v7Q/Qz+4f96AUUDUAQjBU0GgQd9CbwKXQuGCpsISQYABA4DVgLCAu4C0wLpAg4D7QP5BMEGZQcwB9sFFgNHAJT9ovtk+n/5//hJ+Mj3nvfX96X4uvnh+iv7C/sF+hf4pvby9MXzSPP78gDzh/Pm9Cr2d/hi+rH70Pwq/E/7RvmR97L1g/QV9BLz4fJ+8arwXu8R7z3vYO8N8GPv1u687R/tjeza7OHs7us567ToSOY/5KfiNuIy4ibikeET4cfgyuGV4zzl1Oa95ejj3OGF4FTiGOfC7br1o/0yAyEIHAucDYsPzRGDElISGRHCDe4L+wmeClQM3A+XEugUTBb/FYUWRRZBF1cX3ReVFnoUOBK2D/UOIQ+9EDQSxBM1FC0UNRRsFCoVBRZqFsQVFhTLEZwPIw4KDpYOmg8SECAQLg9uDrcNag1qDfwMPwxfCrYIrgbTBZ0FKgb/BjUHGwfoBeEErANYA0oDmQPqA50DSAN2AtoBWAFGAVABZAFtAUUBNwExAXoB8QGMAg0DjgPKAwcEHwQzBBEElQO2AlkB2P8E/qT8ifsD+/T6GvtT+y373PoI+jn5RfiN9+/2SPay9e/0N/R+8zbzMPOa8y/0wPQY9TH1F/XL9Kj0ffRv9Ef0KfS180bz8PKg8pfyuPIA8z3zrPPx81X0sfQO9Qz1zvRO9GLzavKS8drwF/Dm7y7vpe7q7RrtGux46wTrZOqh6mfqz+pK60DsL+1Q7lvv1u9Q8PXvBfCM79zvgvCl8XLza/XS9+X5h/x8/q8ArAIyBJUFpwZuB9QHiQjbCIUJaAqtCzgN/Q7fEJ0STxS2FesWkxclGEMYQxg7GDcYTxhxGOoYIBmrGcIZ0BmIGTAZ0RhQGBEYZxf9FiEWYRVhFHATYxI2EVAQKg86Dg8NHwz6CvoJBgnlB+MGvAXWBPsDdQMZA8gCnQJhAj0CCAIFAgICIQJYAmoCbwIuAs8BRgHbAJcAeACaAM0AKgFqAZ0BmAEtAZsAw//h/iD+mf1K/Ub9ev2N/Yf9Vf22/OX7A/sX+i/5e/jr92f3F/fV9pP2Sfbo9XT17PST9E/0RPR29K/0AfUk9Sb16PSJ9Bb0lvNd8xHz8vLL8rXytfKp8sfyq/Kn8m/yJvLM8Vjx/fBc8ATwVu+37vTt7ewB7O7qNeqC6Sjp3OjF6NjoA+mP6QLqkery6ibrJOsC6+bq9eqz6/vsIe+Q8Sn06vYZ+W77df1W/xYB2gKVBCcGAwh4CfsKfQwtDvQP/xENFOMV0BeSGVUbwRwWHuMeTB+XH6IfmR94H1ofEx/7Ht4erR5qHhEerx1KHQEdbRypG5IaDhlsF6MV5RMwErgQdw9YDoUNvQwJDFALggqDCXkIVQcdBuUEzAO3AusBSgHgAIkAHwDX/27/X/9L/13/U/86/yb/2/7Q/jz+uv3//IP8MvwX/D/8MPx4/Iz88fwt/Vz9VP0s/Sr9Av0X/cT8aPzG+1z7FPvi+sT6afoW+r75rvl6+W/5H/nx+MH4s/ij+DT4z/cu98v2efZD9uL1ifUo9fH09vTf9NT0YvQO9G3zBfNy8qbxMfF98EjwJfAA8KzvHO+a7uzteO3Z7B/sDutM6mTpr+ht6KLncOcm547nCOiP6IPpUukk6kHqvuol6y3rD+yd7BTvNfFQ9En34vmc/KX+SgFkAngEUAUEB3EIKAoUDPIMDA/oD2wSMBSGFmEYuxl1Gy8chh2pHckdPh2oHDscphtXG5QaJRrfGfUZOxotGgQabhnGGD0YWhdwFvMUmRMwEg4RFRD5DiMOVA0SDdcM1QyADNkLDAstCksJNAgnB88FxgThA2ID2wJxAvcBegFLARgB6AB4AA4Ae/8R/6z+D/5+/az8I/ym+4n7fvuk+/j7RfzU/Dn9of21/c/92f3T/eH9mf1a/bf8Xvz++9v7B/z1+zX8Gvwz/O77oftI+7j6evrv+aj5C/lz+M73PPf39qf2ifYc9rr1OPXT9H70GvTI8zDzyvI98rnxD/Fs8PDvmO+H71Hv9O5P7n3tuOwF7GbrqOrT6fLoK+iJ5xXnk+Zq5lDmpOYh55LnI+hZ6P3ohOl56lnrROxq7d3uL/HP8wn3Avrh/Ez/ZQH2AjwEXwVeBgIInwnRC34NYw8JEZQSuxRJFkkYbxl2GgkbLxtTG8waexrJGWYZChmxGFkY1BeeF4UXsBfgF8UXVhefFqMVvhS9E8sSxxHKEAsQVw/iDmMODg7XDcgN2Q2lDUQNXwxoC2gKhwnWCBUIageXBugFRgW0BDoErgNZAwkD2AKRAg8CUwF9ALX/AP9h/r39Ff17/C38NPyC/AH9cf3i/Ub+jv6x/or+Uv4P/tr9v/15/S39qPxH/DH8R/yk/Nv89Pzj/J/8VPzD+zD7cfrO+Un50Ph/+PP3kvcY9/n24/a49nH2xfU+9Xz0HfSV8xbzi/LS8Wjxx/Bo8LXvK++x7j3uHO6W7fXs+OsE6zvqjekD6TDoV+eV5gDm2uXH5fDlE+aC5jjn+ufb6IHpMOoI6zvsme05783wmvLo9Gz3ifpO/db/twE/A6oExwUtBzUI1wmaC9QNGBDqEYMTlhTCFfEWHRjfGFsZYBlEGRcZ1xh0GN8XeBcNFxQX4BafFjsWphWSFUAVLRWGFKQTnxKOEe8QMBClD/AOYA4UDr0NmA0cDaUMNAzpC8ELSgurCqEJsQgACH8HLgeqBjcGoQVIBegEfgT4A1sD4QJhAh8CfQHpACQAg/83//r+9v6d/n/+N/5Q/oD+uP4D/wL/Rf80/2//TP8Z/8v+Z/5b/h7+J/7S/ZT9V/0m/U79Rv1P/ff8qfw3/ML7R/uL+uP5MfnW+Gn4JPi890332vZZ9vT1R/Wg9LPz/fJN8sbxcvH68Izw6u9P76ru8u1M7XXs2us7663qK+po6bjo4edL58fmTub25WXlMOUC5TLljeX95azmM+c86AnpPOpV66nsM+7K7/nxtvMx9gr4aPrK/Of+eAH9AvEEAAZtB8YIIgrTC2YNZQ8pESETchTcFX8WdRf7F2kY4xjAGNEYURgjGKIXXRfrFosWLxazFYMV+xTLFFEUIRTXE1ET2hLTEQkRDRBGD70ODQ62DfYMkgwMDJgLYgvQCrkKJArpCUUJiAjYB+cGdgbKBZ4FJQXLBG0E9gPaA3UDXwP4AsECXgL7Ab4BRwEdAcgAowCaAGIAUwD9/+n/5v8LAGkAlADmAOsAEQECAeMAuABWAA0Aof9b/wX/p/5n/hL+8f2z/Yn9Q/3b/Hz8Avyd+xn7j/r8+VD54PhF+N33VvfW9mT22PVi9az0E/RB84/y3fEq8Zfw3u9O753uAO5h7arsBexd683qaurU6V/pw+gA6F3naub+5UjlA+W65JnksuTD5E3lqOWQ5lrnhujB6Rjrpez17evvbPHa89H1I/he+kD8nP4cAGcCyAO4BQIHfwj4CQgL+wwNDmEQzhHQE1gVRRZqFzwXHRjHF2EYZhhhGFwYnRdxF0kWEhYrFRIVxRR9FHgUyRO3E/cS1xJQEuoRaBGQENYPvQ4qDkUN7gx1DDsM9QuOC0cLkgpcCsYJqQlXCegIawiWB/8GJQbWBV4FMwX6BLMEgQQDBN0DYQNZAyUDJgMMA8ACqAI5AkYCFAJZAmcChQKcAn4ChQJHAmICTgKFApcCoQKOAh8CywEwAb0ANwDF/1D/wP5O/qb9Lf2k/Cj81Ptp+xP7sfpK+tH5R/nH+CD4jffm9kn2sPUJ9ZT0B/Sg8wnzlPLy8Vfxw/AM8HXvuu4k7nzt6exD7KHrButH6rXp/uhh6KjnA+dm5uTlhOVE5TflLOVE5WTlqOUU5pzmUucZ6BvpPOqJ6/rsiu4r8OXxrvOp9Yn3kPly+3b9U/8lAQcDdwQ4BlgH1AgMCocL8gx0DiYQexE7E0oUtRWOFnQXGxhkGKcYQRj4Fw0XeBaUFeQUXBTgE6kTWBNEE/8S6RK1EoUSPBLXEU4RphDHD/cOLg5+DeAMfAwiDN4LwAtvC24LIQsTC9UKoApfCuUJoQnwCLkIGgjpB3QH9gacBu4FvQUcBRkF2gTpBPYE4QT6BJoEoAQrBDEE+APdA+YDowOyA2MDaQMkAxsDCQPeAsgCfAI+AtABbAEAAZAAIwCT/wH/U/6o/Qb9fvwS/LD7cPsQ+7n6TvrZ+WX55fh1+Nv3Yfee9un1DvVO9I/z9fJ38vLxl/EC8ZXw1+9Y75fu++1V7absIexf6+TqIurA6RTpuegr6KPnPOek5nXmD+Y95jfmnebb5kLnvecb6Proium/6rLrIO1e7rzvKfFl8vnzUfXz9oD4QvoA/NX9l/9SARIDwgRLBsQHCQk2CnELmwzrDSwPgxCtEQQT0RPEFFcV2xUyFkAWYhb0FcsVJhWuFAkUgxMjE7ASqRJQEkwSMxITEgMSzBGfEScRwRAeEGYPtQ7hDSwNawzoC1YL9wqxCnQKZApGCmQKSQpmCkUKOgoECr4Jbgn6CKAI7gd6B8kGUwbVBX0FTQUWBTMFLgVpBXsFlgWJBW4FRQX+BMsEgQQ+BPgDpwM6A8wCUQLOAUUB0ABiABwA6P+0/5L/R/8W/6f+NP6l/RH9ivzq+3z74Ppp+tn5TfnG+An4iffh9m729PWC9Sz1vPR89OLzg/PX8jLynPHU8Gvwre9S76nuWO7D7VrtAe2C7EDssuuN6+Pq5epV6jjq4Om16ZDpG+lg6dfoUekN6Y/psukR6svqBusl7IHswu2C7pjvs/Ce8eHyw/P39Az2Gfdf+Hz5z/oe/GH97v4hANIBFQO2BBYGgwfsCBQKigt2DL8Nhg6JD0AQ9hCbEQYSjBLDEiETORNREzoTKRPuEs0SfBJXEhES2BGhEWIRLBHNEJgQGBDOD2MPAw+rDjAO7w1iDRwNjgwtDLsLRAv4CooKZQoeCgYK8QncCeMJzwnUCccJvAm3CZIJiAlaCS0J6wieCEkI3weLBzEH8ga3BpgGagZfBkoGKgYgBuIFxwVyBUoF2wSFBBcEiwMiA3ICDwJlARABlABJABMAxP+z/1f/PP/Z/ov+IP6c/TL9fvwX/Gz74vpF+qb5K/mI+Cf4nfc+99/2kvZB9t71jvUR9an0H/Sc8xPzf/IG8nvxF/Gl8EXw8++j73jvQ+8q7wXv9O7f7sTuru527knuF+7m7b7tne2H7Yntk+3D7fvtRe6Z7gzvm+8s8NrwcPEa8rPyXvP084T0FvWT9Tv21/af92D4N/kT+gP7D/wK/Rz+Kf82AEsBSgJXA0EEKgUTBuUGwAd3CDUJ6gmDCi0LsgtLDLcMJg2LDdkNHw5IDocOnQ7CDtwO7Q70DvAO9Q7fDtsOuA6VDmoOOg4NDs8Njg07DfYMpgxdDBEMxAuJC1MLKAv1CtIKqwqJClkKMwoKCsYJlglYCSEJ4gibCFAI+gewB18HGAfVBpEGYwY8BhgG5wW2BYwFRQUTBcoEigRNBAkE1AOBA0YD4QKWAj4C3wGcAUIBIAHcAMIAjgBKABIApv9Y/97+gf4X/rL9bP0L/dP8a/we/LT7UfsF+6v6dvoq+gX61Pmp+XD5HvnQ+Hb4KfjP95T3Xfcx9x73Affp9sP2nvaB9mT2XPZP9lj2Z/Z19oT2kfaS9oP2gfZ+9nn2gfaI9qb2wfbp9gf3J/dQ9233oPfW9xP4SfiI+Mv4+/gn+Uf5ZfmB+aL5yPnt+SD6Tfp7+rD63PoV+0r7jPvM+xz8evzN/Cf9d/3L/RD+WP6d/u3+Pf+H/+n/QQCbAOIAOgGCAcYBIQJrAtACLgOFA9wDIARqBKIE3AQABTQFZwWRBcUF7wUNBiQGRwZYBnEGhAaXBrMGygbcBuoG8QbeBtgG1wbHBsUGuQaiBpQGkAZ9Bl4GUQYrBiYGKQYWBhIG9wXpBbQFngVyBSMF8wS9BJkEYwRQBBkE9QPvA78DsAOJA3YDTAM5Ax8D5AK2AnICPwL8AcIBjQFWATYBEwH1ALwAngBrADcAHAD5/9T/r/+v/4v/Yv9O/w7/2/7F/on+Sf42/hL+6f3f/b/9jv2B/XH9Sf04/SP9Bv31/PH82/zC/MX8u/y1/MP8xvzG/NX83/za/N383PzT/NL81fzU/Nr85fzr/Pf89vzp/N/82/zd/Oz87vwB/Q79Mv1H/VT9Xv1e/Wb9a/1//Xn9g/2C/Yz9lv2O/Yb9ev2P/ZX9qf2x/cD91P3g/fz9Ef4m/j7+Xv6B/qf+yf7d/t/+A/8L/xT/Kv8y/0P/b/+G/57/q/+5/8b/vf/i/+T/9f8aADYAUwBoAHgAdgCMAJ0AswC/ANAA6wD7AAoBDQENAQ8BDQEXAR0BIQEeARsBFQETARgBGwEnATkBWwFuAYQBkAGLAZABlwGKAZEBkgGHAZcBhwGFAVYBTAEvAQ4BKAH6ABoBDwEpARkBIQEoAREBLQEUASoBEwEhAf4A+ADmAMkAygC+AMcAtgDAALgAowCcAJAAbgBfAFMARQA9AEgANwA2ADQAKgAtACsAOQA2AEUATwBTAEAANQAYAAEA+//a/+D/z//V/8z/0P/h/8///f/9/xgALgAzADMANgAuAB0AHgALAA8ABwAVABsAEgAeAAoACwD8//f/8f/p/+7/6//o/+f/5P/l/9//3v/Z/9T/1v/S/9H/xf+z/6P/nf+E/4L/aP9d/1T/Q/9A/zX/P/9A/1z/aP9y/3b/g/97/33/af9w/1//X/9w/1z/dv9g/3D/av9f/1v/T/9X/0H/Pv81/zv/Q/9K/1r/Y/99/5T/p//A/9H/7P/9/xkAKwBEAEkAYQBvAHQAmACcALUAtQDHAMcA1ADfAOUACQEHASgBIQEtAS8BKwElARIBFgEYASABHwEtASgBJgEPAQIB7gDWAMcApgCeAJkAhwB2AF8ARwAnABcA///0//f/6v/t/+7/5P/i/9P/3f/c/+n/9/8HACMAIgA6AEgAUABoAHcAmwC4AM0AzwDIAM0AwgC4AKEAmAChAKIAoACXAI8AeQBgAE4AWQBaAGoAcQB1AIkAfwB+AFwAPgAsAB0AEQAFABIAJQArACkAHwAyAE0AYQBsAHsAeQB1AJAAnwCeAJ8AkAB/AGUARABsAGgAeAB0AFoAgQB1AIYAnwCZAKUAlwCyANAAzgDjAKsAlACHALkA2AC9ABEB0wADAdYAHwErASgBpQFDAacBDwFJAQgB5wDxAFUA9wCXAOcAhQCqAGoB6gAfAUIAsgAxARwArf9R/73/MgDo/1f/6P7C/ysAk/8R//P+gv9a/23/df9u/5z/dP88/6D+o/68/wQAN/9s/pf+1P6K/j3+5f07/i3/2P5//nf+1P4I//z94/3f/aX9xv1Z/mH+Df2R/bP9wP1J/jH9cP0n/oL9Af6T/WT8l/2z/E/9lv50/RX+av7q/V798v20/mf/2v53/qL+uP3s/gT/Av91/j3+Hf5H/Sv+M/5I/Uf9kP12/WX9l/xb/Lb8Mfyc/En9Zf1p/Sr9mP1H/UD8G/0F/s/9gPxT/Nr9l/74/ub/bv+h/pr+P/4lAF0BRgH/AGkCkAJ3AU8CiQKzAy0CNACaARYCNwI1BGYBCQKaAlUHCAz0BAwBd/uA/3sB1f4E/W37Rv3a+j/84vwY/QH+t/5d/nj8Tv73/gMA0P0F/mT9TfqV/iv+Uv/u/3/+r/6+AEICJwFhAJUBZgG4AEwCewSpA6ADIwQpAXX+awApAwIDJABW/+D+5f6EAHYBawCS/lr9Wvzj/S//9P4Z/8n/Yf5J/Oz9/f5eAMH/5fzc/bD+uv46/+z9R/yb/PT8cf8GAJD/df/o/bD8Jv2BAQYCrf+n/r77tPzQ/zoAo/+r/Mf77PwQ/kH/9/8LAJH/tf6D/yoB3AExAJX74PrK/SP/Sv3C/Sf/9/0y/VP92P6D/zQArf/U/i7/lgFSAgABcQBuABcAfACZAI7/eQBkAdcAswCfAEMBtgLcAxMEjwF8AHwDHAapBt4DogEcA+4FIgekBRYEsgOpBFgGbQXhAy0EBQS0BFQDhAT8A3kDoAQ5A3oDywTKBRMF0gS+A/8D8gVWBxoH1QSBA+sCeAPKBvQHfQW2Al8DTAdsCJQEuAJIBbgGgAWABDAEYAWwBjMFkAJvAjgG3QdaBlMCKgHbAxEGhgbxA/gC6wJtBJoE8QRLBR8FVAaKBYoEqwTRBMoFdgQIAmkBmwH5BF0ErgJTAfwBCwV5BvcEDgLfAXUDMgRBAXAAsgP/BEYDggG3ARkD3ANDA6cB8ACWALcB0AO7Acj/5fyJ/pUD8wLKAE7/Mf8T/zIA9P56/jcANv+m/R7+4/6r/50CzAOtARf+IgDkAhQDOQCI/cX+EAD+AG//x/0y/cD+OP97/k3+mf6j/2H97PzK/Ir+p/7r/Ij7ivtb+937tP6x/jD8//tL/Sz/ngAa/an8tv2J/Xz/9v2c/Mz8D/2O/Gn7y/vO/uf9Mvvk+tP7KgCN/5/+dfw/+8n9Uvy1/Lz7VvqF/Ln9bvz7+1z8Xf2T/Vz8Evz3/Hn+nf6S/Fn7QPsv/bH+HPyL+hX6Cv1O/QH7Bf3M/aT8//kY+5b9kf3o+9L5qPlH+wX8rPs4+zH6GfsF+3H6OvxO+3775PyE+5r85v1t/jD+J/0p/Tf7H/x1/O39jf16+W783v3I/qj+iv30/Sn+Xf5T/5//Af9c/6L99/3Q/jT+eP3e+i/6p/rL+wn9nf1a/lr8rPt+/r0AtADr/kf8nf36AE8AEf1+/C3+dQBV/tD6i/wxADv/Wfz++rr84/++/4b/xP/c/08AsgE8AlEAcv5C/l3/AgAj//z8APvQ/PD+rP9v/zb+TP70/4EBkwAc/97/oQD7Abf+2Pt7/f7/qwDt/Qb9X/94AVEAqwCsAOYAwwICAqsAjgAOApoCLQGs/wEA3AAcAdT9uvzI/xkAu/+o/Mj9vwCIAE3/Rf8h/3cAqwKG/kz+yP/dAPoAXf7k/uv+U//6/mz+c/9l/0H/1f58/8EAhv+O/tP/TgDA/7r/zf+mAFoAXAAfAuIAev9gAC4C9AEqAPz/6P8eAdkAIAABAGoAowFVASIBZwEeAlUBpQB3/6H+dgCaAcsAVP/H/8D/YwCVANj/v/+u/7YAFAD4AF4APf5//18BDAJYACMAsgCoAQcDRAPuAiYDPQWTA0gB6gEvAzMDJgLoAbsArwG0Aw8EHALRAI4C1wPxAoQAXgCpAGcAcv4p/Br9LP64/Xr9Bf94/yr/YP71/loAVgCIAO7/KQCvARkD5wEkATwCFALxAUsBWgHRAc0BzwBTAakCtALBARsAAgGoAkwCdABNAEQBBgFsAIr/XQCvAGL/Q//h/+UAQwBFAWEBi/+h/yAAAgEpAIj/Cf9o/w8Avv/t/+P+yf9RAHQARP+9/VH/KgCVAJoAFQEhAt0CLwIFAbUBrAEJAQwAo/8tAEX/kP55/jH+7f1Y/kL/uv5l/uL+m/8nABkA2f/G/wsAGACkAOUA4wA5AA//nP9pAKIAQwCNAI0B2QHNAe8BdwOqAyICjgHcAbQBqABmAEAAxv8s/2b/+P8w/6v+jv5dAIgBSwAlAPoA9gGMARQBmwFVAgMCZgBfAHsAMQD8/zL/Kf/E/58A4QAJARsByQEmA68CyALZArABpwAdAU4C4ADH/8D/PABFABT/Df+B/zkA7v92/0r/1f/TAOgANAH8AK8B4AGZAJn/BgBaASMBMAC9/3r/Mf+F/2AAzACDALz/x/8hANv/OwCWAGsAHwBhAI8Ax/8E/9L+8/8bAJP/BAC9ALEAJwD3AA0C1gJRArkBwAGIAaMBTAE7ATQB+wBiAI3/fv/Y/3wAhQBLABwAif/Y/2YAwgAOASUBigFsATQB9QD2ACMBOQFOAVAA/f/e/1z/Ev8U/7r/7v9X/9n+o/88ADgAvwBIATUBawAGADEBAwLbADYAIAEeAggCWAF8AUQCQwKDAYgBvQGoAfIAAQCx/8T/8P+W/6P+X/13/Vv+jf6Q/gX+F/7G/nv/pv/N/8wASwHXAZ4B1AHYAu4CYgKXAaYBnQF/Ac0A6f/M//T+tf4R/wP/+/4o/wQA/AC0Af4B0gLaA74DkwOTA58DhwOlApYB9wDNAGYACQCv/0r/mv/e/y8AzAD0AAsBPQFiAaABOwJYAjACJgLIAe0B+QGIAfcAawBlAOkACwF9AFUAJwBGAJ8AjQD4AD0B3gB6AJoAAwFQAQEBLgD8/8f/Tv9Q/yH/GP8R/6b+z/7v/sr+rf74/jX/Wf88/7L+Bv+u/oD+F//6/tH+cf6T/i7/ov9D/6H/lADCAPYAwQBcATECMgJWArUChwLmAXQBDQFEAdoA4P9j/wj/bP7E/cz9CP4K/k79If0F/sr+4P64/mz/gAD4ACMAj//B/9//mv+5/nv+ov5w/oP9Xv1D/l//EgCZ/7z/OQDuAIwBjgGRAXYBXQEsARsB2wDmAFABQQEQAXYAcQA5AboBBwIqApoC2AK7AjkCFgJ6AnwCMAI2AQ4AUf/6/gH/Cf8f/yP/M/8v/0v/KQAhAScCSgJHAlsCQAKIApcCsAJFAroBuAAEAGz/rf6//lf+If64/Sr9vfzJ/Bf9ef18/n3+wv7d/gT/5P83AIUANwDU/3L+/fy3+476QfrR+HP36fUj9bH0kfTw9CT1KvZW9qH28Paq93f4PPmL+Uf5ovna+ET4svcr9y/3H/eh9nb22PYL91z4PvmT+jX8pPyj/Kn8lfyo/MX8ePt6+nL5zfc/99z24/as99v38vcF+eH5/fpQ/Cr9kf7l/+f/8/8aADEAKgGQAcEBcgKQAsYCjwPKBKwGkQjQCEEJ/QnzCpUMHA2ADdkNoQ1HDUgNjQ00DhAPOA+AEBQSQBO+FFYW4BjDG/Id8h7pH2kgQSD0H9EeHx5THAwZfRVmEkYQGg5gC2cIbwZKBO8BCwBO/rT9DfxM+sz45fcT9631zfTg9Db2WvZr9s32RvjC+m38Uv4ZAM0BHgJwAm4CigIqArv/s/1r+1L5BPeo9Jfy9PCJ7xPuFe4z7iDule2e7brulO9X7x/uXu0Y7bnskOtP6l7qPOrm6TrqvuqW7ODtu+5g8KPypPTL9b32Cfet90H3Svbz9RH1WfN18envi+5k7pLspOtT7JvsvO0C7lvu5++t8arxvPJy81P0pPXq9Iv1M/b29p/2VPel+LH63Pze++f9AgCfAvgFgQdkCv8NYxAoEUIUABZqGJ4ZIBgaGmcbUhsPG8Yb+xt4Ht4fNx5eICAgxB+PIXUh4iHPIC8e5RueHSEfsh9eIHweYB81HfobNRqmGEkV6w/+CW0Dsf9y+GTzZu7G6xfrcumE6JrpNu0N8TP22Pru/8QD4QVWCFILig15Dh4NugtMC2EKmQnMCFUJwgmvCvIJyglMCmkJ3whYB7oFhAKA/hn5bfTV8OHsx+kW53XlVeTa5DLmbOm77SzxifQF+BH7Y/23/nf+pf4R/qr8yfrv+C/3Gvab9Vz1+/YM+B/56Pm0+v/7u/yO/G/79vkR9wj0nfBW7crq/ucW5tXkTuS94z7kqeUI6JPrCe458MvxQvNW9EX1QvZm9oD2lvWm9Dn0NvSk9Fb1RPbn9t/3y/ig+c36pPuy/Hj99v0F/lD+6P7e/44B9wLXBHIGigjKCvwMYQ+6EbcT+RQfFg8XYhj1GK4ZkhkhGqYaTRtoHIAd8x6THk4fgCDBIaYisiK6IUEi4CKmIAcgsx/GHjocyRY9DswHqQGS+qj2kvLV7nXpA+UI41zmeOzD8Hr19/ih/VcBbgUTCf0LRA7JDQ0N4QvICuwIGQhmCJsJXgvwC0YMQA2JDt8P7xAgEHkN6AguA+H9XPnk9JLvM+oj5dPhaeCW4HHid+VJ6VDt1vE59kD6mP3f/xsCwwNDBBIDxgBR/vH85vxV/RP+jv7x/rv/5QA0AkYDbwN4AlUAI/1P+Wb1Z/Go7Wjqueeq5Q3kP+PC4+Pl1+in68Htke9I8e3yTvQx9fn1m/bM9kL2j/X59Fz1Svb+9ur3DPns+Y765PoM+8n7xPsZ+sn3dPXZ88XywPHe8CrxEfJs88j1dPgJ/BYALASCCLEM1g9REtAUyhZ5GEcZeRl1GVMZqxgcGGQYCRmIGYYZwRm6GhIcEB3JHfMdFR7QHWYdmRzDG2IbuRriGY0YphcoF4QXYhW4EeIMNAZx/xL4O/JS71fuiuu55wTlI+Yt7O7yavnN/poCUwVECMELMg/NENQOXQyzCoMKWgriCGUHzQY6CG4KCw3DDUYNYwx5CygLewj5A8H9gfey8WvsR+jQ5H3iE+BO36vg5+M56MjrcO/V89P4w/wk//z/IwDaAEcBhAHyAOb/NP/F/gr/9v/EAV0DtwTxBGgEBgTYArEAR/18+b/1R/Ja7nHqh+e/5aHl7eXa5kvo6Omw673tC/Au8if0+/QC9Wj01/MZ9Ij0JvWH9Sz2KvdI+N34d/l++lT73vsI+4j58fdc9q703PIc8YHvJO5g7KrrSOzh7Wbw0vKH9cf4NvxQ/4MCVAUtCNwKJA1PD+YQHBIFE2oU1xVoFzIYMhhrGLMYTRlmGR0ZFxgAF2YWJhYkFsMVMxWGFKQUURTfFFcVsBazF94XIhgGGH8ZRRm4GYIYjBWnEBUJwf+M9/fxO+2w67/nqeWR5C7nv+wn84v5vv6ABFcHXgoHC9sL8wtoCiUIkAUJBVADHgMpA9YFDQoNDS4P0Q86EaQR/RC9DhYL2gU3/+v3fvGf7O/oO+Zy5IzjE+RL5njphu3Y8H3zJva0+EL6j/pi+vr6hfxL/cj9Zf4JAOwB0QP5BZEI0wosC0AKrggVB7EEIgHP/G/4QPQ18APtzuqn6fno+uh36X7qm+uU7OXtx+7z7mPu0u2Q7cftOO427yPx2PJd9Nn1JPg9+7D9AP9b/7L/Qv/F/U/77fgr90v1BvOQ8PXuGu7C7Yvt2u137vvuyu4O7tztgu7C72DxxfJB9P/1hfiy+8H/nANZB8EKZQ1fEOwS6hXZFwMZ9RgZGWwZFhm2GE4XEBcaFm4VABTHE1MU1hMDFBMTMxRgE7YSCxLGEgQVVRVGFRUTuRMCE5oUuBVGGLAZOhdnFWQR0g6PB/v+Uva/8R7ws+3C6wbp5ulc7OLxr/jk/wYFTQeCCRoLSw13DRgMcApYCBcGFASuA3sE+AX0B8sK/g3YD1APMg4XDt4NWwwUCBcCI/w69g7xyO1c7BvsIOyw62zsLu4f8FLypfRA92H5EvpG+XT4Zfhw+bb7v/1R/3sAUgHYAuAE9ganCG8JrwjcBiEE7gDX/Uf63Pb986vxi++W7UDsK+x/7dzuGvC98LDwWPBu79Huhu4y7mbtrexz7BbtnO508P/yFPbg+Pr6d/w4/Y39ff2i/HX7EfoA+F/2JfWp9Mf0SfQA89LxSPHA8JzwlO9f7lftB+ya6obqaOsK7enuJfAV8r/0b/fc+Rz9CgGcBf4IDwp4ClYLxQyFDl8Q7RFXE2oTmRK9EvETUBWiFW0VyBRoFPcTNRI+EpMSjBMYFBoU3BOdEwgTRRMhFsgYrRp4Gg8aQxtxHdEeuB6zHgsd0xntFB4PggkfA+b7avX88YHwn+927jDuoPBE9Kj4Tfw4AE0DwAXkBuwGsQa+BS0FqQSZBacGcAgcCtIL8g07EAYTkxSvFLYSFRBfDe0JCwZjAXT9EPos96L0CvOu8svyRvNu8/7zlvS29Jr0n/Te9A/1/fS59Cb1O/ah95v5C/zv/kcCFQVaB8gITQkXCfAHKAbbA0ABKv4z+2v4P/bY9O/zc/Mc8/HyfvL18SvxTPBp70vuQ+0x7Grrdes57PTt9u/M8W3zGvVt9nn3f/hN+a/6Lvt0+oj5p/h3+B/4b/eW9jL2pPUl9EfziPI187fzOPQK9af0KvMn7/zsU+tl6wHrtOrs6mnqx+oT67Lvc/Tk9zv54fqq/SIAygDLAOkCGgW0BbkEcQQ7BlkIkwmeDMIQgxQPFQ0UKxTRFhAYlhe4FXcUbBNwEUgQXxBZEkoTuhT3FXcYBBvnGy8cgR2XHlkfWh8AHlYdSxycGrsYARf0FFgS+w7fCukHogQ4AbP9aPp/+Hr3fPaz9SP2uPZs+Oz5DvyI/gYBnQKlAyAFxwZ9CHIJaQpBC2UM7AwxDXANJQ4GD6IPyw9NDzAOjwySCqIIkAbuAwkBif2C+pT3g/Xa8+DyOPIP8rHyl/Oj9Bj1DvaL9kv3MfdL9yP4Qfm6+rL7W/00/00BkQLuA04FqgYSB5cGfAV2BCIDLgG2/7b9Q/zT+Jj2IvSY86ryX/G78O/vy++07krure1V7v/s2+wH7GDsHOx46+Hrj+wk78bvN/Gw8BXxlPH18ln0VvSN9MfzOvXa9dP2d/fd99L4ovgy+Fv3k/XF8i/wXe6r7hHv2+6c7h/vIfDh8SDzifRP9ZD1nfXq9Z32jfUU9b30C/aG+Bf6a/vp/Fn+JABkApAEygbiBwYIlgjQCfUKzAtPDNsMmA4+EM0RIBMfFCcVtxb/F70YjxmRGHkYKhjSGHYZ0xmjGaUZvBoIGyIc8RvyG8YblBvTGhQaKxjRFZATPBGlD+wNiQu5CHYGOgQcAyMCmQAh/8v9LP1q/Yv9gf1N/uT/FAGKAnsD2QRDBlIHXggPCmoLVgv7CjsKQgu3C28L2ApICtoJBQmfByAHTAZHBEoCYgBAAPT+lfxN+qj5afke+Kv25vWe9rX2I/bW9tD45fkQ+rT5o/tn/lv/iv/I/7cAjAHpAK4AXQEdAW4A7/7b/vb+Nv6a/GD72vq7+Tf4sPUK9GnyxvBK7+/tjux168rpoumj6dzqOuul6xvsV+xT7eHsWO2N7CTthuzW7P/rcetl66XrcO1U7uLvT/D38Rfzy/Sh9Uz2gPZJ9lD2GvZ79gn2lvW99a32cfgj+aP5Bfpu+rH65Pml+bf4DPgJ97327vZ097z3Cvku+1v9Yv9cAKMBUwK9ApACQQNuA8cDjAOXA2gERgU0BoMHhQkcC38MnAz2DMkMpQzpCzEMCAw4DN4L2At4DI0NAA95EDsTtBTmFrAX6Ri6GS4a/xllGgAbbBpiGQUXlBZOFvQV4RQ9FHoTkhJTEB4OEg3YC7cKwAhvCG0H9waqBMYDXQS0BLEFiAQ0BQ8F9gVbBhQHZwjgCK8JUAkiCmcJ5gmPCTgK4QprCi4KywgpCLUG4QaQBgQGEgXFA+MCswFIAJf+6v1U/dv8FvwN+wP68vjl96P33Pco9372q/XQ9Lf0afRU9Kr04vRX9Yz1Nvb/9j33d/c2+Pz4h/k7+T340fez97X3iPdG94X2lPWG9Obz0PMz85ry5/FZ8R7xjPBb7+rtJO3g7Kjs9etn6ovpsegQ6AvoPeh36KLojOh16JnpZupC6/brDO1i7qXvDvG58S/zdvTw9Yz3s/hC+bP5BPrU+tP7cfwT/Wz9S/7D/pP/cgBiAUQClgLLApUC6QLfAtkC+AJbAwIEYwTABPEE3AW5BrcHQwifCCsJZgndCB4I7AduCKoIdAjcCPAIrgqaC9ALCg10DnkOag2HDnQOgQ7KDkUNhw10Dv8N3Q2lDgEP1A/3D+8PRxAREEgPxw1oDcUNEQ4VDfsLkQsoDEUMkQrQCosLPAs2CpIIfQh7CS0JAwikCCsJfQntCWEJgQg9CbYJ1QiSCYoIhAjoB2YGYwf2BqkGSAY2BbIEZgSZAzkDTAPyAaEAVwC5AHf/qv6v/Z79tf5h/Tr97vxF/H/72fpA+0j7GvsC+ub4W/nl+GX3RPnx+WH4p/gP+Q/66vk++Rz4lfjh+DT4m/h298T3lPco90D3Xvj++Cr3J/XZ9Pj1+fWS82Lx1vHY8rXyEPJ78YrxLfJP8rHxK/P98jDx1vE+8qLxLvKd8QPxmfLK8qbxQPNU9Wz0xfMa9bv2V/Yn9MPzKfaZ9vj18/bc9tb3TflK+kX8CfsQ/Of8xPxA/mv8dPug+kT7df3I/Tn8U/7D/zv/Df6N/U8CiALz/Vj9O//TAXIBUP8MABQBvgO3A8sBrATpAzUFEAbhBA4HPQYQBdQE4QVkBT8HnwmLB0UGRgkICwwHEwaJCIEKZwmxB8sJhAmtClYJQwj/CXEMLA5TCMkGdQytDeMJUQmnCTgL6AoYCQYKGwiiBxYLYwjKCaAK5gciCLcGjAn2CSYGfgI9BqQLwgVhAegCrQ/yDfT8HwM7ENcLL/+f+80GEgzsAt/+8wPCCEQFiQC5ArMHxgKqAB0DbAL3/sj+gANC++v9RQHqAaMAFfh1/+gFffzO+dABewCE+qj8Lf8s+2v9PPpp+WH/lP5D+n73Ov0DAE/4+PYl/rn83fis9r72ifzS/Bj5gfVh9VUB2AH88iHtif7+B+P2xOwb+VEGo/Z97xP0sATBBVfrnPPbABYDmfhk8fv4d/7p/fz44fnS94b89/ya9UD3mAD5/oryzPPPAlsEhO6j/KQAI/h8/fb40vzD/e0Bc/wT8NoCEg/z9DPvxQUxBAr8svxXAaf7TwC2BMn7hf2y/bX7Z/+YATgA3Prn/KD+HAAUBnIBYfcV+80IAwRf9Mz8wAkhAQz5CQBPBLEC5P+KA9P+o/2oDkr96/rSBYcGSQNA98sDHQnC/OwBtgJXAYYGZQT4+KsCQQseBpr3NP60Bw4RF/4U9YIHGwdSD73rB/YdK+ry8/EvCr4H/gzL+sP7EQIrCj4NyvXH+/EKtAnr/7j+CwL1/nMJN/8R/BoCZArZ/AT9cwjZ/1EGhffBA3wJDv9r/N7/NQe0+Q8Hmv0uBmkAova2BiP/0grV93r63wptAnf43QLxCDT3pAGT/GAGOgY29WkHfQCX+ZkEO/53/REHxfKY/8IMpvbxBd76ovpCD4f38vqVBfkD1PRU9EMeQvQt7WgI1wy/A3HflgegF6L8UOzg/TcKCgR49ob3WhBr9CT84wnw+IwA5gAVACX/CAAO+swBcg1C+Ujy4gITCfb7RfkbAcj7qwf5+Xr6/Ae8/ir7zvYZA8gHMfSA9XkOLwCG7McEYgxA9sz/5P4a/0D4vQG1B9TqjwuwAWYCxvbn+WgE8wmYBJ7bBAuaDeX+VO9v/fwCbAx/AnzdoROGCIf3wvkx/AAJXP+H/TABvvZrAncIq/z6/N31z/zOGCv18On3AMQaqwIE33IClhWcBVvya/Y4DCUNt+9s/cgLIwj+9Hj7CgxfB7D2hfRxDEkFXv92+GoBxAN3AsUHffJBAAcNgQFs+yr6iwdCBQL7jQqT/A3vpxjrBHju4wS5CYkFL/p3/h8FNAoj/m/0YQu+A6z6VAo4Aiv1CQiLDjr72vce+0EWXQQa7Xj/ABEcCNT2h/3R+cAWygIc7SUGcRKG+hP2QQya+dkMmvup+aUKW/t3CBkELPlt/gQWhvVs+6cW8/Lb/mQJewfC+Zv7dgcKAeEGv/gxAs0ILvwCA2gAsf3CD3b1gfllEzD1WQLTDAr4ufxdBTAD+wDw+1r/twh4BGvwmAa6Ctj6SwP8AafmKyCKDALc4v7FFKQNWu9I708Pzhfi78rymgjXEXP7CvGUAXMMmAg19P76pAMXCY3+W/km/mcLVwB/9vgDswADCCD2af5TClH//vYP/uQHoQnw8bXxQRDbDRP0Ue4GCEUMOAHQ9S/xCBTGCmjvXvU7CC0JqwMa61T+6xBZAln8te5cBQ0R4gCa6v39eRNF/BH5rfMTCIoRMfSN7D8LQQjiAPf7LPCHDf0C2fqL9bMFBAwN9Q70kAkPDyHrvv8CCqUCqvOA/OsOtv/A75ECNwwaAYfyffMQF48Diu5+/JYJXghp9/f4WvohCu0OQ+4x8gYGThL7/2/nDQW4EXbznQO/+03+JATPAIv/sfYTChD/G/noBokDOvcv/57/IQlJ+3j3nALxANsMLPZ57G4RwQON+ib/8/UuApwHgQEz8kz9OAwnA4XzIfrOCmUEyPrX9hkDxAFQCNv2//gvCIX/egZf9XX7sAuHAcr35fhSBNAJ5v5k+L/5lwduCv75o/K2AzAQM/RA+/gK2vfr/fIC3P+1AZv3mwDjDsLtawSuB/33LAHeB676FPXWCv8BPPit+mMFLwst64YCxg+V++X6RfdLCzj9jARw/HLxyQyCCs7xpPaKCQ0OVO9I/ZMJ9gFNBEHsJAXlCvP/XP8e8JoIoRIz9dLzVwVpCncAK/gQ+7wEHAnq/y3yAgW4Ap0H4v+78ksJbQPk9msJvwZA82r2xQ2uB3T52PSABKwJOPhjB6z4zf54BoUCO/3u8G8PsgpV8e36vQQgB/P8xf8+APP6NgT4B0f5j/nYA4ABYwkn+ET8GQbJ+9sKyAAa7tgKWwVeAen5Uvf/Eyn44/73+QUEiA009Tv7swNGBPMFmPZz+n0LRQci+8vwfwQoEM8EnO/77SYTpBFs9//p/P4GGG4JT+ya980IPQraA6v72fTc/qwL0/40AmP0MgDYBbf9FwMD+RADmAPlBTrzCfwmE8L/gfN3+VEFtwgf/Ej0Qgeo/7b9dAL5/C8Fs/wc/CD9CQegAiz3nAHs/LwHYAGv9hf6XQpPB9j6O/GCBqoRPfAM+d79ngleAw33Qfk0BOQCMAQIASnrbgi9DQf9Jffb8/wKlQM7AiD3BvjQAbMMFgts6q71Zg4lDxr0uPJYAIMKOgbH9MP4Jf/GCyQGgvWO+2j8lQcjDAb/XfGD734SLhHMAODinfg8HUUH9/jy49EF+h21/I7qZv3kB7IHigKC8f/8jwmkBZX6xvY0AzoNn/zX7yMFYgoOBGz78vGSAwcM8gVn90H4eQKmB0EDufUyASEBNwRK+ukA5QcCAQn8ae9UENcP2fdx6pr93BpyBLnzjPSuBZEKLwEU/4n3jP2SCDP/GPuh/yf+sf8DBiL//fpYAaT/wgC8BVIDtvS8/goGNgQiAgT8rAFC9e/7ThW8DOrpWe7xBoYVHQ017WrsPATwE8sLHfQ379D8EwuKCCT/BvXR+HIKcAWo/u77gv1J/5gCLgCY+pAEuv3zAwf7eP3gBTkAPQdq+Nj4MAC3A0MJpfvZ9bj/Nv5UCjkEjfcp/QMBLgJv/+D/Df5JBMD/Nfcc/Y0G4QfWAJfzyfigBswFfQ6Q95LtUvsXCv0K5QBN9Pjt0gl0DMoBc/lz9usAAAc2A3gCe/k5+MEHrASe/dj4WP6xBfoMQPur66QEnQ7VBz734/T0AFQFtgWIAgv2/fYDAl4DPQQa/VH1rPwXB4QA+gB//eT51AFkA38CSfod+638fQgXAYn6uwE0+8QA6wSvBfr/WPlv+jkDnAbHARP9HfwN/aP/gAZAAl38X/vR+hgJBgbQ+1L70AGo/xL+tP4L/WQDmvw1/v75Df0MBGYHEQSG+Q/8TftZBb8KfADC+xj7UfwxBt8Fsv/z+y76tgP9BZICZwGKAWj/yP0RA+MGewBC/tL82v3IAYgD0ADi/HYBcwLFAXABMP6B/5oCMQBpAUUA9v2K/En/HAE1Ag4CV/82/0j9NQPGAssELAOb/TD7r/iDA/QFwwW+/ov8zP8p/7gDggG7AW4Bcf+u/cH9JP0HA5gIswV9AGX3ufsXAggENAjY/gD8f/ue+yEByQbJBnEAZvuN9Kb9UweuApQBMP2k+Hb/0QJmAhgCwv+F/SD9S/7n/0oCZgHq/q785P0fAt8GogP//3P6lvwiA0cCUQWkACr7Fvby/jkH2QN3AvD5rPyvAq4BQwOyAZ3/bf5g/3wA9gAKALD+Av2I/v0CnwFLArD/D/0E/1ECGgPuASD+rv59AJYAbgNNAjsBvgCm/kH+vwEvAaECtwEW/638sf0uARz/iAOlAsD7F/ui+RT9jQCjBUkAAv4u+1D6PwBvBu4H8QDx/XP3h/5fAUID/APj/c/8Avvg/WUBlgWABZ8AdP42/c3+fgO6BHAC0/xs+Wv5GftyBH4FxgHM+qP4af8VA80FlATr///8zvsv+7P5rP+TAa79FvwY/Lz9WQH+AmgD3wLbAL7/SP5L/7IBHQLCAG39Y/uO+iT9ewJ/A7AAqf21/TwA/wFCArMCCQI7Aav+zv0R/rf9fv18+hX91/9bALr/0f9GALT/DwBZAWQCrwBd/rz9cv50/pX/7//cAJsBdgAl/5L/kAESAgACRQFRAd8AAAF7Ak8CDQL9/wz/mABKATkCSAJcAXb/Q/5t/isBEgIBA2oCEQNVAqEAhgCpAFQC7QKZAmYDqAJkAfoAEQHHAjADSgO2ArQBRgFTADEB8AJVA9gDcgPWAskBswGSAkcESwNOApYB1wFMAgkCiwGT/9YABQLgAowD0wIhAqcBfgAoAdsCdANtA6ECKAJMALb/hABWAUYCwQHmAcYBDwGyAu8C4AIGAkkBDwL+AW8CIgJ3AYAADQAfALn/jACwAC4BmAALAHYAMAGpApkClwLUAYMBqQA2//L+7v7i/mv+HP76/Q7+wf6QAGQBHwKtATMBywAhAMv/AP+M/gj+Ef7u/a/9Kv4o/or+R//O/2oAVgCCAIcAvQAMAF3/fv+R/9X/+/95/zX/3/6C/rv+BP4i/k3+1v3w/XP+qf9kAEYAdAByAIsABwCh/4v/5P6U/kn+8f2N/Sz9Yv1+/lL/OABlAP7/xv90/2//Bf/7/lL/iv/C/yr/Ev+y/in+m/4w/rb+h/5i/tv+vf5iAAcB3wAmAeD/vf9Q/0P+6v7w/TP+Wv7W/Xb+Sv4m/67/pP8B/7z+g/4g/wgArf8z//L9MP1c/V7+j/+3AJEAJv87/or9S/6J/zwAYwBI/1/+yv2x/qX/5P8NADD/P/8P/8L+8v7A/qX+e/4//rH+Uf/E/xYAmf9M/wf/JP/B/wEALgA3AJT/Xf+l/7v/VwAfAO//5P+H/4v/k/99/4b/df8q/zr/rv5t/mP+UP6T/tX+Qv/G/yYAHQD8/9D/5f8cAGkAcgBSACQAvf+5/6r/lf+5/8P/VADnAC0BagEoAVABOwH4AMsAcwCiAMoA2QDyALkAjQBRABEADgALABYALAB0AMQATAG3ARIC/gFiAZQAo/9q/0j/hf+0/9H/QgCkAEQBpQGvAVEB6wCdAHUArQDSACkBSAFSAV4BTgFLAT8BMwEXAecAnwBpAF8AewDAAOIADAHZAMsAqQCtANYA3QD3AL4ApwBhAFgAWgBOAEMABAAaABEAPAAxADMAGQD4//j/0//L/6v/xP/V//D//P/o//z/9f8kAAAA/f+j/5T/TP8+/yT/Ef8i/wP/BP/X/u3+7v42/03/bP9v/3b/nP++/8v/n/9R/yT/A//y/tf+lv56/mH+c/6d/sz+Cf8I/yv/Gf8n/yz/B/8V/+P+Bv/p/g3//f7x/ub+yv7d/tD+6f7Z/uD+3f7o/vL+BP8U/x3/Mv9C/1H/Zv92/4L/b/9p/0v/Jv8X/+b+8P65/q7+o/6u/u7+/f40/z7/Qv9M/zX/P/8a/wH/8f7O/tD+xf7M/sf+uP69/rb+wv7F/sT+0P7W/vv+Ff82/0z/Qv9G/zT/Nf85/zP/L/8Y/xb/G/8e/xL/9P7b/sv+1/74/hr/Ov9F/0j/Tf9O/1T/WP9i/1j/X/9T/0//SP9D/zD/IP8S/wn/Gf8i/z7/Sv9c/2T/bv+M/4P/p/+e/7f/xv+8/9b/p/++/5f/kv+G/2v/ff9k/4j/ff+R/5P/kf+W/3n/kP+G/6j/sf/L/87/zv/T/8z/1v/N/8v/xf/E/7r/xP+6/7//t/+6/8D/yv/k/+n/AgDx//f/5//m//X/5f8FAOb/BQD8/wcAEwDu/wAA2P/d/87/x//P/8n/z//Q/+T/6v///wAAEAAVABMAJgAbACIAFQAIAAUA+f8DAP//DAAVACMALAAvADQAKwA2ACcASgBBAFwAZABwAH0AbwCHAGgAcgBeAF0AWgBNAFgAUABeAGUAaQB8AIcAlQCmAKcAtACgAJ4AkwCRAJYAhwCZAIoAoACXAK8AtACxAL4ArwDCALcAxQDEAL4AwAC/AMEAxAC/AL4ArgCwAK0AoACrAKUAqQCsALsAxwDIAMoAvgC1AKUAmQCPAHoAiQB/AKAApAC8ANQAxgDjAMwA3QDWANIA1ADAAMgAwQDBAL0AsQCzAK0ArwCoAKcArgCgAK4AoQChAJ4AngCjAJcAnACJAI4AgACCAHkAgAB+AIMAhACNAJoAlQCeAJMAkwCFAIgAeAB3AG4AZwBlAGEAZwBoAHEAZgB1AGUAewBoAGsAbgBYAGwASQBpAEMATQBEACoAQQAJACUACQAWAA8AAgAXAAMAJAAVABkAGgAUACQAFQArABkAMwAkADYANAAyAEQALQBKADQAQAA8ADsARwA9AEwAQgBGAEoASQBMAEwAUwBWAFMAYQBYAGsAYQBtAGQAYABlAEsAUgAwAEUAJwA4ACgAJwAvACwAQwA7AFYATABgAF4AbABkAHgAaQB8AGsAaQBvAFAAdQA4AHAAMwBeAD8ARgBSADkAaAAsAGwAOgBjAEEASQBLADgAUQA1AEwAPABKAEgAQgBNAEQAUABEAEoARwAyAEQAJAA8ABoAMwAcACkAKwAcAD8AGQBUAB8AVAA1AEIAUgArAFgAFwBTAB4AOgAzACUASgAlAFQAMQBJAD4APABCACsANQAjAC0AJQAnACMAIAAhACcAJQAuACkAKAAsAB4ANgAeADUAIgArACkAIQAyABkANAAUADMAHAApACQAHAAmABEAJAAIABkAAgARAAAACQALAAsADwAGABMACQAaAAgAEwAIABAADgANABQAEwAYABMAHgASABcAEwASAAsACgADAAIABAABAAAAAAABAAEABgAIAAcADQAKABEAEgAdABgAHQAkACAAMgAgAD4AKAA7ADkALQBBACwASgAwAD8ANAAtAEAAKgBDACoAOAA2ADIAPwAxAE0ANgBLAEYASgBZAEYAYgBJAF8ATABXAFYATgBVAEQAVQBCAE8APgBFAEMAPQA+ACoANQAXACkADwAZAA0AAwAKAP3/FQABACIABgAhABYAHQAmABcAMwAKADQAAQAiAAEAAQD9/+P/AQDC/+z/vP/T/7j/tP/C/6L/wv+b/77/ov+1/7T/q//D/6//x/+0/8P/vv+0/8D/qf/A/6D/qf+d/5v/of+O/6L/hP+U/37/hP9//3P/ff9h/3r/XP9y/1n/bP9d/2T/Zf9Y/27/U/94/1n/ff9j/3v/dP9u/4b/ZP+W/2r/mP92/4r/if9+/5n/cf+Y/3T/kP+D/4L/k/98/5n/g/+Z/5H/lv+l/5v/rv+n/67/tv+u/7r/sv+8/7T/q/+z/53/t/+W/6T/nP+S/6P/g/+h/4L/lf+M/4//nP+M/6P/k/+i/6T/nP+r/5z/sP+j/6X/q/+a/7L/lv+x/5j/nv+i/4v/n/9+/5j/dv+J/2//df9t/2r/dP9e/3j/ZP9//2H/g/9m/3j/cv9r/3v/Wv+E/07/ef9O/2b/Wv9P/2j/O/9s/zr/Zf9E/1D/W/9D/2r/Pf9r/0b/Yf9X/1P/a/9I/3f/TP99/17/fP97/3P/iv9q/5X/bv+O/3j/ff+D/3H/h/9r/4D/d/9//4f/fP+O/4H/lv+R/5L/n/+X/6n/nv+2/6j/t//D/8r/zv/V/+b/5//6//n/BQD//w0ABgANAAMACgAGAP//BgD0/wUA8f8EAPD/+P/x/+v/7v/g/+3/2P/h/8z/0f/K/77/vf+s/6//o/+p/6P/rf+r/7H/v//C/9n/1v/q//D/AQAMABIAHwAjADQALgA7ADwAOgBCADkAOQA2ADUAOgAwADMAKQA2AC0AOQA9AD8ATwBMAGgAYAB3AHcAkACPAJoAogCdALUAqgDJALEAzgC3AMoAuQC9AMAAsADIAKsAyACpAMoAsgDFAMAAxgDTAMoA5QDJAOgAygDtANAA4ADbAM8A3wDBAN8AtgDbALgAzQDAALgAxACjAL4AlwCtAIMAhQBxAFQAVAAkAC0AAAAAAOj/zf/J/6r/s/+N/57/f/+B/3T/Y/9k/0L/T/8q/zT/H/8h/yP/Gv8v/yH/O/8r/0b/Pv9N/1j/Wf9u/2D/ev9m/3n/cf9x/3L/V/9n/1H/Xf9G/0r/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UgBSAE8AQQA5AC0AJAAZABoAEwAVABYAEgASABIAEAALAAwABAAAAPn/9//0//D/8P/s/+//7P/w//D/7//w/+z/7P/h/+L/4P/k/+b/7f/4//z/AQAEAAIA/f/y/+n/4v/b/9f/1v/g/+X/8P/1//7/AgAFAAgABAAIAAYABAAFAAQABQD8//j/6//m/9r/0f/B/7n/sP+u/7H/sP+4/8P/zP/Z/+D/7v/y//n/+f/2//P/7//s/+b/5//q//H/+f/+/wQACAAJAAsACwAPAA4AEgASABUAGwAdAB8AHwAcABMADAADAPr/8P/s/+X/4//e/9//3v/k/+b/7P/t/+7/7P/o/+j/3P/a/9T/1f/N/87/0P/O/87/zv/Q/87/0v/U/9f/2P/e/+f/7v/y//T/9v/2//b/9v/1/+7/6//o/+v/7v/x//P/+f/9//3/AwAIAAUACQAEAAEAAgD///n/+P/0//H/9P/1//b/8v/0//L/7v/s/+n/5//l/+L/4v/i/+P/4P/h/+H/2f/T/9H/zf/J/8n/zP/P/8z/0f/Q/9X/2P/d/93/2//d/97/2v/Z/9n/2v/Y/9n/3f/f/9z/4f/h/+D/4P/b/97/2v/h/97/3//i/+L/5P/l/+z/7f/x/+n/7v/r/+n/7v/q/+j/4//k/+D/5P/i/9//4f/h/+P/3f/h/+P/5//n/+3/8v/4//n//v8AAPz/AQD9//7//f///wAA+f/9//z////8////BgAFAAoABwAOABAAEQAUABUAFQAXABgAGQAdAB0AHgAfACAAHwAcACEAHAAeABkAGwAYABwAGQAbABwAGAAZABoAHAAaABsAFQAZABUAGQAVABUAFQAQABAADgARAAwAEAAKAA8ACQANAA0ACQAJAAwADAAKAA0ACgAPAA0AEwARABQAFQAYABUAGwAaABsAIAAgABwAHQAcABwAHwAeAB0AHQAfABoAHQAdAB4AIgAjACQAIgAiACUAJAAlACYAHwAdACEAHQAfAB4AGgAYABoAFwAaABcAGAASABcAEwAUABQADgAPABMAEAAQABEAEgAPAA4ADAAMAAsABwAJAAYABAADAAQABAADAAIAAwAGAAQABQACAAYABAAGAAUABgAFAAYABQACAAMABwAFAAIAAgAEAAYABgAHAAgACQAIAAcAAgAGAAoACgANAAkACwAFAAkABwALAAwACgAIAAwACQAGAAcABQAHAAUABgAFAAcABQAHAAQABwAFAAQABQAFAAQABgAGAAYABAACAAMAAQACAAAAAwD//wEA/v////z/+//6//v/+//8//7/AQABAP///v/9//3//P/+//v//P/6//n//v////r////+/wEABAABAAAA//8AAP//AgABAAYAAAACAAIAAQABAAMABQADAAQAAgADAAIAAQAEAAIAAwACAAIAAwAAAAAA//8CAP//AgADAAAAAQD9/wAA/v8DAAIA/f/+/wMAAgAAAAAA/v//////AAACAAEAAgD8//3/+//9//z/AQAAAAAA/f/+/wAAAQABAAAA/v/+//z//f/+//7////+/wAAAwD//////v8AAP3/AQACAP7////9/////P//////AQADAAIAAQAAAAAAAQABAAMAAAAAAAMAAgACAAIAAwADAP//AQABAP//BAD//wMA//8CAAIA/f8AAAAAAgD+//7/AQABAAAAAQADAAMAAAABAAEAAQABAP////8AAP///v8AAAAAAwACAAMAAQABAAEAAQADAAAAAAD/////AQAAAAAAAwACAAQA//8FAAAAAwABAAIABQABAAEAAQADAAAAAwAAAAQA//8BAAEAAAAAAAEAAwAAAP///v/8//7//f8CAP///v/8/wIAAAD+/wIAAgAHAAAAAwD+////AQADAP3/AgD///3/AAD///3/AQACAP//AAABAAEAAAADAAMAAAABAAIAAgD+/////P8BAP7/AQABAAAAAgAAAAAAAAD/////AAAAAAEAAAAAAP//AAABAAEAAAAAAAIA//8AAP//AAABAAAAAgAAAAQAAwAGAAMA//8AAAMAAwACAAEA/v/+/wAAAQAFAAEAAQD9/wMAAQACAAUA/f8EAAAAAAD/////BAD9/wIAAAAFAAAA///+/////P///////v/7/////f/+//////8BAAEA/v/9//7/AQD+/wAA/P8BAPv/AgAAAP/////7/////f8EAPz/AQD8//3/AQD+/////f8BAP//AAAAAAAAAAABAAAAAAD9/wAAAAABAAEA/v8AAP7/AQD8/wAAAQADAP//AwACAP//AQD9/wAA/f8BAP7/AAD+////+//8/wEA/f8FAP//AwD9//7/AAD///n/AAABAP7/AAABAAIAAAAAAAEA/v8DAP3/BAD+/wAAAgD+//3///8GAP//+//5/wMA/P8AAAEA/P/8/wEA//8BAAEA/////wAAAAD//wIA/v///wAA///+//z//v/8/////f8DAAEAAQD+//3////7////AQAFAAAABAABAAEAAQAAAAEAAgAFAAQAAQABAAIAAgD//wAA/v8AAAAAAQABAAEAAAD+//////8AAP3//v/7/wEA+/8CAP//+v/5/wEA/v/9//3/AAACAAAAAQD+/wEAAAAFAP7/AwD//wMAAgACAAAAAgAEAP///v/9/wMA//8HAAUA//8AAAIABwACAAMA//8AAAMA//8DAAAABAD8/wMA/f8DAAAA/v8CAAIAAQD+/wMA/f8AAP7/AwACAP//AAD9/wIA/P8DAP//AAD9/wEA///+/////v8AAAEAAAD9/wEAAwAGAP//AgD//wAABAACAP//AAADAAAAAQAEAAIAAgD///3/BAD//////P/9//7///8EAAEAAQD//wQAAgADAAEAAgACAAAA//////7/BAABAAYAAAACAP//AwABAAEABgABAAUA/v8EAP3////7/wEA/v8AAAUA/v8EAP//BAD8////AgACAP7/AAADAPz/AwD+//3//f8AAP////8DAP/////6/////P/9//v//f/9////AQAGAP7/AAD7//n////7//z//P////7///8DAAIABAD//wAABQACAAIA/f8EAP///v/+/wQAAgABAAAA/v8BAPr/BAD9/wMAAAACAP3/AgABAAAA/v/+//3/+/8BAP7//v/8/wQAAQABAAEA/P/8/wAA/v8CAAIAAgD//wEAAAD9/wAA+/8BAPv//v/+/wEA///+/wEAAAABAP///////wIA/v8DAPz//v/2/////f8CAP///f///wAA///7/wQAAQAIAAAAAgD///3/BAD///7///8FAP3/AAD7/////f/9/wIA+/8BAP7/AAABAP///v/8//7//f////3/AAD//wAA//8BAAIA/////////f/8//r///////7/+//8//3//f8CAP7/BAD//wEA//8CAPz/AQD+//7/AAAAAAAA/f8CAP//AwACAP//AQD9/wIA/P8CAP//AgABAP7/AgD3////+/8DAAEA/f/+/wQAAQABAAIA/v/9/////v8BAAAABQAAAAAAAAD///////8AAAAA///+//v/AQD9//7/+//8//7//v8GAPv////8////AAD+//3/AQADAAIA/v///wEA/v8BAAAA///8/wEA/P8AAP3/AAD9/wAA/f/9/wEAAAACAP//AwD9/wAA/P/9//7//v8DAP7/AAD9/wUA//8CAAAA/////wIA/v/+////BAD+/wIA+/8BAP7///////7/AQD6/wEA/P8GAPn/AgD+/wAABwACAAAA/P8BAPr/BAAAAP///v/+/////v8CAAAAAAD8/wAA/v8HAPv/BQD9/wAA/v8CAP3///////r////8////+/8AAPz/BAAAAAMAAAABAAAA/f/+/wEAAQD//wMAAwAEAAIA//8AAAIAAgACAAAAAgAAAAIAAgAFAP//AgABAP7/AgD//wEA//8CAAIAAAAAAP//AQD+/wQA//8HAPz/BAD8/wIAAwACAP//AwACAAAA//8DAAEAAgACAAIAAAD+/wAAAwACAAIA/v/+//7//v8DAAAAAAD7/wUA//8CAAMA//8DAP//AwD/////AgAAAAAAAAACAAEA/f/+////AAD//wEABAABAAAAAAABAAIAAwACAAMAAwAEAAEA/////wAAAQABAAEA//8BAP7/AAD8////AwAHAP7/BQD8/wAAAgAFAP//AAAAAPz/AAD+/wAA+/8BAP7///8AAP7/BgAAAAQAAAADAP3/AwACAAAAAQD7/wMA+f8GAAAAAAD9/wEAAAD6/wEA/f8GAPv/BAD6/wAABAADAAIA/v8BAP7/AAAAAAAAAQD///z/+//6//7///8CAAAA/f/+/wAAAQD//wIAAQAFAP//AgD+/wEAAgD///////8HAAAA/f/9/wAAAAAAAAEA+v/7/wIAAgADAAAA+v/+//3//v/+//7////5////+/8AAP3//v/+/wAA/v/6/////P8BAP//AQD///7//P/7/////v8CAP7//////wIAAAD//wAA/f/7/////P8CAP7//v/9/wUAAAADAAIA/P//////BAD//wEAAAD///z//v////3//f/+/wAA//8BAAEA+v/+//r/AAD9//3////4/wAA+f8EAAEAAQD/////AgD6//7//v////7//f8EAP7/AAD5/wMA+//+//3///8EAP3/AQD4/wEA/v8CAP3/AQADAPv/AAD+//////8BAAQA/f8AAAEAAgABAP/////6////+/8CAAEABAD+/wMA/f8AAAAAAQADAAAA///8/wAAAAADAP7////9//z/AwACAP7/AQAAAP////8BAAAAAQAAAAAABQADAAAAAAD//wEAAQAEAAIAAQD//wIAAgACAAIAAgABAPz/AQD//wAAAAD//wAAAQAEAP7/AQD8/wEAAgAEAAIAAwABAP///f8AAP//AAAEAAMAAQD+/wMAAQADAAMAAgAEAAIAAQABAP//AQD8/wEAAQABAAIAAAAFAAEAAQD//wIABgACAAIAAQAEAAAABAADAAEABgACAAUA/P8GAP//BgD+/wEAAQD//wAAAQAGAAAABAD+/wMAAQAEAAUA+//9/wQAAwAFAAIAAQD9/wMA+/8AAP//AQD+/wUAAwADAAIA/v8AAAQAAgAFAAcABQAFAAQABwAGAAQAAwACAAQAAwAFAAMABQADAAIAAgD//wMAAQAEAAEAAQD9//3/AgABAAAA/v8DAAAAAAACAP7/AwD+/wQAAgADAAIAAgAFAAIAAgACAAAAAQABAP//BQABAAAAAAABAAAA+P/+/wIABAAAAAIA/P/8//7///8DAAIA/////wEA/P8AAP3/AAD5/wAA+/8AAP3//f/9/wAA/v/3//3/+//+//j/+//6//r/+v/1//z/+P8BAPv/+f/2////+f/9//z/+//8//n/+v/4//n/+//6//3//P/8//n//P/8//v/9//3//v/9//9//T//f/1//j/+P/2//f/+P8AAPb//v/0//n/9//5//n/+P/8//f/+P/0//j/+v/6//r/9//2//P/+P/8//T/+f/y//b/9f/4//b/9//3//b/+f/4//n/9//5//n/+//7//v/+v/9//r/+f/5//3//f/6//r//P////j//f/2//z//P/+//j/9//8//r//f/6//7/+v/6//b/+f/5//n/+v/7//3/+//8//z/AAD6//7/+P/7//v/+//+//3/AQD5/wAA/f8DAAEA+f///wAA///8/wAAAAAAAAMAAwAAAAEAAgABAP3////9//z//P/+//3/AQAAAAIA/f8BAAMAAAABAPz/AAD8/wEAAgAEAAMAAAD+//7//v/9/wEAAAAAAP7//P/+//7//v////3////9//7/AQACAP3/AAD+//3/AQACAAAA///9//z//P////z//v/3//z//v8CAPj//v/8//v//v/9/wAA+P/+//j//f/8//v//v/5////+v8CAPb/AQD5/wAA+v///////P8BAPn////4//7/+v8CAP7/+P/2////+v8AAP7/+//4//7//P/6////+v8BAP3//v/9//7/AwADAP//AgABAAMA/f8EAPv/AwD//wQAAgD//wQA/v8IAAIABQAAAAkAAwAHAAQAAgAEAAQACgAGAAkABgAGAAsABQAKAAYACQAGAAkABgAIAAcACQAHAAwABwANAA4ADAAPAAwADgAIAA8ACwAQAAoADAARAAkAEgAIABAACAAMAAwACQANAAsADQAGAAsABgAMAAcACgALAAsACgAIAA8ADAARAA0ADAAKAAwADwAOAA8ACQAIABIACAARAAoAEwAGABMABgANAAwACQAQAAcAEwAAAA8ACQAQAAoADAAPAAUADQAHAAoACAAHAAoABAAJAAcACAAGAAMACAAEAAgABgAJAAoADAAMAAYACAAEAAkAAgANAAQACQAHAAcABgD//wcA//8NAP7/CwAAAAcAAAD9/wUAAAAGAPn/BwD+/wkAAQAJAAEAAQAEAP//BgD8/wYAAAAHAAIAAAAGAAEACAD+/wYABQAGAAAABAABAP///P8DAP7/AwAAAAIA/v/9/wYA/f8IAP7//v/8/wAA/P/6/////P/7//r/+v/+//v//f/7/////P/8//7/+P/+//j//f/6//j//v/3/wAA+P////f/9v/3//r/+v/3////+f/8//b/+//4//v//P/6//v/9f/7//j//f/6//z/+f/6//j/+f/7//j/+//4//n//P/7//n//f/5//r/+v/+//n/+v/6//r//P/5//r/9//7//r/9//5//v/+//9//r/+v/4//n/+//4//v/+P/7//b/+f/4//z/+f/8//v/+//7//n//P/6//v/+f/4//n//f////r//P/6//v/+//9//r////8//3//P/8//v/+P/8//v//P/7//r//f/6//7//f8AAPr/AAD7//v//f/6//v/+P8BAPz//f/5////+//7//r/+//+//3/AgAAAAAA/P/+//z//f/9/wAA+P/8//v//f/9/////P/+//7//f/+//v////6/wAA+/8BAP7/AAABAAEAAQD8/wEAAAAAAP7//f8AAP//AgACAAIAAAAAAAMAAAADAP//AgAAAAEAAQAEAAAAAwABAAEA//////////8AAAMAAQACAAIA//8BAP7/AwD+/wEA/v/+/////v8BAP7/AgAAAAAA/v///wEAAQAFAAMAAQABAAIAAgADAAYAAwAFAAUABQAFAAMABAADAAQABgAGAAUABAADAAUABgAIAAYAAwAEAAYABwAEAAUABgADAAUAAwAGAAUABAAGAAQAAwAAAAMA//8DAAEAAgADAP3/BAD+//3//v8AAAEA/P////7//v/8//7/+v/8//3//P/9//r//v/9/////v8AAAAA/P/7//3//f/+//7//v/6/wIA/P8EAP///f/9/wIAAQD+/wQA+/8DAAEABQABAAEABQD+/wMA/f8GAP7/AQD7/wIA/v/+/wIA/v8CAP//AgD+/wEA/P8AAP///f/9//v//P/6//3//P/////////8//7//f/+//3/+v/2//7/9v/9//j/+v/2//n/+P/4//v/+//7//r/+v/6//r/+v/8//n////5//v/+//9//r/+v/9//j/AQD9//z/+//6/wIA/f8GAP3/AwD7/wAA/v8CAAIAAAAEAP7/CAD+/wUA+f8GAP//AgABAP//BAD4/wQA+f8HAPf/AwD8//3////4/wIA9v8GAPj/AAD6/wIA+//9////+/8BAPv/BAD6/wIA+/8CAPv//v/8//z//v/4/wAA9/8HAPz/AQD5/wEA/f/+/wEA+P8BAPn/AQD7/wMAAwACAAEA/v8CAPz/AgD9//7/AgACAAUA/v8FAAIABgADAAMAAAD9/wIA+/8CAP3/AwD+/wEA/v/8/////v8BAPj//f/6//7/AQABAAIA/v8AAP7/+f/8//z//v/7//v////8//3//f8AAPz/+f/5//n/+v/5//z/+//6/wAA/P/+//r//P/+//n/AgD5/wEA//8CAP7/+v8BAPr/AQD2/wEA/P8CAAIA+v////r/AQD5/////f/+//7//P////z////8/////P////3//v/8//7//P/9/////f8AAP3//f/5//3//v/+//z//f/7//7//f8BAPn//f/6//n////7//z//P/9//z/+v/7//7/+//9//r//v/6//3/+/8AAAAA/P////z/AgD8/wAA+v/+////AgD///7/+v/7//z//f///wAA///9/wAA//8BAAAA/v/9/wMA/v8BAP//AwD8/wIA//8BAAMA/v8GAPz/BgD9/wMA///9/wAA+/8GAP7/BQAAAAUA/////wMA//8GAPz/BwD8/wUA//8EAAAA//8HAPv/BgD4/wUA/v8DAAEA+v8BAPz/AQD9/wEAAAAAAAEAAQACAAMA//8DAAYAAAAEAP//BgD9/wQA//8FAAEAAwAEAAIABQD+/wUA//8HAAEABwAEAAUAAQD+/wQA/v8FAAEABQD//wUAAAABAAQAAwAEAAMABAAEAAEAAgD+/wAA/v8BAP7/AQAAAAQABAADAAcAAAAGAAIABQADAAQAAwAEAP7///8BAP///v/8/wAA/f8CAP7//v/7/wEA/f/8/wAA+/8BAPr/AwD7///////9/wAA+v8CAPr//f/4//z//v/7/wAA9//9//v/AQABAAIAAQAAAAMAAAACAAAABgAAAAcAAwAEAAIA//8EAP7/BQD9/wYA//8BAAIA//8IAAEACgABAAQAAgACAAUAAgAJAP//CQAAAAQAAgAFAAUAAQAHAAMABQAAAAcAAAAEAAIAAwAEAAIABAD//wMAAQABAAEABAAEAAIA/v///wEA//8AAP//AgAAAAIAAQAEAAEAAgADAAMAAgACAAYABAAGAAMABwAEAAcABwAIAAkACAALAAgACwALAAkACwAKAAsACwALAAsACAAMAAkACwAJAAoACwAKAA4ACgAMAAoACAAIAAcACgAJAAcABwAIAAcABQAJAAQABgACAAQABQAFAAMAAQADAP7/AwD+/wEA/v/+//7//P8BAPz/AQD4//r/9//3//X/9//4//b//P/1//v/9v/6//j/9//7//f//P/4//v/+v/6//n/9//7//r/+v/7//7/+f/5//3//v/9//r/+//6//z/+v/7//r/+f/5//n//P/6//v/9//3//r/9v/3//T/9f/1//b/9v/4//X/8//y//H/9f/w/+7/8P/u//D/8P/x//D/8v/v//L/8f/z//T/8//1//H/8f/v//P/8P/z//P/8f/y//L/8//0//P/9P/y//P/9f/z//T/9//3//f/+P/1//b/9//5//j/+f/4//r/+v////b/+f/0//X/+v/5//7//P/9//n/AQD+//r////7/wEAAAAMAAIACwADAAsACwALAAgAAwAJAAIA///9/wEAAQAIAAwACwAYAB4ADgAeABsAJAAPAPf/CgD9/zYAFwAMACkAFgAwAAIA9f/+//X//v8FAOj/GAD+/7z/',
                  format: ChatCompletionMessageInputAudioFormat.wav,
                ),
              ),
            ]),
          ),
        ],
      );
      final res1 = await client.createChatCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;
      expect(choice1.message.content, isNull);
      expect(choice1.message.audio, isNotNull);
      expect(choice1.message.audio!.id, isNotEmpty);
      expect(choice1.message.audio!.expiresAt, greaterThan(0));
      expect(choice1.message.audio!.transcript, contains('2'));
      expect(choice1.message.audio!.data, isNotEmpty);
    });

    test('Test predicted outputs feature', () async {
      const codeContent = '''
class User {
  firstName: string = "";
  lastName: string = "";
  username: string = "";
}

export default User;''';
      const request = CreateChatCompletionRequest(
        model: ChatCompletionModel.model(
          ChatCompletionModels.gpt4o,
        ),
        messages: [
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(
              'Replace the username property with an email property. '
              'Respond only with code, and with no markdown formatting.',
            ),
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(codeContent),
          ),
        ],
        prediction: PredictionContent(
          content: PredictionContentContent.text(codeContent),
        ),
      );
      final res1 = await client.createChatCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;
      expect(choice1.message.content, contains('email: string ='));
      expect(choice1.message.content, isNot(contains('username: string =')));
      expect(
        res1.usage?.completionTokensDetails?.acceptedPredictionTokens,
        greaterThan(0),
      );
      expect(
        res1.usage?.completionTokensDetails?.rejectedPredictionTokens,
        greaterThan(0),
      );
    });
  });
}
