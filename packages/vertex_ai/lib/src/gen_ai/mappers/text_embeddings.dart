import 'package:googleapis/aiplatform/v1.dart';

import '../models/models.dart';

/// Vertex AI Text Embeddings Model Mapper to googleapis models.
class VertexAITextEmbeddingsModelGoogleApisMapper {
  /// Maps a VertexAITextEmbeddingsModel to a GoogleCloudAiplatformV1Model.
  static GoogleCloudAiplatformV1PredictRequest mapRequest(
    final VertexAITextEmbeddingsModelRequest request,
  ) {
    return GoogleCloudAiplatformV1PredictRequest(
      instances: [
        for (final c in request.content) c.toMap(),
      ],
    );
  }

  /// Maps a GoogleCloudAiplatformV1PredictResponse to a
  /// VertexAITextEmbeddingsModelResponse.
  static VertexAITextEmbeddingsModelResponse mapResponse(
    final GoogleCloudAiplatformV1PredictResponse response,
  ) {
    return VertexAITextEmbeddingsModelResponse(
      predictions: response.predictions
              ?.map(
                (final p) => VertexAITextEmbeddingsModelPrediction.fromMap(
                  p as Map<String, dynamic>? ?? const {},
                ),
              )
              .toList(growable: false) ??
          const [],
      metadata: VertexAITextEmbeddingsModelResponseMetadata.fromMap(
        response.metadata as Map<String, dynamic>? ?? const {},
      ),
    );
  }
}
