# Together AI

[Together AI](https://www.together.ai) offers a unified OpenAI-compatible API for a broad range of [models](https://api.together.xyz/playground) running serverless or on your own dedicated instances.

It also allows to fine-tune models on your own data or train new models from scratch.

You can consume Together AI API using the `ChatOpenAI` wrapper in the same way you would use the OpenAI API.

The only difference is that you need to change the base URL to `https://api.together.xyz/v1`:

```dart
final chatModel = ChatOpenAI(
  apiKey: togetherAiApiKey,
  baseUrl: 'https://api.together.xyz/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/Mistral-7B-Instruct-v0.2',
  ),
);
```

## Invoke

```dart
final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that translates {input_language} to {output_language}.',
  ),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOpenAI(
  apiKey: togetherAiApiKey,
  baseUrl: 'https://api.together.xyz/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/Mistral-7B-Instruct-v0.2',
  ),
);

final chain = promptTemplate | chatModel | const StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'aime programmer'
```

## Stream

```dart
final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatOpenAI(
  apiKey: togetherAiApiKey,
  baseUrl: 'https://api.together.xyz/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/Mistral-7B-Instruct-v0.2',
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ...
// 9
```
