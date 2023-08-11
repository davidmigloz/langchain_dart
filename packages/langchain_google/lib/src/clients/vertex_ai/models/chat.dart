import 'package:collection/collection.dart';
import 'package:googleapis/aiplatform/v1.dart';
import 'package:meta/meta.dart';

import 'model.dart';

/// {@template vertex_ai_chat_model_request}
/// Request for a Vertex AI Chat Model.
/// {@endtemplate}
@immutable
class VertexAIChatModelRequest {
  /// {@macro vertex_ai_chat_model_request}
  const VertexAIChatModelRequest({
    this.context,
    this.examples,
    required this.messages,
    required this.params,
  });

  /// Context shapes how the model responds throughout the conversation. For
  /// example, you can use context to specify words the model can or cannot
  /// use, topics to focus on or avoid, or the response format or style.
  ///
  /// If not empty, this context will be given to the model first before the
  /// [examples] and [messages]
  ///
  /// Examples:
  /// - "Translate the phrase from English to French"
  /// - "Given a statement, classify the sentiment as happy, sad or neutral"
  ///
  /// Anything included in this field will take precedence over history in
  /// messages if the total input size exceeds the model's.
  final String? context;

  /// List of messages to the model to learn how to respond to the conversation.
  ///
  /// This includes both the user input and the response that the model should
  /// emulate.
  ///
  /// These examples are treated identically to conversation messages except
  /// that they take precedence over the history in [messages]: If the total
  /// input size exceeds the model's input_token_limit the input will be
  /// truncated. Items will be dropped from [messages] before [examples].
  final List<VertexAIChatModelExample>? examples;

  /// Conversation history provided to the model in a structured
  /// alternate-author form.
  ///
  /// Messages appear in chronological order: oldest first, newest last.
  ///
  ///
  /// When the history of messages causes the input
  /// to exceed the maximum length, the oldest messages are removed until the
  /// entire prompt is within the allowed limit.
  final List<VertexAIChatModelMessage> messages;

  /// The parameters for the request.
  final VertexAIModelRequestParams params;

  GoogleCloudAiplatformV1PredictRequest toRequest() {
    return GoogleCloudAiplatformV1PredictRequest(
      instances: [
        {
          'context': context,
          'examples':
              examples?.map((final e) => e.toMap()).toList(growable: false),
          'messages':
              messages.map((final m) => m.toMap()).toList(growable: false),
        },
      ],
      parameters: params.toMap(),
    );
  }

  @override
  bool operator ==(covariant final VertexAIChatModelRequest other) {
    final exampleEquals = const ListEquality<VertexAIChatModelExample>().equals;
    final messageEquals = const ListEquality<VertexAIChatModelMessage>().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            context == other.context &&
            exampleEquals(examples, other.examples) &&
            messageEquals(messages, other.messages) &&
            params == other.params;
  }

  @override
  int get hashCode =>
      context.hashCode ^
      const ListEquality<VertexAIChatModelExample>().hash(examples) ^
      const ListEquality<VertexAIChatModelMessage>().hash(messages) ^
      params.hashCode;

  @override
  String toString() {
    return 'VertexAIChatModelRequest{'
        'context: $context, '
        'examples: $examples, '
        'messages: $messages, '
        'params: $params}';
  }
}

/// {@template vertex_ai_chat_model_response}
/// Response for a Vertex AI Chat Model.
/// {@endtemplate}
@immutable
class VertexAIChatModelResponse {
  /// {@macro vertex_ai_chat_model_response}
  const VertexAIChatModelResponse({
    required this.predictions,
    required this.metadata,
  });

  /// The predictions from the model.
  final List<VertexAIChatModelPrediction> predictions;

  /// The metadata for the response.
  final VertexAIResponseMetadata metadata;

