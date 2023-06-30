@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIFunctionsAgent tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test OpenAIFunctionsAgent', () async {
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        model: 'gpt-3.5-turbo-0613',
        temperature: 0,
      );

      final tool = CalculatorTool();
      final tools = [tool];

      final agent =
          OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);

      final executor = AgentExecutor(agent: agent, tools: tools);

      final res = await executor.run('What is 40 raised to the 0.43 power? ');

      expect(res, contains('4.88'));
    });
  });
}
