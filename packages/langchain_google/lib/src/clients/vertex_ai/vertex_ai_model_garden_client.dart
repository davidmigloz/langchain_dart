import 'package:googleapis/aiplatform/v1.dart';
import 'package:http/http.dart' as http;

import 'models/models.dart';

/// {@template vertex_ai_model_garden_client}
/// A client for interacting with Vertex AI Model Garden models.
///
/// This client gives you access to first-party models like the PaLM 2 family
/// and Codey, Open source models like BERT and T5, and Third-party models.
///
/// Check out Model Garden for more information:
/// https://cloud.google.com/model-garden
///
/// API documentation:
/// https://cloud.google.com/vertex-ai/docs/reference/rest
///
/// ### Set up your Google Cloud project
///
/// 1. [Select or create a Google Cloud project](https://console.cloud.google.com/cloud-resource-manager).
/// 2. [Make sure that billing is enabled for your project](https://cloud.google.com/billing/docs/how-to/modify-project).
/// 3. [Enable the Vertex AI API](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
/// 4. [Configure the Vertex AI location](https://cloud.google.com/vertex-ai/docs/general/locations).
///
/// ### Authenticated HTTP client
///
/// The HTTP [client] passed to the constructor must be authenticated.
/// You can use the `googleapis_auth` package to obtain an authenticated
/// HTTP client. See: https://pub.dev/packages/googleapis_auth#autonomous-application--service-account
///
/// Example:
/// ```dart
/// final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
///   json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
/// );
/// final client = await clientViaServiceAccount(
///   serviceAccountCredentials,
///   [VertexAIModelGardenClient.cloudPlatformScope],
/// );
/// ```
///
/// The service account should have the following permission:
/// - `aiplatform.endpoints.predict`
///
/// See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control
///
/// ### Pricing
///
/// You can find pricing information for Vertex AI here:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/pricing
/// {@endtemplate}
class VertexAIModelGardenClient {
  /// {@macro vertex_ai_model_garden_client}
  VertexAIModelGardenClient({
    required final http.Client client,
    required this.project,
    this.location = 'us-central1',
    final String rootUrl = 'https://us-central1-aiplatform.googleapis.com/',
  }) : _vertexAiApi = AiplatformApi(client, rootUrl: rootUrl);

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
  VertexAITextModelApi get text => VertexAITextModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );

  /// Chat model API.
  VertexAIChatModelApi get chat => VertexAIChatModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );

  /// Text embeddings model API.
  VertexAITextEmbeddingsModelApi get textEmbeddings =>
      VertexAITextEmbeddingsModelApi(
        modelsApi: _vertexAiApi.projects.locations.publishers.models,
        project: project,
        location: location,
      );
}

/// {@template vertex_ai_text_model_api}
/// A client for interacting with Vertex AI Model Garden text models.
/// https://cloud.google.com/vertex-ai/docs/generative-ai/text/text-overview
/// {@endtemplate}
class VertexAITextModelApi {
  /// {@macro vertex_ai_text_model_api}
  VertexAITextModelApi({
    required final ProjectsLocationsPublishersModelsResource modelsApi,
    required this.project,
    required this.location,
  }) : _modelsApi = modelsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Model Garden API client.
  final ProjectsLocationsPublishersModelsResource _modelsApi;

