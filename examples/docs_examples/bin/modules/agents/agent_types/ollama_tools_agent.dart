import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main() async {
  await ollamaToolsAgent();
  await ollamaToolsAgentCustomToolsMemory();
  await ollamaToolsAgentLCEL();
}

Future<void> ollamaToolsAgent() async {
  final llm = ChatOllamaTools(
    defaultOptions: const ChatOllamaToolsOptions(
      options: ChatOllamaOptions(
        model: 'gemma2',
        temperature: 0,
      ),
    ),
  );
  final tool = CalculatorTool();
  final agent = OllamaToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run('What is 40 raised to the 0.43 power? ');
  print(res); // Should print a result close to 4.8852
}

Future<void> ollamaToolsAgentCustomToolsMemory() async {
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

  final llm = ChatOllamaTools(
    defaultOptions: const ChatOllamaToolsOptions(
      options: ChatOllamaOptions(
        model: 'gemma2',
        temperature: 0,
      ),
    ),
  );

  final memory = ConversationBufferMemory(returnMessages: true);
  final agent = OllamaToolsAgent.fromLLMAndTools(
    llm: llm,
    tools: [tool],
    memory: memory,
  );

  final executor = AgentExecutor(agent: agent);

  final res1 = await executor.run(
    'Search for cats. Return only 3 results.',
  );
  print(res1);
  // Should print something like:
  // Here are 3 search results for "cats":
  // 1. Result 1
  // 2. Result 2
  // 3. Result 3
}

Future<void> ollamaToolsAgentLCEL() async {
  final prompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, 'You are a helpful assistant'),
    (ChatMessageType.human, '{input}'),
    (ChatMessageType.messagesPlaceholder, 'agent_scratchpad'),
  ]);

  final tool = CalculatorTool();

  final model = ChatOllamaTools(
    defaultOptions: const ChatOllamaToolsOptions(
      options: ChatOllamaOptions(
        model: 'gemma2',
        temperature: 0,
      ),
    ),
  ).bind(ChatOllamaToolsOptions(tools: [tool]));

  const outputParser = OllamaToolsAgentOutputParser();

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
  // Should print a result close to 4.88524
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
