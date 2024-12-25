# RunnableSequence: Chaining runnables

One key advantage of the `Runnable` interface is that any two runnables can be “chained” together into sequences. The output of the previous runnable’s `.invoke()` call is passed as input to the next runnable. This can be done using the `.pipe()` method (or the `|` operator, which is a convenient shorthand for `.pipe()`). The resulting `RunnableSequence` is itself a runnable, which means it can be invoked, streamed, or piped just like any other runnable.

> Note: when using the `|` operator, the output type of the last runnable is always resolved to `Object` because of [Dart limitations](https://github.com/dart-lang/language/issues/1044). If you need to preserve the output type, use the `.pipe()` method instead.

## The pipe operator

To show off how this works, let’s go through an example. We’ll walk through a common pattern in LangChain: using a prompt template to format input into a chat model, and finally converting the chat message output into a string with an output parser.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final chain = promptTemplate.pipe(model).pipe(outputParser);
```

Prompts and models are both runnable, and the output type from the prompt call is the same as the input type of the chat model, so we can chain them together. We can then invoke the resulting sequence like any other runnable:

```dart
final res = await chain.invoke({'topic': 'bears'});
print(res);
// Why don't bears wear socks?
// Because they have bear feet!
```

## Formatting inputs & output

We can even combine this chain with more runnables to create another chain. This may involve some input/output formatting using other types of runnables, depending on the required inputs and outputs of the chain components.

For example, let’s say we wanted to compose the joke generating chain with another chain that evaluates whether the generated joke was funny.

We would need to be careful with how we format the input into the next chain. In the below example, we use a `RunnableMap` which runs all of its values concurrently and returns a map with the results which can then be passed to the prompt template.

```dart
final analysisPrompt = ChatPromptTemplate.fromTemplate(
  'is this a funny joke? {joke}',
);
final composedChain = Runnable.fromMap({
  'joke': chain,
}).pipe(analysisPrompt).pipe(model).pipe(outputParser);

final res1 = await composedChain.invoke({'topic': 'bears'});
print(res1);
// Some people may find this joke funny, especially if they enjoy puns or wordplay...
```

Instead of using `Runnable.fromMap`, we can use the convenience method `Runnable.getMapFromInput` which will automatically create a `RunnableMap` placing the input value into the map with the key specified.

```dart
final composedChain2 = chain
    .pipe(Runnable.getMapFromInput('joke'))
    .pipe(analysisPrompt)
    .pipe(model)
    .pipe(outputParser);
```

Another option is to use `Runnable.mapInput` which allows to transform the input value using the provided function.

```dart
final composedChain3 = chain
    .pipe(Runnable.mapInput((joke) => <String, dynamic>{'joke': joke}))
    .pipe(analysisPrompt)
    .pipe(model)
    .pipe(outputParser);
```

## Runnable.fromList

You can also create a `RunnableSequence` from a list of runnables using `Runnable.fromList`. 

```dart
final chain = Runnable.fromList([promptTemplate, chatModel]);
```
