# GCP Chat Vertex AI

Wrapper around [GCP Vertex AI chat models](https://cloud.google.com/vertex-ai/docs/generative-ai/chat/test-chat-prompts) API (aka PaLM API for chat).

## Set up your Google Cloud Platform project

1. [Select or create a Google Cloud project](https://console.cloud.google.com/cloud-resource-manager).
2. [Make sure that billing is enabled for your project](https://cloud.google.com/billing/docs/how-to/modify-project).
3. [Enable the Vertex AI API](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
4. [Configure the Vertex AI location](https://cloud.google.com/vertex-ai/docs/general/locations).

### Authentication

To create an instance of `ChatVertexAI` you need to provide an HTTP client that handles authentication. The easiest way to do this is to use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html) from the [googleapis_auth](https://pub.dev/packages/googleapis_auth) package.

To create an instance of `VertexAI` you need to provide an [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html) instance.

There are several ways to obtain an `AuthClient` depending on your use case. Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth) package documentation for more details.

Example using a service account JSON:

```dart
final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
  json.decode(serviceAccountJson),
);
final authClient = await clientViaServiceAccount(
  serviceAccountCredentials,
  [ChatVertexAI.cloudPlatformScope],
);
final chatVertexAi = ChatVertexAI(
  httpClient: authClient,
  project: 'your-project-id',
);
```

The service account should have the following [permission](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
- `aiplatform.endpoints.predict`

The required [OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes) is:
- `https://www.googleapis.com/auth/cloud-platform` (you can use the constant `ChatVertexAI.cloudPlatformScope`)

See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control

### Available models

- `chat-bison`
  * Max input token: 4096
  * Max output tokens: 1024
  * Training data: Up to Feb 2023
  * Max turns: 2500
- `chat-bison-32k`
  * Max input and output tokens combined: 32k
  * Training data: Up to Aug 2023
  * Max turns: 2500

The previous list of models may not be exhaustive or up-to-date. Check out the [Vertex AI documentation](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models) for the latest list of available models.

### Model options

You can define default options to use when calling the model (e.g. temperature, stop sequences, etc. ) using the `defaultOptions` parameter.

The default options can be overridden when calling the model using the `options` parameter.

Example:
```dart
final chatModel = ChatVertexAI(
  httpClient: authClient,
  project: 'your-project-id',
  defaultOptions: ChatVertexAIOptions(
    temperature: 0.9,
  ),
);
final result = await chatModel(
  [ChatMessage.humanText('Hello')],
  options: ChatVertexAIOptions(
    temperature: 0.5,
   ),
);
```

### Full example

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main() async {
  final chat = ChatVertexAI(
    httpClient: await _getAuthHttpClient(),
    project: _getProjectId(),
    defaultOptions: const ChatVertexAIOptions(
      temperature: 0,
    ),
  );
  while (true) {
    stdout.write('> ');
    final usrMsg = ChatMessage.humanText(stdin.readLineSync() ?? '');
    final aiMsg = await chat([usrMsg]);
    print(aiMsg.content);
  }
}

Future<AuthClient> _getAuthHttpClient() async {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return clientViaServiceAccount(
    serviceAccountCredentials,
    [VertexAI.cloudPlatformScope],
  );
}

String _getProjectId() {
  return Platform.environment['VERTEX_AI_PROJECT_ID']!;
}
```
