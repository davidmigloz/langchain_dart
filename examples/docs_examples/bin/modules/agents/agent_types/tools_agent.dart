// ignore_for_file: avoid_print, unreachable_from_main
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _toolsAgent();
  await _toolsAgentCustomToolsMemory();
  await _toolsAgentLCEL();
}

Future<void> _toolsAgent() async {
  final llm = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.2',
      temperature: 0,
    ),
  );
  final tool = CalculatorTool();
  final agent = ToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run(
    'What is 40 raised to the power of 0.43? '
    'Return the result with 3 decimals.',
  );
  print(res);
  // The result is: 4.885
}

Future<void> _toolsAgentCustomToolsMemory() async {
  final tool = Tool.fromFunction<SearchInput, String>(
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
    func: callYourSearchFunction,
    getInputFromJson: SearchInput.fromJson,
  );

  final llm = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3-groq-tool-use',
      temperature: 0,
    ),
  );

  final memory = ConversationBufferMemory(returnMessages: true);
  final agent = ToolsAgent.fromLLMAndTools(
    llm: llm,
    tools: [tool],
    memory: memory,
  );

  final executor = AgentExecutor(agent: agent);

  final res1 = await executor.run(
    'Search for cat names. Return only 3 results.',
  );
  print(res1);
  // Here are 3 search results for "cats":
  // 1. Result 1
  // 2. Result 2
  // 3. Result 3
}

class SearchInput {
  const SearchInput({
    required this.query,
    required this.n,
  });

  final String query;
  final int n;

  SearchInput.fromJson(final Map<String, dynamic> json)
      : this(
          query: json['query'] as String,
          n: json['n'] as int,
        );
}

String callYourSearchFunction(final SearchInput input) {
  final n = input.n;
  final res = List<String>.generate(
    n,
    (i) => 'Result ${i + 1}: ${String.fromCharCode(65 + i) * 3}',
  );
  return 'Results:\n${res.join('\n')}';
}

Future<void> _toolsAgentLCEL() async {
  final openAiKey = Platform.environment['OPENAI_API_KEY'];

  final prompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, 'You are a helpful assistant'),
    (ChatMessageType.human, '{input}'),
    (ChatMessageType.messagesPlaceholder, 'agent_scratchpad'),
  ]);

  final tool = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openAiKey,
    defaultOptions: ChatOpenAIOptions(
      model: 'gpt-4o-mini',
      temperature: 0,
      tools: [tool],
    ),
  );

  const outputParser = ToolsAgentOutputParser();

  List<ChatMessage> buildScratchpad(final List<AgentStep> intermediateSteps) {
    return intermediateSteps
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
        .toList(growable: false);
  }

  final agent = Agent.fromRunnable(
    Runnable.mapInput(
      (AgentPlanInput planInput) => <String, dynamic>{
        'input': planInput.inputs['input'],
        'agent_scratchpad': buildScratchpad(planInput.intermediateSteps),
      },
    ).pipe(prompt).pipe(model).pipe(outputParser),
    tools: [tool],
  );
  final executor = AgentExecutor(agent: agent);

  final res = await executor.invoke({
    'input': 'What is 40 raised to the power of 0.43? '
        'Return the result with 3 decimals.',
  });
  print(res['output']);
  // The result of 40 raised to the power of 0.43 is approximately 4.885.
}
