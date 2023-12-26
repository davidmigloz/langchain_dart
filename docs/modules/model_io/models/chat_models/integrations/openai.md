# OpenAI

[OpenAI](https://platform.openai.com/docs/introduction) offers a spectrum of
chat models with different levels of power suitable for different tasks.

This example goes over how to use LangChain to interact with
OpenAI [models](https://platform.openai.com/docs/models) using the Chat API.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (
  ChatMessageType.system,
  'You are a helpful assistant that translates {input_language} to {output_language}.',
  ),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: ChatOpenAIOptions(
    temperature: 0,
  ),
);

final chain = promptTemplate | chatModel | StringOutputParser();

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

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (
  ChatMessageType.system,
  'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chat = ChatOpenAI(apiKey: openaiApiKey);

final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

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

## JSON mode

GPT-4 Turbo supports a new JSON mode, which ensures the model will respond with valid JSON. JSON mode is useful for developers generating JSON in the Chat Completions API outside of function calling.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final prompt = PromptValue.chat([
  ChatMessage.system(
    "Extract the 'name' and 'origin' of any companies mentioned in the "
        'following statement. Return a JSON list.',
  ),
  ChatMessage.humanText(
    'Google was founded in the USA, while Deepmind was founded in the UK',
  ),
]);
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    model: 'gpt-4-1106-preview',
    temperature: 0,
    responseFormat: ChatOpenAIResponseFormat(
      type: ChatOpenAIResponseFormatType.jsonObject,
    ),
  ),
);
final res = await llm.invoke(prompt);
final outputMsg = res.firstOutputAsString;
print(outputMsg);
// {
//   "companies": [
//     {
//       "name": "Google",
//       "origin": "USA"
//     },
//     {
//       "name": "Deepmind",
//       "origin": "UK"
//     }
//   ]
// }
```
