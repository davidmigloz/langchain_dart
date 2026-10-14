# ChatCohere

Wrapper around the [Cohere](https://cohere.com) v2 [Chat API](https://docs.cohere.com/reference/chat) (Command models).

## Setup

To use `ChatCohere` you need a Cohere account and an API key. You can get one [here](https://dashboard.cohere.com/api-keys).

Add the dependency:

```yaml
dependencies:
  langchain: {version}
  langchain_cohere: {version}
```

Some of the models available at the moment:
- `command-r-plus-08-2024`: powerful, general-purpose model with strong tool-use support (default).
- `command-r-08-2024`: smaller, faster alternative.

You can find the full and up-to-date list in the [Cohere models documentation](https://docs.cohere.com/docs/models).

## Usage

```dart
final chatModel = ChatCohere(
  apiKey: Platform.environment['COHERE_API_KEY'],
  defaultOptions: const ChatCohereOptions(
    model: 'command-r-plus-08-2024',
    temperature: 0,
  ),
);

final prompt = PromptValue.chat([
  ChatMessage.system('You are a helpful assistant.'),
  ChatMessage.humanText('Tell me a joke.'),
]);

final res = await chatModel.invoke(prompt);
print(res.output.contentAsString);

chatModel.close();
```

## Streaming

```dart
final stream = chatModel.stream(prompt);
await for (final chunk in stream) {
  stdout.write(chunk.output.contentAsString);
}
```

## Tool calling

`ChatCohere` supports [tool calling](/modules/model_io/models/chat_models/how_to/tools.md). Note that `ChatToolChoice.forced` is not supported by the Cohere API (`none`, `auto` and `required` are).

```dart
const tool = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and country, e.g. Madrid, Spain',
      },
    },
    'required': ['location'],
  },
);

final chatModel = ChatCohere(
  apiKey: Platform.environment['COHERE_API_KEY'],
  defaultOptions: const ChatCohereOptions(
    model: 'command-r-plus-08-2024',
    tools: [tool],
  ),
);

final res = await chatModel.invoke(
  PromptValue.string('What is the weather like in Madrid?'),
);
print(res.output.toolCalls);

chatModel.close();
```
