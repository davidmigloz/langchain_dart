# Runnable interface

To make it as easy as possible to create custom chains, LangChain provides a `Runnable` interface that most components implement, including chat models, LLMs, output parsers, retrievers, prompt templates, and more.

This is a standard interface, which makes it easy to define custom chains as well as invoke them in a standard way. The standard interface includes:

- `invoke`: call the chain on an input and return the output.
- `stream`: call the chain on an input and stream the output.
- `batch`: call the chain on a list of inputs and return a list of outputs.

The type of the input and output varies by component:

| Component                   | Input Type             | Output Type            |
|-----------------------------|------------------------|------------------------|
| `PromptTemplate`            | `Map<String, dynamic>` | `PromptValue`          |
| `ChatMessagePromptTemplate` | `Map<String, dynamic>` | `PromptValue`          |
| `LLM`                       | `PromptValue`          | `LLMResult`            |
| `ChatModel`                 | `PromptValue`          | `ChatResult`           |
| `OutputParser`              | Any object             | Parser output type     |
| `Retriever`                 | `String`               | `List<Document>`       |
| `DocumentTransformer`       | `List<Document>`       | `List<Document>`       |
| `Tool`                      | `Map<String, dynamic>` | `String`               |
| `Chain`                     | `Map<String, dynamic>` | `Map<String, dynamic>` |

There are also several useful primitives for working with runnables, which you can read about in [this section](/expression_language/primitives.md).

## Runnable interface

Let's take a look at these methods! To do so, we'll create a super simple `PromptTemplate` + `ChatModel` chain.

```dart
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);

final chain = promptTemplate.pipe(model).pipe(StringOutputParser());
```

In this example, we use the method `pipe` to combine runnables into a sequence. You can read more about this in the [RunnableSequence: Chaining runnables](/expression_language/primitives/sequence.md) section.

### Invoke

The `invoke` method takes an input and returns the output of invoking the chain on that input.

```dart
final res = await chain.invoke({'topic': 'bears'});
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```

### Stream

The `stream` method takes an input and streams back chunks of the output.

```dart
final stream = chain.stream({'topic': 'bears'});
int count = 0;
await for (final res in stream) {
  print('$count: $res');
  count++;
}
// 0:
// 1: Why
// 2:  don
// 3: 't
// 4:  bears
// 5:  like
// 6:  fast
// 7:  food
// 8: ?
// 9: Because
// 10:  they
// 11:  can
// 12: 't
// 13:  catch
// 14:  it
// 15: !
```

### Batch

Batches the invocation of the `Runnable` on the given `inputs`.

```dart
final res = await chain.batch([
  {'topic': 'bears'},
  {'topic': 'cats'},
]);
print(res);
//['Why did the bear break up with his girlfriend? Because she was too "grizzly" for him!',
// 'Why was the cat sitting on the computer? Because it wanted to keep an eye on the mouse!']
```

If the underlying provider supports batching, this method will try to batch the calls to the provider. Otherwise, it will just call `invoke` on each input concurrently. You can configure the concurrency limit by setting the `concurrencyLimit` field in the `options` parameter.

You can provide call options to the `batch` method using the `options` parameter. It can be:
- `null`: the default options are used.
- List with 1 element: the same options are used for all inputs.
- List with the same length as the inputs: each input gets its own options.

```dart
final res = await chain.batch(
  [
    {'topic': 'bears'},
    {'topic': 'cats'},
  ],
  options: [
    const ChatOpenAIOptions(model: 'gpt-3.5-turbo', temperature: 0.5),
    const ChatOpenAIOptions(model: 'gpt-4', temperature: 0.7),
  ],
);
print(res);
//['Why did the bear break up with his girlfriend? Because he couldn't bear the relationship anymore!,',
// 'Why don't cats play poker in the jungle? Because there's too many cheetahs!']
```
