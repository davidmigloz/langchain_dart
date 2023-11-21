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

- Prompt Response (with streaming support)
- Models
  - List
  - Show Information
  - Create
  - Copy
  - Delete
  - Pull
  - Push
- Embeddings
  - Generate

## Table of contents
[//]: # (TODO update)

- [Ollama Dart Client](#ollama-dart-client)
  - [Features](#features)
  - [Table of contents](#table-of-contents)
  - [Usage](#usage)
    - [Chat](#chat)
      - [Chat with Streamed Response](#chat-with-streamed-response)
      - [Chat with Non-streamed Response](#chat-with-non-streamed-response)
    - [Models](#models)
      - [Create Model with streamed Response](#create-model-with-streamed-response)
      - [Create Model with Non-streamed Response](#create-model-with-non-streamed-response)
    - [Embeddings](#embeddings)
  - [Advance Usage](#advance-usage)
    - [Default HTTP client](#default-http-client)
    - [Custom HTTP client](#custom-http-client)
    - [Using a proxy](#using-a-proxy)
      - [HTTP proxy](#http-proxy)
      - [SOCKS5 proxy](#socks5-proxy)
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
[//]: # (TODO update)

List and describe the various models available in the API.

*** List Local Models ***

List models that are available locally.

```dart
  TagResponse tags = await client.listTags();
  print(tags.models);

  /// Output:
  ///
  /// TagResponse(
  ///    models: [
  ///       Tag(
  ///         name: codellama:13b, 
  ///         modifiedAt: 2023-09-19T23:18:56.540889126+02:00, 
  ///         size: 7323409954,
  ///       )
  ///   ]
  /// )
```

*** Show Model Information ***

Show details about a model including modelfile, template, parameters, license, and system prompt.

```dart
  ShowResponse response = await client.showModel(
    request: ShowRequest(name: modelName),
  );

  print(response);
  /// Output:
  /// ShowResponse{
  ///   license: "LLAMA 2 COMMUNITY LICENSE AGREEMENT...",
  ///   parameters: "rope_frequency_base            100000",
  ///   template: "[INST] {{ if and .First .System }}\u003c\u003cSYS\u003e\u003e{{ .System }}\u003c\u003c/SYS\u003e\u003e\n\n{{ end }}{{ .Prompt }} [/INST] "
  /// }
```
*** Create a Model ***

Creates a new local model using a modelfile. It is recommended to set modelfile to the content of the Modelfile rather than just set path. This is a requirement for remote create. Remote model creation should also create any file blobs, fields such as FROM and ADAPTER, explicitly with the server using Create a Blob and the value to the path indicated in the response.

#### Create Model with streamed Response

```dart
  const String createModelName = 'supermario';
  client
      .createModelStream(
    request: const CreateRequest(
      name: createModelName,
      modelfile:
          'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
    ),
  )
      .listen((final CreateResponse generated) {
    print(
      '🤖 creating model: $createModelName (${generated.status ?? 'processing'})',
    );
  });
```

#### Create Model with Non-streamed Response

```dart
  const String modelName = 'mario';
  const String modelfile =
      'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.';
    final CreateResponse response = await client.create(
    request: const CreateRequest(
      name: modelName,
      modelfile: modelfile,
      stream: false,
    ),
  );
  print(response.status);
  /// Output:
  /// CreateResponseStatus.success
```

*** Download a Model ***

Downlad a model from the Ollama servers

```dart
   Stream<PullResponse> response =
       client.pullModelStream(request: PullRequest(name: modelName));

   response.listen((PullResponse response) {
     if (response.status != null && response == PullResponseStatus.success) {
       print('finished pulling model: $modelName!!');
     } else {
       int completed = response.completed ?? 0;
       int total = response.total ?? 1;
       double finished = (completed.toDouble() / total.toDouble()) * 100;
       print(
         "$modelName: (${response.status ?? 'downloading'}) ${finished.toInt()}% [${"|" * finished.toInt()}] ${(total / 1024e3.toDouble()).toStringAsFixed(2)} GB",
       );
     }
   });
```

***Copy a Model***

Copy a model. Creates a model with another name from an existing model.

```dart
  const String copyName = 'codellama:7b-backup';
  await client.copyModel(
    request: const CopyRequest(
      source: modelName, 
      destination: copyName,
      ),
  );
```

To copy a model and return a http response object, use the method `copyModelWithResponse`:
```dart
  const String copyName = 'codellama:7b-backup';
  final Response response = await client.copyModelWithResponse(
    request: const CopyRequest(
     source: modelName,
     destination: copyName,
    ),
  );

 print(response.statusCode);
 /// Output:
 /// Status code: 200, empty body
```

*** Delete a Model ***

Delete a model and its data.

```dart
  String copyName = 'codellama:7b-backup';
  await client.deleteModel(
    request: DeleteRequest(name: copyName),
  );
```

To delete a model and return a http response object, use the method `deleteModelWithResponse`:
```dart
  const String copyName = 'codellama:7b-backup';
  final Response deleteResponse = await client.deleteModelWithResponse(
     request: const DeleteRequest(name: copyName),
  );
  print(deleteResponse.statusCode);
 /// Output:
 /// Status code: 200, null body
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
