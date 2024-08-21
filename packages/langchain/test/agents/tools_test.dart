@TestOn('vm')
@Timeout(Duration(minutes: 50))
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  late BaseChatModel llm;
  const defaultOllamaModel = 'llama3-groq-tool-use';
  const defaultOpenAIModel = 'gpt-4o-mini';

  group('ChatToolsAgent using Ollama tests', () {
    setUp(() async {
      llm = ChatOllama(
        defaultOptions: ChatOllamaOptions(
          model: defaultOllamaModel,
          temperature: 0,
          tools: [CalculatorTool(), searchTool],
        ),
      );
    });

    test('Test ChatToolsAgent with calculator tool', () async {
      await testAgentWithCalculator(llm);
    });

    test('Test ToolsAgent with messages memory', () async {
      await testMemory(llm, returnMessages: true);
    });

    test('Test ToolsAgent with string memory throws error', () async {
      expect(
        () async => testMemory(llm, returnMessages: false),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test ToolsAgent LCEL equivalent using Ollama', () async {
      final res =
          await testLCDLEquivalent(llm: llm, tool: CalculatorTool()).invoke({
        'input': 'What is 40 raised to the power of 0.43? '
            'Return the result with 3 decimals.',
      });
      expect(res['output'], contains('4.88'));
    });
  });

  group('ChatToolsAgent using OpenAi tests', () {
    setUp(() async {
      final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
      llm = ChatOpenAI(
        apiKey: openaiApiKey,
        defaultOptions: ChatOpenAIOptions(
          model: defaultOpenAIModel,
          tools: [CalculatorTool(), searchTool],
        ),
      );
    });

    test('Test ChatToolsAgent with calculator tool', () async {
      await testAgentWithCalculator(llm);
    });

    test('Test ToolsAgent with messages memory', () async {
      await testMemory(llm, returnMessages: true);
    });

    test('Test ToolsAgent with string memory throws error', () async {
      expect(
        () async => testMemory(llm, returnMessages: false),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test ToolsAgent LCEL equivalent using OpenAi', () async {
      final res =
          await testLCDLEquivalent(llm: llm, tool: CalculatorTool()).invoke({
        'input': 'What is 40 raised to the power of 0.43? '
            'Return the result with 3 decimals.',
      });
      expect(res['output'], contains('4.88'));
    });
  });
}

Future<void> testAgentWithCalculator(
  BaseChatModel<ChatModelOptions> llm,
) async {
  final agent = ToolsAgent.fromLLMAndTools(
    llm: llm,
  );
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run(
    'What is 40 raised to the power of 0.43? '
    'Return the result with 3 decimals.',
  );
  expect(res, contains('4.885'));
}

Future<void> testMemory(
  BaseChatModel llm, {
  required final bool returnMessages,
}) async {
  final memory = ConversationBufferMemory(returnMessages: returnMessages);
  final agent = ToolsAgent.fromLLMAndTools(
    llm: llm,
    memory: memory,
  );

  final executor = AgentExecutor(agent: agent);

  final res1 = await executor.run(
    'Search for cat names. Return only 3 results.',
  );

  expect(res1, contains('AAA'));
  expect(res1, contains('BBB'));
  expect(res1, contains('CCC'));
  expect(res1, isNot(contains('DDD')));

  final res2 = await executor.run(
    'How many results did the search return? Respond with a number.',
  );
  expect(res2, contains('3'));
  expect(res2, isNot(contains('1')));
  expect(res2, isNot(contains('2')));
  expect(res2, isNot(contains('4')));

  final res3 = await executor.run('What was the last result?');
  expect(res3, contains('CCC'));
}

AgentExecutor testLCDLEquivalent({
  required BaseChatModel<ChatModelOptions> llm,
  required Tool tool,
}) {
  final prompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, 'You are a helpful assistant'),
    (ChatMessageType.human, '{input}'),
    (ChatMessageType.messagesPlaceholder, 'agent_scratchpad'),
  ]);

  final agent = Agent.fromRunnable(
    Runnable.mapInput(
      (AgentPlanInput planInput) => <String, dynamic>{
        'input': planInput.inputs['input'],
        'agent_scratchpad': planInput.intermediateSteps
            .map((s) {
              return s.action.messageLog +
                  [
                    ChatMessage.tool(
                      toolCallId: s.action.id,
                      content: s.observation,
                    ),
                  ];
            })
            .expand((m) => m)
            .toList(growable: false),
      },
    ).pipe(prompt).pipe(llm).pipe(const ToolsAgentOutputParser()),
    tools: [tool],
  );

  return AgentExecutor(agent: agent);
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

final searchTool = Tool.fromFunction<_SearchInput, String>(
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
        'type': 'integer',
        'description': 'The number of results to return',
      },
    },
    'required': ['query'],
  },
  func: (final _SearchInput toolInput) async {
    final n = toolInput.n;
    final res = List<String>.generate(
      n,
      (i) => 'Result ${i + 1}: ${String.fromCharCode(65 + i) * 3}',
    );
    return 'Results:\n${res.join('\n')}';
  },
  getInputFromJson: _SearchInput.fromJson,
);
