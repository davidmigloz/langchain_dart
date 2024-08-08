@TestOn('vm')
library; // Uses dart:io

import 'package:langchain/langchain.dart'
    show
        Agent,
        AgentExecutor,
        ChatMessage,
        ChatPromptTemplate,
        ConversationBufferMemory,
        HumanChatMessagePromptTemplate,
        MessagesPlaceholder,
        Runnable,
        SystemChatMessagePromptTemplate,
        ToolsAgent,
        ToolsAgentOutputParser;
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_core/src/agents/types.dart';
import 'package:langchain_core/src/runnables/types.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  // const defaultModel = 'gemma2';
  const defaultModel = 'llama3-groq-tool-use';
  // const defaultModel = 'qwen2';
  group('ChatOllamaToolsAgent tests', () {
    test('Test ChatOllamaToolsAgent with calculator tool', () async {
      final llm = ChatOllama(
        defaultOptions: ChatOllamaOptions(
          model: defaultModel,
          temperature: 0,
          tools: [CalculatorTool()],
        ),
      );

      final agent = ToolsAgent.fromLLMAndTools(
        llm: llm,
      );

      final executor = AgentExecutor(agent: agent);

      final res = await executor
          .run('What is 40 raised to the 0.43 power with 3 decimals? ');

      expect(res, contains('4.885'));
    });
    Future<void> testMemory({required final bool returnMessages}) async {
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
        func: (final _SearchInput toolInput) async {
          final n = toolInput.n;
          final res = List<String>.generate(n, (final i) => 'Result ${i + 1}');
          return 'Results:\n${res.join('\n')}';
        },
        getInputFromJson: _SearchInput.fromJson,
      );
      final tools = [tool];
      final llm = ChatOllama(
        defaultOptions: ChatOllamaOptions(
          model: defaultModel,
          temperature: 0,
          tools: [CalculatorTool(), ...tools],
        ),
      );
      final memory = ConversationBufferMemory(returnMessages: returnMessages);
      final agent = ToolsAgent.fromLLMAndTools(
        llm: llm,
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

    test('Test ToolsAgent with messages memory', () async {
      await testMemory(returnMessages: true);
    });

    test('Test ToolsAgent with string memory throws error', () async {
      expect(
        () async => testMemory(returnMessages: false),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('ToolsAgent LCEL equivalent test', () {
    final tool = CalculatorTool();
    final model = ChatOllama(
      defaultOptions: const ChatOllamaOptions(
        model: defaultModel,
        temperature: 0,
      ),
    ).bind(ChatOllamaOptions(tools: [tool]));

    final prompt = ChatPromptTemplate.fromPromptMessages([
      SystemChatMessagePromptTemplate.fromTemplate(
        '''
    'You are a helpful assistant'
    \n\n
                  'You have access to these tools: ${model.defaultOptions.tools!.map((t) => t.name).join(', ')}'
                  Instructions:
                  
                  Based on the user input, select tool_choice from the available tools.
                  Respond with a JSON object containing a "tool_calls" array.
                  Each tool call in the array should have:
                  
                  "tool_name": The name of the selected tool (string)
                  "tool_input": A JSON string with the input for the tool
                  
                  Example response format:
                  ```json
                  {{
                    "tool_calls": [
                      {{
                        "tool_name": "tool_name",
                        "tool_input": "{{"param1":"value1","param2":"value2"}}"
                      }}
                    ]
                  }}
                  ```'
                  ''',
      ),
      HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      const MessagesPlaceholder(variableName: 'agent_scratchpad'),
    ]);

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
      ).pipe(prompt).pipe(model).pipe(const ToolsAgentOutputParser()),
      tools: [tool],
    );

    final executor = AgentExecutor(agent: agent);

    test('Test ToolsAgent LCEL equivalent', () async {
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
