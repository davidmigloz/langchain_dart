import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';

/// {@template vertex_ai_text_chat_model_api}
/// A client for interacting with Vertex AI Model Garden Text Chat Models.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/chat/test-chat-prompts
///
/// Supported models:
/// - `chat-bison`
///   * Max input token: 4096
///   * Max output tokens: 1024
///   * Training data: Up to Feb 2023
///   * Max turns: 2500
/// - `chat-bison-32k`
///   * Max input and output tokens combined: 32k
///   * Training data: Up to Aug 2023
///   * Max turns: 2500
///
/// The previous list of models may not be exhaustive or up-to-date. Check out
/// the [Vertex AI documentation](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models)
/// for the latest list of available models.
/// {@endtemplate}
class VertexAITextChatModelApi {
  /// {@macro vertex_ai_text_chat_model_api}
  VertexAITextChatModelApi({
    required final ProjectsLocationsPublishersModelsResource modelsApi,
    required this.project,
    required this.location,
  }) : _modelsApi = modelsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Models API client.
  final ProjectsLocationsPublishersModelsResource _modelsApi;

  /// Get predictions from a text chat model.
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
  Future<VertexAITextChatModelResponse> predict({
    final String? context,
    final List<VertexAITextChatModelExample>? examples,
    required final List<VertexAITextChatModelMessage> messages,
    final String publisher = 'google',
    final String model = 'chat-bison',
    final VertexAITextChatModelRequestParams parameters =
        const VertexAITextChatModelRequestParams(),
  }) async {
    final request = VertexAITextChatModelGoogleApisMapper.mapRequest(
      VertexAITextChatModelRequest(
        context: context,
        examples: examples,
        messages: messages,
        params: parameters,
      ),
    );
    final response = await _modelsApi.predict(
      request,
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAITextChatModelGoogleApisMapper.mapResponse(response);
  }

  /// Count the number of tokens in the given prompt.
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
  Future<VertexAICountTokensResponse> countTokens({
    final String? context,
    final List<VertexAITextChatModelExample>? examples,
    required final List<VertexAITextChatModelMessage> messages,
    final String publisher = 'google',
    final String model = 'chat-bison',
  }) async {
    final request = VertexAICountTokensGoogleApisMapper.mapTextChatRequest(
      VertexAITextChatModelRequest(
        context: context,
        examples: examples,
        messages: messages,
        params: const VertexAITextChatModelRequestParams(),
      ),
    );
    final response = await _modelsApi.countTokens(
      request,
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAICountTokensGoogleApisMapper.mapResponse(response);
  }
}
