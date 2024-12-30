# Fallbacks

When working with language models, you may often encounter issues from the underlying APIs, e.g. rate limits or downtime. Therefore, as you move your LLM applications into production it becomes more and more important to have contingencies for errors. That's why we've introduced the concept of fallbacks.

Crucially, fallbacks can be applied not only on the LLM level but on the whole runnable level. This is important because often times different models require different prompts. So if your call to OpenAI fails, you don't just want to send the same prompt to Anthropic - you probably want to use e.g. a different prompt template.

## Handling LLM API errors with fallbacks

This is maybe the most common use case for fallbacks. A request to an LLM API can fail for a variety of reasons - the API could be down, you could have hit a rate limit, or any number of things.  This Situation can be handled using Fallbacks.

Fallbacks can be created using  `withFallbacks()` function on the runnable that you are working on, for example `final runnablWithFallbacks = mainRunnable.withFallbacks([fallback1, fallback2])` this would create a `RunnableWithFallback` along with a list of fallbacks. When it is invoked, the `mainRunnable` would be called first, if it fails then fallbacks would be invoked sequentially until one of the fallback in list return output. If the `mainRunnable` succeeds and returns output then the fallbacks won't be called. 

## Fallback for chat models

```dart
// fake model will throw error during invoke and fallback model will be called
final fakeOpenAIModel = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'tomato'),
);

final latestModel = ChatOpenAI(
  defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
);

final modelWithFallbacks = fakeOpenAIModel.withFallbacks([latestModel]);

final prompt = PromptValue.string('Explain why sky is blue in 2 lines');

final res = await modelWithFallbacks.invoke(prompt);
print(res);
/*
{
  "ChatResult": {
    "id": "chatcmpl-9nKBcFNkzo5qUrdNB92b36J0d1meA",
    "output": {
      "AIChatMessage": {
        "content": "The sky appears blue because molecules in the Earth's atmosphere scatter shorter wavelength blue light from the sun more effectively than longer wavelengths like red. This scattering process is known as Rayleigh scattering.",
        "toolCalls": []
      }
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721542696,
      "system_fingerprint": "fp_400f27fa1f"
    },
    "usage": {
      "LanguageModelUsage": {
        "promptTokens": 16,
        "promptBillableCharacters": null,
        "responseTokens": 36,
        "responseBillableCharacters": null,
        "totalTokens": 52
      }
    },
    "streaming": false
  }
}
*/
```

Note: if the options provided when invoking the runnable with fallbacks are not compatible with some of the fallbacks, they will be ignored. If you want to use different options for different fallbacks, provide them as `defaultOptions` when instantiating the fallbacks or use `bind()`. 

## Fallbacks for RunnableSequences with batch

```dart
final fakeOpenAIModel = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'tomato'),
);

final latestModel = ChatOpenAI(
  defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
);

final promptTemplate = ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');

final badChain = promptTemplate.pipe(fakeOpenAIModel);
final goodChain = promptTemplate.pipe(latestModel);

final chainWithFallbacks = badChain.withFallbacks([goodChain]);

final res = await chainWithFallbacks.batch(
  [
    {'topic': 'bears'},
    {'topic': 'cats'},
  ],
);
print(res);
/*
[
  {
    "id": "chatcmpl-9nKncT4IpAxbUxrEqEKGB0XUeyGRI",
    "output": {
      "content": "Sure! How about this one?\n\nWhy did the bear bring a suitcase to the forest?\n\nBecause it wanted to pack a lunch! 🐻🌲",
      "toolCalls": []
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721545052,
      "system_fingerprint": "fp_400f27fa1f"
    },
    "usage": {
      "promptTokens": 13,
      "promptBillableCharacters": null,
      "responseTokens": 31,
      "responseBillableCharacters": null,
      "totalTokens": 44
    },
    "streaming": false
  },
  {
    "id": "chatcmpl-9nKnc58FpXFTPkzZfm2hHxJ5VSQQh",
    "output": {
      "content": "Sure, here's a cat joke for you:\n\nWhy was the cat sitting on the computer?\n\nBecause it wanted to keep an eye on the mouse!",
      "toolCalls": []
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721545052,
      "system_fingerprint": "fp_c4e5b6fa31"
    },
    "usage": {
      "promptTokens": 13,
      "promptBillableCharacters": null,
      "responseTokens": 29,
      "responseBillableCharacters": null,
      "totalTokens": 42
    },
    "streaming": false
  }
]
*/
```
