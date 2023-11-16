import 'package:collection/collection.dart';
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
  final VertexAITextModelRequestParams params;

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

/// {@template vertex_ai_text_model_request_params}
/// Parameters for a Vertex AI Text model request.
/// {@endtemplate}
@immutable
class VertexAITextModelRequestParams {
  /// {@macro vertex_ai_text_model_request_params}
  const VertexAITextModelRequestParams({
    this.temperature = 0.2,
    this.maxOutputTokens = 1024,
    this.topP = 0.95,
    this.topK = 40,
    this.stopSequences = const [],
    this.candidateCount = 1,
  });

  /// The temperature is used for sampling during response generation, which
  /// occurs when topP and topK are applied. Temperature controls the degree of
  /// randomness in token selection. Lower temperatures are good for prompts
  /// that require a more deterministic and less open-ended or creative
  /// response, while higher temperatures can lead to more diverse or creative
  /// results. A temperature of 0 is deterministic, meaning that the highest
  /// probability response is always selected.
  ///
  /// For most use cases, try starting with a temperature of 0.2. If the model
  /// returns a response that's too generic, too short, or the model gives a
  /// fallback response, try increasing the temperature.
  ///
  /// Range: `[0.0, 1.0]`
  final double temperature;

  /// Maximum number of tokens that can be generated in the response. A token
  /// is approximately four characters. 100 tokens correspond to roughly
  /// 60-80 words.
  ///
  /// Specify a lower value for shorter responses and a higher value for longer
  /// responses.
  ///
  /// Range: `[1, 1024]`
  final int maxOutputTokens;

  /// Top-P changes how the model selects tokens for output. Tokens are
  /// selected from the most (see top-K) to least probable until the sum of
  /// their probabilities equals the top-P value. For example, if tokens A, B,
  /// and C have a probability of 0.3, 0.2, and 0.1 and the top-P value is 0.5,
  /// then the model will select either A or B as the next token by using
  /// temperature and excludes C as a candidate.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: `[0.0, 1.0]`
  final double topP;

  /// Top-K changes how the model selects tokens for output. A top-K of 1 means
  /// the next selected token is the most probable among all tokens in the
  /// model's vocabulary (also called greedy decoding), while a top-K of 3
  /// means that the next token is selected from among the three most probable
  /// tokens by using temperature.
  ///
  /// For each token selection step, the top-K tokens with the highest
  /// probabilities are sampled. Then tokens are further filtered based on
  /// top-P with the final token selected using temperature sampling.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: `[1, 40]`
  final int topK;

  /// Specifies a list of strings that tells the model to stop generating text
  /// if one of the strings is encountered in the response. If a string appears
  /// multiple times in the response, then the response truncates where it's
  /// first encountered. The strings are case-sensitive.
  final List<String> stopSequences;

  /// The number of response variations to return.
  final int candidateCount;

