# OpenAI

[OpenAI](https://platform.openai.com/docs/introduction) offers a spectrum of
models with different levels of power suitable for different tasks.

This example goes over how to use LangChain to interact with
OpenAI [models](https://platform.openai.com/docs/models).

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final llm = OpenAI(apiKey: openaiApiKey);
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
final chain = LLMChain(llm: llm, prompt: prompt);
final res = await chain.run('colorful socks');
// -> '\n\nSocktastic!'
```
