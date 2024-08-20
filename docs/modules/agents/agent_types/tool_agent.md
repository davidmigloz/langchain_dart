# Tools Agent

The Tools Agent is a flexible and powerful agent that can work with various language models and tools. It's designed to interpret the language model's output and decide when to call specific tools based on that output. This agent is particularly useful when you want to use models that don't have built-in function-calling capabilities or when you want more control over the tool-calling process.

The Tools Agent can be used with a wide range of models, including those from OpenAI, Anthropic, Ollama, and others. It interprets the model's text output to determine when and how to use tools.

> **Note**: Can be used with any chat model, not just those with built-in function-calling capabilities.

```dart
final llm = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama2',
    temperature: 0,
  ),
);
final tool = CalculatorTool();
final agent = ToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
final executor = AgentExecutor(agent: agent);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> 'The result of 40 raised to the power of 0.43 is approximately 4.885.'
```

You can easily call your own functions by wrapping them in a `Tool`. You can also add memory to the agent by passing it when creating the agent.

Let's see an example of how to do this.

First, let's create a class that will be the input for our tool.

```dart
@immutable
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
final searchTool = Tool.fromFunction<SearchInput, String>(
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
final llm = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama3-groq-tool-use',
    temperature: 0,
  ),
);

final memory = ConversationBufferMemory(returnMessages: true);
final agent = ToolsAgent.fromLLMAndTools(
  llm: llm,
  tools: [searchTool],
  memory: memory,
);

final executor = AgentExecutor(agent: agent);

final res1 = await executor.run(
'Search for cats. Return only 3 results.',
);
print(res1);
// Here are the 3 search results for "cats":
// Result 1
// Result 2
// Result 3
```

## Using LangChain Expression Language (LCEL)

You can replicate the functionality of the Tools Agent by using the LangChain Expression Language (LCEL) directly.

```dart
final prompt = ChatPromptTemplate.fromPromptMessages([
  SystemChatMessagePromptTemplate.fromTemplate(
    '''
    'You are a helpful assistant'
    \n\n
    'You have access to these tools: ${llm.defaultOptions.tools!.map((t) => t.name).join(', ')}'
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

final tool = CalculatorTool();

final model = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama3-groq-tool-use',
    temperature: 0,
  ),
);

const outputParser = ToolsAgentOutputParser();

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
  ).pipe(prompt).pipe(model).pipe(outputParser),
  tools: [tool],
);
final executor = AgentExecutor(agent: agent);

final res = await executor.invoke({
'input': 'What is 40 raised to the 0.43 power?',
});
print(res['output']);
// The result of 40 raised to the power of 0.43 is approximately 4.885.
```

In this way, you can create your own custom agents with full control over their behavior, while still leveraging the flexibility of the Tools Agent to work with various language models and tools.