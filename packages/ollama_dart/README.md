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
- Chat completions (with streaming and tool calling support)
- Embeddings
- Models
- Blobs
- Version

## Table of contents

- [Usage](#usage)
  * [Completions](#completions)
    + [Generate completion](#generate-completion)
    + [Stream completion](#stream-completion)
  * [Chat completions](#chat-completions)
    + [Generate chat completion](#generate-chat-completion)
    + [Stream chat completion](#stream-chat-completion)
    + [Tool calling](#tool-calling)
  * [Embeddings](#embeddings)
    + [Generate embedding](#generate-embedding)
  * [Models](#models)
    + [Create model](#create-model)
    + [List models](#list-models)
    + [List running models](#list-running-models)
    + [Show Model Information](#show-model-information)
    + [Pull a Model](#pull-a-model)
    + [Push a Model](#push-a-model)
    + [Check if a Blob Exists](#check-if-a-blob-exists)
  * [Version](#version)
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

#### Generate completion

```dart
final generated = await client.generateCompletion(
  request: GenerateCompletionRequest(
    model: 'mistral:latest',
    prompt: 'Why is the sky blue?',
  ),
);
print(generated.response);
// The sky appears blue because of a phenomenon called Rayleigh scattering...
```

#### Stream completion

```dart
final stream = client.generateCompletionStream(
  request: GenerateCompletionRequest(
    model: 'mistral:latest',
    prompt: 'Why is the sky blue?',
  ),
);
String text = '';
await for (final res in stream) {
  text += res.response?.trim() ?? '';
}
print(text);
// The sky appears blue because of a phenomenon called Rayleigh scattering...
```

### Chat completions

Given a prompt, the model will generate a response in a chat format.

#### Generate chat completion

```dart
final res = await client.generateChatCompletion(
  request: GenerateChatCompletionRequest(
    model: defaultModel,
    messages: [
      Message(
        role: MessageRole.system,
        content: 'You are a helpful assistant.',
      ),
      Message(
        role: MessageRole.user,
        content: 'List the numbers from 1 to 9 in order.',
      ),
    ],
    keepAlive: 1,
  ),
);
print(res);
// Message(role: MessageRole.assistant, content: 123456789)
```

#### Stream chat completion

```dart
final stream = client.generateChatCompletionStream(
  request: GenerateChatCompletionRequest(
    model: defaultModel,
    messages: [
      Message(
        role: MessageRole.system,
        content: 'You are a helpful assistant.',
      ),
      Message(
        role: MessageRole.user,
        content: 'List the numbers from 1 to 9 in order.',
      ),
    ],
    keepAlive: 1,
  ),
);

String text = '';
await for (final res in stream) {
  text += (res.message?.content ?? '').trim();
}
print(text);
// 123456789
```

#### Tool calling

Tool calling allows a model to respond to a given prompt by generating output that matches a user-defined schema, that you can then use to call the tools in your code and return the result back to the model to complete the conversation.

**Notes:** 
- Tool calling requires Ollama 0.2.8 or newer.
- Streaming tool calls is not supported at the moment.
- Not all models support tool calls. Check the Ollama catalogue for models that have the `Tools` tag (e.g. [`llama3.2`](https://ollama.com/library/llama3.2)). 

```dart
const tool = Tool(
  function: ToolFunction(
    name: 'get_current_weather',
    description: 'Get the current weather in a given location',
    parameters: {
      'type': 'object',
      'properties': {
        'location': {
          'type': 'string',
          'description': 'The city and country, e.g. San Francisco, US',
        },
        'unit': {
          'type': 'string',
          'description': 'The unit of temperature to return',
          'enum': ['celsius', 'fahrenheit'],
        },
      },
      'required': ['location'],
    },
  ),
);

const userMsg = Message(
  role: MessageRole.user,
  content: 'What’s the weather like in Barcelona in celsius?',
);

final res1 = await client.generateChatCompletion(
  request: GenerateChatCompletionRequest(
    model: 'llama3.2',
    messages: [userMsg],
    tools: [tool],
  ),
);

print(res1.message.toolCalls);
// [
//   ToolCall(
//     function:
//       ToolCallFunction(
//         name: get_current_weather,
//         arguments: {
//           location: Barcelona, ES,
//           unit: celsius
//         }
//       )
//   )
// ]

// Call your tool here. For this example, we'll just mock the response.
const toolResult = '{"location": "Barcelona, ES", "temperature": 20, "unit": "celsius"}';

// Submit the response of the tool call to the model
final res2 = await client.generateChatCompletion(
  request: GenerateChatCompletionRequest(
    model: 'llama3.2',
    messages: [
      userMsg,
      res1.message,
      Message(
        role: MessageRole.tool,
        content: toolResult,
      ),
    ],
  ),
);
print(res2.message.content);
// The current weather in Barcelona is 20°C.
```

### Embeddings

Given a prompt, the model will generate an embedding representing the prompt.

#### Generate embedding

```dart
final generated = await client.generateEmbedding(
  request: GenerateEmbeddingRequest(
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
  request: CreateModelRequest(
    model: 'mario',
    modelfile: 'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
  ),
);
```

You can also stream the status of the model creation:

```dart
final stream = client.createModelStream(
  request: CreateModelRequest(
    model: 'mario',
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

#### List running models

Lists models currently loaded and their memory footprint.

```dart
final res = await client.listRunningModels();
print(res.models);
```

#### Show Model Information

Show details about a model including modelfile, template, parameters, license, and system prompt.

```dart
final res = await client.showModelInfo(
  request: ModelInfoRequest(model: 'mistral:latest'),
);
print(res);
```

#### Pull a Model

Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.

```dart
final res = await client.pullModel(
  request: PullModelRequest(model: 'yarn-llama3:13b-128k-q4_1'),
);
print(res.status);
```

You can also stream the pulling status:

```dart
final stream = client.pullModelStream(
  request: PullModelRequest(model: 'yarn-llama3:13b-128k-q4_1'),
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
  request: PushModelRequest(model: 'mattw/pygmalion:latest'),
);
print(res.status);
```

You can also stream the pushing status:

```dart
final stream = client.pushModelStream(
  request: PushModelRequest(model: 'mattw/pygmalion:latest'),
);
await for (final res in stream) {
  print(res.status);
}
```

#### Check if a Blob Exists

Ensures that the file blob used for a FROM or ADAPTER field exists on the server. This is checking your Ollama server and not Ollama.ai.

```dart
await client.checkBlob(
  digest: 'sha256:29fdb92e57cf0827ded04ae6461b5931d01fa595843f55d36f5b275a52087dd2',
);
```

If the blob doesn't exist, an `OllamaClientException` exception will be thrown.

### Version

Get the version of the Ollama server.

```dart
final res = await client.getVersion();
print(res.version);
```

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
