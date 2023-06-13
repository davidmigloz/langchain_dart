# Getting Started

This section covers how to use the LLM class in LangChain.

The LLM class is a class designed for interfacing with LLMs. There are lots of LLM providers 
(OpenAI, Cohere, Hugging Face, etc) - this class is designed to provide a standard interface for 
all of them. In this part of the documentation, we will focus on generic LLM functionality.

For this guide, we will work with an OpenAI LLM wrapper, although the functionalities highlighted 
are generic for all LLM types.

To use LangChain you need to import the `langchain` package. As we are integrating with OpenAI,
we also need to import the `langchain_openai` package.
```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
```

We can then instantiate the model:
```dart
final llm = OpenAI(apiKey: openaiApiKey, model: 'text-ada-001', n: 2, bestOf: 2);
```

**Generate Text:** The most basic functionality an LLM has is just the ability to call it, passing 
in a string and getting back a string.

```dart
final llmRes = await llm('Tell me a joke');
print(llmRes); // '\n\nWhy did the chicken cross the road?\n\nTo get to the other side.'
```

**Generate:** More broadly, you can call it with an input, getting back a more complete 
response than just the text. This complete response includes things like multiple top responses, 
as well as LLM provider specific information.

```dart
final llmRes = await llm.generate('Tell me a joke');
print(llmRes.generations.first);
// [LLMGeneration(output='\n\nWhy did the chicken cross the road?\n\nTo get to the other side!')]
```

`tokensUsage` field contains the amount of tokens used for the generation. This is useful for
tracking usage and billing.

```dart
print(llmRes.tokensUsage); // 641
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

**Generate PromptValue:** You can also generate from a `PromptValue`. 

```dart
final llmRes = await llm.generatePrompt(const StringPromptValue('Tell me a joke.'));
```
