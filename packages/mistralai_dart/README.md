# Mistral AI Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![mistralai_dart](https://img.shields.io/pub/v/mistralai_dart.svg)](https://pub.dev/packages/mistralai_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [Mistral AI](https://docs.mistral.ai/api) API.

> Note: Mistral AI API is currently in closed beta. You can request access [here](https://console.mistral.ai).

## Features

- Generated from the official Mistral AI [OpenAPI specification](https://docs.mistral.ai/redocusaurus/plugin-redoc-0.yaml)
- Fully type-safe, [documented](https://pub.dev/documentation/mistralai_dart/latest) and tested
- All platforms supported (including streaming on web)
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

**Supported endpoints:**

- Chat Completions (with streaming support)
- Embeddings
- Models

## Table of contents

- [Usage](#usage)
  * [Chat Completions](#chat-completions)
  * [Embeddings](#embeddings)
  * [Models](#models)
    + [List models](#list-models)
- [Advance Usage](#advance-usage)
  * [Default HTTP client](#default-http-client)
  * [Custom HTTP client](#custom-http-client)
  * [Using a proxy](#using-a-proxy)
    + [HTTP proxy](#http-proxy)
    + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

Refer to the [documentation](https://docs.mistral.ai) for more information about the API.

### Chat Completions

Given a list of messages comprising a conversation, the model will return a response.

**Generate chat completion:**

```dart
final res = await client.createChatCompletion(
  request: ChatCompletionRequest(
    model: ChatCompletionModel.model(ChatCompletionModels.mistralMedium),
    temperature: 0,
    messages: [
      ChatCompletionMessage(
        role: ChatCompletionMessageRole.user,
        content: 'Why is the sky blue?',
      ),
    ],
  ),
);
print(res.choices.first.message?.content);
// The sky appears blue due to a phenomenon called Rayleigh scattering...
```

`ChatCompletionModel` is a sealed class that offers two ways to specify the model:
- `ChatCompletionModel.modelId('model-id')`: the model ID as string (e.g. `'mistral-small'`).
- `ChatCompletionModel.model(ChatCompletionModels.mistralMedium)`: a value from `ChatCompletionModels` enum which lists all the available models.

The following models are available at the moment:
- `mistral-tiny`: Mistral 7B Instruct v0.2 (a minor release of Mistral 7B Instruct). It only works in English and obtains 7.6 on MT-Bench.
- `mistral-small`: Mixtral 8x7B. It masters English/French/Italian/German/Spanish and code and obtains 8.3 on MT-Bench.
- `mistral-medium`: a prototype model, that is currently among the top serviced models available based on standard benchmarks. It masters English/French/Italian/German/Spanish and code and obtains a score of 8.6 on MT-Bench.

Mind that this list may not be up-to-date. Refer to the [documentation](https://docs.mistral.ai/models) for the updated list.

**Stream chat completion:**

```dart
final stream = client.createChatCompletionStream(
  request: const ChatCompletionRequest(
    model: ChatCompletionModel.model(ChatCompletionModels.mistralMedium),
    temperature: 0,
    messages: [
      ChatCompletionMessage(
        role: ChatCompletionMessageRole.user,
        content: 'Why is the sky blue?',
      ),
    ],
  ),
);
String text = '';
await for (final res in stream) {
  text += res.choices.first.delta.content?.trim() ?? '';
}
print(text);
// The sky appears blue due to a phenomenon called Rayleigh scattering...
```

### Embeddings

Given a prompt, the model will generate an embedding representing the prompt.

**Generate embedding:**

```dart
final generated = await client.createEmbedding(
  request: const EmbeddingRequest(
    model: EmbeddingModel.model(EmbeddingModels.mistralEmbed),
    input: ['Why is the sky blue?'],
  ),
);
print(generated.data.first.embedding);
// [-0.0182342529296875, 0.03594970703125, 0.0286102294921875, ...]
```

`EmbeddingModel` is a sealed class that offers two ways to specify the model:
- `EmbeddingModel.modelId('model-id')`: the model ID as string (e.g. `'mistral-embed'`).
- `EmbeddingModel.model(EmbeddingModels.mistralEmbed)`: a value from `EmbeddingModels` enum which lists all the available models.

The following models are available at the moment:
- `mistral-embed`: an embedding model with a 1024 embedding dimensions designed with retrieval capabilities in mind. It achieves a retrieval score of 55.26 on MTEB.

### Models

#### List models

List models that are available.

```dart
final res = await client.listModels();
print(res.data);
// [Model(id: mistral-medium, object: model, created: 1702396611, ownedBy: mistralai), ...]
```

## Advance Usage

### Default HTTP client

By default, the client uses `https://api.mistral.ai/v1` as the `baseUrl` and the following implementations of `http.Client`:

- Non-web: [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
- Web: [`FetchClient`](https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html) (to support streaming on web)

### Custom HTTP client

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = MistralAIClient(
  apiKey: 'MISTRAL_API_KEY',
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = MistralAIClient(
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

final client = MistralAIClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

Mistral AI Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
