// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIDallETool tests', () {
    final openAiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test generate image returned as URL', () async {
      final tool = OpenAIDallETool(
        apiKey: openAiKey,
        defaultOptions: const OpenAIDallEToolOptions(
          model: 'dall-e-2',
          size: ImageSize.v256x256,
        ),
      );
      final res = await tool.invoke({Tool.inputVar: 'A cute baby sea otter'});
      expect(res, startsWith('http'));
      tool.close();
    });

    test('Test generate image returned as base64', () async {
      final tool = OpenAIDallETool(
        apiKey: openAiKey,
        defaultOptions: const OpenAIDallEToolOptions(
          model: 'dall-e-2',
          size: ImageSize.v256x256,
          responseFormat: ImageResponseFormat.b64Json,
        ),
      );
      final res = await tool.invoke({Tool.inputVar: 'A cute baby sea otter'});
      expect(res, isNot(startsWith('http')));
      tool.close();
    });

    test('Test OpenAIDallETool in an agent',
        timeout: const Timeout(Duration(minutes: 2)), skip: true, () async {
      final llm = ChatOpenAI(
        apiKey: openAiKey,
        defaultOptions: const ChatOpenAIOptions(
          model: 'gpt-4',
          temperature: 0,
        ),
      );

      final List<BaseTool<ToolOptions>> tools = [
        CalculatorTool(),
        OpenAIDallETool(
          apiKey: openAiKey,
          defaultOptions: const OpenAIDallEToolOptions(
            model: 'dall-e-2',
            size: ImageSize.v256x256,
          ),
        ),
      ];

      final agent = OpenAIFunctionsAgent.fromLLMAndTools(
        llm: llm,
        tools: tools,
      );

      final executor = AgentExecutor(agent: agent);

      final res = await executor.run(
        'Calculate the result of 40 raised to the power of 0.43 and generate a funny illustration with it. '
        'Return ONLY the URL of the image. Do not add any explanation.',
      );

      expect(res, startsWith('https://'));
    });
  });
}
