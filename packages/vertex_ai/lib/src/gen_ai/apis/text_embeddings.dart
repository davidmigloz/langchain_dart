import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';

/// {@template vertex_ai_text_embeddings_model_api}
/// A client for interacting with Vertex AI Model Garden text embeddings models.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/embeddings/get-text-embeddings
///
/// Supported models:
/// - `textembedding-gecko`
///   * Max input token: 3072
///   * Output: 768-dimensional vector embeddings
/// - `textembedding-gecko-multilingual`
///   * Max input token: 3072
///   * Output: 768-dimensional vector embeddings
///
/// The previous list of models may not be exhaustive or up-to-date. Check out
/// the [Vertex AI documentation](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models)
/// for the latest list of available models.
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

  /// Models API client.
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
    required final List<VertexAITextEmbeddingsModelContent> content,
    final String publisher = 'google',
    final String model = 'textembedding-gecko',
  }) async {
    assert(
      content.length <= 5,
      'There is a limit of up to 5 input texts per request',
    );
    final request = VertexAITextEmbeddingsModelGoogleApisMapper.mapRequest(
      VertexAITextEmbeddingsModelRequest(content: content),
    );
    final response = await _modelsApi.predict(
      request,
      'projects/$project/locations/$location/publishers/$publisher/models/$model',
    );
    return VertexAITextEmbeddingsModelGoogleApisMapper.mapResponse(response);
  }
}
