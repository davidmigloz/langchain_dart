import 'package:googleapis/aiplatform/v1.dart';

import '../models/models.dart';

/// Vertex AI Text Chat Model Mapper to googleapis models.
class VertexAITextChatModelGoogleApisMapper {
  /// Maps a VertexAITextChatModel to a GoogleCloudAiplatformV1Model.
  static GoogleCloudAiplatformV1PredictRequest mapRequest(
    final VertexAITextChatModelRequest request,
  ) {
    return GoogleCloudAiplatformV1PredictRequest(
      instances: [
        {
          'context': request.context ?? '',
          'examples': request.examples
                  ?.map((final e) => e.toMap())
                  .toList(growable: false) ??
              const [],
          'messages': request.messages
              .map((final m) => m.toMap())
              .toList(growable: false),
        },
      ],
      parameters: request.params.toMap(),
    );
  }

  /// Maps a GoogleCloudAiplatformV1PredictResponse to a
  /// VertexAITextChatModelResponse.
  static VertexAITextChatModelResponse mapResponse(
    final GoogleCloudAiplatformV1PredictResponse response,
  ) {
    return VertexAITextChatModelResponse(
      predictions: response.predictions
              ?.map(
                (final p) => VertexAITextChatModelPrediction.fromMap(
                  p as Map<String, dynamic>? ?? const {},
                ),
              )
              .toList(growable: false) ??
          const [],
      metadata: VertexAITextChatModelResponseMetadata.fromMap(
        response.metadata as Map<String, dynamic>? ?? const {},
      ),
    );
  }
}
