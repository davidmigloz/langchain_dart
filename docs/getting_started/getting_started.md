# Quick start

This tutorial gives you a quick walkthrough about building an end-to-end language model application
with LangChain.

## Installation

To get started, add LangChain.dart dependency to your project:

```yaml
dependencies:
  langchain: { version }
```

Then, run `pub get` to install the package.

## Environment Setup

Using LangChain will usually require integrations with one or more model providers, data stores,
apis, etc.

For this example, we will be using OpenAI’s APIs, so we will first need to add LangChain.dart OpenAI
package:

```yaml
dependencies:
  langchain: { version }
  langchain_openai: { version }
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

final text = 'What would be a good company name for a company that makes colorful socks?';
print
(
await
llm
(
prompt
:
text
)
); // 'Feetful of Fun'
```

For more details on how to use LLMs within LangChain, see the
[LLM getting started guide](/#/modules/models/llms/getting_started).

### Prompt Templates: Manage prompts for LLMs

TODO

### Chains: Combine LLMs and prompts in multi-step workflows

TODO

### Agents: Dynamically Call Chains Based on User Input

TODO

### Memory: Add State to Chains and Agents

TODO

## Building a Language Model Application: Chat Models

TODO

### Get Message Completions from a Chat Model

TODO

### Chat Prompt Templates

TODO

### Chains with Chat Models

TODO

### Agents with Chat Models

TODO

### Memory: Add State to Chains and Agents

TODO
