# Interface

In an effort to make it as easy as possible to create custom chains, we've implemented a `Runnable` interface that most components implement. This is a standard interface with a few different methods, which makes it easy to define custom chains as well as making it possible to invoke them in a standard way. The standard interface exposed includes:

- `invoke`: call the chain on an input.
- `stream`: stream back chunks of the response.
- `batch`: call the chain on a list of inputs.

The type of the input and output varies by component:

| Component                   | Input Type             | Output Type            |
|-----------------------------|------------------------|------------------------|
| `PromptTemplate`            | `Map<String, dynamic>` | `PromptValue`          |
| `ChatMessagePromptTemplate` | `Map<String, dynamic>` | `PromptValue`          |
| `Retriever`                 | `String`               | `List<Document>`       |
| `DocumentTransformer`       | `List<Document>`       | `List<Document>`       |
| `LLM`                       | `PromptValue`          | `LLMResult`            |
| `ChatModel`                 | `PromptValue`          | `ChatResult`           |
| `Chain`                     | `Map<String, dynamic>` | `Map<String, dynamic>` |
| `OutputParser`              | `LanguageModelResult`  | Parser output type     |
| `Tool`                      | `Map<String, dynamic>` | `String`               |
| `RunnableSequence`          | Fist input type        | Last output type       |
| `RunnableMap`               | Runnable input type    | `Map<String, dynamic>` |
| `RunnableBinding`           | Runnable input type    | Runnable output type   |
| `RunnableFunction`          | Runnable input type    | Runnable output type   |
| `RunnablePassthrough`       | Runnable input type    | Runnable input type    |
| `RunnableItemFromMap`       | `Map<String, dynamic>` | Runnable output type   |
| `RunnableMapFromItem`       | Runnable input type    | `Map<String, dynamic>` |

You can combine `Runnable` objects into sequences in three ways:

- Calling `.pipe` method which takes another `Runnable` as an argument. E.g.:

```dart
final chain = promptTemplate.pipe(chatModel);
```

- Using the `|` operator. This is a convenience method that calls `.pipe` under the hood (note that it offers less type safety than `.pipe` because of Dart limitations). E.g.:

```dart
final chain = promptTemplate | chatModel;
```

- Using the `Runnable.fromList` static method with a list of `Runnable`, which will run in sequence when invoked.  E.g.:

```dart
final chain = Runnable.fromList([promptTemplate, chatModel]);
```

## Runnable interface

Let's take a look at these methods! To do so, we'll create a super simple `PromptTemplate` + `ChatModel` chain.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);

final chain = promptTemplate | model | const StringOutputParser();
```

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

Batch is not supported yet.

## Runnable types

The `Runnable` interface is implemented by most components (models, prompt templates, retrievers, etc.). However, there are a few special types of `Runnable` that facilitate the creation of custom chains.

### RunnableSequence

A `RunnableSequence` allows you to run multiple `Runnable` objects sequentially, passing the output of the previous `Runnable` to the next one.

As mentioned above, you can create a `RunnableSequence` in three ways:

- `.pipe` method
- `|` operator
- `Runnable.fromList` static method

When you call `invoke` on a `RunnableSequence`, it will invoke each `Runnable` in the sequence in order, passing the output of the previous `Runnable` to the next one. The output of the last `Runnable` in the sequence is returned.

You can think of a `RunnableSequence` as the replacement for `SequentialChain`.

Example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);

// The following three chains are equivalent:
final chain1 = promptTemplate | model | const StringOutputParser();
final chain2 = promptTemplate.pipe(model).pipe(const StringOutputParser());
final chain3 = Runnable.fromList(
  [promptTemplate, model, const StringOutputParser()],
);

final res = await chain1.invoke({'topic': 'bears'});
print(res);
// Why don't bears wear shoes?\n\nBecause they have bear feet!
```

### RunnableMap

A `RunnableMap`  allows you to run multiple `Runnable` objects in parallel on the same input returning a map of the results.

You can create a `RunnableMap` using the `Runnable.fromMap` static method.

When you call `invoke` on a `RunnableMap`, it will invoke each `Runnable` in the map in parallel, passing the same input to each one. The output of each `Runnable` is returned in a map, where the keys are the names of the outputs.

