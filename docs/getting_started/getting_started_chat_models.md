# Quick start: using Chat Models

Chat models are a variation on language models. While chat models use language models under the 
hood, the interface they expose is a bit different. Rather than expose a "text in, text out" API, 
they expose an interface where "chat messages" are the inputs and outputs.

## Installation and Setup

To get started, follow the [installation instructions](/getting_started/installation.md) to install
LangChain.

For this example, we will be using OpenAI’s APIs, so we will first need to add LangChain.dart OpenAI
package:

```yaml
dependencies:
  langchain: {version}
  langchain_openai: {version}
```

For using OpenAI’s APIs, you will need to have an OpenAI account and an API key.

The library does not force you to use any specific key management strategy. You just need to pass
the key on the `OpenAI` constructor:

```dart  
final llm = ChatOpenAI(apiKey: openaiApiKey);
```

## Building a Language Model Application: Chat Models

Now that we have installed LangChain and set up our environment, we can start building our Chat 
Model application.

### Get Message Completions from a Chat Model

You can get chat completions by passing one or more messages to the chat model. The response will 
be a `ChatMessage`. The types of messages currently supported in LangChain are `AIChatMessage`, 
`HumanChatMessage`, `SystemChatMessage`, and `CustomChatMessage` – `CustomChatMessage` takes in an 
arbitrary role parameter. Most of the time, you’ll just be dealing with `HumanChatMessage`, 
`AIChatMessage`, and `SystemChatMessage`.

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
```

You can get completions by passing in a single message.

```dart
final usrMsg = ChatMessage.human(
  'Translate this sentence from English to French. I love programming.',
);
final aiMsg = await chat([usrMsg]);
print(aiMsg); 
// -> AIChatMessage(content="J'aime programmer.") 
```

You can also pass in multiple messages for OpenAI’s gpt-3.5-turbo and gpt-4 models.

```dart
final messages = [
  ChatMessage.system('You are a helpful assistant that translates English to French'),
  ChatMessage.human('I love programming.'),
];
final aiMsg = await chat(messages);
print(aiMsg);
// -> AIChatMessage(content="J'aime programmer.") 
```

The `generate` returns a `ChatResult` object instead of a `ChatMessage`. This object contains some 
additional metadata about the generation (e.g. token usage).

```dart
final res = await chat.generate(messages);
print(res.tokensUsage);
// -> 35
print(res.modelOutput);
// -> {id: chatcmpl-7QxpM8wbmfSAuLGacxlt9S8DRNycE, created: 2023-06-13 14:54:20.000, model: gpt-3.5-turbo}
```

For more details on how to use Chat Models within LangChain, see the
[Chat Models getting started guide](/modules/models/chat_models/getting_started.md).

### Chat Prompt Templates

Similar to LLMs, you can make use of templating by using a `MessagePromptTemplate`. You can build a 
`ChatPromptTemplate` from one or more `MessagePromptTemplate`s. You can use `ChatPromptTemplate`’s 
`formatPrompt` – this returns a `PromptValue`, which you can convert to a string or `ChatMessage` 
object, depending on whether you want to use the formatted value as input to an LLM or Chat model.

For convenience, there is a `fromTemplate` method exposed on the template. If you were to use this 
template, this is what it would look like:

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toChatMessages();

final aiMsg = chat(formattedPrompt);
// -> AIChatMessage(content="J'aime programmer.")
```

For more details on how to use Chat Prompt Templates, see the
[Chat Prompt Templates getting started guide](/modules/prompts/chat_prompt_templates/chat_prompt_templates.md).

### Chains with Chat Models

The `LLMChain` discussed in the above section can be used with chat models as well:

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);

final chain = LLMChain(llm: chat, prompt: chatPrompt);

final res = await chain.run({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
});
print(res);
// -> 'J'adore la programmation.'
```

For more details, check out the
[Chains getting started guide](/modules/chains/getting_started.md).

### Agents with Chat Models

TODO

### Memory: Add State to Chains and Agents

You can use Memory with chains and agents initialized with chat models. The main difference between 
this and Memory for LLMs is that rather than trying to condense all previous messages into a 
string, we can keep them as their own unique memory object.

```dart
final output1 = await conversation.run('Hi there!');
print(output1);
// -> 'Hello! How can I assist you today?'
final output2 = await conversation.run(
  "I'm doing well! Just having a conversation with an AI.",
);
print(output2);
// -> 'That sounds like fun! I'm happy to chat with you. Is there anything 
// specific you'd like to talk about?'
final output3 = await conversation.run(
  'Tell me about yourself',
);
print(output3);
// -> 'Sure! I am an AI language model created by OpenAI. I was trained on a 
// large dataset of text from the internet, which allows me to understand and 
// generate human-like language. I can answer questions, provide information, 
// and even have conversations like this one. Is there anything else you'd 
// like to know about me?'
```
