@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOpenAIResponses tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
    const defaultModel = 'gpt-4o-mini';

    late ChatOpenAIResponses chatModel;

    setUp(() {
      chatModel = ChatOpenAIResponses(
        apiKey: openaiApiKey,
        defaultOptions: const ChatOpenAIResponsesOptions(
          model: defaultModel,
          maxOutputTokens: 100,
        ),
      );
    });

    tearDown(() {
      chatModel.close();
    });

    group('invoke', () {
      test('should return a text response', () async {
        final res = await chatModel.invoke(
          PromptValue.chat([ChatMessage.humanText('Say "hi"')]),
        );
        expect(res.output.content, isNotEmpty);
        expect(res.id, isNotEmpty);
        expect(res.finishReason, FinishReason.stop);
        expect(res.metadata, containsPair('model', contains('gpt-4o-mini')));
      });

      test('should support system messages', () async {
        final res = await chatModel.invoke(
          PromptValue.chat([
            ChatMessage.system('You always respond with exactly "OK".'),
            ChatMessage.humanText('Hello'),
          ]),
        );
        expect(res.output.content.toLowerCase(), contains('ok'));
      });
    });

    group('streaming', () {
      test('should stream text deltas', () async {
        final stream = chatModel.stream(
          PromptValue.chat([ChatMessage.humanText('Say "hello world"')]),
        );

        ChatResult? result;
        var count = 0;
        await for (final res in stream) {
          result = result?.concat(res) ?? res;
          count++;
        }

        expect(count, greaterThan(1));
        expect(result, isNotNull);
        expect(result!.output.content, isNotEmpty);
        expect(result.finishReason, FinishReason.stop);
      });
    });

    group('tool calling', () {
      const weatherTool = ToolSpec(
        name: 'get_weather',
        description: 'Get the current weather for a location.',
        inputJsonSchema: {
          'type': 'object',
          'properties': {
            'location': {
              'type': 'string',
              'description': 'The city name',
            },
          },
          'required': ['location'],
        },
      );

      test('should return tool calls when tools are provided', () async {
        final model = ChatOpenAIResponses(
          apiKey: openaiApiKey,
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: defaultModel,
            tools: [weatherTool],
          ),
        );

        final res = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('What is the weather in Barcelona?'),
          ]),
        );

        expect(res.output.toolCalls, isNotEmpty);
        final toolCall = res.output.toolCalls.first;
        expect(toolCall.name, 'get_weather');
        expect(toolCall.arguments, containsPair('location', isNotEmpty));

        model.close();
      });

      test('should support multi-turn tool calling', () async {
        final model = ChatOpenAIResponses(
          apiKey: openaiApiKey,
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: defaultModel,
            tools: [weatherTool],
            maxOutputTokens: 200,
          ),
        );

        // Step 1: model calls the tool
        final res1 = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('What is the weather in Barcelona?'),
          ]),
        );
        expect(res1.output.toolCalls, isNotEmpty);
        final toolCall = res1.output.toolCalls.first;

        // Step 2: provide tool result and get final answer
        final res2 = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('What is the weather in Barcelona?'),
            ChatMessage.ai(
              res1.output.content,
              toolCalls: res1.output.toolCalls,
            ),
            ChatMessage.tool(
              toolCallId: toolCall.id,
              content: '{"temperature": 22, "condition": "sunny"}',
            ),
          ]),
        );
        expect(res2.output.content, isNotEmpty);

        model.close();
      });
    });

    group('tool calling streaming', () {
      const weatherTool = ToolSpec(
        name: 'get_weather',
        description: 'Get the current weather for a location.',
        inputJsonSchema: {
          'type': 'object',
          'properties': {
            'location': {
              'type': 'string',
              'description': 'The city name',
            },
          },
          'required': ['location'],
        },
      );

      test('should stream tool calls', () async {
        final model = ChatOpenAIResponses(
          apiKey: openaiApiKey,
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: defaultModel,
            tools: [weatherTool],
          ),
        );

        final stream = model.stream(
          PromptValue.chat([
            ChatMessage.humanText('What is the weather in Barcelona?'),
          ]),
        );

        ChatResult? result;
        var count = 0;
        await for (final res in stream) {
          result = result?.concat(res) ?? res;
          count++;
        }

        expect(count, greaterThan(1));
        expect(result, isNotNull);
        expect(result!.output.toolCalls, isNotEmpty);
        final toolCall = result.output.toolCalls.first;
        expect(toolCall.name, 'get_weather');
        expect(toolCall.arguments, containsPair('location', isNotEmpty));

        model.close();
      });
    });

    group('structured output', () {
      test('should return JSON matching schema', () async {
        final model = ChatOpenAIResponses(
          apiKey: openaiApiKey,
          defaultOptions: ChatOpenAIResponsesOptions(
            model: defaultModel,
            responseFormat: ChatOpenAIResponsesResponseFormat.jsonSchema(
              name: 'city_info',
              schema: const {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                  'country': {'type': 'string'},
                },
                'required': ['name', 'country'],
                'additionalProperties': false,
              },
              strict: true,
            ),
          ),
        );

        final res = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('Tell me about Barcelona.'),
          ]),
        );

        expect(res.output.content, isNotEmpty);
        // Should be valid JSON
        expect(res.output.content, contains('"name"'));
        expect(res.output.content, contains('"country"'));

        model.close();
      });
    });

    group('multi-turn with previousResponseId', () {
      test('should maintain context across turns', () async {
        final model = ChatOpenAIResponses(
          apiKey: openaiApiKey,
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: defaultModel,
            maxOutputTokens: 50,
            store: true,
          ),
        );

        final res1 = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('My name is LangChainDartTestUser.'),
          ]),
        );
        expect(res1.id, isNotEmpty);

        final res2 = await model.invoke(
          PromptValue.chat([
            ChatMessage.humanText('What is my name?'),
          ]),
          options: ChatOpenAIResponsesOptions(
            previousResponseId: res1.id,
          ),
        );
        expect(
          res2.output.content.toLowerCase(),
          contains('langchaindart'),
        );

        model.close();
      });
    });
  });
}
