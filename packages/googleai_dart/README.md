# Google AI Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![googleai_dart](https://img.shields.io/pub/v/googleai_dart.svg)](https://pub.dev/packages/googleai_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [Google AI](https://ai.google.dev) for Developers (Gemini API).

## Features

- Generated from the official Google AI [OpenAPI specification](https://generativelanguage.googleapis.com//$discovery/rest?version=v1&key=your-key)
- Fully type-safe, [documented](https://pub.dev/documentation/googleai_dart/latest) and tested
- All platforms supported
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)

> [!NOTE]
> Streaming support coming soon.

**Supported endpoints:**

- Generate content
- Count tokens
- Embed content
- Models info
- Tuned models operations
- Operations

## Table of contents

- [Usage](#usage)
  * [Authentication](#authentication)
  * [Generate content](#generate-content)
    + [Text-only input](#text-only-input)
    + [Text-and-image input](#text-and-image-input)
    + [Multi-turn conversations (chat)](#multi-turn-conversations-chat)
  * [Count tokens](#count-tokens)
  * [Embedding](#embedding)
  * [Model info](#model-info)
    + [List models](#list-models)
    + [Get model](#get-model)
- [Advance Usage](#advance-usage)
  * [Default HTTP client](#default-http-client)
  * [Custom HTTP client](#custom-http-client)
  * [Using a proxy](#using-a-proxy)
    + [HTTP proxy](#http-proxy)
    + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

Refer to the [documentation](https://ai.google.dev/docs) for more information about the API.

### Authentication

The Google AI API uses API keys for authentication. Visit [Google AI Studio dashboard](https://makersuite.google.com/app/apikey) page to retrieve the API key you'll use in your requests.

> [!CAUTION]
> **Remember that your API key is a secret!**  
> Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

```dart
final googleaiApiKey = Platform.environment['GOOGLEAI_API_KEY'];
final client = GoogleAIClient(apiKey: googleaiApiKey);
```

### Generate content

#### Text-only input

Use the `generateContent` method to generate a response from the model given an input message.

```dart
final res = await client.generateContent(
  modelId: 'gemini-pro',
  request: const GenerateContentRequest(
    contents: [
      Content(
        parts: [
          Part(text: 'Write a story about a magic backpack.'),
        ],
      ),
    ],
    generationConfig: GenerationConfig(
      temperature: 0.8,
    ),
  ),
);
print(res.candidates?.first.content?.parts?.first.text);
// In a quaint little town nestled amidst rolling hills, there lived a...
```

#### Text-and-image input

If the input contains both text and image, use the gemini-pro-vision model.

```dart
final res = await client.generateContent(
  modelId: 'gemini-pro-vision',
  request: GenerateContentRequest(
    contents: [
      Content(
        parts: [
          const Part(text: 'What is this picture?'),
          Part(
            inlineData: Blob(
              mimeType: 'image/png',
              data: base64.encode(
                await File('./test/assets/1.png').readAsBytes(),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
print(res.candidates?.first.content?.parts?.first.text);
// The picture shows some scones with blueberries and flowers...
```

#### Multi-turn conversations (chat)

Using Gemini, you can build freeform conversations across multiple turns.

> [!NOTE]
> The gemini-pro-vision model (for text-and-image input) is not yet optimized for multi-turn conversations. 
> Make sure to use gemini-pro and text-only input for chat use cases.

```dart
final res = await client.generateContent(
  modelId: 'gemini-pro',
  request: const GenerateContentRequest(
    contents: [
      Content(
        role: 'user',
        parts: [
          Part(
            text: 'Write the first line of a story about a magic backpack.',
          ),
        ],
      ),
      Content(
        role: 'model',
        parts: [
          Part(
            text:
                'In the bustling city of Meadow brook, lived a young girl named Sophie. '
                'She was a bright and curious soul with an imaginative mind.',
          ),
        ],
      ),
      Content(
        role: 'user',
        parts: [
          Part(
            text: 'Can you set it in a quiet village in 1600s France?',
          ),
        ],
      ),
    ],
  ),
);
print(res.candidates?.first.content?.parts?.first.text);
// In the heart of a tranquil village nestled amidst the rolling hills of 17th century France...
```

### Count tokens

When using long prompts, it might be useful to count tokens before sending any content to the model.

```dart
final res = await client.countTokens(
  modelId: 'gemini-pro',
  request: const CountTokensRequest(
    contents: [
      Content(
        parts: [
          Part(
            text: 'Write a story about a magic backpack.',
          ),
        ],
      ),
    ],
  ),
);
print(res.totalTokens);
// 8
```

### Embedding

Use the `embedding-001` model with either `embedContents` or `batchEmbedContents`:

```dart
final res = await client.embedContent(
  modelId: 'embedding-001',
  request: const EmbedContentRequest(
    content: Content(
      parts: [
        Part(text: 'Write a story about a magic backpack.'),
      ],
    ),
  ),
);
print(res.embedding?.values);
// [0.008624583, -0.030451821, -0.042496547, ...]
```

### Model info

#### List models

Use the `listModels` method to list all the models available through the API, including both the Gemini and PaLM family models.

```dart
final res = await client.listModels();
print(res.models);
// [Model(name: models/gemini-pro, displayName: Gemini Pro, description: The best model...
```

#### Get model

Use the `getModel` method to return information about that model such as version, display name, input token limit, etc.

```dart
final res = await client.getModel(modelId: 'gemini-pro');
print(res);
// Model(name: models/gemini-pro, displayName: Gemini Pro, description: The best model...
```

## Advance Usage

### Default HTTP client

By default, the client uses `https://api.mistral.ai/v1` as the `baseUrl` and the following implementations of `http.Client`:

- Non-web: [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
- Web: [`FetchClient`](https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html) (to support streaming on web)

### Custom HTTP client

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = GoogleAIClient(
  apiKey: 'GOOGLEAI_API_KEY',
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = GoogleAIClient(
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

final client = GoogleAIClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

Google AI Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
