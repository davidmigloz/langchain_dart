import 'package:collection/collection.dart';
import 'package:googleapis/aiplatform/v1.dart';
import 'package:meta/meta.dart';

import 'model.dart';

/// {@template vertex_ai_text_model_request}
/// Request for a Vertex AI Text Model.
/// {@endtemplate}
@immutable
class VertexAITextModelRequest {
  /// {@macro vertex_ai_text_model_request}
  const VertexAITextModelRequest({
    required this.prompt,
    required this.params,
  });

  /// A prompt is a natural language request submitted to a language model to
  /// receive a response back. Prompts can contain questions, instructions,
  /// contextual information, examples, and text for the model to complete or
  /// continue.
  final String prompt;

  /// The parameters for the request.
  final VertexAIModelRequestParams params;

  GoogleCloudAiplatformV1PredictRequest toRequest() {
    return GoogleCloudAiplatformV1PredictRequest(
      instances: [
        {'prompt': prompt},
      ],
      parameters: params.toMap(),
    );
  }

  @override
  bool operator ==(covariant final VertexAITextModelRequest other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          prompt == other.prompt &&
          params == other.params;

  @override
  int get hashCode => prompt.hashCode ^ params.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelRequest{'
        'prompt: $prompt, '
        'params: $params}';
  }
}

/// {@template vertex_ai_text_model_response}
/// Response for a Vertex AI Text Model.
/// {@endtemplate}
@immutable
class VertexAITextModelResponse {
  /// {@macro vertex_ai_text_model_response}
  const VertexAITextModelResponse({
    required this.predictions,
    required this.metadata,
  });

  /// The predictions from the model.
  final List<VertexAITextModelPrediction> predictions;

  /// The metadata for the response.
  final VertexAIResponseMetadata metadata;

  factory VertexAITextModelResponse.fromResponse(
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
      metadata: VertexAIResponseMetadata.fromMap(
        response.metadata as Map<String, dynamic>? ?? const {},
      ),
    );
  }

  @override
  bool operator ==(covariant final VertexAITextModelResponse other) {
    const listEquals = ListEquality<VertexAITextModelPrediction>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(predictions, other.predictions) &&
            metadata == other.metadata;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAITextModelPrediction>().hash(predictions) ^
      metadata.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelResponse{'
        'predictions: $predictions, '
        'metadata: $metadata}';
  }
}

/// {@template vertex_ai_text_model_prediction}
/// Prediction from a Vertex AI Text Model.
/// {@endtemplate}
@immutable
class VertexAITextModelPrediction {
  /// {@macro vertex_ai_text_model_prediction}
  const VertexAITextModelPrediction({
    required this.content,
    required this.citations,
    required this.safetyAttributes,
  });

  /// The content of the prediction.
  final String content;

  /// The citations for the prediction.
  final List<VertexAIPredictionCitation> citations;

  /// The safety attributes for the prediction.
  final VertexAIPredictionSafetyAttributes safetyAttributes;

  factory VertexAITextModelPrediction.fromMap(
    final Map<String, dynamic> predictionJson,
  ) {
    final citationMetadata =
        predictionJson['citationMetadata'] as Map<String, dynamic>;
    final citations =
        citationMetadata['citations'] as List<dynamic>? ?? const [];
    return VertexAITextModelPrediction(
      content: predictionJson['content'] as String,
      citations: citations
          .map(
            (final c) => VertexAIPredictionCitation.fromMap(
              c as Map<String, dynamic>? ?? const {},
            ),
          )
          .toList(growable: false),
      safetyAttributes: VertexAIPredictionSafetyAttributes.fromMap(
        predictionJson['safetyAttributes'],
      ),
    );
  }

  @override
  bool operator ==(covariant final VertexAITextModelPrediction other) {
    const listEquals = ListEquality<VertexAIPredictionCitation>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            content == other.content &&
            listEquals.equals(citations, other.citations) &&
            safetyAttributes == other.safetyAttributes;
  }

  @override
  int get hashCode =>
      content.hashCode ^
      const ListEquality<VertexAIPredictionCitation>().hash(citations) ^
      safetyAttributes.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelPrediction{'
        'content: $content, '
        'citations: $citations, '
        'safetyAttributes: $safetyAttributes}';
  }
}
