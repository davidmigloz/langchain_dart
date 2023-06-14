# Quick start: using LLMs

This tutorial gives you a quick walkthrough about building an end-to-end Large Language Model 
application with LangChain.

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
final llm = OpenAI(apiKey: openaiApiKey);
```

## Building a Language Model Application

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

So far, all the chains and agents we’ve gone through have been stateless. But often, you may want a 
chain or agent to have some concept of “memory” so that it may remember information about its 
previous interactions. The clearest and simple example of this is when designing a chatbot - you 
want it to remember previous messages so it can use context from that to have a better 
conversation. This would be a type of “short-term memory”. On the more complex side, you could 
imagine a chain/agent remembering key pieces of information over time - this would be a form of 
“long-term memory”. For more concrete ideas on the latter, see this awesome paper.

LangChain provides several specially created chains just for this purpose. This notebook walks 
through using one of those chains (the `ConversationChain`) with two different types of memory.

By default, the `ConversationChain` has a simple type of memory that remembers all previous 
inputs/outputs and adds them to the context that is passed. Let’s take a look at using this chain.

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0);
final conversation = ConversationChain(llm: llm);
final output = await conversation.run('Hi there!');
print(output);
// -> 'Hello! How are you today?'
```

Under the hood, the chain has formatted the prompt with the input and then passed it to the LLM.
```dart
> Entering new chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and 
provides lots of specific details from its context. If the AI does not know the answer to a 
question, it truthfully says it does not know.

Current conversation:

Human: Hi there!
AI:

> Finished chain.
' Hello! How are you today?'
```

As it was the first message, 'Current conversation' is still empty. If we send another message, we
can see that the chain remembers the previous message and adds it to the context.

```dart
final output1 = await conversation.run(
  "I'm doing well! Just having a conversation with an AI.",
);
print(output1);
// -> 'That's great! What would you like to talk about?'
```

Under the hood:

```dart
> Entering new chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and 
provides lots of specific details from its context. If the AI does not know the answer to a 
question, it truthfully says it does not know.

Current conversation:

Human: Hi there!
AI:  Hello! How are you today?
Human: I'm doing well! Just having a conversation with an AI.
AI:

> Finished chain.
" That's great! What would you like to talk about?"
```