Example: 

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate1 = ChatPromptTemplate.fromTemplate(
  'What is the city {person} is from?',
);
final promptTemplate2 = ChatPromptTemplate.fromTemplate(
  'How old is {person}?',
);
final promptTemplate3 = ChatPromptTemplate.fromTemplate(
  'Is {city} a good city for a {age} years old person?',
);
const stringOutputParser = StringOutputParser();

final chain = Runnable.fromMap({
  'city': promptTemplate1 | model | stringOutputParser,
  'age': promptTemplate2 | model | stringOutputParser,
}) | promptTemplate3 | model | stringOutputParser;

final res = await chain.invoke({'person': 'Elon Musk'});
print(res);
// It is subjective to determine whether Pretoria, South Africa, is a good city for a 50-year-old person as it depends on individual preferences and needs.
```

### RunnableBinding

A `RunnableBinding` allows you to run a `Runnable` object with a set of options.

You can create a `RunnableBinding` using the `Runnable.bind` method.

When you call `invoke` on a `RunnableBinding`, it will invoke the `Runnable` with the options passed to `bind`.

Example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final chain = promptTemplate |
    model.bind(const ChatOpenAIOptions(stop: ['\n'])) |
    const StringOutputParser();

final res = await chain.invoke({'foo': 'bears'});
print(res);
// Why don't bears wear shoes?
```

### RunnableFunction

A `RunnableFunction` allows you to run a Dart function as part of a chain.

You can create a `RunnableFunction` using the `Runnable.fromFunction` static method.

When you call `invoke` on a `RunnableFunction`, it will invoke the function, passing the input to it. The output of the function is returned.

Example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'How much is {a} + {b}?',
);

final chain = Runnable.fromMap({
      'a': Runnable.fromFunction((
        final Map<String, String> input,
        final options,
      ) async {
        final foo = input['foo'] ?? '';
        return '${foo.length}';
      }),
      'b': Runnable.fromFunction((
        final Map<String, String> input,
        final options,
      ) async {
        final foo = input['foo'] ?? '';
        final bar = input['bar'] ?? '';
        return '${bar.length * foo.length}';
      }),
    }) |
    promptTemplate |
    model |
    const StringOutputParser();

final res = await chain.invoke({'foo': 'foo', 'bar': 'bar'});
print(res);
// 3 + 9 = 12
```

### RunnablePassthrough

A `RunnablePassthrough` takes the input it receives and passes it through as output.

You can create a `RunnablePassthrough` using the `Runnable.passthrough` static method.

When you call `invoke` on a `RunnablePassthrough`, it will return the input it receives.

Example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final map = Runnable.fromMap({
  'foo': Runnable.passthrough(),
});
final chain = map | promptTemplate | model | const StringOutputParser();

final res = await chain.invoke('bears');
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```

### RunnableItemFromMap

A `RunnableItemFromMap` allows you to get a value from the input.

You can create a `RunnableItemFromMap` using the `Runnable.getItemFromMap` static method.

When you call `invoke` on a `RunnableItemFromMap`, it will take the input it receives and returns the value of the given key.

Example:

```dart
final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}

Answer in the following language: {language}''');

final chain = Runnable.fromMap({
      'context': Runnable.getItemFromMap('question') |
          (retriever | Runnable.fromFunction((docs, _) => docs.join('\n'))),
      'question': Runnable.getItemFromMap('question'),
      'language': Runnable.getItemFromMap('language'),
    }) |
    promptTemplate |
    model |
    const StringOutputParser();

final res = await chain.invoke({
  'question': 'What payment methods do you accept?',
  'language': 'es_ES',
});
print(res);
// Aceptamos los siguientes métodos de pago: iDEAL, PayPal y tarjeta de crédito.
```

### RunnableMapFromItem

A `RunnableMapFromItem` allows you to output a map with the given key and the input as value.

You can create a `RunnableMapFromItem` using the `Runnable.getMapFromItem` static method.

When you call `invoke` on a `RunnableMapFromItem`, it will take the input it receives and returns a map with the given key and the input as value.

It is equivalent to:

```dart
Runnable.fromMap({
  'key': Runnable.passthrough(),
})
```

Example:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final chain = Runnable.getMapFromItem('foo') |
    promptTemplate |
    model |
    const StringOutputParser();

final res = await chain.invoke('bears');
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```
