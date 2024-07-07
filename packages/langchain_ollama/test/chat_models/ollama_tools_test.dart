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
      test('should format if toolSystemPromptTemplate is in right format', () {
        const testTool = ToolSpec(
          name: 'test_tool',
          description: 'tool_description',
          inputJsonSchema: {'input': 'tool_input'},
        );
        const String testFinalPrompt =
            "System: You have access to the following tools: [ToolSpec{\n  name: test_tool,\n  description: tool_description,\n  inputJsonSchema: {input: tool_input},\n}\n] select one\nHuman: What's the weather in Vellore,India?";
        const toolOptions = ChatOllamaToolOptions(
          options: ChatOllamaOptions(model: 'llama3:8b'),
          toolSystemPromptTemplate:
              'You have access to the following tools: {tools} select one',
          tools: [testTool],
        );
        final output = toolOptions.formatTemplate(humanMessage);
        expect(output.toString(), testFinalPrompt);
      });
      test('test ollama tool options', () async {
        const toolOptions = ChatOllamaToolOptions(
          options: ChatOllamaOptions(
            model: 'foo',
            format: OllamaResponseFormat.json,
            numKeep: 0,
            seed: 1,
            numPredict: 2,
            topK: 3,
            topP: 4.0,
            tfsZ: 5.0,
            typicalP: 6.0,
            repeatLastN: 7,
            temperature: 8.0,
            repeatPenalty: 9.0,
            presencePenalty: 10.0,
            frequencyPenalty: 11.0,
            mirostat: 12,
            mirostatTau: 13.0,
            mirostatEta: 14.0,
            penalizeNewline: false,
            stop: ['stop <start_message>', 'stop <stop_message>'],
            numa: true,
            numCtx: 15,
            numBatch: 16,
            numGpu: 0,
            mainGpu: 18,
            lowVram: true,
            f16KV: true,
            logitsAll: true,
            vocabOnly: true,
            useMmap: true,
            useMlock: true,
            numThread: 21,
          ),
          tools: [tool1],
          toolSystemPromptTemplate: 'toolSystemPromptTemplate',
        );

        expect(toolOptions.options.model, 'foo');
        expect(toolOptions.options.format, OllamaResponseFormat.json);
        expect(toolOptions.options.numKeep, 0);
        expect(toolOptions.options.seed, 1);
        expect(toolOptions.options.numPredict, 2);
        expect(toolOptions.options.topK, 3);
        expect(toolOptions.options.topP, 4.0);
        expect(toolOptions.options.tfsZ, 5.0);
        expect(toolOptions.options.typicalP, 6.0);
        expect(toolOptions.options.repeatLastN, 7);
        expect(toolOptions.options.temperature, 8.0);
        expect(toolOptions.options.repeatPenalty, 9.0);
        expect(toolOptions.options.presencePenalty, 10.0);
        expect(toolOptions.options.frequencyPenalty, 11.0);
        expect(toolOptions.options.mirostat, 12);
        expect(toolOptions.options.mirostatTau, 13.0);
        expect(toolOptions.options.mirostatEta, 14.0);
        expect(toolOptions.options.penalizeNewline, false);
        expect(toolOptions.options.stop,
            ['stop <start_message>', 'stop <stop_message>']);
        expect(toolOptions.options.numa, true);
        expect(toolOptions.options.numCtx, 15);
        expect(toolOptions.options.numBatch, 16);
        expect(toolOptions.options.numGpu, 0);
        expect(toolOptions.options.mainGpu, 18);
        expect(toolOptions.options.lowVram, true);
        expect(toolOptions.options.f16KV, true);
        expect(toolOptions.options.logitsAll, true);
        expect(toolOptions.options.vocabOnly, true);
        expect(toolOptions.options.useMmap, true);
        expect(toolOptions.options.useMlock, true);
        expect(toolOptions.options.numThread, 21);
        expect(
          toolOptions.toolSystemPromptTemplate,
          'toolSystemPromptTemplate',
        );
        expect(toolOptions.tools![0], tool1);
      });
    },
  );
}
