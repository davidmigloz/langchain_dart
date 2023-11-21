# Ollama Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![ollama_dart](https://img.shields.io/pub/v/ollama_dart.svg)](https://pub.dev/packages/ollama_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [Ollama](https://ollama.ai/) API.

## Features

- Fully type-safe, [documented](https://pub.dev/documentation/ollama_dart/latest/) and tested
- All platforms supported (including streaming on web)
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

**Supported endpoints:**

- Completions (with streaming support)
- Embeddings
- Models

## Table of contents

- [Usage](#usage)
  * [Completions](#completions)
  * [Embeddings](#embeddings)
  * [Models](#models)
    + [Create model](#create-model)
    + [List models](#list-models)
    + [Show Model Information](#show-model-information)
    + [Pull a Model](#pull-a-model)
    + [Push a Model](#push-a-model)
- [Advance Usage](#advance-usage)
  * [Default HTTP client](#default-http-client)
  * [Custom HTTP client ](#custom-http-client)
  * [Using a proxy](#using-a-proxy)
    + [HTTP proxy](#http-proxy)
    + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

Refer to the [documentation](https://github.com/jmorganca/ollama/blob/main/docs/api.md) for more information about the API.

### Completions

Given a prompt, the model will generate a response.

**Generate completion:**

```dart
final generated = await client.generateCompletion(
  request: const GenerateCompletionRequest(
    model: 'mistral:latest',
    prompt: 'Why is the sky blue?',
  ),
);
print(generated.response);
// The sky appears blue because of a phenomenon called Rayleigh scattering...
```

**Stream completion:**

```dart
final stream = client.generateCompletionStream(
  request: const GenerateCompletionRequest(
    model: 'mistral:latest',
    prompt: 'Why is the sky blue?',
  ),
);
String text = '';
await for (final res in stream) {
  text += res.response?.trim() ?? '';
}
print(text);
```

### Embeddings

Given a prompt, the model will generate an embedding representing the prompt.

**Generate embedding:**

```dart
final generated = await client.generateEmbedding(
  request: const GenerateEmbeddingRequest(
    model: 'mistral:latest',
    prompt: 'Here is an article about llamas...',
  ),
);
print(generated.embedding);
// [8.566641807556152, 5.315540313720703, ...]
```

### Models

#### Create model

Creates a new local model using a modelfile.

```dart
await client.createModel(
  request: const CreateModelRequest(
    name: 'mario',
    modelfile: 'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
  ),
);
```

You can also stream the status of the model creation:

```dart
final stream = client.createModelStream(
  request: const CreateModelRequest(
    name: 'mario',
    modelfile: 'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
  ),
);
await for (final res in stream) {
  print(res.status);
}
```

#### List models

List models that are available locally.

```dart
final res = await client.listModels();
print(res.models);
```

#### Show Model Information

Show details about a model including modelfile, template, parameters, license, and system prompt.

```dart
final res = await client.showModelInfo(
  request: const ModelInfoRequest(name: 'mistral:latest'),
);
print(res);
```

#### Pull a Model

Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.

```dart
final res = await client.pullModel(
  request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
);
print(res.status);
```

You can also stream the pulling status:

```dart
final stream = client.pullModelStream(
  request: const PullModelRequest(name: 'yarn-llama2:13b-128k-q4_1'),
);
await for (final res in stream) {
  print(res.status);
}
```

#### Push a Model

Upload a model to a model library. 

Requires registering for ollama.ai and adding a public key first.

```dart
final res = await client.pushModel(
  request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
);
print(res.status);
```

You can also stream the pushing status:

```dart
final stream = client.pushModelStream(
  request: const PushModelRequest(name: 'mattw/pygmalion:latest'),
);
await for (final res in stream) {
  print(res.status);
}
```

#### Check if a Blob Exists

Check if a blob is known to the server.

```dart
await client.checkBlob(
  name: 'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
);
```

If the blob doesn't exist, an `OllamaClientException` exception will be thrown.

## Advance Usage

### Default HTTP client

By default, the client uses `http://localhost:11434/api` as the `baseUrl` and the following implementations of `http.Client`:

- Non-web: [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
- Web: [`FetchClient`](https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html) (to support streaming on web)

### Custom HTTP client 

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = OllamaClient(
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = OllamaClient(
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

final client = OllamaClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

Ollama Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
