# Anthropic Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![anthropic_sdk_dart](https://img.shields.io/pub/v/anthropic_sdk_dart.svg)](https://pub.dev/packages/anthropic_sdk_dart)
![Discord](https://img.shields.io/discord/1123158322812555295?label=discord)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [Anthropic](https://docs.anthropic.com/en/api) API (aka Claude API).

## Features

- Fully type-safe, [documented](https://pub.dev/documentation/anthropic_sdk_dart/latest) and tested
- All platforms supported (including streaming on web)
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

**Supported endpoints:**

- Messages (with tools and streaming support)
- Message Batches

## Table of contents

- [Usage](#usage)
  * [Authentication](#authentication)
  * [Messages](#messages)
  * [Tool use](#tool-use)
  * [Computer use](#computer-use)
  * [Prompt caching](#prompt-caching)
  * [Message Batches](#message-batches)
- [Advance Usage](#advance-usage)
  * [Default HTTP client](#default-http-client)
  * [Custom HTTP client](#custom-http-client)
  * [Using a proxy](#using-a-proxy)
    + [HTTP proxy](#http-proxy)
    + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

Refer to the [documentation](https://docs.anthropic.com) for more information about the API.

### Authentication

The Anthropic API uses API keys for authentication. Visit the [Anthropic console](https://console.anthropic.com/settings/keys) to retrieve the API key you'll use in your requests.

> **Remember that your API key is a secret!**  
> Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

```dart
final apiKey = Platform.environment['ANTHROPIC_API_KEY'];
final client = AnthropicClient(apiKey: apiKey);
```

### Messages

Send a structured list of input messages with text and/or image content, and the model will generate the next message in the conversation.

**Create a Message:**

```dart
final res = await client.createMessage(
  request: CreateMessageRequest(
    model: Model.model(Models.claude35Sonnet20241022),
    maxTokens: 1024,
    messages: [
      Message(
        role: MessageRole.user,
        content: MessageContent.text('Hello, Claude'),
      ),
    ],
  ),
);
print(res.content.text);
// Hello! It's nice to meet you. How are you doing today?
```

`Model` is a sealed class that offers two ways to specify the model:
- `Model.modelId('model-id')`: the model ID as string (e.g. `'claude-instant-1.2'`).
- `Model.model(Models.claude35Sonnet20241022)`: a value from `Models` enum which lists all the available models.

Mind that this list may not be up-to-date. Refer to the [documentation](https://docs.anthropic.com/en/docs/models-overview) for the updated list.

**Streaming messages:**

```dart
final stream = client.createMessageStream(
  request: CreateMessageRequest(
    model: Model.model(Models.claude35Sonnet20241022),
    maxTokens: 1024,
    messages: [
      Message(
        role: MessageRole.user,
        content: MessageContent.text('Hello, Claude'),
      ),
    ],
  ),
);
await for (final res in stream) {
  res.map(
    messageStart: (MessageStartEvent e) {},
    messageDelta: (MessageDeltaEvent e) {},
    messageStop: (MessageStopEvent e) {},
    contentBlockStart: (ContentBlockStartEvent e) {},
    contentBlockDelta: (ContentBlockDeltaEvent e) {
      stdout.write(e.delta.text);
    },
    contentBlockStop: (ContentBlockStopEvent e) {},
    ping: (PingEvent e) {},
    error: (ErrorEvent v) {},
  );
}
// Hello! It's nice to meet you. How are you doing today?
```

### Tool use

Claude is capable of interacting with external client-side tools and functions, allowing you to equip Claude with your own custom tools to perform a wider variety of tasks.

Refer to the [official documentation](https://docs.anthropic.com/en/docs/build-with-claude/tool-use) for more information.

In the following example, we want the model to be able to use our function that return the current weather in a given city:

```dart
Map<String, dynamic> _getCurrentWeather(
  final String location,
  final String unit,
) {
  const temperature = 22;
  const weather = 'Sunny';
  return {
    'temperature': unit == 'celsius' ? temperature : (temperature * 9 / 5) + 32,
    'unit': unit,
    'description': weather,
  };
}
```

To do that, we need to provide the definition of the tool:
```dart
const tool = Tool.custom(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and state, e.g. San Francisco, CA',
      },
      'unit': {
        'type': 'string',
        'description': 'The unit of temperature to return',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);
```

Then we can use the tool in the message request:
```dart
final request1 = CreateMessageRequest(
  model: Model.model(Models.claude35Sonnet20241022),
  messages: [
    Message(
      role: MessageRole.user,
      content: MessageContent.text(
        'What’s the weather like in Boston right now?',
      ),
    ),
  ],
  tools: [tool],
  toolChoice: ToolChoice(
    type: ToolChoiceType.tool,
    name: tool.name,
  ),
  maxTokens: 1024,
);
final aiMessage1 = await client.createMessage(request: request1);

final toolUse = aiMessage1.content.blocks.firstOrNull;
if (toolUse == null || toolUse is! ToolUseBlock) {
  return;
}

// Call your tool here with the given input
final toolResult = _getCurrentWeather(
  toolUse.input['location'],
  toolUse.input['unit'],
);

final request2 = CreateMessageRequest(
  model: Model.model(Models.claude35Sonnet20241022),
  messages: [
    Message(
      role: MessageRole.user,
      content: MessageContent.text(
        'What’s the weather like in Boston right now in Fahrenheit?',
      ),
    ),
    Message(
      role: MessageRole.assistant,
      content: aiMessage1.content,
    ),
    Message(
      role: MessageRole.user,
      content: MessageContent.blocks([
        Block.toolResult(
          toolUseId: toolUse.id,
          content: ToolResultBlockContent.text(json.encode(toolResult)),
        ),
      ]),
    ),
  ],
  tools: [tool],
  maxTokens: 1024,
);
final aiMessage2 = await client.createMessage(request: request2);

print(aiMessage2.content.text);
// Based on the current weather information for Boston, here's what it's like right now:
//
// The temperature in Boston is 71.6°F (Fahrenheit).
// The weather conditions are described as sunny.
```

You can also stream the input for a tool:

```dart
final stream = client.createMessageStream(request: request);
await for (final res in stream) {
  res.map(
    messageStart: (MessageStartEvent v) {},
    messageDelta: (MessageDeltaEvent v) {},
    messageStop: (MessageStopEvent v) {},
    contentBlockStart: (ContentBlockStartEvent v) {},
    contentBlockDelta: (ContentBlockDeltaEvent v) {
      stdout.write(v.delta.inputJson);
    },
    contentBlockStop: (ContentBlockStopEvent v) {},
    ping: (PingEvent v) {},
    error: (ErrorEvent v) {},
  );
}
// {"location": "Boston, MA", "unit": "fahrenheit"}
```

### Computer use

Claude 3.5 Sonnet model is capable of interacting with tools that can manipulate a computer desktop environment.

Refer to the [official documentation](https://docs.anthropic.com/en/docs/build-with-claude/computer-use) for more information.

Anthropic-defined tools:
- `computer`: a tool that uses a mouse and keyboard to interact with a computer, and take screenshots.
- `text_editor`: a tool for viewing, creating and editing files.
- `bash`: a tool for running commands in a bash shell.

Example:
```dart
const request = CreateMessageRequest(
  model: Model.model(Models.claude35Sonnet20241022),
  messages: [
    Message(
      role: MessageRole.user,
      content: MessageContent.text(
        'Save a picture of a cat to my desktop. '
        'After each step, take a screenshot and carefully evaluate if you '
            'have achieved the right outcome. Explicitly show your thinking: '
            '"I have evaluated step X..." If not correct, try again. '
            'Only when you confirm a step was executed correctly should '
            'you move on to the next one.',
      ),
    ),
  ],
  tools: [
    Tool.computerUse(displayWidthPx: 1024, displayHeightPx: 768),
    Tool.textEditor(),
    Tool.bash(),
  ],
  maxTokens: 1024,
);
final res = await client.createMessage(request: request);
```

### Prompt caching

Prompt caching is a powerful feature that optimizes your API usage by allowing resuming from specific prefixes in your prompts. This approach significantly reduces processing time and costs for repetitive tasks or prompts with consistent elements.

Refer to the [official documentation](https://docs.anthropic.com/en/docs/build-with-claude/prompt-caching) for more information.

Example:
```dart
final request = CreateMessageRequest(
  model: Model.model(Models.claude35Sonnet20241022),
  system: CreateMessageRequestSystem.blocks([
    Block.text(
      text:
          'You are an AI assistant tasked with analyzing literary works. '
          'Your goal is to provide insightful commentary on themes, characters, and writing style.',
    ),
    Block.text(
      cacheControl: CacheControlEphemeral(),
      text: '<The whole text of the book>',
    ),
  ]),
  messages: [
    Message(
      role: MessageRole.user,
      content: MessageContent.text("What's the theme of the work?"),
    ),
  ],
  maxTokens: 1024,
);

final res1 = await client.createMessage(request: request);
print(res1.usage?.cacheCreationInputTokens); // 5054
print(res1.usage?.cacheReadInputTokens); // 0

final res2 = await client.createMessage(request: request);
print(res2.usage?.cacheCreationInputTokens); // 0
print(res2.usage?.cacheReadInputTokens); // 5054
```

### Message Batches

The Message Batches API is a powerful, cost-effective way to asynchronously process large volumes of Messages requests. This approach is well-suited to tasks that do not require immediate responses, reducing costs by 50% while increasing throughput.

Refer to the [official documentation](https://docs.anthropic.com/en/docs/build-with-claude/message-batches) for more information.

**Prepare and create your batch:**

```dart
const batchRequest = CreateMessageBatchRequest(
  requests: [
    BatchMessageRequest(
      customId: 'request1',
      params: CreateMessageRequest(
        model: Model.model(Models.claudeInstant12),
        temperature: 0,
        maxTokens: 1024,
        messages: [
          Message(
            role: MessageRole.user,
            content: MessageContent.text(
                'List the numbers from 1 to 9 in order.'),
          ),
        ],
      ),
    ),
    BatchMessageRequest(
      customId: 'request2',
      params: CreateMessageRequest(
        model: Model.model(Models.claudeInstant12),
        temperature: 0,
        maxTokens: 1024,
        messages: [
          Message(
            role: MessageRole.user,
            content: MessageContent.text(
                'List the numbers from 10 to 19 in order.'),
          ),
        ],
      ),
    ),
  ],
);
var batch = await client.createMessageBatch(request: batchRequest);
print(batch.id);
```

**Tracking your batch:**

```dart
do {
  await Future<void>.delayed(const Duration(seconds: 5));
  batch = await client.retrieveMessageBatch(id: batch.id);
} while (batch.processingStatus == MessageBatchProcessingStatus.inProgress);
```

**Retrieving batch results:**

```dart
batch = await client.retrieveMessageBatch(id: batch.id);
print(batch.resultsUrl);
```

## Advance Usage

### Default HTTP client

By default, the client uses `https://api.anthropic.com/v1` as the `baseUrl` and the following implementations of `http.Client`:

- Non-web: [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
- Web: [`FetchClient`](https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html) (to support streaming on web)

### Custom HTTP client

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = AnthropicClient(
  apiKey: 'MISTRAL_API_KEY',
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = AnthropicClient(
  baseUrl: 'https://my-proxy.com',
  headers: {
      'x-my-proxy-header': 'value',
  },
);
```

If you need further customization, you can always provide your own `http.Client`.

#### SOCKS5 proxy

To use a SOCKS5 proxy, you can use the [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package:

```dart
final baseHttpClient = HttpClient();
SocksTCPClient.assignToHttpClient(baseHttpClient, [
  ProxySettings(InternetAddress.loopbackIPv4, 1080),
]);
final httpClient = IOClient(baseClient);

final client = AnthropicClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

Anthropic Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
