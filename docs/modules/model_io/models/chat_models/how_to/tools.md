# Tool/function calling

> We use the term "tool calling" interchangeably with "function calling". Although function calling is sometimes meant to refer to invocations of a single function, we treat all models as though they can return multiple tool or function calls in each message.

> Tool calling is currently supported by:
> - [`ChatOpenAI`](/modules/model_io/models/chat_models/integrations/openai.md)
> - [`ChatFirebaseVertexAI`](/modules/model_io/models/chat_models/integrations/firebase_vertex_ai.md)
> - [`ChatGoogleGenerativeAI`](/modules/model_io/models/chat_models/integrations/googleai.md)

Tool calling allows a model to respond to a given prompt by generating output that matches a user-defined schema. While the name implies that the model is performing some action, this is actually not the case! The model is coming up with the arguments to a tool, and actually running the tool (or not) is up to the user - for example, if you want to extract output matching some schema from unstructured text, you could give the model an “extraction” tool that takes parameters matching the desired schema, then treat the generated output as your final result.

A tool call includes an `id` of the call, the `name` of the tool to call, and a map with the `arguments` to pass to the tool. The `arguments` map is structured like `{argument_name: argument_value}`.

Many LLM providers, including Anthropic, Cohere, Google, Mistral, OpenAI, and others, support variants of a tool calling feature. These features typically allow requests to the LLM to include available tools and their schemas, and for responses to include calls to these tools. For instance, given a search engine tool, an LLM might handle a query by first issuing a call to the search engine. The system calling the LLM can receive the tool call, execute it, and return the output to the LLM to inform its response. LangChain.dart includes a suite of [built-in tools](/modules/agents/tools/tools.md) and supports several methods for defining your own custom tools. Tool-calling is extremely useful for building tool-using chains and agents, and for getting structured outputs from models more generally.

Providers adopt different conventions for formatting tool schemas and tool calls. For instance, Anthropic returns tool calls as parsed structures within a larger content block:

```json
[
  {
    "text": "<thinking>\nI should use a tool.\n</thinking>",
    "type": "text"
  },
  {
    "id": "id_value",
    "input": {"arg_name": "arg_value"},
    "name": "tool_name",
    "type": "tool_use"
  }
]
```

whereas OpenAI separates tool calls into a distinct parameter, with arguments as JSON strings:

```json
{
  "tool_calls": [
    {
      "id": "id_value",
      "function": {
        "arguments": '{"arg_name": "arg_value"}',
        "name": "tool_name"
      },
      "type": "function"
    }
  ]
}
```

LangChain.dart implements standard interfaces for defining tools, passing them to LLMs, and representing tool calls.

## Request

For a model to be able to invoke tools, you need to pass tool specs to it when making a chat request.

### Defining tool schemas: LangChain Tool

You can define a tool spec using the `ToolSpec` class. A `ToolSpec` defines the name, description, and input [JSON Schema](https://json-schema.org) of a tool, but it does not define the actual tool implementation.

```dart
const tool1 = ToolSpec(
  name: 'joke',
  description: 'A joke',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'setup': {
        'type': 'string',
        'description': 'The setup for the joke',
      },
      'punchline': {
        'type': 'string',
        'description': 'The punchline for the joke',
      },
    },
    'required': ['setup', 'punchline'],
  },
);
```

All LangChain.dart `Tool`s implements `ToolSpec`, so they can be passed to the model directly.

> The difference between `ToolSpec` and `Tool` is that `ToolSpec` only defines the schema of the tool, while `Tool` also defines the actual tool implementation.

```json
final tool2 = CalculatorTool();
final tool3 = Tool.fromFunction<SearchInput, String>(
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

### Passing tools to model

Once you have defined the tools that the model can call, you can pass them to the model in several ways:

- **When instantiating the model**: you can configure the tools in the `defaultOptions` field. This is useful if you want the tools to be available for all requests using the model.

```dart
final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: ChatOpenAIOptions(
      tools: [tool1, tool2, tool3],
    ),
);
```

- **Using `model.bind()`: you can bind tools to a specific model. This is useful if the tools are specific to a particular chain, but not to all requests that use the model.

```dart
final chain = model.bind(
    ChatOpenAIOptions(
      tools: [tool1, tool2, tool3],
    ),
).pipe(...);
```

- **When invoking/streaming the chain**: you can pass the tools in the `options` field when invoking/streaming the chain. This is useful when you want to use tools for a specific request only.

```dart
final res = await model.invoke(
  input,
  options: ChatOpenAIOptions(
    tools: [tool1, tool2, tool3],
  ),
);

