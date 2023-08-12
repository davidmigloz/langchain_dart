import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';

/// {@template vertex_ai_text_model_api}
/// A client for interacting with Vertex AI Generative AI text models.
///
/// Documentation:
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

  /// Models API client.
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
    final VertexAITextModelRequestParams parameters =
        const VertexAITextModelRequestParams(),
  }) async {
    final request = VertexAITextModelGoogleApisMapper.mapRequest(
      VertexAITextModelRequest(prompt: prompt, params: parameters),
    );
    final response = await _modelsApi.predict(
      request,
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAITextModelGoogleApisMapper.mapResponse(response);
  }
}
