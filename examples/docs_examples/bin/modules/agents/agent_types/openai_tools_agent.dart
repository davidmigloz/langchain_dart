// ignore_for_file: avoid_print, unreachable_from_main
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _openAIToolsAgent();
  await _openAIToolsAgentCustomToolsMemory();
  await _openAIToolsAgentLCEL();
}

Future<void> _openAIToolsAgent() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      temperature: 0,
    ),
  );
  final tool = CalculatorTool();
  final agent = OpenAIToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run('What is 40 raised to the 0.43 power? ');
  print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
}

Future<void> _openAIToolsAgentCustomToolsMemory() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

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
          'type': 'number',
          'description': 'The number of results to return',
        },
      },
      'required': ['query'],
    },
    func: callYourSearchFunction,
    getInputFromJson: SearchInput.fromJson,
  );

  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(temperature: 0),
  );

  final memory = ConversationBufferMemory(returnMessages: true);
  final agent = OpenAIToolsAgent.fromLLMAndTools(
    llm: llm,
    tools: [tool],
    memory: memory,
  );

  final executor = AgentExecutor(agent: agent);

  final res1 = await executor.run(
    'Search for cats. Return only 3 results.',
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
  return 'Results:\n${List<String>.generate(input.n, (final i) => 'Result ${i + 1}').join('\n')}';
}

Future<void> _openAIToolsAgentLCEL() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final prompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, 'You are a helpful assistant'),
    (ChatMessageType.human, '{input}'),
    (ChatMessageType.messagesPlaceholder, 'agent_scratchpad'),
  ]);

  final tool = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: ChatOpenAIOptions(
      temperature: 0,
      tools: [tool],
    ),
  );

  const outputParser = OpenAIToolsAgentOutputParser();

  List<ChatMessage> buildScratchpad(final List<AgentStep> intermediateSteps) {
    return intermediateSteps
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
        .toList(growable: false);
  }

  final agent = Agent.fromRunnable(
    Runnable.mapInput(
      (final AgentPlanInput planInput) => <String, dynamic>{
        'input': planInput.inputs['input'],
        'agent_scratchpad': buildScratchpad(planInput.intermediateSteps),
      },
    ).pipe(prompt).pipe(model).pipe(outputParser),
    tools: [tool],
  );
  final executor = AgentExecutor(agent: agent);

  final res = await executor.invoke({
    'input': 'What is 40 raised to the 0.43 power?',
  });
  print(res['output']);
  // 40 raised to the power of 0.43 is approximately 4.88524.
}
