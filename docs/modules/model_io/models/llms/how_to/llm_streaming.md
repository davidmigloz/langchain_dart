# Streaming

Some LLMs provide a streaming response. This means that instead of waiting for the entire response to be returned, you can start processing it as soon as it's available. This is useful if you want to display the response to the user as it's being generated, or if you want to process the response as it's being generated.

Example usage:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = PromptTemplate.fromTemplate(
  'List the numbers from 1 to {max_num} in order without any spaces or commas',
);
final llm = OpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<LLMResult>();

final chain = promptTemplate | llm | stringOutputParser;

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 45
// 67
// 89
```
