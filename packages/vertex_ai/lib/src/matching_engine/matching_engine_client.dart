import 'package:googleapis/aiplatform/v1.dart';
import 'package:http/http.dart' as http;

import 'apis/apis.dart';

/// {@template vertex_ai_matching_engine_client}
/// A client for interacting with Vertex AI's Matching Engine vector database.
///
/// APIs available:
/// - [indexes] API: to create and manage vector indexes.
/// - [indexEndpoints] API: to create and manage vector index endpoints.
///
/// Vertex AI Matching Engine documentation:
/// https://cloud.google.com/vertex-ai/docs/matching-engine/overview
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
/// To create an instance of `VertexAIMatchingEngineClient` you need to provide
/// an HTTP client that handles authentication. The easiest way to do this is
/// to use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
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
/// final vertexAi = VertexAIMatchingEngineClient(
///   httpClient: authClient,
///   project: 'your-project-id',
/// );
/// ```
///
/// To be able to create and manage indexes and index endpoints, the service
/// account should have the following [permissions](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
/// - `aiplatform.indexes.create`
/// - `aiplatform.indexes.get`
/// - `aiplatform.indexes.list`
/// - `aiplatform.indexes.update`
/// - `aiplatform.indexes.delete`
/// - `aiplatform.indexEndpoints.create`
/// - `aiplatform.indexEndpoints.get`
/// - `aiplatform.indexEndpoints.list`
/// - `aiplatform.indexEndpoints.update`
/// - `aiplatform.indexEndpoints.delete`
/// - `aiplatform.indexEndpoints.deploy`
/// - `aiplatform.indexEndpoints.undeploy`
///
/// If you just want to query an index endpoint, the service account only needs:
/// - `aiplatform.indexEndpoints.queryVectors`
///
/// The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes)
/// is:
/// - `https://www.googleapis.com/auth/cloud-platform` (you can use the constant
///   `VertexAIMatchingEngineClient.cloudPlatformScope`)
///
/// See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control
/// {@endtemplate}
class VertexAIMatchingEngineClient {
  /// {@macro vertex_ai_matching_engine_client}
  VertexAIMatchingEngineClient({
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

  /// Indexes API client.
  VertexAIIndexesApi get indexes => VertexAIIndexesApi(
        indexesApi: _vertexAiApi.projects.locations.indexes,
        project: project,
        location: location,
      );

  /// Index Endpoints API client.
  VertexAIIndexEndpointsApi get indexEndpoints => VertexAIIndexEndpointsApi(
        indexEndpointsApi: _vertexAiApi.projects.locations.indexEndpoints,
        project: project,
        location: location,
      );
}
