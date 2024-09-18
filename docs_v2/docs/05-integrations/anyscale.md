# Anyscale

[Anyscale](https://www.anyscale.com/) offers a unified OpenAI-compatible API for a broad range of [models](https://docs.endpoints.anyscale.com/guides/models/#chat-models) running serverless or on your own dedicated instances.

It also allows to fine-tune models on your own data or train new models from scratch.

You can consume Anyscale API using the `ChatOpenAI` wrapper in the same way you would use the OpenAI API.

The only difference is that you need to change the base URL to `https://api.endpoints.anyscale.com/v1`:

```dart
final chatModel = ChatOpenAI(
  apiKey: anyscaleApiKey,
  baseUrl: 'https://api.endpoints.anyscale.com/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'meta-llama/Llama-2-70b-chat-hf',
  ),
);
```

## Invoke

```dart
final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that translates {input_language} to {output_language}.',
  ),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOpenAI(
  apiKey: anyscaleApiKey,
  baseUrl: 'https://api.endpoints.anyscale.com/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'meta-llama/Llama-2-70b-chat-hf',
  ),
);

final chain = promptTemplate | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> "I love programming" se traduit en français sous la forme "J'aime passionnément la programmation"
```

## Stream

```dart
final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
  ChatMessageType.system,
  'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatOpenAI(
  apiKey: anyscaleApiKey,
  baseUrl: 'https://api.endpoints.anyscale.com/v1',
  defaultOptions: const ChatOpenAIOptions(
    model: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ...
// 9
```
