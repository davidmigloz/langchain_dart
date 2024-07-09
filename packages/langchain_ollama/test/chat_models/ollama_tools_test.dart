import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group(
    'OllamaTools tests',
    skip: Platform.environment.containsKey('CI'),
    () {
      late OllamaTools ollamaTool;
      final humanMessage = PromptValue.chat([
        ChatMessage.humanText("What's the weather in Vellore,India?"),
      ]);
      const tool1 = ToolSpec(
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
              'enum': ['celsius', 'fahrenheit'],
            },
          },
          'required': ['location'],
        },
      );

      setUp(() async {
        ollamaTool = OllamaTools(
          defaultOptions: const ChatOllamaToolOptions(
            options: ChatOllamaOptions(model: 'llama3:8b'),
            tools: [tool1],
          ),
        );
      });
      tearDown(() {
        ollamaTool.close();
      });
      test('test if model returned a tool call for input', () async {
        final res = await ollamaTool.invoke(humanMessage);
        expect(res.output.toolCalls[0].name, 'get_current_weather');
        expect(
          res.output.toolCalls[0].argumentsRaw,
          '{"location":"Vellore, India","unit":"celsius"}',
        );
        expect(
          res.output.toolCalls[0].arguments,
          {'location': 'Vellore, India', 'unit': 'celsius'},
        );
        expect(res.finishReason, FinishReason.stop);
      });
      test(
        'should throw exception if model did not respond in right JSON string format',
        () async {
          const toolOptions = ChatOllamaToolOptions(
            options: ChatOllamaOptions(model: 'llama3:8b'),
            tools: [tool1],
            toolSystemPromptTemplate:
                'You have access to the following tools: {tools} You must always select one of the above tools and respond in plain text',
          );
          try {
            await ollamaTool.invoke(humanMessage, options: toolOptions);
          } catch (e) {
            expect(
              e.toString(),
              'Exception: Model did not respond in vaild json string format, try improving your prompt, instruct to "respond in JSON"',
            );
          }
        },
      );
      test(
          'should return default tool if no other tools should be called for a given query',
          () async {
        const toolOptions = ChatOllamaToolOptions(
          options: ChatOllamaOptions(model: 'llama3:8b'),
        );
        final res = await ollamaTool.invoke(humanMessage, options: toolOptions);
        expect(res.output.toolCalls[0].name, '__conversational_response');
      });
      test(
        'should throw error if toolSystemPromptTemplate not in right format',
        () {
          const toolOptions = ChatOllamaToolOptions(
            options: ChatOllamaOptions(model: 'llama3:8b'),
            toolSystemPromptTemplate:
                'You have access to the following tools: tools} You must always select one of the above tools',
          );
          try {
            toolOptions.formatTemplate(humanMessage);
          } catch (e) {
            expect(
              e.toString(),
              "[template_validation] Single \'}\' in template.",
            );
          }
        },
      );
      test('test ollama tool options', () async {
        const toolOptions = ChatOllamaToolOptions(
          options: ChatOllamaOptions(
            model: 'llama3:8b',
          ),
          tools: [tool1],
          toolSystemPromptTemplate: 'toolSystemPromptTemplate',
        );

        expect(toolOptions.options.model, 'llama3:8b');
        expect(
          toolOptions.toolSystemPromptTemplate,
          'toolSystemPromptTemplate',
        );
        expect(toolOptions.tools![0], tool1);
      });
    },
  );
}
