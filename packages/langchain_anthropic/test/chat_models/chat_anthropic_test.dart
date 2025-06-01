// ignore_for_file: avoid_redundant_argument_values, avoid_print
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

void main() {
  group('ChatAnthropic tests', () {
    const defaultModel = 'claude-3-5-sonnet-20241022';

    late ChatAnthropic chatModel;

    setUp(() {
      chatModel = ChatAnthropic(
        apiKey: Platform.environment['ANTHROPIC_API_KEY'],
        defaultOptions: const ChatAnthropicOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test Text-only input with different models', () async {
      final models = [
        'claude-3-5-sonnet-20241022',
        'claude-3-haiku-20240307',
        'claude-3-opus-20240229',
        'claude-3-sonnet-20240229',
      ];
      for (final model in models) {
        print('Testing model: $model');
        final res = await chatModel.invoke(
          PromptValue.string(
            'List the numbers from 1 to 9 in order '
            'without any spaces, commas or additional explanations.',
          ),
          options: ChatAnthropicOptions(
            model: model,
            temperature: 0,
          ),
        );
        expect(res.id, isNotEmpty);
        expect(res.finishReason, isNot(FinishReason.unspecified));
        expect(res.metadata['model'], contains(model.toLowerCase()));
        expect(
          res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
        await Future<void>.delayed(const Duration(seconds: 5));
      }
    });

    test('Text-and-image input', () async {
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
      );

      expect(res.output.content.toLowerCase(), contains('apple'));
    });

    test('Test stop sequence', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatAnthropicOptions(
          model: defaultModel,
          stopSequences: ['4'],
        ),
      );
      final text = res.output.content;
      expect(text, contains('123'));
      expect(text, isNot(contains('456789')));
      expect(res.finishReason, FinishReason.stop);
    });

    test('Test max tokens', () async {
      final res = await chatModel.invoke(
        PromptValue.string('Tell me a joke'),
        options: const ChatAnthropicOptions(
          model: defaultModel,
          maxTokens: 10,
        ),
      );
      expect(res.output.content.length, lessThan(50));
      expect(res.finishReason, FinishReason.length);
    });

    test('Test Multi-turn conversations', () async {
      final prompt = PromptValue.chat([
        ChatMessage.humanText(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        ChatMessage.ai('123456789'),
        ChatMessage.humanText(
          'Remove the number 4 from the list',
        ),
      ]);
      final res = await chatModel.invoke(
        prompt,
        options: const ChatAnthropicOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      expect(
        res.output.content,
        contains('12356789'),
      );
    });

    test('Test streaming', () async {
      final stream = chatModel.stream(
        PromptValue.string(
          'List the numbers from 1 to 100 in order '
          'without any spaces, commas or additional explanations.',
        ),
      );

      var content = '';
      var count = 0;
      await for (final res in stream) {
        content += res.output.content;
        count++;
      }
      expect(count, greaterThan(1));
      expect(content, contains('123456789'));
    });

    test('Test tool calling', timeout: const Timeout(Duration(minutes: 1)),
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
      final model = chatModel.bind(
        const ChatAnthropicOptions(
          model: defaultModel,
          tools: [tool],
        ),
      );

      final humanMessage = ChatMessage.humanText(
        "What's the weather like in Boston and Madrid right now in celsius?",
      );
      final res1 = await model.invoke(PromptValue.chat([humanMessage]));

      final aiMessage1 = res1.output;
      expect(aiMessage1.toolCalls, hasLength(2));

      final toolCall1 = aiMessage1.toolCalls.first;
      expect(toolCall1.name, tool.name);
      expect(toolCall1.arguments.containsKey('location'), isTrue);
      expect(toolCall1.arguments['location'], contains('Boston'));
      expect(toolCall1.arguments['unit'], 'celsius');

      final toolCall2 = aiMessage1.toolCalls.last;
      expect(toolCall2.name, tool.name);
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
    });

    test('Test streaming with tools',
        timeout: const Timeout(Duration(minutes: 5)), () async {
      const tool = ToolSpec(
        name: 'joke',
        description: 'A joke',
        inputJsonSchema: {
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

      final promptTemplate = ChatPromptTemplate.fromTemplate(
        'tell me a long joke about {foo}',
      );
      final chat = chatModel.bind(
        ChatAnthropicOptions(
          model: defaultModel,
          tools: const [tool],
          toolChoice: ChatToolChoice.forced(name: 'joke'),
        ),
      );
      final jsonOutputParser = ToolsOutputParser();

      final chain = promptTemplate.pipe(chat).pipe(jsonOutputParser);

      final stream = chain.stream({'foo': 'bears'});

      List<ParsedToolCall> lastResult = [];
      var count = 0;
      await for (final res in stream) {
        print(res);
        lastResult = res;
        count++;
      }

      expect(count, greaterThan(1));
      expect(lastResult, hasLength(1));
      final toolCall = lastResult.first;
      expect(toolCall.arguments['setup'], isNotEmpty);
      expect(toolCall.arguments['punchline'], isNotEmpty);
    });
  });
}
