# Getting Started

One of the core value props of LangChain is that it provides a standard interface to models.
- Language Models: good for text generation.
- Text Embedding Models: good for turning text into a numerical representation.

## Language Models

There are two different sub-types of Language Models:
- LLMs: these wrap APIs which take text in and return text.
- ChatModels: these wrap models which take chat messages in and return a chat message.

This is a subtle difference, but a value proposition of LangChain is that we provide a unified 
interface across these. This is nice because although the underlying APIs are actually quite 
different, you often want to use them interchangeably.

To see this, let's look at `OpenAI` (a wrapper around OpenAI's LLM) vs `ChatOpenAI` (a wrapper 
around OpenAI's ChatModel).

To use LangChain you need to import the `langchain` package. As we are integrating with OpenAI, 
we also need to import the `langchain_openai` package.
```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
```

We can then instantiate the models:
```dart
final llm = OpenAI(apiKey: openaiApiKey);
final chatModel = OpenAIChat(apiKey: openaiApiKey);
```

### `text` -> `text` interface

````dart
final llmRes = await llm.predict(text: 'say hi!');
print(llmRes);
// '\n\nHi there!'

final chatRes = await chatModel.predict(text: 'say hi!');
print(chatRes);
// 'Hi! Hello there! How can I assist you today?'
````

### `messages` -> `messages` interface

```dart
final llmRes = await llm.predictMessages(messages: [HumanMessage(content: 'say hi!')]);
print(llmRes); // [AIMessage(content: '\n\nHi there! How can I help you?')]

final chatRes = await chatModel.predictMessages(messages: [HumanMessage(content: 'say hi!')]);
print(chatRes); // [AIMessage(content: '\n\nHi there! How can I help you?')]
```
