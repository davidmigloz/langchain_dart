// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('ChatGoogleGenerativeAI tests', () {
    const defaultModel = 'gemini-2.5-flash';

    late ChatGoogleGenerativeAI chatModel;

    setUp(() {
      chatModel = ChatGoogleGenerativeAI(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
        defaultOptions: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    test('Test Text-only input', () async {
      const models = [
        'gemini-2.5-pro',
        'gemini-2.5-flash',
        'gemini-2.5-flash-lite',
      ];
      for (final model in models) {
        final res = await chatModel.invoke(
          PromptValue.string(
            'List the numbers from 1 to 9 in order '
            'without any spaces, commas or additional explanations.',
          ),
          options: ChatGoogleGenerativeAIOptions(
            model: model,
            temperature: 0,
          ),
        );
        expect(res.id, isNotEmpty);
        expect(res.finishReason, isNot(FinishReason.unspecified));
        expect(res.metadata['model'], startsWith(model));
        expect(res.metadata['block_reason'], isNull);
        expect(
          res.output.content.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
      }
    });

    test('Test models prefix', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'List the numbers from 1 to 9 in order '
          'without any spaces, commas or additional explanations.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          temperature: 0,
        ),
      );
      expect(res.output.content, isNotEmpty);
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
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          stopSequences: ['4'],
        ),
      );
      final text = res.output.content;
      expect(text, contains('123'));
      expect(text, isNot(contains('456789')));
    });

    test('Test max tokens', () async {
      final res = await chatModel.invoke(
        PromptValue.string('Tell me a joke'),
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          maxOutputTokens: 2,
        ),
      );
      expect(res.output.content.length, lessThan(20));
      expect(res.finishReason, FinishReason.length);
    });

    test('Test Multi-turn conversations with gemini-pro', () async {
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
        options: const ChatGoogleGenerativeAIOptions(
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
              'description': 'The city and country, e.g. San Francisco, US',
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
        const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          tools: [tool],
        ),
      );

      final humanMessage = ChatMessage.humanText(
        'What’s the weather like in Boston, US and Madrid, Spain in Celsius?',
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

    test('Test code execution', () async {
      final res = await chatModel.invoke(
        PromptValue.string(
          'Calculate the fibonacci sequence up to 10 terms and output the last one.',
        ),
        options: const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          enableCodeExecution: true,
        ),
      );
      final text = res.output.content;
      expect(text, contains('34'));
      expect(res.metadata['executable_code'], isNotNull);
      expect(res.metadata['code_execution_result'], isNotNull);
    });

    // https://github.com/davidmigloz/langchain_dart/issues/753
    test('Batches sequential tool responses into a single turn', () async {
      const tool = ToolSpec(
        name: 'add',
        description: 'sum of `a` and `b`: result = `a` + `b`',
        inputJsonSchema: {
          'type': 'object',
          'properties': {
            'a': {'type': 'integer'},
            'b': {'type': 'integer'},
          },
          'required': ['a', 'b'],
        },
      );

      final model = chatModel.bind(
        const ChatGoogleGenerativeAIOptions(
          model: defaultModel,
          tools: [tool],
          temperature: 0,
        ),
      );

      // Encourage Gemini to emit both function calls in a single model turn
      final humanMessage = ChatMessage.humanText(
        'Compute 1+2 and 5+8 in one go using the `add` tool only. '
        'Do not produce the final answer until tool results are provided.',
      );

      final res1 = await model.invoke(PromptValue.chat([humanMessage]));
      final aiMessage1 = res1.output;

      // The model should request two tool calls in the same turn.
      expect(aiMessage1.toolCalls, hasLength(2));
      for (final call in aiMessage1.toolCalls) {
        expect(call.name, tool.name);
        expect(call.arguments.containsKey('a'), isTrue);
        expect(call.arguments.containsKey('b'), isTrue);
      }

      // Provide two consecutive ToolChatMessages (these will be batched by the mapper)
      final functionMessages = <ChatMessage>[];
      for (final call in aiMessage1.toolCalls) {
        final a = call.arguments['a'] as int;
        final b = call.arguments['b'] as int;
        final result = a + b;
        functionMessages.add(
          ChatMessage.tool(
            toolCallId: call.id,
            content: json.encode({'result': result}),
          ),
        );
      }

      // If batching works, a single functionResponses turn will be sent and this call succeeds
      final res2 = await model.invoke(
        PromptValue.chat([
          humanMessage,
          aiMessage1,
          ...functionMessages,
        ]),
      );

      final aiMessage2 = res2.output;
      expect(aiMessage2.toolCalls, isEmpty);
      // The final answer should incorporate both tool results: 3 and 13.
      expect(aiMessage2.content, contains('3'));
      expect(aiMessage2.content, contains('13'));
    });
  });
}
