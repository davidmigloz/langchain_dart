import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group(
    'ChatOllamaTools tests',
    skip: Platform.environment.containsKey('CI'),
    () {
      const defaultModel = 'gemma2';
      late ChatOllamaTools model;
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

      setUp(() async {
        model = ChatOllamaTools(
          defaultOptions: const ChatOllamaToolsOptions(
            options: ChatOllamaOptions(
              model: defaultModel,
              keepAlive: 2,
            ),
            tools: [tool1, tool2],
          ),
        );
      });

      tearDown(() {
        model.close();
      });

      test('Test single tool call', () async {
        final res = await model.invoke(
          PromptValue.string("What's the weather in Vellore, India?"),
        );
        expect(res.output.toolCalls, hasLength(1));
        final toolCall = res.output.toolCalls.first;
        expect(toolCall.name, 'get_current_weather');
        expect(toolCall.argumentsRaw, isNotEmpty);
        expect(toolCall.arguments, isNotEmpty);
        expect(toolCall.arguments['location'], contains('Vellore'));
        expect(toolCall.arguments['unit'], 'celsius');
        expect(res.finishReason, FinishReason.stop);
      });

      test('Test multi tool call', () async {
        final res = await model.invoke(
          PromptValue.string(
            "What's the weather in Vellore, India and in Barcelona, Spain?",
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
        final res = await model.invoke(
          PromptValue.string("What's the weather in Vellore, India?"),
          options: const ChatOllamaToolsOptions(
            options: ChatOllamaOptions(model: defaultModel),
            tools: [tool1],
            toolChoice: ChatToolChoice.none,
          ),
        );
        expect(res.output.toolCalls, isEmpty);
        expect(res.output.content, isNotEmpty);
      });

      test('Test ChatToolChoice.forced', () async {
        final res = await model.invoke(
          PromptValue.string("What's the weather in Vellore, India?"),
          options: ChatOllamaToolsOptions(
            options: const ChatOllamaOptions(model: defaultModel),
            tools: const [tool1, tool2],
            toolChoice: ChatToolChoice.forced(name: tool2.name),
          ),
        );
        expect(res.output.toolCalls, hasLength(1));
        final toolCall = res.output.toolCalls.first;
        expect(toolCall.name, tool2.name);
      });

      test(
        'Should throw exception if model did not respond in right JSON string format',
        () async {
          const toolOptions = ChatOllamaToolsOptions(
            options: ChatOllamaOptions(model: defaultModel),
            tools: [tool1],
            toolsSystemPromptTemplate:
                'You have access to the following tools: {tools} '
                'You must always select one of the above tools '
                'and respond in plain text.',
          );

          expect(
            () async => model.invoke(
              PromptValue.string("What's the weather in Vellore, India?"),
              options: toolOptions,
            ),
            throwsException,
          );
        },
      );

      test(
          'Should return content if no other tools should be called for a given query',
          () async {
        const toolOptions = ChatOllamaToolsOptions(
          options: ChatOllamaOptions(model: defaultModel),
          tools: [],
        );
        final res = await model.invoke(
          PromptValue.string('Do you know the weather in Vellore, India?'),
          options: toolOptions,
        );
        expect(res.output.toolCalls, isEmpty);
        expect(res.output.content, isNotEmpty);
      });

      test(
        'Should throw error if toolSystemPromptTemplate not in right format',
        () async {
          const toolOptions = ChatOllamaToolsOptions(
            options: ChatOllamaOptions(model: defaultModel),
            toolsSystemPromptTemplate:
                'You have access to the following tools: tools} '
                'You must always select one of the above tools',
          );
          expect(
            () async => model.invoke(
              PromptValue.string("What's the weather in Vellore, India?"),
              options: toolOptions,
            ),
            throwsException,
          );
        },
      );

      test('Test ChatOllamaToolsOptions', () async {
        const toolOptions = ChatOllamaToolsOptions(
          options: ChatOllamaOptions(
            model: defaultModel,
          ),
          tools: [tool1],
          toolsSystemPromptTemplate: 'toolSystemPromptTemplate',
        );

        expect(toolOptions.options.model, defaultModel);
        expect(
          toolOptions.toolsSystemPromptTemplate,
          'toolSystemPromptTemplate',
        );
        expect(toolOptions.tools![0], tool1);
      });
    },
  );
}
