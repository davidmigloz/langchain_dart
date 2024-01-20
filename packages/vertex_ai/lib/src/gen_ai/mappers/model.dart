import 'package:googleapis/aiplatform/v1.dart';

import '../models/model.dart';
import '../models/text.dart';
import '../models/text_chat.dart';

/// Vertex AI count tokens mapper.
class VertexAICountTokensGoogleApisMapper {
  /// Maps a VertexAITextModelRequest to a GoogleCloudAiplatformV1CountTokensRequest.
  static GoogleCloudAiplatformV1CountTokensRequest mapTextRequest(
    final VertexAITextModelRequest request,
  ) {
    return GoogleCloudAiplatformV1CountTokensRequest(
      instances: [
        {'prompt': request.prompt},
      ],
    );
  }

  /// Maps a VertexAITextChatModelRequest to a GoogleCloudAiplatformV1CountTokensRequest.
  static GoogleCloudAiplatformV1CountTokensRequest mapTextChatRequest(
    final VertexAITextChatModelRequest request,
  ) {
    return GoogleCloudAiplatformV1CountTokensRequest(
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
    );
  }

  /// Maps a GoogleCloudAiplatformV1CountTokensResponse to a VertexAICountTokensResponse.
  static VertexAICountTokensResponse mapResponse(
    final GoogleCloudAiplatformV1CountTokensResponse response,
  ) {
    return VertexAICountTokensResponse(
      totalBillableCharacters: response.totalBillableCharacters ?? 0,
      totalTokens: response.totalTokens ?? 0,
    );
  }
}
