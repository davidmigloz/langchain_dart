# Getting Started

This section covers how to get started with chat models. The interface is based around messages 
rather than raw text.

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
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
```

You can get chat completions by passing one or more messages to the chat model. The response will 
be a message. The types of messages currently supported in LangChain are `AIChatMessage`, 
`HumanChatMessage`, `SystemChatMessage`, and `CustomChatMessage` – `CustomChatMessage` takes in an 
arbitrary role parameter. Most of the time, you’ll just be dealing with `HumanChatMessage`, 
`AIChatMessage`, and `SystemChatMessage`.

```dart
final messages = [
  ChatMessage.human(
    'Translate this sentence from English to French. I love programming.',
  ),
];
final chatRes = await chat(messages);
// -> AIChatMessage{content: J'aime programmer., example: false}
```

OpenAI’s chat model supports multiple messages as input. 
See [here](https://platform.openai.com/docs/guides/gpt/chat-completions-vs-completions) for more 
information. Here is an example of sending a system and user message to the chat model:

```dart
final messages = [
  ChatMessage.system('You are a helpful assistant that translates English to French.'),
  ChatMessage.human('I love programming.')
];
final chatRes = await chat(messages);
print(chatRes);
// -> AIChatMessage{content: J'adore la programmation., example: false}
```

The `generate` and `generatePrompt` APIs return an `ChatResult` which contains a `ChatGeneration` 
object with the `output` messages and some metadata about the generation. It also contains some  
additional information like `tokensUsage` and `modelOutput`.

```dart
final chatRes1 = await chat.generate(messages);
print(chatRes1.generations);
// -> [ChatGeneration{
//       output: AIChatMessage{content: J'adore la programmation., example: false},
//       generationInfo: {index: 0, finish_reason: stop}}]
print(chatRes1.tokensUsage);
// -> 36
print(chatRes1.modelOutput);
// -> {id: chatcmpl-7QHTjpTCELFuGbxRaazFqvYtepXOc, created: 2023-06-11 17:41:11.000, model: gpt-3.5-turbo}

final chatRes2 = await chat.generatePrompt(ChatPromptValue(messages));
print(chatRes2.generations);
print(chatRes2.tokensUsage);
print(chatRes2.modelOutput);
```

## PromptTemplates

You can make use of templating by using a `ChatMessagePromptTemplate`. You can build a 
`ChatPromptTemplate` from one or more `ChatMessagePromptTemplate`s. You can use 
`ChatPromptTemplate`’s `formatPrompt()` – this returns a `PromptValue`, which you can convert to a 
string or `ChatMessage` object, depending on whether you want to use the formatted value as input 
to an LLM or Chat model.

For convenience, there is a `fromTemplate()` method exposed on the template. If you were to use 
this template, this is what it would look like:

```dart
const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const  humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages(
  [systemMessagePrompt, humanMessagePrompt],
);
final chatRes = await chat(
  chatPrompt.formatPrompt({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.'
  }).toChatMessages(),
);
print(chatRes);
// -> AIChatMessage{content: J'adore la programmation., example: false}
```

If you wanted to construct the `MessagePromptTemplate` more directly, you could create a 
`PromptTemplate` outside and then pass it in, eg:

```dart
final prompt= PromptTemplate.fromTemplate(
  'You are a helpful assistant that translates {input_language} to {output_language}.',
);
final systemMessagePrompt = SystemChatMessagePromptTemplate(prompt: prompt);
```
