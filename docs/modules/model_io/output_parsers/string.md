# String output parser

The `StringOutputParser` takes the output of the previous `Runnable` in the chain and converts it into a String. 

If the input is:
- `null`, the parser returns an empty String.
- A `LLMResult`, the parser returns the output String.
- A `ChatResult`, the parser returns the content of the output message as a String.
- A `ChatMessage`, the parser returns the content of the message as a String.
- A `Document`, the parser returns the page content as a String.
- Anything else, the parser returns the String representation of the input.

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
