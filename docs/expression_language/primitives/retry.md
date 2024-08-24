# RunnableRetry : Retry a runnable if it failes


`RunnableRetry` is a Runnable that will retry if the operation failes, it is especially useful when a `invoke` or `batch` operation might fail due to transient errors.

In such cases, RunnableRetry will automatically retry the operation. By default the runnable will be retried 3 times with exponential backoff strategy but, this retry logic can be overriden by providing optional `RetryOptions`.

A `RunnableRetry` can be created using `Runnable.withRetry`

# Usage

## Creating a RunnableRetry

```dart
final model = ChatOpenAI();
final input = PromptValue.string('Explain why sky is blue in 2 lines');

final modelWithRetry = model.withRetry(RetryOptions());
final res = await modelWithRetry.invoke(input);
print(res);
/*
ChatResult{
  id: chatcmpl-9zmFYnu19Pd6ss3zVFHlKN71DILtx, 
  output: AIChatMessage{
  content: The sky appears blue due to Rayleigh scattering, where shorter wavelengths of sunlight (blue light) are scattered more than longer wavelengths (red light) by the molecules in the Earth's atmosphere. This scattering effect is most prominent when the sun is high in the sky.,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-mini-2024-07-18, created: 1724510508, system_fingerprint: fp_48196bc67a},
  usage: LanguageModelUsage{
  promptTokens: 16, 
  promptBillableCharacters: null, 
  responseTokens: 52, 
  responseBillableCharacters: null, 
  totalTokens: 68}
,
  streaming: false
}
*/
```

## with chain

RunnableRetry can be used to retry any Runnable, including a chain of Runnables, but in general it’s best practice to keep the scope of the retry as small as possible. For example, if you have a chain of Runnables, you should only retry the Runnable that is likely to fail, not the entire chain.

Example

```dart
  final promptTemplate =
      ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');
  final model = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
  );
  final modelWithRetry = model.withRetry(RetryOptions());
  final chain = promptTemplate.pipe(modelWithRetry);

  final res = await chain.batch(
    [
      {'topic': 'bears'},
      {'topic': 'cats'},
    ],
  );
  print(res);
  /*
  [ChatResult{
  id: chatcmpl-9zmjiMfHP2WP3PhM6YXdoHXS02ZAm, 
  output: AIChatMessage{
  content: Sure, here's a bear-themed joke for you:

Why did the bear refuse to play cards?

Because he was afraid he might get spotted—he couldn’t bear the tension! 🐻♠️,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-2024-05-13, created: 1724512378, system_fingerprint: fp_3aa7262c27},
  usage: LanguageModelUsage{
  promptTokens: 13, 
  promptBillableCharacters: null, 
  responseTokens: 41, 
  responseBillableCharacters: null, 
  totalTokens: 54}
,
  streaming: false
}, ChatResult{
  id: chatcmpl-9zmji1gxCZ4yR3UtX7Af4TBrRhPP1, 
  output: AIChatMessage{
  content: Sure, here's one for you:

Why did the cat sit on the computer?

Because it wanted to keep an eye on the mouse! 🐱🖱️,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-2024-05-13, created: 1724512378, system_fingerprint: fp_c9aa9c0491},
  usage: LanguageModelUsage{
  promptTokens: 13, 
  promptBillableCharacters: null, 
  responseTokens: 34, 
  responseBillableCharacters: null, 
  totalTokens: 47}
,
  streaming: false
}]
*/
```


## using RetryOptions

```dart
  // passing a fake model to cause Exception
  final input = PromptValue.string('Explain why sky is blue in 2 lines');
  final model = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'fake-model'),
  );
  final modelWithRetry = model.withRetry(
    RetryOptions(
      maxRetries: 3,
      addJitter: true,
    ),
  );
  final res = await modelWithRetry.invoke(input);
  print(res);
  // retried 3 times and returned Exception 
  /*
  retry attempt 0 with delay duration 0:00:01.082000
  retry attempt 1 with delay duration 0:00:02.073000
  retry attempt 2 with delay duration 0:00:04.074000
  Unhandled exception:
  Exception: Function failed to return response and max retries exceeded, Error: OpenAIClientException({
  "uri": "https://api.openai.com/v1/chat/completions",
  "method": "POST",
  "code": 404,
  "message": "Unsuccessful response",
  "body": {
    "error": {
      "message": "The model `fake-model` does not exist or you do not have access to it.",
      "type": "invalid_request_error",
      "param": null,
      "code": "model_not_found"
    }
  }
}) 
```

## Passing delay durations

Each entry in the delayDurations list corresponds to a specific
retry attempt, and the corresponding delay from the list will be used
instead of the default exponential delay.

```dart
  final input = PromptValue.string('Explain why sky is blue in 2 lines');
  final model = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'fake-model'),
  );
  final modelWithRetry = model.withRetry(
    RetryOptions(
      maxRetries: 3,
      addJitter: false,
      delayDurations: [
        const Duration(seconds: 1),
        const Duration(seconds: 2),
        const Duration(seconds: 3),
      ],
    ),
  );
  final res = await modelWithRetry.invoke(input);
  print(res);
  // retried with delays provided in RetryOptions
  /*
retry attempt 0 with delay duration 0:00:01.000000
retry attempt 1 with delay duration 0:00:02.000000
retry attempt 2 with delay duration 0:00:03.000000
Unhandled exception:
Exception: Function failed to return response and max retries exceeded, Error: OpenAIClientException({
  "uri": "https://api.openai.com/v1/chat/completions",
  "method": "POST",
  "code": 401,
  "message": "Unsuccessful response",
  "body": {
    "error": {
      "message": "You didn't provide an API key. You need to provide your API key in an Authorization header using Bearer auth (i.e. Authorization: Bearer YOUR_KEY), or as the password field (with blank username) if you're accessing the API from your browser and are prompted for a username and password. You can obtain an API key from https://platform.openai.com/account/api-keys.",
      "type": "invalid_request_error",
      "param": null,
      "code": null
    }
  }
})
*/
```
