# LLMs

Large Language Models (LLMs) are a core component of LangChain. LangChain does
not serve its own LLMs, but rather provides a standard interface for
interacting with many different LLMs.

For more detailed documentation check out our:
- **How-to guides**: Walkthroughs of core functionality, like streaming, async,
  etc.
- **Integrations**: How to use different LLM providers (OpenAI, Anthropic, 
  etc.).

## Get started

There are lots of LLM providers (OpenAI, Cohere, Hugging Face, etc) - the LLM 
class is designed to provide a standard interface for all of them.

In this walkthrough we'll work with an OpenAI LLM wrapper, although the 
functionalities highlighted are generic for all LLM types.

### Setup

To get started, follow
the [installation instructions](/get_started/installation.md) to install
LangChain.

Using LangChain will usually require integrations with one or more model
providers, data stores, APIs, etc. For this example, we'll use OpenAI's model
APIs.

First we'll need to add LangChain.dart OpenAI package:

```yaml
dependencies:
  langchain: { version }
  langchain_openai: { version }
```

Accessing the API requires an API key, which you can get by creating an account
and heading [here](https://platform.openai.com/account/api-keys).

The library does not force you to use any specific key management strategy. You
just need to pass the key on the `OpenAI` constructor:

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final llm = OpenAI(apiKey: openaiApiKey);
```

### `call`: string in -> string out

The simplest way to use an LLM is a callable: pass in a string, get a string 
completion.

```dart
final llmRes = await llm('Tell me a joke');
print(llmRes); // '\n\nWhy did the chicken cross the road?\n\nTo get to the other side.'
```

### `generate`: batch calls, richer outputs

`generate` lets you can call the model with a list of strings, getting back a 
more complete response than just the text. This complete response can include 
things like multiple top responses and other LLM provider-specific information:

```dart
final llmRes = await llm.generate('Tell me a joke');
print(llmRes.generations.first);
// [LLMGeneration(output='\n\nWhy did the chicken cross the road?\n\nTo get to the other side!')]
```

`usage` field contains the amount of tokens used for the generation. This is useful for
tracking usage and billing.

```dart
print(llmRes.usage?.totalUsage); // 641
```

You can also access provider specific information that is returned.
This information is NOT standardized across providers.

```dart
print(llmRes.modelOutput);
// {
//   id: cmpl-7PZIWeUBRWBe4DoPQt3BEWyw3vxsF, 
//   created: 2023-06-09 18:30:40.000,
//   model: text-ada-001
// }
```

### `generatePrompt`: generate from a `PromptValue`

```dart
final llmRes = await llm.generatePrompt(const StringPromptValue('Tell me a joke.'));
```