  factory VertexAIChatModelResponse.fromResponse(
    final GoogleCloudAiplatformV1PredictResponse response,
  ) {
    return VertexAIChatModelResponse(
      predictions: response.predictions
              ?.map(
                (final p) => VertexAIChatModelPrediction.fromMap(
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
  bool operator ==(covariant final VertexAIChatModelResponse other) {
    const listEquals = ListEquality<VertexAIChatModelPrediction>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(predictions, other.predictions) &&
            metadata == other.metadata;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAIChatModelPrediction>().hash(predictions) ^
      metadata.hashCode;

  @override
  String toString() {
    return 'VertexAIChatModelResponse{'
        'predictions: $predictions, '
        'metadata: $metadata}';
  }
}

/// {@template vertex_ai_chat_model_prediction}
/// Prediction from a Vertex AI Chat Model.
/// {@endtemplate}
@immutable
class VertexAIChatModelPrediction {
  /// {@macro vertex_ai_chat_model_prediction}
  const VertexAIChatModelPrediction({
    required this.candidates,
    required this.citations,
    required this.safetyAttributes,
  });

  /// The output messages from the model.
  final List<VertexAIChatModelMessage> candidates;

  /// The citations for the prediction.
  final List<List<VertexAIPredictionCitation>> citations;

  /// The safety attributes for the prediction.
  final List<VertexAIPredictionSafetyAttributes> safetyAttributes;

  factory VertexAIChatModelPrediction.fromMap(
    final Map<String, dynamic> predictionJson,
  ) {
    final candidates =
        predictionJson['candidates'] as List<dynamic>? ?? const [];
    final citationMetadataList =
        predictionJson['citationMetadata'] as List<dynamic>? ?? const [];
    final citationsList = citationMetadataList.map((final cm) {
      final metadata = cm as Map<String, dynamic>? ?? const {};
      final citations = metadata['citations'] as List<dynamic>? ?? const [];
      return citations
          .map(
            (final c) => VertexAIPredictionCitation.fromMap(
              c as Map<String, dynamic>? ?? const {},
            ),
          )
          .toList(growable: false);
    }).toList(growable: false);
    final safetyAttributesList =
        predictionJson['safetyAttributes'] as List<dynamic>? ?? const [];
    final safetyAttributes = safetyAttributesList
        .map(
          (final sa) => VertexAIPredictionSafetyAttributes.fromMap(
            sa as Map<String, dynamic>? ?? const {},
          ),
        )
        .toList(growable: false);
    return VertexAIChatModelPrediction(
      candidates: candidates
          .map(
            (final c) => VertexAIChatModelMessage.fromMap(
              c as Map<String, dynamic>? ?? const {},
            ),
          )
          .toList(growable: false),
      citations: citationsList,
      safetyAttributes: safetyAttributes,
    );
  }

  @override
  bool operator ==(covariant final VertexAIChatModelPrediction other) {
    const candidatesEquals = ListEquality<VertexAIChatModelMessage>();
    const citationsEquals = DeepCollectionEquality();
    const safetyAttributesEquals =
        ListEquality<VertexAIPredictionSafetyAttributes>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            candidatesEquals.equals(candidates, other.candidates) &&
            citationsEquals.equals(citations, other.citations) &&
            safetyAttributesEquals.equals(
              safetyAttributes,
              other.safetyAttributes,
            );
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAIChatModelMessage>().hash(candidates) ^
      const DeepCollectionEquality().hash(citations) ^
      const ListEquality<VertexAIPredictionSafetyAttributes>()
          .hash(safetyAttributes);

  @override
  String toString() {
    return 'VertexAIChatModelPrediction{'
        'content: $candidates, '
        'citations: $citations, '
        'safetyAttributes: $safetyAttributes}';
  }
}

/// {@template vertex_ai_chat_model_message}
/// A message includes an author and the content of the message.
///
/// The author is used to tag messages when they are fed to the model as text.
/// {@endtemplate}
@immutable
class VertexAIChatModelMessage {
  /// {@macro vertex_ai_chat_model_message}
  const VertexAIChatModelMessage({
    this.author,
    required this.content,
  });

  /// The author of this message. This serves as a key for tagging the content
  /// of this message when it is fed to the model as text.
  ///
  /// The author can be any alphanumeric string.
  final String? author;

  /// The text content of the message.
  final String content;

  factory VertexAIChatModelMessage.fromMap(final Map<String, dynamic> map) {
    return VertexAIChatModelMessage(
      author: map['author'] as String?,
      content: map['content'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
    };
  }

  @override
  bool operator ==(covariant final VertexAIChatModelMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          author == other.author &&
          content == other.content;

  @override
  int get hashCode => author.hashCode ^ content.hashCode;

  @override
  String toString() {
    return 'VertexAIChatModelMessage{'
        'author: $author, '
        'content: $content}';
  }
}

/// {@template vertex_ai_chat_model_example}
/// Example of what the model should generate.
///
/// This includes both the user input and the response that the model should
/// emulate.
/// {@endtemplate}
@immutable
class VertexAIChatModelExample {
  /// {@macro vertex_ai_chat_model_example}
  const VertexAIChatModelExample({
    required this.input,
    required this.output,
  });

  /// An example of an input message from the user.
  final VertexAIChatModelMessage input;

  /// An example of what the model should output given the input.
  final VertexAIChatModelMessage output;

  Map<String, dynamic> toMap() {
    return {
      'input': input.toMap(),
      'output': output.toMap(),
    };
  }

  @override
  bool operator ==(covariant final VertexAIChatModelExample other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          input == other.input &&
          output == other.output;

  @override
  int get hashCode => input.hashCode ^ output.hashCode;

  @override
  String toString() {
    return 'VertexAIChatModelExample{'
        'input: $input, '
        'output: $output}';
  }
}
