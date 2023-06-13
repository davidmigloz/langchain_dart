# Quick start

This tutorial gives you a quick walkthrough about building an end-to-end language model application
with LangChain.

## Installation

To get started, add LangChain.dart dependency to your project `pubspec.yaml` file:

```yaml
dependencies:
  langchain: {version}
```

Then, run `pub get` to install the package.

## Environment Setup

Using LangChain will usually require integrations with one or more model providers, data stores,
apis, etc.

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
final llm = OpenAI(apiKey: openaiApiKey);
```

## Building a Language Model Application: LLMs

Now that we have installed LangChain and set up our environment, we can start building our language
model application.

LangChain provides many modules that can be used to build language model applications. Modules can
be combined to create more complex applications, or be used individually for simple applications.

### LLMs: Get predictions from a language model

The most basic building block of LangChain is calling an LLM on some input. Let’s walk through a
simple example of how to do this. For this purpose, let’s pretend we are building a service that
generates a company name based on what the company makes.

In order to do this, we first need to import the LLM wrapper.

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
```

We can then initialize the wrapper with any arguments. In this example, we probably want the
outputs to be MORE random, so we’ll initialize it with a HIGH temperature.

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
```

We can now call it on some input!

```dart
const text = 'What would be a good company name for a company that makes colorful socks?';
print(await llm(text)); // 'Feetful of Fun'
```

For more details on how to use LLMs within LangChain, see the
[LLM getting started guide](/modules/models/llms/getting_started.md).

### Prompt Templates: Manage prompts for LLMs

Calling an LLM is a great first step, but it’s just the beginning. Normally when you use an LLM in 
an application, you are not sending user input directly to the LLM. Instead, you are probably 
taking user input and constructing a prompt, and then sending that to the LLM.

For example, in the previous example, the text we passed in was hardcoded to ask for a name for a 
company that made colorful socks. In this imaginary service, what we would want to do is take only 
the user input describing what the company does, and then format the prompt with that information.

This is easy to do with LangChain!

First lets define the prompt template:
```dart
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
```

Let’s now see how this works! We can call the `.format` method to format it.

```dart
print(prompt.format({'product': 'colorful socks'}));
// What is a good name for a company that makes colorful socks?
```

For more details on how to use Prompt Templates, see the 
[Prompt Templates getting started guide](/modules/prompts/getting_started.md).

### Chains: Combine LLMs and prompts in multi-step workflows

Up until now, we’ve worked with the `PromptTemplate` and LLM primitives by themselves. But of 
course, a real application is not just one primitive, but rather a combination of them.

A chain in LangChain is made up of links, which can be either primitives like LLMs or other chains.

The most core type of chain is an `LLMChain`, which consists of a `PromptTemplate` and an LLM.

Extending the previous example, we can construct an `LLMChain` which takes user input, formats it
with a PromptTemplate, and then passes the formatted response to an LLM.

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
```

We can now create a very simple chain that will take user input, format the prompt with it, and 
then send it to the LLM:

```dart
final chain = LLMChain(prompt: prompt, llm: llm);
```

Now we can run that chain only specifying the product!

```dart
final res = await chain.run('colorful socks');
// -> '\n\nSocktastic!'
```

There we go! There’s the first chain - an `LLMChain`. This is one of the simpler types of chains, 
but understanding how it works will set you up well for working with more complex chains.

For more details, check out the 
[Chains getting started guide](/modules/chains/getting_started.md).

### Agents: Dynamically Call Chains Based on User Input

TODO

### Memory: Add State to Chains and Agents

TODO

## Building a Language Model Application: Chat Models

Similarly, you can use chat models instead of LLMs. Chat models are a variation on language models. 
While chat models use language models under the hood, the interface they expose is a bit different: 
rather than expose a “text in, text out” API, they expose an interface where “chat messages” are 
the inputs and outputs.

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

TODO
