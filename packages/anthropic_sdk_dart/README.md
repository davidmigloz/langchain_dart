# Anthropic Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![anthropic_sdk_dart](https://img.shields.io/pub/v/anthropic_sdk_dart.svg)](https://pub.dev/packages/anthropic_sdk_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [Anthropic](https://docs.anthropic.com/en/api) API (aka Claude API).

## Features

- Fully type-safe, [documented](https://pub.dev/documentation/anthropic_sdk_dart/latest) and tested
- All platforms supported (including streaming on web)
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

**Supported endpoints:**

- Messages (with streaming support)

## Table of contents

- [Usage](#usage)
  * [Authentication](#authentication)
  * [Messages](#messages)
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
    model: Model.model(Models.claude3Opus20240229),
    maxTokens: 1024,
    messages: [
      Message(
        role: MessageRole.user,
        content: 'Hello, Claude',
      ),
    ],
  ),
);
print(res.content.text);
// Hi there! How can I help you today?
```

`Model` is a sealed class that offers two ways to specify the model:
- `Model.modelId('model-id')`: the model ID as string (e.g. `'claude-3-haiku-20240307'`).
- `Model.model(Models.claude3Opus20240229)`: a value from `Models` enum which lists all the available models.

Mind that this list may not be up-to-date. Refer to the [documentation](https://docs.anthropic.com/en/docs/models-overview) for the updated list.

**Streaming messages:**

```dart
final stream = await client.createMessageStream(
  request: CreateMessageRequest(
    model: Model.model(Models.claude3Opus20240229),
    maxTokens: 1024,
    messages: [
      Message(
        role: MessageRole.user,
        content: 'Hello, Claude',
      ),
    ],
  ),
);
String text = '';
await for (final res in stream) {
  res.map(
      messageStart: (e) {},
      messageDelta: (e) {},
      messageStop: (e) {},
      contentBlockStart: (e) {},
      contentBlockDelta: (e) {
        text += e.delta.text;
      },
      contentBlockStop: (e) {},
      ping: (e) {},
  );
}
print(text);
// Hi there! How can I help you today?
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
