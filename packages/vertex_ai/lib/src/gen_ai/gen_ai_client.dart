import 'package:googleapis/aiplatform/v1.dart';
import 'package:http/http.dart' as http;

import 'apis/apis.dart';

/// {@template vertex_ai_gen_ai_client}
/// A client for interacting with Vertex AI's Generative AI foundational models.
///
/// APIs available:
/// - [text] API: models fine-tuned to follow natural language instructions and
///   suitable for a variety of language tasks (e.g. `text-bison`).
/// - [chat] API: models fine-tuned for multi-turn conversation use cases
///   (e.g. `chat-bison`).
/// - [textEmbeddings] API: models that extract semantic information from text
///   (e.g. `textembedding-gecko`).
///
/// Vertex AI Generative AI documentation:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview
///
/// API documentation:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/overview
///
/// ### Set up your Google Cloud project
///
/// 1. [Select or create a Google Cloud project](https://console.cloud.google.com/cloud-resource-manager).
/// 2. [Make sure that billing is enabled for your project](https://cloud.google.com/billing/docs/how-to/modify-project).
/// 3. [Enable the Vertex AI API](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
/// 4. [Configure the Vertex AI location](https://cloud.google.com/vertex-ai/docs/general/locations).
///
/// ### Authentication
///
/// To create an instance of `VertexAIGenAIClient` you need to provide an
/// HTTP client that handles authentication. The easiest way to do this is to
/// use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
/// from the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
/// package.
///
/// There are several ways to obtain an `AuthClient` depending on your use case.
/// Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
/// package documentation for more details.
///
/// Example using a service account JSON:
///
/// ```dart
/// final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
///   json.decode(serviceAccountJson),
/// );
/// final authClient = await clientViaServiceAccount(
///   serviceAccountCredentials,
///   [VertexAIGenAIClient.cloudPlatformScope],
/// );
/// final vertexAi = VertexAIGenAIClient(
///   httpClient: authClient,
///   project: 'your-project-id',
/// );
/// ```
///
/// The service account should have the following
/// [permission](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
/// - `aiplatform.endpoints.predict`
///
/// The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes)
/// is:
/// - `https://www.googleapis.com/auth/cloud-platform` (you can use the constant
///   `VertexAIGenAIClient.cloudPlatformScope`)
///
/// See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control
///
/// ### Pricing
///
/// You can find pricing information for Vertex AI here:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/pricing
/// {@endtemplate}
class VertexAIGenAIClient {
  /// {@macro vertex_ai_gen_ai_client}
  VertexAIGenAIClient({
    required final http.Client httpClient,
    required this.project,
    this.location = 'us-central1',
    final String? rootUrl,
  }) : _vertexAiApi = AiplatformApi(
          httpClient,
          rootUrl: rootUrl ?? 'https://$location-aiplatform.googleapis.com/',
        );

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  ///
  /// See: https://cloud.google.com/vertex-ai/docs/general/locations
  final String location;

  /// Vertex AI API client.
  final AiplatformApi _vertexAiApi;

  /// Scope required for Vertex AI API calls.
  static const cloudPlatformScope = AiplatformApi.cloudPlatformScope;

  /// Text model API.
  ///
  /// Models fine-tuned to follow natural language instructions and suitable
  /// for a variety of language tasks (e.g. `text-bison`).
  VertexAITextModelApi get text => VertexAITextModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );

  /// Chat model API.
  ///
  /// Models fine-tuned for multi-turn conversation use cases
  /// (e.g. `chat-bison`).
  VertexAITextChatModelApi get chat => VertexAITextChatModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );

  /// Text embeddings model API.
  ///
  /// Models that extract semantic information from text
  /// (e.g. `textembedding-gecko`).
  VertexAITextEmbeddingsModelApi get textEmbeddings =>
      VertexAITextEmbeddingsModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );
}
