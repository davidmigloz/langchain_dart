# ChatAnthropic

Wrapper around [Anthropic Messages API](https://docs.anthropic.com/en/api/messages) (aka Claude API).

## Setup

The Anthropic API uses API keys for authentication. Visit your [API Keys](https://console.anthropic.com/settings/keys) page to retrieve the API key you'll use in your requests.

The following models are available:
- `claude-3-5-sonnet-latest`
- `claude-3-5-sonnet-20241022`
- `claude-3-5-sonnet-20240620`
- `claude-3-opus-latest`
- `claude-3-opus-20240229`
- `claude-3-sonnet-20240229`
- `claude-3-haiku-20240307`
- `claude-2.1`
- `claude-2.0`
- `claude-instant-1.2`

Mind that the list may not be up-to-date. See https://docs.anthropic.com/en/docs/about-claude/models for the updated list.

## Usage

```dart
final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

final chatModel = ChatAnthropic(
  apiKey: apiKey,
  defaultOptions: ChatAnthropicOptions(
    model: 'claude-3-5-sonnet-20241022',
    temperature: 0,
  ),
);

final chatPrompt = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, 'Text to translate:\n{text}'),
]);

final chain = chatPrompt | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore programmer.'
```

## Multimodal support

```dart
final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

final chatModel = ChatAnthropic(
  apiKey: apiKey,
  defaultOptions: ChatAnthropicOptions(
    model: 'claude-3-5-sonnet-20241022',
    temperature: 0,
  ),
);

final res = await chatModel.invoke(
  PromptValue.chat([
    ChatMessage.human(
      ChatMessageContent.multiModal([
        ChatMessageContent.text('What fruit is this?'),
        ChatMessageContent.image(
          mimeType: 'image/jpeg',
          data: base64.encode(
            await File('./bin/assets/apple.jpeg').readAsBytes(),
          ),
        ),
      ]),
    ),
  ]),
);

print(res.output.content);
// -> 'The fruit in the image is an apple.'
```

## Streaming

```dart
final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas.'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatAnthropic(
  apiKey: apiKey,
  defaultOptions: ChatAnthropicOptions(
    model: 'claude-3-5-sonnet-20241022',
    temperature: 0,
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

final stream = chain.stream({'max_num': '30'});
await stream.forEach(print);
// 123
// 456789101
// 112131415161
// 718192021222
// 324252627282
// 930
```

## Tool calling

`ChatAnthropic` supports tool calling.

Check the [docs](/modules/model_io/models/chat_models/how_to/tools.md) for more information on how to use tools.

Example:
```dart
const tool = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and country, e.g. San Francisco, US',
      },
    },
    'required': ['location'],
  },
);
final chatModel = ChatAnthropic(
  apiKey: apiKey,
  defaultOptions: ChatAnthropicOptions(
    model: 'claude-3-5-sonnet-20241022',
    temperature: 0,
    tools: [tool],
  ),
);

final res = await model.invoke(
  PromptValue.string('What’s the weather like in Boston and Madrid right now in celsius?'),
);
```
