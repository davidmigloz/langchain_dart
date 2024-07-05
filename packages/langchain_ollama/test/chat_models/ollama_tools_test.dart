//import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:langchain_ollama/src/chat_models/ollama_tools.dart';
import 'package:test/test.dart';

void main() {
  group(
    'OllamaTools tests',
    //skip: Platform.environment.containsKey('CI'),
    () {
      late OllamaTools ollamaTool;
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
        final messages = [
          ChatMessage.humanText("What's the weather in Vellore,India?"),
        ];
        final input = PromptValue.chat(messages);
        final res = await ollamaTool.invoke(input);
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
          late String errorMessage;
          final messages = [
            ChatMessage.humanText("What's the weather in Vellore,India?"),
          ];
          final input = PromptValue.chat(messages);
          const toolOptions = ChatOllamaToolOptions(
            options: ChatOllamaOptions(model: 'llama3:8b'),
            tools: [tool1],
            toolSystemPromptTemplate:
                'You have access to the following tools: {tools} You must always select one of the above tools and respond in plain text',
          );
          try {
            await ollamaTool.invoke(input, options: toolOptions);
          } catch (e) {
            errorMessage = e.toString();
          }
          expect(
            errorMessage,
            'Exception: Model did not respond in vaild json string format, try improving your prompt, instruct to "respond in JSON"',
          );
        },
      );
    },
  );
}
