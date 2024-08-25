# RunnableRetry : Retrying Runnables

`RunnableRetry` wraps a `Runnable` and retries it if it fails. It be created using `runnable.withRetry()`. 

By default, the runnable will be retried 3 times with exponential backoff strategy.

## Usage

## Creating a RunnableRetry

```dart
final model = ChatOpenAI();
final input = PromptValue.string('Explain why sky is blue in 2 lines');

final modelWithRetry = model.withRetry();
final res = await modelWithRetry.invoke(input);
print(res);
```

## Retrying a chain

`RunnableRetry` can be used to retry any `Runnable`, including a chain of `Runnable`s.

Example

```dart
final promptTemplate = ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');
final model = ChatOpenAI(
  defaultOptions: ChatOpenAIOptions(model: 'gpt-4o'),
);
final chain = promptTemplate.pipe(model).withRetry();

final res = await chain.batch(
  [
    {'topic': 'bears'},
    {'topic': 'cats'},
  ],
);
print(res);
```

> In general, it's best to keep the scope of the retry as small as possible.

## Configuring the retry

```dart
// passing a fake model to cause Exception
final input = PromptValue.string('Explain why sky is blue in 2 lines');
final model = ChatOpenAI(
  defaultOptions: ChatOpenAIOptions(model: 'fake-model'),
);
final modelWithRetry = model.withRetry(
    maxRetries: 3,
    addJitter: true,
);
final res = await modelWithRetry.invoke(input);
print(res);
// retried 3 times and returned Exception:
// OpenAIClientException({
//   "uri": "https://api.openai.com/v1/chat/completions",
//   "method": "POST",
//   "code": 404,
//   "message": "Unsuccessful response",
//   "body": {
//     "error": {
//       "message": "The model `fake-model` does not exist or you do not have access to it.",
//       "type": "invalid_request_error",
//       "param": null,
//       "code": "model_not_found"
//     }
//   }
// }) 
```

## Passing delay durations

If you want to use custom delay durations for each retry attempt, you can pass a list of `Duration` objects to the `delayDurations` parameter.

```dart
final input = PromptValue.string('Explain why sky is blue in 2 lines');
final model = ChatOpenAI(
  defaultOptions: ChatOpenAIOptions(model: 'fake-model'),
);
final modelWithRetry = model.withRetry(
    maxRetries: 3,
    delayDurations: [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
);
final res = await modelWithRetry.invoke(input);
print(res);
```