final stream = model.stream(
  input,
  options: ChatOpenAIOptions(
    tools: [tool1, tool2, tool3],
  ),
);
```

Under the hood, LangChain.dart will pass the tools to the model in the correct format based on the provider's requirements.

### Forcing a tool call

When you just define the tools the model can call, the model can choose whether to return one tool call, multiple tool calls, or no tool calls at all. Some models support a `toolChoice` parameter that gives you some ability to force the model to call a tool. 

For models that support this, you can pass in the name of the tool you want the model to always call:

```dart
ChatOpenAIOptions(
  tools: [tool1, tool2, tool3],
  toolChoice: ChatToolChoice.forced(name: 'joke'),
);
```

You can force the model to call at least one tool, without specifying which tool specifically:

```dart
ChatOpenAIOptions(
  tools: [tool1, tool2, tool3],
  toolChoice: ChatToolChoice.auto,
);
```

Or you can force the model to not call any tools:

```dart
ChatOpenAIOptions(
  tools: [tool1, tool2, tool3],
  toolChoice: ChatToolChoice.none,
);
```

## Response

Once you have passed the tools to the model, the model can return tool calls in the response. 

### Reading tool calls from model output

If tool calls are included in a LLM response, they are attached to the corresponding `AIChatMessage` as a list of `AIChatMessageToolCall` objects in the `toolCalls` field. Messages with no tool calls default to an empty list.

A `AIChatMessageToolCall` includes:
- `id`: The tool call id. This is unique for each tool call in the response.
- `name`: The name of the tool to call.
- `argumentsRaw`: The raw JSON string containing the arguments returned by the model to pass to the tool.
- `arguments`: The arguments returned by the model to pass to the tool parsed into a Dart map.

Example:
```dart
final calculator = CalculatorTool();
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    tools: [calculator],
  ),
);
final res = await model.invoke(
  PromptValue.string('Calculate 3 * 12 and 11 + 49'),
);
print(res.output);
// AIChatMessage{
//   content: ,
//   toolCalls: [
//     AIChatMessageToolCall{
//       id: call_Kgo8xBug6OkFbBVBmAgI2bm0,
//       name: calculator,
//       argumentsRaw: {"input": "3 * 12"},
//       arguments: {
//         input: 3 * 12
//       },
//     }, AIChatMessageToolCall{
//       id: call_Tc2zOW8obEGh0iEtA5UNykqR,
//       name: calculator,
//       argumentsRaw: {"input": "11 + 49"},
//       arguments: {
//         input: 11 + 49
//       },
//     }
//   ],
// }
```

Note that the model does not always generate a valid JSON, in that case, `arguments` will be empty, but you can still see the raw response in `argumentsRaw`.

The model may also hallucinate parameters not defined by your tool schema. Validate the arguments in your code before calling your tool.

If desired, output parsers can further process the output. For example, you can extract the tool calls from the model response using `ToolsOutputParser`:

```dart
final chain = model.pipe(ToolsOutputParser());
final res2 = await chain.invoke(
  PromptValue.string('Calculate 3 * 12 and 11 + 49'),
);
print(res2);
// [ParsedToolCall{
//   id: call_p4GmED1My56vV6XZi9ChljJN,
//   name: calculator,
//   arguments: {
//     input: 3 * 12
//   },
// }, ParsedToolCall{
//   id: call_eLJo7nII9EanFUcxy42WA5Pm,
//   name: calculator,
//   arguments: {
//     input: 11 + 49
//   },
// }]
```

### Streaming

When tools are called in a streaming context, message chunks will be populated with tool call chunk objects in a list.

```dart
final stream = model.stream(
  PromptValue.string('Calculate 3 * 12 and 11 + 49'),
);
await for (final chunk in stream) {
  print(chunk.output.toolCalls);
}
// [] 
// [AIChatMessageToolCall{ id: call_bfU0p8DH8xvzZVXaDK3V42hN, name: calculator, argumentsRaw: , arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: {"in, arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: put":, arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: "3 * , arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: 12"}, arguments: {}, }] 
// [AIChatMessageToolCall{ id: call_WnHu44lmhkI3fFpEelyGBh6L, name: calculator, argumentsRaw: , arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: {"in, arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: put":, arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: "11 +, arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: 49", arguments: {}, }] 
// [AIChatMessageToolCall{ id: , name: , argumentsRaw: }, arguments: {}, }] []
```

As you can see, the `arguments` field is always empty because the `argumentsRaw` is never a valid JSON.

`ToolsOutputParser` is a useful tool for this case, as it concatenates the chunks progressively and tries to complete the partial JSON into a valid one:

```dart
final chain2 = model.pipe(ToolsOutputParser());
final stream2 = chain2.stream(
  PromptValue.string('Calculate 3 * 12 and 11 + 49'),
);
await stream2.forEach(print);
// [] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {}, }] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * }, }] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {}, }] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {input: 11 +}, }] 
// [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {input: 11 + 49}, }]
```

### Passing tool outputs to model

If we’re using the model-generated tool invocations to actually call tools and want to pass the tool results back to the model, we can do so using `ToolChatMessage`.

```dart
final calculator = CalculatorTool();
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    tools: [calculator],
  ),
);

