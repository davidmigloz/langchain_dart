# OpenAI

[OpenAI](https://platform.openai.com/docs/introduction) offers a spectrum of
models with different levels of power suitable for different tasks.

This example goes over how to use LangChain to interact with
OpenAI [models](https://platform.openai.com/docs/models).

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
final llm = OpenAI(apiKey: openaiApiKey);

final chain = prompt | llm | const StringOutputParser();

final res = await chain.invoke({'product': 'colorful socks'});
print(res);
// -> '\n\nSocktastic!'
```

## Streaming

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = PromptTemplate.fromTemplate(
  'List the numbers from 1 to {max_num} in order without any spaces or commas',
);
final llm = OpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<String>();

final chain = promptTemplate | llm | stringOutputParser;

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 45
// 67
// 89
```
