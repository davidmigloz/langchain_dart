# Chat models

Chat models are a variation on language models. While chat models use language
models under the hood, the interface they expose is a bit different. Rather than
expose a "text in, text out" API, they expose an interface where "chat messages"
are the inputs and outputs.

Chat model APIs are fairly new, so we are still figuring out the correct
abstractions.

The following sections of documentation are provided:

- **How-to guides**: Walkthroughs of core functionality, like streaming,
  creating chat prompts, etc.
- **Integrations**: How to use different chat model providers (OpenAI,
  Anthropic, etc).

## Get started

### Setup

For this guide, we will work with an OpenAI chat model wrapper, although the functionalities
highlighted are generic for all LLM types.

To use LangChain you need to import the `langchain` package. As we are integrating with OpenAI,
we also need to import the `langchain_openai` package.
```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
```

We can then instantiate the chat model:
```dart
final chatModel = final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    temperature: 0,
  ),
);
```

### Messages

The chat model interface is based around messages rather than raw text. The 
types of messages currently supported in LangChain are `AIChatMessage`, 
`HumanChatMessage`, `SystemChatMessage`, and `CustomChatMessage` – 
`CustomChatMessage` takes in an  arbitrary role parameter. Most of the time, 
you’ll just be dealing with `HumanChatMessage`, `AIChatMessage`, and 
`SystemChatMessage`.

### LCEL

LLMs implement the `Runnable` interface, the basic building block of the LangChain Expression Language (LCEL). This means they support `invoke`, `stream`, and `batch` calls.

```dart
final messages = [
  ChatMessage.humanText(
    'Translate this sentence from English to French. I love programming.',
  ),
];
final prompt = PromptValue.chat(messages);
final chatRes = await chatModel.invoke(prompt);
// -> [ChatGeneration{
//       output: AIChatMessage{content: J'adore la programmation., example: false},
//       generationInfo: {index: 0, finish_reason: stop}}]
```

OpenAI’s chat model supports multiple messages as input. See [here](https://platform.openai.com/docs/guides/gpt/chat-completions-vs-completions) for more information. Here is an example of sending a system and user message to the chat model:

```dart
final messages = [
  ChatMessage.system('You are a helpful assistant that translates English to French.'),
  ChatMessage.humanText('I love programming.')
];
final prompt = PromptValue.chat(messages);
final chatRes = await chatModel.invoke(prompt);
print(chatRes);
// -> [ChatGeneration{
//       output: AIChatMessage{content: J'adore la programmation., example: false},
//       generationInfo: {index: 0, finish_reason: stop}}]
```

The `invoke` API return an `ChatResult` which contains a `ChatGeneration`
object with the `output` messages and some metadata about the generation. It 
also contains some additional information like `usage` and `modelOutput`.

```dart
final chatRes1 = await chat.generate(messages);
print(chatRes1.generations);
// -> [ChatGeneration{
//       output: AIChatMessage{content: J'adore la programmation., example: false},
//       generationInfo: {index: 0, finish_reason: stop}}]
print(chatRes1.usage?.totalTokens);
// -> 36
print(chatRes1.modelOutput);
// -> {id: chatcmpl-7QHTjpTCELFuGbxRaazFqvYtepXOc, created: 2023-06-11 17:41:11.000, model: gpt-3.5-turbo}
```
