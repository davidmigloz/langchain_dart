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
final chatModel = ChatOpenAI(apiKey: openaiApiKey);
```

### `text` -> `text` interface

```dart
final llmRes = await llm.generatePrompt(const StringPromptValue('say hi!'));
print(llmRes.generations.first.first.output);
// -> 'Hi there! How can I help you?'

final chatRes = await chatModel.generatePrompt(const StringPromptValue('say hi!'));
print(chatRes.generations.first.output);
// -> AIChatMessage{content: 'Hello! How can I assist you today?'}
```

As it is the main functionality of the LLM, we also provide a shorthand:
````dart
final llmRes = await llm('say hi!');
print(llmRes);
// -> '\n\nHi there!'
````

### `messages` -> `messages` interface

```dart
final llmRes = await llm.generatePrompt(ChatPromptValue([ChatMessage.humanText('say hi!')]));
print(llmRes.generations.first.first.output);
// -> 'Robot: Hi there!'

final chatRes = await chatModel.generatePrompt(ChatPromptValue([ChatMessage.humanText('say hi!')]));
print(chatRes.generations.first.output);
// -> AIChatMessage{content: 'Hello there! How may I assist you today?'}
```

As it is the main functionality of the Chat model, we also provide a shorthand:
```dart
final chatRes = await chatModel([ChatMessage.humanText('say hi!')]);
print(chatRes); // [ChatMessage.ai(content: '\n\nHi there! How can I help you?')]
```
