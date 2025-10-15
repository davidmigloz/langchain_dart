// ignore_for_file: avoid_print
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('GitHub Models tests', () {
    late ChatOpenAI chatModel;

    setUp(() {
      chatModel = ChatOpenAI(
        apiKey: Platform.environment['GITHUB_TOKEN'],
        baseUrl: 'https://models.inference.ai.azure.com',
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test invoke GitHub Models API with different models', () async {
      final models = [
        'gpt-4o',
        'AI21-Jamba-Instruct',
        'meta-llama-3.1-405b-instruct',
        'Mistral-large',
        'Phi-3.5-mini-instruct',
      ];
      for (final model in models) {
        print('Testing model: $model');
        final res = await chatModel.invoke(
          PromptValue.string(
            'List the numbers from 1 to 9 in order. '
            'Output ONLY the numbers in one line without any spaces or commas. '
            'NUMBERS:',
          ),
          options: ChatOpenAIOptions(
            model: model,
            temperature: 0,
          ),
        );

        expect(res.id, isNotEmpty);
        expect(
          res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
        expect(res.metadata, isNotEmpty, reason: model);
        expect(res.metadata['created'], greaterThan(0), reason: model);
        expect(res.metadata['model'], isNotEmpty, reason: model);
      }
    });

    test('Test stream GitHub Models API with different models', () async {
      final models = [
        'gpt-4o',
        'AI21-Jamba-Instruct',
        'meta-llama-3.1-405b-instruct',
        'Phi-3.5-mini-instruct',
      ];
      for (final model in models) {
        print('Testing model: $model');
        final stream = chatModel.stream(
          PromptValue.string(
            'List the numbers from 1 to 9 in order. '
            'Output ONLY the numbers in one line without any spaces or commas. '
            'NUMBERS:',
          ),
          options: ChatOpenAIOptions(
            model: model,
            temperature: 0,
          ),
        );

        var content = '';
        var count = 0;
        await for (final res in stream) {
          content += res.output.content.replaceAll(RegExp(r'[\s\n]'), '');
          count++;
        }
        expect(count, greaterThan(1), reason: model);
        expect(content, contains('123456789'), reason: model);
      }
    });

    test('Test countTokens', () async {
      final models = [
        'gpt-4o',
        'AI21-Jamba-Instruct',
        'meta-llama-3.1-405b-instruct',
        'Mistral-large',
        'Phi-3.5-mini-instruct',
      ];
      for (final model in models) {
        print('Testing model: $model');
        const text = 'Hello, how are you?';

        final numTokens = await chatModel.countTokens(
          PromptValue.chat([ChatMessage.humanText(text)]),
          options: ChatOpenAIOptions(model: model),
        );
        expect(numTokens, 13, reason: model);
      }
    });

    test(
      'Test tool calling',
      timeout: const Timeout(Duration(minutes: 1)),
      () async {
        const tool = ToolSpec(
          name: 'get_current_weather',
          description: 'Get the current weather in a given location',
          inputJsonSchema: {
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

        final humanMessage = ChatMessage.humanText(
          'What’s the weather like in Boston right now?',
        );
        final res1 = await chatModel.invoke(
          PromptValue.chat([humanMessage]),
          options: const ChatOpenAIOptions(
            model: 'gpt-4o',
            tools: [tool],
          ),
        );

        final aiMessage1 = res1.output;

        expect(aiMessage1.content, isEmpty);
        expect(aiMessage1.toolCalls, isNotEmpty);
        final toolCall = aiMessage1.toolCalls.first;

        expect(toolCall.name, tool.name);
        expect(toolCall.arguments.containsKey('location'), isTrue);
        expect(toolCall.arguments['location'], contains('Boston'));

        final functionResult = {
          'temperature': '22',
          'unit': 'celsius',
          'description': 'Sunny',
        };
        final functionMessage = ChatMessage.tool(
          toolCallId: toolCall.id,
          content: json.encode(functionResult),
        );

        final res2 = await chatModel.invoke(
          PromptValue.chat([humanMessage, aiMessage1, functionMessage]),
          options: const ChatOpenAIOptions(
            model: 'gpt-4o',
            tools: [tool],
          ),
        );

        final aiMessage2 = res2.output;

        expect(aiMessage2.toolCalls, isEmpty);
        expect(aiMessage2.content, contains('22'));
      },
    );
  });
}
