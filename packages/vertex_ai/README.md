# Vertex AI API Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![vertex_ai](https://img.shields.io/pub/v/vertex_ai.svg)](https://pub.dev/packages/vertex_ai)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Dart client for the [Vertex AI](https://cloud.google.com/vertex-ai) API.

## Features

- [Generative AI](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview)
  * [Text models](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text)
  * [Text chat models](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-chat)
  * [Text embeddings models](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-embeddings)

## Generative AI

[Generative AI]((https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview)) 
support on Vertex AI (also known as `genai`) gives you access to Google's large 
generative AI models so you can use in your AI-powered applications.

### Authentication

The `VertexAIGenAIClient` delegates authentication to the 
[googleapis_auth](https://pub.dev/packages/googleapis_auth) package. 

To create an instance of `VertexAIGenAIClient` you need to provide an
[`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html) 
instance.

There are several ways to obtain an `AuthClient` depending on your use case.
Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth) 
package documentation for more details.

Example using a service account JSON:

```dart
final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
  json.decode(serviceAccountJson),
);
final authClient = await clientViaServiceAccount(
  serviceAccountCredentials,
  [VertexAIGenAIClient.cloudPlatformScope],
);
final vertexAi = VertexAIGenAIClient(
  authHttpClient: authClient,
  project: 'your-project-id',
);
```

The service account should have the following
[permission](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
- `aiplatform.endpoints.predict`

The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes) 
is:
- `https://www.googleapis.com/auth/cloud-platform` (you can use the constant 
  `VertexAIGenAIClient.cloudPlatformScope`)

### Text models

[PaLM API for text](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text) 
is fine-tuned for language tasks such as classification, summarization, and 
entity extraction.

```dart
final res = await vertexAi.text.predict(
  prompt: 'What is the purpose of life?',
);
```

#### Chat models

[PaLM API for chat](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-chat) 
is fine-tuned for multi-turn chat, where the model keeps track of previous 
messages in the chat and uses it as context for generating new responses.

```dart
final res = await vertexAi.chat.predict(
  context: 'I want you to act as a Socrat.',
  messages: const [
    VertexAIChatModelMessage(
      author: 'USER',
      content: 'Is justice neccessary in a society?',
    ),
  ],
);
```

#### Text embeddings

The [Text Embedding API](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-embeddings) 
generates vector embeddings for input text. You can use embeddings for tasks 
like semantic search, recommendation, classification, and outlier detection.

```dart
final res = await vertexAi.textEmbeddings.predict(
  content: ['The only true wisdom is in knowing you know nothing.'],
);
```

## License

Vertex AI API Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
