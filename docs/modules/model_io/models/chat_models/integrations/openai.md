# OpenAI

[OpenAI](https://platform.openai.com/docs/introduction) offers a spectrum of
chat models with different levels of power suitable for different tasks.

This example goes over how to use LangChain to interact with
OpenAI [models](https://platform.openai.com/docs/models) using the Chat API.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final chatModel = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);

final chain = chatPrompt | chatModel | const StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore la programmation.'
```

## Streaming

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromPromptMessages([
  SystemChatMessagePromptTemplate.fromTemplate(
    'You are a helpful assistant that replies only with numbers '
        'in order without any spaces or commas',
  ),
  HumanChatMessagePromptTemplate.fromTemplate(
    'List the numbers from 1 to {max_num}',
  ),
]);
final chat = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatMessage>();

final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456
// 789
```

You can also stream OpenAI functions:

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
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0).bind(
  ChatOpenAIOptions(
    functions: const [function],
    functionCall: ChatFunctionCall.forced(functionName: 'joke'),
  ),
);
final jsonOutputParser = JsonOutputFunctionsParser();

final chain = promptTemplate.pipe(chat).pipe(jsonOutputParser);

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
