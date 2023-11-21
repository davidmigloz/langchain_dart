# Functions output parsers

The functions output parsers are useful for parsing the output of OpenAI functions.

Let's consider the following chain:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
const function = ChatFunction(
  name: 'joke',
  description: 'A joke',
  parameters: {
    'type': 'object',
    'properties': {
      'setup': {
        'type': 'string',
        'description': 'The setup for the joke',
      },
      'punchline': {
        'type': 'string',
        'description': 'The punchline to the joke',
      },
    },
    'required': ['location', 'punchline'],
  },
);
final promptTemplate = ChatPromptTemplate.fromTemplate(
  'tell me a long joke about {foo}',
);
final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    temperature: 0,
  ),
).bind(
  ChatOpenAIOptions(
    functions: const [function],
    functionCall: ChatFunctionCall.forced(functionName: 'joke'),
  ),
);
final outputParser = TODO();
final chain = promptTemplate.pipe(chat).pipe(outputParser);
```

## OutputFunctionsParser

A parser that returns the output of a function as a JSON String.

```dart
final outputParser = OutputFunctionsParser();
final chain = promptTemplate.pipe(chat).pipe(outputParser);
final res = await chain.invoke({'foo': 'bears'});
print(res);
// '{"setup": "Why don't bears like fast food?", "punchline": "Because they can't catch it!"}'
```

## JsonOutputFunctionsParser

A parser that converts the output of a function call into a `Map` that contains the arguments of the function call.

```dart
final outputParser = JsonOutputFunctionsParser();
final chain = promptTemplate.pipe(chat).pipe(outputParser);
final res = await chain.invoke({'foo': 'bears'});
print(res);
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
```

It can also be used with streaming:

```dart
final outputParser = JsonOutputFunctionsParser();
final chain = promptTemplate.pipe(chat).pipe(outputParser);
final stream = chain.stream({'foo': 'bears'});
await stream.forEach(print);
// {}
// {setup: }
// {setup: Why}
// {setup: Why don}
// {setup: Why don't}
// {setup: Why don't bears}
// {setup: Why don't bears like}
// {setup: Why don't bears like fast}
// {setup: Why don't bears like fast food}
// {setup: Why don't bears like fast food?, punchline: }
// {setup: Why don't bears like fast food?, punchline: Because}
// {setup: Why don't bears like fast food?, punchline: Because they}
// {setup: Why don't bears like fast food?, punchline: Because they can}
// {setup: Why don't bears like fast food?, punchline: Because they can't}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
```

## JsonKeyOutputFunctionsParser

A parser that extracts a specific key from the arguments of a function call.

```dart
final outputParser = JsonKeyOutputFunctionsParser(keyName: 'setup');
final chain = promptTemplate.pipe(chat).pipe(outputParser);
final res = await chain.invoke({'foo': 'bears'});
print(res);
// Why don't bears like fast food?
```

It can also be used with streaming:

```dart
final outputParser = JsonKeyOutputFunctionsParser(keyName: 'setup');
final chain = promptTemplate.pipe(chat).pipe(outputParser);
final stream = chain.stream({'foo': 'bears'});
await stream.forEach(print);
// 
// Why
// Why don
// Why don't
// Why don't bears
// Why don't bears like
// Why don't bears like fast
// Why don't bears like fast food
// Why don't bears like fast food?
```
