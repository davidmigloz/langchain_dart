import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template vertex_ai_text_embeddings_model_request}
/// Request for a Vertex AI Text Embeddings Model.
/// {@endtemplate}
@immutable
class VertexAITextEmbeddingsModelRequest {
  /// {@macro vertex_ai_text_embeddings_model_request}
  const VertexAITextEmbeddingsModelRequest({
    required this.content,
  });

  /// The text that you want to generate embeddings for.
  ///
  /// There is a limit of up to 5 input texts per request.
  final List<String> content;

  @override
  bool operator ==(covariant final VertexAITextEmbeddingsModelRequest other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          const ListEquality<String>().equals(content, other.content);

  @override
  int get hashCode => const ListEquality<String>().hash(content);

  @override
  String toString() {
    return 'VertexAITextEmbeddingsModelRequest{'
        'content: $content}';
  }
}

/// {@template vertex_ai_text_embeddings_model_response}
/// Response for a Vertex AI Text Embeddings Model.
/// {@endtemplate}
@immutable
class VertexAITextEmbeddingsModelResponse {
  /// {@macro vertex_ai_text_embeddings_model_response}
  const VertexAITextEmbeddingsModelResponse({
    required this.predictions,
    required this.metadata,
  });

  /// The predictions from the model.
  final List<VertexAITextEmbeddingsModelPrediction> predictions;

  /// The metadata for the response.
  final VertexAITextEmbeddingsModelResponseMetadata metadata;

  @override
  bool operator ==(covariant final VertexAITextEmbeddingsModelResponse other) {
    const listEquals = ListEquality<VertexAITextEmbeddingsModelPrediction>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(predictions, other.predictions) &&
            metadata == other.metadata;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAITextEmbeddingsModelPrediction>()
          .hash(predictions) ^
      metadata.hashCode;

  @override
  String toString() {
    return 'VertexAITextEmbeddingsModelResponse{'
        'predictions: $predictions, '
        'metadata: $metadata}';
  }
}

/// {@template vertex_ai_text_embeddings_model_prediction}
/// Prediction from a Vertex AI Text Embeddings Model.
/// {@endtemplate}
@immutable
class VertexAITextEmbeddingsModelPrediction {
  /// {@macro vertex_ai_text_embeddings_model_prediction}
  const VertexAITextEmbeddingsModelPrediction({
    required this.values,
    required this.statistics,
  });

  /// Contains the embedding vectors corresponding to the words in the input
  /// text.
  final List<double> values;

  /// The statistics computed from the input text.
  final VertexAITextEmbeddingsModelResponseStatistics statistics;

  factory VertexAITextEmbeddingsModelPrediction.fromMap(
    final Map<String, dynamic> predictionJson,
  ) {
    final embeddings = predictionJson['embeddings'] as Map<String, dynamic>;
    final values = embeddings['values'] as List<dynamic>? ?? const [];
    final statistics = embeddings['statistics'] as Map<String, dynamic>? ??
        const <String, dynamic>{};
    return VertexAITextEmbeddingsModelPrediction(
      values: values.cast(),
      statistics: VertexAITextEmbeddingsModelResponseStatistics.fromMap(
        statistics,
      ),
    );
  }

  @override
  bool operator ==(
    covariant final VertexAITextEmbeddingsModelPrediction other,
  ) {
    const listEquals = ListEquality<double>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(values, other.values) &&
            statistics == other.statistics;
  }

  @override
  int get hashCode =>
      const ListEquality<double>().hash(values) ^ statistics.hashCode;

  @override
  String toString() {
    return 'VertexAITextEmbeddingsModelPrediction{'
        'values: $values, '
        'statistics: $statistics}';
  }
}

/// {@template vertex_ai_text_embeddings_model_response_statistics}
/// Statistics for a Vertex AI Text Embeddings Model Response.
/// {@endtemplate}
@immutable
class VertexAITextEmbeddingsModelResponseStatistics {
  /// {@macro vertex_ai_text_embeddings_model_response_statistics}
  const VertexAITextEmbeddingsModelResponseStatistics({
    required this.truncated,
    required this.tokenCount,
  });

  /// Indicates if the input text was longer than max allowed tokens and
  /// truncated.
  final bool truncated;

  /// Number of tokens of the input text.
  final int tokenCount;

  /// Factory for creating a [VertexAITextEmbeddingsModelResponseStatistics]
  /// from a JSON map.
  factory VertexAITextEmbeddingsModelResponseStatistics.fromMap(
    final Map<String, dynamic> statisticsJson,
  ) {
    return VertexAITextEmbeddingsModelResponseStatistics(
      truncated: statisticsJson['truncated'] as bool? ?? false,
      tokenCount: statisticsJson['tokenCount'] as int? ??
          statisticsJson['token_count'] as int? ?? // Typo in API
          0,
    );
  }

  @override
  bool operator ==(
    covariant final VertexAITextEmbeddingsModelResponseStatistics other,
  ) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            truncated == other.truncated &&
            tokenCount == other.tokenCount;
  }

  @override
  int get hashCode => truncated.hashCode ^ tokenCount.hashCode;

  @override
  String toString() {
    return 'VertexAITextEmbeddingsModelResponseStatistics{'
        'truncated: $truncated, '
        'tokenCount: $tokenCount}';
  }
}

/// {@template vertex_ai_text_embeddings_model_response_metadata}
/// Metadata for a Vertex AI Text Embeddings Model Response.
/// {@endtemplate}
@immutable
class VertexAITextEmbeddingsModelResponseMetadata {
  /// {@macro vertex_ai_text_embeddings_model_response_metadata}
  const VertexAITextEmbeddingsModelResponseMetadata({
    required this.billableCharacterCount,
  });

  /// The total number of billable characters.
  final int billableCharacterCount;

  /// Factory for creating a [VertexAITextEmbeddingsModelResponseMetadata]
  /// from a JSON map.
  factory VertexAITextEmbeddingsModelResponseMetadata.fromMap(
    final Map<String, dynamic> metadataJson,
  ) {
    return VertexAITextEmbeddingsModelResponseMetadata(
      billableCharacterCount: metadataJson['billableCharacterCount'] as int,
    );
  }

  @override
  bool operator ==(
    covariant final VertexAITextEmbeddingsModelResponseMetadata other,
  ) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          billableCharacterCount == other.billableCharacterCount;

  @override
  int get hashCode => billableCharacterCount.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelResponseMetadata{'
        'billableCharacterCount: $billableCharacterCount}';
  }
}
