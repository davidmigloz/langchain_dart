# Streaming

Some chat models provide a streaming response. This means that instead of waiting for the entire response to be returned, you can start processing it as soon as it's available. This is useful if you want to display the response to the user as it's being generated, or if you want to process the response as it's being generated.

Example usage:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);
final chat = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatResult>();

final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456
// 789
```
