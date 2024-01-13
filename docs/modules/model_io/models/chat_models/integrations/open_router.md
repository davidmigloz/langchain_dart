# OpenRouter

[OpenRouter](https://openrouter.ai/) offers a unified OpenAI-compatible API for a broad range of models.

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

final chain = promptTemplate | chatModel | const StringOutputParser();

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

final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456789
```
