# OpenRouter

[OpenRouter](https://openrouter.ai/) offers a unified OpenAI-compatible API for a broad range of [models](https://openrouter.ai/models).

You can also let users pay for their own models via their [OAuth PKCE](https://openrouter.ai/docs#oauth) flow.

You can consume OpenRouter API using the `ChatOpenAI` wrapper in the same way you would use the OpenAI API.

The only difference is that you need to change the base URL to `https://openrouter.ai/api/v1`:

```dart
final chatModel = ChatOpenAI(
  apiKey: openRouterApiKey,
  baseUrl: 'https://openrouter.ai/api/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/mistral-small',
  ),
);
```

OpenRouter allows you to specify an optional `HTTP-Referer` header to identify your app and make it discoverable to users on openrouter.ai. You can also include an optional `X-Title` header to set or modify the title of your app.

```dart
 final chatModel = ChatOpenAI(
  apiKey: openRouterApiKey,
  baseUrl: 'https://openrouter.ai/api/v1',
  headers: {
    'HTTP-Referer': 'com.myapp',
    'X-Title': 'OpenRouterTest',
  },
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/mistral-small',
  ),
);
```

## Invoke

```dart
final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that translates {input_language} to {output_language}.',
  ),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOpenAI(
  apiKey: openRouterApiKey,
  baseUrl: 'https://openrouter.ai/api/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/mistral-small',
  ),
);

final chain = promptTemplate | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'aime la programmation.'
```

## Stream

```dart
final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatOpenAI(
  apiKey: openRouterApiKey,
  baseUrl: 'https://openrouter.ai/api/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/mistral-small',
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456789
```

## Tool calling

OpenRouter supports [tool calling](https://openrouter.ai/docs#tool-calls). 

Check the [docs](/modules/model_io/models/chat_models/how_to/tools.md) for more information on how to use tools.

In the following example we use the `joke` tool to generate jokes. We stream the joke generation using the `ToolsOutputParser' which tries to "auto-complete" the partial json from each chunk into a valid state.

```dart
final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];
const tool = ToolSpec(
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
        'description': 'The punchline to the joke',
      },
    },
    'required': ['location', 'punchline'],
  },
);
final promptTemplate = ChatPromptTemplate.fromTemplate(
  'tell me a long joke about {foo}',
);
final chat = ChatOpenAI(
  apiKey: openRouterApiKey,
  baseUrl: 'https://openrouter.ai/api/v1',
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4o',
    tools: [tool],
    toolChoice: ChatToolChoice.forced(name: 'joke'),
  ),
);
final outputParser = ToolsOutputParser();

final chain = promptTemplate.pipe(chat).pipe(outputParser);

final stream = chain.stream({'foo': 'bears'});
await for (final chunk in stream) {
  final args = chunk.first.arguments;
  print(args);
}
// {}
// {setup: }
// {setup: Why don't}
// {setup: Why don't bears}
// {setup: Why don't bears like fast food}
// {setup: Why don't bears like fast food?, punchline: }
// {setup: Why don't bears like fast food?, punchline: Because}
// {setup: Why don't bears like fast food?, punchline: Because they can't}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
```
