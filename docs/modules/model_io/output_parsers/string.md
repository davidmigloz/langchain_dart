# String output parser

The `StringOutputParser` takes language model output (either an entire response or as a stream) and converts it into a string. This is useful for standardizing chat model and LLM output.

## Usage

Here we use the `StringOutputParser` to convert the output of a chat model into a string:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
'Tell me a joke about {topic}',
);

final chain = promptTemplate.pipe(model).pipe(StringOutputParser());

final res = await chain.invoke({'topic': 'bears'});
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```

We can also use it with streaming:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);

final chain = promptTemplate | model | StringOutputParser();

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