final messages = [
  ChatMessage.humanText('Calculate 3 * 12 and 11 + 49'),
];

final res = await model.invoke(
  PromptValue.chat(messages),
);
print(res);
// ChatResult{
//   id: chatcmpl-9LYl0AecfrQClqOS4PNfczOvsBNvt,
//   output: AIChatMessage{
//     content: ,
//     toolCalls: [
//       AIChatMessageToolCall{
//         id: call_5tXVddYtn9igaRAeUwfH7ZN2,
//         name: calculator,
//         argumentsRaw: {"input": "3 * 12"},
//         arguments: {
//           input: 3 * 12
//         },
//       },
//       AIChatMessageToolCall{
//         id: call_bQ3Yx6foKIYLXBMQas5ObhHa,
//         name: calculator,
//         argumentsRaw: {"input": "11 + 49"},
//         arguments: {
//           input: 11 + 49
//         },
//       }
//     ],
//   },
//   finishReason: FinishReason.toolCalls,
//   metadata: {
//     model: gpt-4-turbo-2024-04-09,
//     created: 1714925522,
//     system_fingerprint: fp_3450ce39d5
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 91,
//     responseTokens: 49,
//     totalTokens: 140
//   },
//   streaming: false
// }

messages.add(res.output);

for (final toolCall in res.output.toolCalls) {
  final input = calculator.getInputFromJson(toolCall.arguments);
  final toolRes = await calculator.invoke(input);
  final toolMessage = ChatMessage.tool(
    toolCallId: toolCall.id,
    content: toolRes,
  );
  messages.add(toolMessage);
}

final res2 = await model.invoke(
  PromptValue.chat(messages),
);
print(res2.output.content);
// The calculations yield the following results:
// - 3 * 12 = 36
// - 11 + 49 = 60
```

### Few-shot prompting

For more complex tool use it’s very useful to add few-shot examples to the prompt. We can do this by adding `AIChatMessages` with `AIChatMessageToolCall` and corresponding `ToolChatMessage` to our prompt.

For example, let's say that instead of using `+` for addition and `*` for multiplication, we want to use the plus (➕) and (✖️) emojis. We can add a few-shot example to the prompt to teach the model how to use the plus emoji:

```dart
final calculator = CalculatorTool();
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    tools: [calculator],
  ),
);

final examples = [
  ChatMessage.humanText('Calculate 3 ✖️ 12 and 11 ➕ 49'),
  ChatMessage.ai(
    '',
    toolCalls: [
      AIChatMessageToolCall(
        id: 'call_1',
        name: 'calculator',
        argumentsRaw: '{"input": "3 * 12"}',
        arguments: {'input': '3 * 12'},
      ),
      AIChatMessageToolCall(
        id: 'call_2',
        name: 'calculator',
        argumentsRaw: '{"input": "11 + 49"}',
        arguments: {'input': '11 + 49'},
      ),
    ],
  ),
  ChatMessage.tool(toolCallId: 'call_1', content: '36'),
  ChatMessage.tool(toolCallId: 'call_2', content: '60'),
  ChatMessage.ai('The calculations yield the following results:\n- 3 ✖️ 12 = 36\n- 11 ➕ 49 = 60'),
];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are bad at math but are an expert at using a calculator. '
      'Use past tool usage as an example of how to correctly use the tools.'),
  (ChatMessageType.messagesPlaceholder, 'examples'),
  (ChatMessageType.human, '{query}'),
]);

final chain = promptTemplate.pipe(model).pipe(ToolsOutputParser());
final res = await chain.invoke({
  'query': 'Calculate 3 ✖️ 12 and 11 ➕ 49',
  'examples': examples,
});
print(res);
// [ParsedToolCall{
//   id: call_BtNoLk7IiQksMfad5897mSSu,
//   name: calculator,
//   arguments: {input: 3 * 12},
// }, ParsedToolCall{
//   id: call_ZAiFb1G71hwiwVvnqZFKHTuP,
//   name: calculator,
//   arguments: {input: 11 + 49},
// }]
```

The model interpreted the emojis correctly and returned the correct tool calls.
