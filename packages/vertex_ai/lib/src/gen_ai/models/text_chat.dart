import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'model.dart';

/// {@template vertex_ai_text_chat_model_request}
/// Request for a Vertex AI Text Chat Model.
/// {@endtemplate}
@immutable
class VertexAITextChatModelRequest {
  /// {@macro vertex_ai_text_chat_model_request}
  const VertexAITextChatModelRequest({
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
  final List<VertexAITextChatModelExample>? examples;

  /// Conversation history provided to the model in a structured
  /// alternate-author form.
  ///
  /// Messages appear in chronological order: oldest first, newest last.
  ///
  ///
  /// When the history of messages causes the input
  /// to exceed the maximum length, the oldest messages are removed until the
  /// entire prompt is within the allowed limit.
  final List<VertexAITextChatModelMessage> messages;

  /// The parameters for the request.
  final VertexAITextChatModelRequestParams params;

  @override
  bool operator ==(covariant final VertexAITextChatModelRequest other) {
    final exampleEquals =
        const ListEquality<VertexAITextChatModelExample>().equals;
    final messageEquals =
        const ListEquality<VertexAITextChatModelMessage>().equals;
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
      const ListEquality<VertexAITextChatModelExample>().hash(examples) ^
      const ListEquality<VertexAITextChatModelMessage>().hash(messages) ^
      params.hashCode;

  @override
  String toString() {
    return 'VertexAITextChatModelRequest{'
        'context: $context, '
        'examples: $examples, '
        'messages: $messages, '
        'params: $params}';
  }
}

/// {@template vertex_ai_text_chat_model_request_params}
/// Parameters for a Vertex AI Text Chat model request.
/// {@endtemplate}
@immutable
class VertexAITextChatModelRequestParams {
  /// {@macro vertex_ai_text_chat_model_request_params}
  const VertexAITextChatModelRequestParams({
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
  bool operator ==(covariant final VertexAITextChatModelRequestParams other) =>
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
    return 'VertexAITextChatModelRequestParams{'
        'temperature: $temperature, '
        'maxOutputTokens: $maxOutputTokens, '
        'topP: $topP, '
        'topK: $topK, '
        'stopSequence: $stopSequences, '
        'candidateCount: $candidateCount}';
  }
}

/// {@template vertex_ai_text_chat_model_response}
/// Response for a Vertex AI Text Chat Model.
/// {@endtemplate}
@immutable
class VertexAITextChatModelResponse {
  /// {@macro vertex_ai_text_chat_model_response}
  const VertexAITextChatModelResponse({
    required this.predictions,
    required this.metadata,
  });

  /// The predictions from the model.
  final List<VertexAITextChatModelPrediction> predictions;

  /// The metadata for the response.
  final VertexAITextChatModelResponseMetadata metadata;

  @override
  bool operator ==(covariant final VertexAITextChatModelResponse other) {
    const listEquals = ListEquality<VertexAITextChatModelPrediction>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(predictions, other.predictions) &&
            metadata == other.metadata;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAITextChatModelPrediction>().hash(predictions) ^
      metadata.hashCode;

  @override
  String toString() {
    return 'VertexAITextChatModelResponse{'
        'predictions: $predictions, '
        'metadata: $metadata}';
  }
}

/// {@template vertex_ai_text_chat_model_prediction}
/// Prediction from a Vertex AI Chat Model.
/// {@endtemplate}
@immutable
class VertexAITextChatModelPrediction {
  /// {@macro vertex_ai_text_chat_model_prediction}
  const VertexAITextChatModelPrediction({
    required this.candidates,
    required this.citations,
    required this.safetyAttributes,
  });

  /// The output messages from the model.
  final List<VertexAITextChatModelMessage> candidates;

  /// The citations for the prediction.
  final List<List<VertexAIPredictionCitation>> citations;

  /// The safety attributes for the prediction.
  final List<VertexAIPredictionSafetyAttributes> safetyAttributes;

  /// Factory for creating a [VertexAITextChatModelPrediction] from a JSON map.
  factory VertexAITextChatModelPrediction.fromMap(
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
    return VertexAITextChatModelPrediction(
      candidates: candidates
          .map(
            (final c) => VertexAITextChatModelMessage.fromMap(
              c as Map<String, dynamic>? ?? const {},
            ),
          )
          .toList(growable: false),
      citations: citationsList,
      safetyAttributes: safetyAttributes,
    );
  }

  @override
  bool operator ==(covariant final VertexAITextChatModelPrediction other) {
    const candidatesEquals = ListEquality<VertexAITextChatModelMessage>();
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
      const ListEquality<VertexAITextChatModelMessage>().hash(candidates) ^
      const DeepCollectionEquality().hash(citations) ^
      const ListEquality<VertexAIPredictionSafetyAttributes>()
          .hash(safetyAttributes);

  @override
  String toString() {
    return 'VertexAITextChatModelPrediction{'
        'content: $candidates, '
        'citations: $citations, '
        'safetyAttributes: $safetyAttributes}';
  }
}

/// {@template vertex_ai_text_chat_model_message}
/// A message includes an author and the content of the message.
///
/// The author is used to tag messages when they are fed to the model as text.
/// {@endtemplate}
@immutable
class VertexAITextChatModelMessage {
  /// {@macro vertex_ai_text_chat_model_message}
  const VertexAITextChatModelMessage({
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

  /// Factory for creating a [VertexAITextChatModelMessage] from a JSON map.
  factory VertexAITextChatModelMessage.fromMap(final Map<String, dynamic> map) {
    return VertexAITextChatModelMessage(
      author: map['author'] as String?,
      content: map['content'] as String,
    );
  }

  /// Converts this message to a JSON map.
  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
    };
  }

  @override
  bool operator ==(covariant final VertexAITextChatModelMessage other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          author == other.author &&
          content == other.content;

  @override
  int get hashCode => author.hashCode ^ content.hashCode;

  @override
  String toString() {
    return 'VertexAITextChatModelMessage{'
        'author: $author, '
        'content: $content}';
  }
}

/// {@template vertex_ai_text_chat_model_example}
/// Example of what the model should generate.
///
/// This includes both the user input and the response that the model should
/// emulate.
/// {@endtemplate}
@immutable
class VertexAITextChatModelExample {
  /// {@macro vertex_ai_text_chat_model_example}
  const VertexAITextChatModelExample({
    required this.input,
    required this.output,
  });

  /// An example of an input message from the user.
  final VertexAITextChatModelMessage input;

  /// An example of what the model should output given the input.
  final VertexAITextChatModelMessage output;

  /// Converts this example to a JSON map.
  Map<String, dynamic> toMap() {
    return {
      'input': input.toMap(),
      'output': output.toMap(),
    };
  }

  @override
  bool operator ==(covariant final VertexAITextChatModelExample other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          input == other.input &&
          output == other.output;

  @override
  int get hashCode => input.hashCode ^ output.hashCode;

  @override
  String toString() {
    return 'VertexAITextChatModelExample{'
        'input: $input, '
        'output: $output}';
  }
}

/// {@template vertex_ai_text_chat_model_response_metadata}
/// Metadata for a Vertex AI Text Chat Model Response.
/// {@endtemplate}
@immutable
class VertexAITextChatModelResponseMetadata {
  /// {@macro vertex_ai_text_chat_model_response_metadata}
  const VertexAITextChatModelResponseMetadata({
    required this.token,
  });

  /// The token metadata for the response.
  final VertexAITextChatModelResponseMetadataToken token;

  /// Factory method for creating a [VertexAITextChatModelResponseMetadata]
  /// from a JSON map.
  factory VertexAITextChatModelResponseMetadata.fromMap(
    final Map<String, dynamic> metadataJson,
  ) {
    return VertexAITextChatModelResponseMetadata(
      token: VertexAITextChatModelResponseMetadataToken.fromMap(
        metadataJson['tokenMetadata'],
      ),
    );
  }

  @override
  bool operator ==(
    covariant final VertexAITextChatModelResponseMetadata other,
  ) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() {
    return 'VertexAITextChatModelResponseMetadata{token: $token}';
  }
}

/// {@template vertex_ai_text_chat_model_response_metadata_token}
/// Token metadata for a Vertex AI Text Chat Model Response.
/// {@endtemplate}
@immutable
class VertexAITextChatModelResponseMetadataToken {
  /// {@macro vertex_ai_text_chat_model_response_metadata_token}
  const VertexAITextChatModelResponseMetadataToken({
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

  /// Factory method for creating a [VertexAITextChatModelResponseMetadataToken]
  /// from a JSON
  /// map.
  factory VertexAITextChatModelResponseMetadataToken.fromMap(
    final Map<String, dynamic> tokenMetadataJson,
  ) {
    final inputTokenCount =
        tokenMetadataJson['inputTokenCount'] as Map<String, dynamic>;
    final outputTokenCount =
        tokenMetadataJson['outputTokenCount'] as Map<String, dynamic>;
    return VertexAITextChatModelResponseMetadataToken(
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
    covariant final VertexAITextChatModelResponseMetadataToken other,
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
    return 'VertexAITextChatModelResponseMetadataToken{'
        'inputTotalTokens: $inputTotalTokens, '
        'inputTotalBillableCharacters: $inputTotalBillableCharacters, '
        'outputTotalTokens: $outputTotalTokens, '
        'outputTotalCharacters: $outputTotalBillableCharacters}';
  }
}
