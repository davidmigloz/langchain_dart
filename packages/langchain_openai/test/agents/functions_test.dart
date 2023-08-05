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

      final executor = AgentExecutor(agent: agent);

      final res = await executor.run('What is 40 raised to the 0.43 power? ');

      expect(res, contains('4.88'));
    });

    Future<void> testMemory({required final bool returnMessages}) async {
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        model: 'gpt-3.5-turbo-0613',
        temperature: 0,
      );

      final tool = BaseTool.fromFunction(
        name: 'search',
        description: 'Tool for searching the web.',
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'query': {
              'type': 'string',
              'description': 'The query to search for',
            },
            'n': {
              'type': 'number',
              'description': 'The number of results to return',
            },
          },
          'required': ['query'],
        },
        func: (final Map<String, dynamic> toolInput) async {
          final n = toolInput['n'];
          final res = List<String>.generate(n, (final i) => 'Result ${i + 1}');
          return 'Results:\n${res.join('\n')}';
        },
      );
      final tools = [tool];

      final memory = ConversationBufferMemory(returnMessages: returnMessages);
      final agent = OpenAIFunctionsAgent.fromLLMAndTools(
        llm: llm,
        tools: tools,
        memory: memory,
      );

      final executor = AgentExecutor(agent: agent);

      final res1 = await executor.run(
        'Search for cats. Return only 3 results.',
      );

      expect(res1, contains('Result 1'));
      expect(res1, contains('Result 2'));
      expect(res1, contains('Result 3'));
      expect(res1, isNot(contains('Result 4')));

      final res2 = await executor.run(
        'How many results did the search return?',
      );
      expect(res2, contains('3'));
      expect(res2, isNot(contains('1')));
      expect(res2, isNot(contains('2')));
      expect(res2, isNot(contains('4')));

      final res3 = await executor.run('What was the last result?');
      expect(res3, contains('Result 3'));
    }

    test('Test OpenAIFunctionsAgent with messages memory', () async {
      await testMemory(returnMessages: true);
    });

    test('Test OpenAIFunctionsAgent with string memory throws error', () async {
      expect(
        () async => testMemory(returnMessages: false),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