  /// Converts this object to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'maxOutputTokens': maxOutputTokens,
      'topP': topP,
      'topK': topK,
      'stopSequences': stopSequences,
      'candidateCount': candidateCount,
    };
  }

  @override
  bool operator ==(covariant final VertexAITextModelRequestParams other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          temperature == other.temperature &&
          maxOutputTokens == other.maxOutputTokens &&
          topP == other.topP &&
          topK == other.topK &&
          const ListEquality<String>().equals(
            stopSequences,
            other.stopSequences,
          ) &&
          candidateCount == other.candidateCount;

  @override
  int get hashCode =>
      temperature.hashCode ^
      maxOutputTokens.hashCode ^
      topP.hashCode ^
      topK.hashCode ^
      const ListEquality<String>().hash(stopSequences) ^
      candidateCount.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelRequestParams{'
        'temperature: $temperature, '
        'maxOutputTokens: $maxOutputTokens, '
        'topP: $topP, '
        'topK: $topK, '
        'stopSequence: $stopSequences, '
        'candidateCount: $candidateCount}';
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
  final VertexAITextModelResponseMetadata metadata;

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

  /// Factory for creating a [VertexAITextModelPrediction] from a map.
  factory VertexAITextModelPrediction.fromMap(
    final Map<String, dynamic> predictionJson,
  ) {
    final citationMetadata =
        predictionJson['citationMetadata'] as Map<String, dynamic>? ?? const {};
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

/// {@template vertex_ai_text_model_response_metadata}
/// Metadata for a Vertex AI Text Model Response.
/// {@endtemplate}
@immutable
class VertexAITextModelResponseMetadata {
  /// {@macro vertex_ai_text_model_response_metadata}
  const VertexAITextModelResponseMetadata({
    required this.token,
  });

  /// The token metadata for the response.
  final VertexAITextModelResponseMetadataToken token;

  /// Factory method for creating a [VertexAITextModelResponseMetadata] from a
  /// JSON map.
  factory VertexAITextModelResponseMetadata.fromMap(
    final Map<String, dynamic> metadataJson,
  ) {
    return VertexAITextModelResponseMetadata(
      token: VertexAITextModelResponseMetadataToken.fromMap(
        metadataJson['tokenMetadata'],
      ),
    );
  }

  @override
  bool operator ==(covariant final VertexAITextModelResponseMetadata other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelResponseMetadata{token: $token}';
  }
}

/// {@template vertex_ai_text_model_response_metadata_token}
/// Token metadata for a Vertex AI Text Model Response.
/// {@endtemplate}
@immutable
class VertexAITextModelResponseMetadataToken {
  /// {@macro vertex_ai_text_model_response_metadata_token}
  const VertexAITextModelResponseMetadataToken({
    required this.inputTotalTokens,
    required this.inputTotalBillableCharacters,
    required this.outputTotalTokens,
    required this.outputTotalBillableCharacters,
  });

  /// The total number of tokens in the input.
  final int inputTotalTokens;

  /// The total number of billable characters in the input.
  final int inputTotalBillableCharacters;

  /// The total number of tokens in the output.
  final int outputTotalTokens;

  /// The total number of billable characters in the output.
  final int outputTotalBillableCharacters;

  /// Factory method for creating a [VertexAITextModelResponseMetadataToken]
  /// from a JSON
  /// map.
  factory VertexAITextModelResponseMetadataToken.fromMap(
    final Map<String, dynamic> tokenMetadataJson,
  ) {
    final inputTokenCount =
        tokenMetadataJson['inputTokenCount'] as Map<String, dynamic>;
    final outputTokenCount =
        tokenMetadataJson['outputTokenCount'] as Map<String, dynamic>;
    return VertexAITextModelResponseMetadataToken(
      inputTotalTokens: inputTokenCount['totalTokens'] as int,
      inputTotalBillableCharacters:
          inputTokenCount['totalBillableCharacters'] as int,
      outputTotalTokens: outputTokenCount['totalTokens'] as int,
      outputTotalBillableCharacters:
          outputTokenCount['totalBillableCharacters'] as int,
    );
  }

  @override
  bool operator ==(
    covariant final VertexAITextModelResponseMetadataToken other,
  ) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          inputTotalTokens == other.inputTotalTokens &&
          inputTotalBillableCharacters == other.inputTotalBillableCharacters &&
          outputTotalTokens == other.outputTotalTokens &&
          outputTotalBillableCharacters == other.outputTotalBillableCharacters;

  @override
  int get hashCode =>
      inputTotalTokens.hashCode ^
      inputTotalBillableCharacters.hashCode ^
      outputTotalTokens.hashCode ^
      outputTotalBillableCharacters.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelResponseMetadataToken{'
        'inputTotalTokens: $inputTotalTokens, '
        'inputTotalBillableCharacters: $inputTotalBillableCharacters, '
        'outputTotalTokens: $outputTotalTokens, '
        'outputTotalCharacters: $outputTotalBillableCharacters}';
  }
}
