# Tools Agent

An agent powered by the [tool calling API](/modules/model_io/models/chat_models/how_to/tools.md).

This agent is designed to work with any chat model that supports tool calling. It can interpret the model's output and decide when to call specific tools based on that output. 

**Supported models:**
You can use any chat model that supports tool calling, like `ChatOpenAI`, `ChatOllama`, `ChatAnthropic`, `ChatFirebaseVertexAI`, etc. Check the [tool calling docs](/modules/model_io/models/chat_models/how_to/tools.md) for a complete list.

## Usage

In the following example, we use `ChatOllama` with the `llama3.1` model and a calculator tool (included in `langchain_community`) to calculate the result of a mathematical expression.

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

//...

final llm = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.1',
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
```

## Custom tools

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
  inputJsonSchema: {
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
```

Notice that we need to provide a function that converts the JSON input that the model will send to our tool into the input class that we defined.

The tool will call `callYourSearchFunction` function with the parsed input. For simplicity, we will just mock the search function.
```dart
String callYourSearchFunction(final SearchInput input) {
    final n = input.n;
    final res = List<String>.generate(
      n,
      (i) => 'Result ${i + 1}: ${String.fromCharCode(65 + i) * 3}',
    );
    return 'Results:\n${res.join('\n')}';
}
```

Now we can create the agent and run it:

```dart
final llm = ChatOllama(
  defaultOptions: ChatOllamaOptions(
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
  'Search for cat names. Return only 3 results.',
);
print(res1);
// Here are the top 3 cat names I found: AAA, BBB, and CCC.
```

## Custom agent using LangChain Expression Language (LCEL)

You can replicate the functionality of the Tools Agent by using the LangChain Expression Language (LCEL) directly.

```dart
final openAiKey = Platform.environment['OPENAI_API_KEY'];

final prompt = ChatPromptTemplate.fromTemplates([
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
```

In this way, you can create your own custom agents with full control over their behavior, while still leveraging the flexibility of the Tools Agent to work with various language models and tools.
