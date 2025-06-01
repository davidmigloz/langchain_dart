// ignore_for_file: deprecated_member_use_from_same_package, unnecessary_async
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart'
    show AgentExecutor, ConversationBufferMemory;
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_core/agents.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIToolsAgent tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test OpenAIToolsAgent with calculator tool', () async {
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const ChatOpenAIOptions(
          temperature: 0,
        ),
      );

      final tool = CalculatorTool();
      final tools = [tool];

      final agent = OpenAIToolsAgent.fromLLMAndTools(llm: llm, tools: tools);

      final executor = AgentExecutor(agent: agent);

      final res = await executor
          .run('What is 40 raised to the 0.43 power with 3 decimals? ');

      expect(res, contains('4.88'));
    });

    Future<void> testMemory({required final bool returnMessages}) async {
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const ChatOpenAIOptions(
          temperature: 0,
        ),
      );

      final tool = Tool.fromFunction<_SearchInput, String>(
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
        func: (final _SearchInput toolInput) {
          final n = toolInput.n;
          final res = List<String>.generate(n, (final i) => 'Result ${i + 1}');
          return 'Results:\n${res.join('\n')}';
        },
        getInputFromJson: _SearchInput.fromJson,
      );
      final tools = [tool];

      final memory = ConversationBufferMemory(returnMessages: returnMessages);
      final agent = OpenAIToolsAgent.fromLLMAndTools(
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

    test('Test OpenAIToolsAgent with messages memory', () async {
      await testMemory(returnMessages: true);
    });

    test('Test OpenAIToolsAgent with string memory throws error', () {
      expect(
        () async => testMemory(returnMessages: false),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('OpenAIToolsAgent LCEL equivalent test', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    final prompt = ChatPromptTemplate.fromPromptMessages([
      SystemChatMessagePromptTemplate.fromTemplate(
        'You are a helpful assistant',
      ),
      HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      const MessagesPlaceholder(variableName: 'agent_scratchpad'),
    ]);

    final tool = CalculatorTool();

    final model = ChatOpenAI(
      apiKey: openaiApiKey,
      defaultOptions: const ChatOpenAIOptions(
        temperature: 0,
      ),
    ).bind(ChatOpenAIOptions(tools: [tool]));

    final agent = Agent.fromRunnable(
      Runnable.mapInput(
        (final AgentPlanInput planInput) => <String, dynamic>{
          'input': planInput.inputs['input'],
          'agent_scratchpad': planInput.intermediateSteps
              .map((final s) {
                return s.action.messageLog +
                    [
                      ChatMessage.tool(
                        toolCallId: s.action.id,
                        content: s.observation,
                      ),
                    ];
              })
              .expand((final m) => m)
              .toList(growable: false),
        },
      ).pipe(prompt).pipe(model).pipe(const OpenAIToolsAgentOutputParser()),
      tools: [tool],
    );

    final executor = AgentExecutor(agent: agent);

    test('Test OpenAIToolsAgent LCEL equivalent', () async {
      final res = await executor.invoke({
        'input': 'What is 40 raised to the 0.43 power with 3 decimals?',
      });
      expect(res['output'], contains('4.88'));
    });
  });
}

@immutable
class _SearchInput {
  const _SearchInput({
    required this.query,
    required this.n,
  });

  final String query;
  final int n;

  _SearchInput.fromJson(final Map<String, dynamic> json)
      : this(
          query: json['query'] as String,
          n: json['n'] as int,
        );

  @override
  bool operator ==(covariant _SearchInput other) =>
      identical(this, other) || query == other.query && n == other.n;

  @override
  int get hashCode => query.hashCode ^ n.hashCode;
}
