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

**Generate:** More broadly, you can call it with a list of inputs, getting back a more complete 
response than just the text. This complete response includes things like multiple top responses, 
as well as LLM provider specific information.

```dart
final llmRes = await llm.generate(
  [
    'Tell me a joke',
    'Tell me a poem',
    'Tell me a compliment',
    'Tell me a short story',
  ],
);
print(llmRes.generations.length); // 4
print(llmRes.generations.first);
// [Generation(text='\n\nWhy did the chicken cross the road?\n\nTo get to the other side!'),
//  Generation(text='\n\nWhy did the chicken cross the road?\n\nTo get to the other side.')]
print(llmRes.generations.last);
// [Generation(text='\n\nAbout a time when you were in a group\n\nI was in a group when I 
// was there for a while. We were into some guy's stuff, and he would post about it all on 
// the social media. I never heard back from him for forever. I just felt like he was after me.'),
//  Generation(text='\n\nAbout the MPEG Codec Library\n\nThe MPEG Codec Library is a collection 
//  of fix, stream and stream streaming algorithms that can be used in digital TVs, movies, 
//  music and other applications.')]
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
