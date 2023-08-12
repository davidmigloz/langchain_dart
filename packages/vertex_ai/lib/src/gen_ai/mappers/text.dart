import 'package:googleapis/aiplatform/v1.dart';

import '../models/models.dart';

/// Vertex AI Text Model Mapper to googleapis models.
class VertexAITextModelGoogleApisMapper {
  static GoogleCloudAiplatformV1PredictRequest mapRequest(
    final VertexAITextModelRequest request,
  ) {
    return GoogleCloudAiplatformV1PredictRequest(
      instances: [
        {'prompt': request.prompt},
      ],
      parameters: request.params.toMap(),
    );
  }

  static VertexAITextModelResponse mapResponse(
    final GoogleCloudAiplatformV1PredictResponse response,
  ) {
    return VertexAITextModelResponse(
      predictions: response.predictions
              ?.map(
                (final p) => VertexAITextModelPrediction.fromMap(
                  p as Map<String, dynamic>? ?? const {},
                ),
              )
              .toList(growable: false) ??
          const [],
      metadata: VertexAITextModelResponseMetadata.fromMap(
        response.metadata as Map<String, dynamic>? ?? const {},
      ),
    );
  }
}
