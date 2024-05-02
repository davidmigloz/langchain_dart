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
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    temperature: 0,
  ),
);
final tool = CalculatorTool();
final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
final executor = AgentExecutor(agent: agent);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
```

You can easily call your own functions by wrapping them in a `Tool`. You can also add memory to the agent by passing it when creating the agent. 

Let's see an example of how to do this.

First let's create a class that will be the input for our tool.

```dart
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
```

Now let's define the tool:

```dart
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
```

Notice that we need to provide a function that converts the JSON input that the model will send to our tool into the input class that we defined.

The tool will call `callYourSearchFunction` function with the parsed input. For simplicity, we will just mock the search function.
```dart
String callYourSearchFunction(final SearchInput input) {
  return 'Results:\n${List<String>.generate(input.n, (final i) => 'Result ${i + 1}').join('\n')}';
}
```

Now we can create the agent and run it.

```dart
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(temperature: 0),
);

final memory = ConversationBufferMemory(returnMessages: true);
final agent = OpenAIFunctionsAgent.fromLLMAndTools(
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
```

## Using LangChain Expression Language (LCEL) 

You can replicate the functionality of the OpenAI Functions Agent by using the LangChain Expression Language (LCEL) directly. 

```dart
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
// 40 raised to the power of 0.43 is approximately 4.88524.
```

In this way, you can create your own custom agents with full control over their behavior.
