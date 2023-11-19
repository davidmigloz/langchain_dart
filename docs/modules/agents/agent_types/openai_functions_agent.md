# OpenAI functions

Certain OpenAI models (like `gpt-3.5-turbo` and `gpt-4`) have been
fine-tuned to detect when a function should to be called and respond with the
inputs that should be passed to the function. In an API call, you can describe
functions and have the model intelligently choose to output a JSON object
containing arguments to call those functions. The goal of the OpenAI Function
APIs is to more reliably return valid and useful function calls than a generic
text completion or chat API.

The OpenAI Functions Agent is designed to work with these models.

> **Note**: Must be used with an [OpenAI Functions](https://platform.openai.com/docs/guides/gpt/function-calling) model.

```dart
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  model: 'gpt-4',
  temperature: 0,
);
final tool = CalculatorTool();
final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
final executor = AgentExecutor(agent: agent);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
```

You can easily call your own functions by wrapping them in a `Tool`. You can also add memory to the agent by passing it when creating the agent. 

Let's see an example of how to do this:

```dart
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
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
```

## Using LangChain Expression Language (LCEL) 

You can replicate the functionality of the OpenAI Functions Agent by using the LangChain Expression Language (LCEL) directly. 

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final prompt = ChatPromptTemplate.fromPromptMessages([
  SystemChatMessagePromptTemplate.fromTemplate('You are a helpful assistant'),
  HumanChatMessagePromptTemplate.fromTemplate('{input}'),
  const MessagesPlaceholder(variableName: 'agent_scratchpad'),
]);

final tool = CalculatorTool();

final model = ChatOpenAI(
  apiKey: openaiApiKey,
  temperature: 0,
).bind(ChatOpenAIOptions(functions: [tool.toChatFunction()]));

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
```

In this way, you can create your own custom agents with full control over their behavior.
