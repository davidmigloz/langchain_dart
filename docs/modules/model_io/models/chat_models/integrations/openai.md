# OpenAI

[OpenAI](https://platform.openai.com/docs/introduction) offers a spectrum of
chat models with different levels of power suitable for different tasks.

This example goes over how to use LangChain to interact with
OpenAI [models](https://platform.openai.com/docs/models) using the Chat API.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
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

You can also stream OpenAI tool calls:

```dart
const tool = ToolSpec(
  name: 'joke',
  description: 'A joke',
  inputJsonSchema: {
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
  defaultOptions: ChatOpenAIOptions(
    tools: [tool],
    toolChoice: ChatToolChoice.forced(name: 'joke'),
  ),
);
final outputParser = ToolsOutputParser();

final chain = promptTemplate.pipe(chat).pipe(outputParser);

final stream = chain.stream({'foo': 'bears'});
await for (final chunk in stream) {
  final args = chunk.first.arguments;
  print(args);
}
// {}
// {setup: }
// {setup: Why don't}
// {setup: Why don't bears}
// {setup: Why don't bears like fast food}
// {setup: Why don't bears like fast food?, punchline: }
// {setup: Why don't bears like fast food?, punchline: Because}
// {setup: Why don't bears like fast food?, punchline: Because they can't}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
```

## JSON mode

GPT-4 Turbo supports a new JSON mode, which ensures the model will respond with valid JSON. JSON mode is useful for developers generating JSON in the Chat Completions API outside of function calling. You can use it in combination with a `JsonOutputParser` to parse the response into a JSON map.

```dart
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
    model: 'gpt-4-turbo',
    temperature: 0,
    responseFormat: ChatOpenAIResponseFormat.jsonObject,
  ),
);
final chain = llm.pipe(JsonOutputParser());
final res = await chain.invoke(prompt);
print(res);
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