  /// Get predictions from a text model.
  ///
  /// - [prompt] a prompt is a natural language request submitted to a language
  ///   model to receive a response back. Prompts can contain questions,
  ///   instructions, contextual information, examples, and text for the
  ///   model to complete or continue.
  /// - [publisher] the publisher of the model. Use `google` for first-party
  ///   models.
  /// - [model] the model to use. To use the latest model version, specify the
  ///   model name without a version number (e.g. `text-bison`). To use a
  ///   stable model version, specify the model version number
  ///   (e.g. `text-bison@001`). You can find a list of available models here:
  ///   https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  /// - [parameters] parameters to use for the request.
  ///
  /// API documentation:
  /// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.publishers.models/predict
  Future<VertexAITextModelResponse> predict({
    required final String prompt,
    final String publisher = 'google',
    final String model = 'text-bison',
    final VertexAIModelRequestParams parameters =
        const VertexAIModelRequestParams(),
  }) async {
    final response = await _modelsApi.predict(
      VertexAITextModelRequest(prompt: prompt, params: parameters).toRequest(),
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAITextModelResponse.fromResponse(response);
  }
}

/// {@template vertex_ai_chat_model_api}
/// A client for interacting with Vertex AI Model Garden chat models.
/// https://cloud.google.com/vertex-ai/docs/generative-ai/chat/test-chat-prompts
/// {@endtemplate}
class VertexAIChatModelApi {
  /// {@macro vertex_ai_chat_model_api}
  VertexAIChatModelApi({
    required final ProjectsLocationsPublishersModelsResource modelsApi,
    required this.project,
    required this.location,
  }) : _modelsApi = modelsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Model Garden API client.
  final ProjectsLocationsPublishersModelsResource _modelsApi;

  /// Get predictions from a chat model.
  ///
  /// - [context] shapes how the model responds throughout the conversation.
  ///   For example, you can use context to specify words the model can or
  ///   cannot use, topics to focus on or avoid, or the response format or
  ///   style.
  /// - [examples] list of messages to the model to learn how to respond to the
  ///   conversation.
  /// - [messages] conversation history provided to the model in a structured
  ///   alternate-author form (oldest first, newest last).
  /// - [publisher] the publisher of the model. Use `google` for first-party
  ///   models.
  /// - [model] the model to use. To use the latest model version, specify the
  ///   model name without a version number (e.g. `chat-bison`). To use a
  ///   stable model version, specify the model version number
  ///   (e.g. `chat-bison@001`). You can find a list of available models here:
  ///   https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  /// - [parameters] parameters to use for the request.
  ///
  /// API documentation:
  /// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.publishers.models/predict
  Future<VertexAIChatModelResponse> predict({
    final String? context,
    final List<VertexAIChatModelExample>? examples,
    required final List<VertexAIChatModelMessage> messages,
    final String publisher = 'google',
    final String model = 'chat-bison',
    final VertexAIModelRequestParams parameters =
        const VertexAIModelRequestParams(),
  }) async {
    final response = await _modelsApi.predict(
      VertexAIChatModelRequest(
        context: context,
        examples: examples,
        messages: messages,
        params: parameters,
      ).toRequest(),
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAIChatModelResponse.fromResponse(response);
  }
}

/// {@template vertex_ai_text_embeddings_model_api}
/// A client for interacting with Vertex AI Model Garden text embeddings models.
/// https://cloud.google.com/vertex-ai/docs/generative-ai/embeddings/get-text-embeddings
/// {@endtemplate}
class VertexAITextEmbeddingsModelApi {
  /// {@macro vertex_ai_text_embeddings_model_api}
  VertexAITextEmbeddingsModelApi({
    required final ProjectsLocationsPublishersModelsResource modelsApi,
    required this.project,
    required this.location,
  }) : _modelsApi = modelsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Model Garden API client.
  final ProjectsLocationsPublishersModelsResource _modelsApi;

  /// Get predictions from a text embeddings model.
  ///
  /// - [content] the text that you want to generate embeddings for.
  /// - [publisher] the publisher of the model. Use `google` for first-party
  ///   models.
  /// - [model] the model to use. To use the latest model version, specify the
  ///   model name without a version number (e.g. `textembedding-gecko`). To
  ///   use a stable model version, specify the model version number
  ///   (e.g. `textembedding-gecko@001`). You can find a list of available
  ///   models here: https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  ///
  /// API documentation:
  /// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.publishers.models/predict
  Future<VertexAITextEmbeddingsModelResponse> predict({
    required final List<String> content,
    final String publisher = 'google',
    final String model = 'textembedding-gecko',
    final VertexAIModelRequestParams parameters =
        const VertexAIModelRequestParams(),
  }) async {
    assert(
      content.length <= 5,
      'There is a limit of up to 5 input texts per request',
    );
    final response = await _modelsApi.predict(
      VertexAITextEmbeddingsModelRequest(content: content).toRequest(),
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAITextEmbeddingsModelResponse.fromResponse(response);
  }
}
