// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _openaiFunctionsAgent();
  await _openaiFunctionsAgentCustomToolsMemory();
  await _openaiFunctionsAgentLCEL();
}

Future<void> _openaiFunctionsAgent() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4',
      temperature: 0,
    ),
  );
  final tool = CalculatorTool();
  final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run('What is 40 raised to the 0.43 power? ');
  print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
}

Future<void> _openaiFunctionsAgentCustomToolsMemory() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(temperature: 0),
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
      final query = toolInput['query'];
      final n = toolInput['n'];
      return callYourSearchFunction(query, n);
    },
  );
  final tools = [tool];

  final memory = ConversationBufferMemory(returnMessages: true);
  final agent = OpenAIFunctionsAgent.fromLLMAndTools(
    llm: llm,
    tools: tools,
    memory: memory,
  );

  final executor = AgentExecutor(agent: agent);

  final res1 = await executor.run(
    'Search for cats. Return only 3 results.',
  );
  print(res1);
}

String callYourSearchFunction(final String query, final int n) {
  return 'Results:\n${List<String>.generate(n, (final i) => 'Result ${i + 1}').join('\n')}';
}

Future<void> _openaiFunctionsAgentLCEL() async {
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
    defaultOptions: ChatOpenAIOptions(
      temperature: 0,
      functions: [tool.toChatFunction()],
    ),
  );

  const outputParser = OpenAIFunctionsAgentOutputParser();

  List<ChatMessage> buildScratchpad(final List<AgentStep> intermediateSteps) {
    return intermediateSteps
        .map((final s) {
          return s.action.messageLog +
              [
                ChatMessage.function(
                  name: s.action.tool,
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
}
