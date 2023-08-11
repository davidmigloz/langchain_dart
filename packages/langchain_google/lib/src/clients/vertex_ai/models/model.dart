import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template vertex_ai_model_request_params}
/// Parameters for a Vertex AI model request.
/// {@endtemplate}
@immutable
class VertexAIModelRequestParams {
  /// {@macro vertex_ai_model_request_params}
  const VertexAIModelRequestParams({
    this.temperature = 0.2,
    this.maxOutputTokens = 1024,
    this.topP = 0.95,
    this.topK = 40,
    this.additionalParameters,
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
  /// Range: [0.0, 1.0]
  final double temperature;

  /// Maximum number of tokens that can be generated in the response. A token
  /// is approximately four characters. 100 tokens correspond to roughly
  /// 60-80 words.
  ///
  /// Specify a lower value for shorter responses and a higher value for longer
  /// responses.
  ///
  /// Range: [1, 1024]
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
  /// Range: [0.0, 1.0]
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
  /// Range: [1, 40]
  final int topK;

  /// Additional parameters to be passed to the Vertex AI model.
  final Map<String, dynamic>? additionalParameters;

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'maxOutputTokens': maxOutputTokens,
      'topP': topP,
      'topK': topK,
      ...?additionalParameters,
    };
  }

  @override
  bool operator ==(covariant final VertexAIModelRequestParams other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          temperature == other.temperature &&
          maxOutputTokens == other.maxOutputTokens &&
          topP == other.topP &&
          topK == other.topK &&
          const MapEquality<String, dynamic>().equals(
            additionalParameters,
            other.additionalParameters,
          );

  @override
  int get hashCode =>
      temperature.hashCode ^
      maxOutputTokens.hashCode ^
      topP.hashCode ^
      topK.hashCode ^
      const MapEquality<String, dynamic>().hash(additionalParameters);

  @override
  String toString() {
    return 'VertexAIModelRequestParams{'
        'temperature: $temperature, '
        'maxOutputTokens: $maxOutputTokens, '
        'topP: $topP, '
        'topK: $topK, '
        'additionalParameters: $additionalParameters}';
  }
}

/// {@template vertex_ai_response_metadata}
/// Metadata for a Vertex AI Text and Chat Model Response.
/// {@endtemplate}
@immutable
class VertexAIResponseMetadata {
  /// {@macro vertex_ai_response_metadata}
  const VertexAIResponseMetadata({
    required this.token,
  });

  final VertexAIResponseMetadataToken token;

  factory VertexAIResponseMetadata.fromMap(
    final Map<String, dynamic> metadataJson,
  ) {
    return VertexAIResponseMetadata(
      token: VertexAIResponseMetadataToken.fromMap(
        metadataJson['tokenMetadata'],
      ),
    );
  }

  @override
  bool operator ==(covariant final VertexAIResponseMetadata other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() {
    return 'VertexAIResponseMetadata{token: $token}';
  }
}

/// {@template vertex_ai_response_metadata_token}
/// Token metadata for a Vertex AI Text and Chat Model Response.
/// {@endtemplate}
@immutable
class VertexAIResponseMetadataToken {
  /// {@macro vertex_ai_response_metadata_token}
  const VertexAIResponseMetadataToken({
    required this.inputTotalTokens,
    required this.inputTotalBillableCharacters,
    required this.outputTotalTokens,
    required this.outputTotalCharacters,
  });

  /// The total number of tokens in the input.
  final int inputTotalTokens;

  /// The total number of billable characters in the input.
  final int inputTotalBillableCharacters;

  /// The total number of tokens in the output.
  final int outputTotalTokens;

  /// The total number of billable characters in the output.
  final int outputTotalCharacters;

  factory VertexAIResponseMetadataToken.fromMap(
    final Map<String, dynamic> tokenMetadataJson,
  ) {
    final inputTokenCount =
        tokenMetadataJson['inputTokenCount'] as Map<String, dynamic>;
    final outputTokenCount =
        tokenMetadataJson['outputTokenCount'] as Map<String, dynamic>;
    return VertexAIResponseMetadataToken(
      inputTotalTokens: inputTokenCount['totalTokens'] as int,
      inputTotalBillableCharacters:
          inputTokenCount['totalBillableCharacters'] as int,
      outputTotalTokens: outputTokenCount['totalTokens'] as int,
      outputTotalCharacters: outputTokenCount['totalBillableCharacters'] as int,
    );
  }

  @override
  bool operator ==(
    covariant final VertexAIResponseMetadataToken other,
  ) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          inputTotalTokens == other.inputTotalTokens &&
          inputTotalBillableCharacters == other.inputTotalBillableCharacters &&
          outputTotalTokens == other.outputTotalTokens &&
          outputTotalCharacters == other.outputTotalCharacters;

  @override
  int get hashCode =>
      inputTotalTokens.hashCode ^
      inputTotalBillableCharacters.hashCode ^
      outputTotalTokens.hashCode ^
      outputTotalCharacters.hashCode;

  @override
  String toString() {
    return 'VertexAIResponseMetadataToken{'
        'inputTotalTokens: $inputTotalTokens, '
        'inputTotalBillableCharacters: $inputTotalBillableCharacters, '
        'outputTotalTokens: $outputTotalTokens, '
        'outputTotalCharacters: $outputTotalCharacters}';
  }
}

/// {@template vertex_ai_prediction_citation}
/// Citation for a Vertex AI Text Model Prediction.
/// {@endtemplate}
@immutable
class VertexAIPredictionCitation {
  /// {@macro vertex_ai_prediction_citation}
  const VertexAIPredictionCitation({
    required this.startIndex,
    required this.endIndex,
    this.url,
    this.title,
    this.license,
    this.publicationDate,
  });

  /// Index in the response where the citation starts (inclusive). Must be
  /// greater than or equal to 0 and less than the value of endIndex.
  final int startIndex;

  /// Index in the prediction output where the citation ends (exclusive). Must
  /// be greater than startIndex and less than the length of the response.
  final int endIndex;

  /// URL associated with this citation. If present, this URL links to the
  /// source webpage of this citation.
  final String? url;

  /// Title associated with this citation. If present, it refers to the title
  /// of the source of this citation.
  final String? title;

  /// License associated with this recitation. If present, it refers to the
  /// license of the source of this citation. Possible licenses include code
  /// licenses.
  final String? license;

  /// Publication date associated with this citation. If present, it refers to
  /// the date at which the source of this citation was published.
  final DateTime? publicationDate;

  factory VertexAIPredictionCitation.fromMap(
    final Map<String, dynamic> citationJson,
  ) {
    return VertexAIPredictionCitation(
      startIndex: citationJson['startIndex'] as int,
      endIndex: citationJson['endIndex'] as int,
      url: citationJson['url'] as String?,
      title: citationJson['title'] as String?,
      license: citationJson['license'] as String?,
      publicationDate: DateTime.tryParse(citationJson['publicationDate']),
    );
  }

  @override
  bool operator ==(covariant final VertexAIPredictionCitation other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          startIndex == other.startIndex &&
          endIndex == other.endIndex &&
          url == other.url;

  @override
  int get hashCode => startIndex.hashCode ^ endIndex.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'VertexAIPredictionCitation{'
        'startIndex: $startIndex, '
        'endIndex: $endIndex, '
        'url: $url}';
  }
}

/// {@template vertex_ai_prediction_safety_attributes}
/// Content processed through the Vertex AI PaLM API is assessed against a list
/// of safety attributes, which include "harmful categories" and topics that
/// may be considered sensitive.
/// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/responsible-ai#safety_attribute_confidence_scoring
/// {@endtemplate}
@immutable
class VertexAIPredictionSafetyAttributes {
  /// {@macro vertex_ai_prediction_safety_attributes}
  const VertexAIPredictionSafetyAttributes({
    required this.categories,
    required this.scores,
    required this.blocked,
  });

  /// The display names of Safety Attribute categories associated with the
  /// generated content. Order matches the [scores].
  final List<VertexAIPredictionSafetyAttributesCategory> categories;

  /// Confidence scores between 0.0 and 1.0, rounded to one decimal place,
  /// reflecting the likelihood of the input or response belonging to a given
  /// category.
  final List<double> scores;

  /// Whether Google has blocked the model response because it exceed the
  /// designated confidence scores for Derogatory, Toxic, Sexual or Violent.
  final bool blocked;

  factory VertexAIPredictionSafetyAttributes.fromMap(
    final Map<String, dynamic> safetyAttributesJson,
  ) {
    return VertexAIPredictionSafetyAttributes(
      categories: (safetyAttributesJson['categories'] as List<dynamic>)
          .map(
            (final category) => switch (category) {
              'Derogatory' =>
                VertexAIPredictionSafetyAttributesCategory.derogatory,
              'Toxic' => VertexAIPredictionSafetyAttributesCategory.toxic,
              'Sexual' => VertexAIPredictionSafetyAttributesCategory.sexual,
              'Violent' => VertexAIPredictionSafetyAttributesCategory.violent,
              'Insult' => VertexAIPredictionSafetyAttributesCategory.insult,
              'Profanity' =>
                VertexAIPredictionSafetyAttributesCategory.profanity,
              'Death, Harm & Tragedy' =>
                VertexAIPredictionSafetyAttributesCategory.deathHarmAndTragedy,
              'Firearms & Weapons' =>
                VertexAIPredictionSafetyAttributesCategory.firearmsAndWeapons,
              'Public Safety' =>
                VertexAIPredictionSafetyAttributesCategory.publicSafety,
              'Health' => VertexAIPredictionSafetyAttributesCategory.health,
              'Religion & Belief' =>
                VertexAIPredictionSafetyAttributesCategory.religionAndBelief,
              'Drugs' => VertexAIPredictionSafetyAttributesCategory.drugs,
              'War & Conflict' =>
                VertexAIPredictionSafetyAttributesCategory.warAndConflict,
              'Finance' => VertexAIPredictionSafetyAttributesCategory.finance,
              'Politics' => VertexAIPredictionSafetyAttributesCategory.politics,
              'Legal' => VertexAIPredictionSafetyAttributesCategory.legal,
              _ => VertexAIPredictionSafetyAttributesCategory.unknown,
            },
          )
          .toList(growable: false),
      scores:
          (safetyAttributesJson['scores'] as List<dynamic>? ?? const []).cast(),
      blocked: safetyAttributesJson['blocked'] as bool,
    );
  }

  @override
  bool operator ==(covariant final VertexAIPredictionSafetyAttributes other) {
    const categoriesEquals =
        ListEquality<VertexAIPredictionSafetyAttributesCategory>();
    const scoresEquals = ListEquality<double>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            categoriesEquals.equals(categories, other.categories) &&
            scoresEquals.equals(scores, other.scores) &&
            blocked == other.blocked;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAIPredictionSafetyAttributesCategory>()
          .hash(categories) ^
      const ListEquality<double>().hash(scores) ^
      blocked.hashCode;

  @override
  String toString() {
    return 'VertexAIPredictionSafetyAttributes{'
        'categories: $categories, '
        'scores: $scores, '
        'blocked: $blocked}';
  }
}

/// Category of the safety attribute.
/// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/responsible-ai#safety_attribute_descriptions
enum VertexAIPredictionSafetyAttributesCategory {
  /// Negative or harmful comments targeting identity and/or protected
  /// attributes.
  derogatory,

  /// Content that is rude, disrespectful, or profane.
  toxic,

  /// Contains references to sexual acts or other lewd content.
  sexual,

  /// Describes scenarios depicting violence against an individual or group, or
  /// general descriptions of gore.
  violent,

  /// Insulting, inflammatory, or negative comment towards a person or a group
  /// of people.
  insult,

  /// Obscene or vulgar language such as cursing.
  profanity,

  /// Human deaths, tragedies, accidents, disasters, and self-harm.
  deathHarmAndTragedy,

  /// Content that mentions knives, guns, personal weapons, and accessories
  /// such as ammunition, holsters, etc.
  firearmsAndWeapons,

  /// Services and organizations that provide relief and ensure public safety.
  publicSafety,

  /// Human health, including: Health conditions, diseases, and disorders
  /// Medical therapies, medication, vaccination, and medical practices
  /// Resources for healing, including support groups.
  health,

  /// Belief systems that deal with the possibility of supernatural laws and
  /// beings; religion, faith, belief, spiritual practice, churches, and places
  /// of worship. Includes astrology and the occult.
  religionAndBelief,

  /// Recreational and illicit drugs; drug paraphernalia and cultivation,
  /// headshops, etc. Includes medicinal use of drugs typically used
  /// recreationally (e.g. marijuana).
  drugs,

  /// War, military conflicts, and major physical conflicts involving large
  /// numbers of people. Includes discussion of military services, even if not
  /// directly related to a war or conflict.
  warAndConflict,

  /// Consumer and business financial services, such as banking, loans, credit,
  /// investing, insurance, etc.
  finance,

  /// Political news and media; discussions of social, governmental, and
  /// public policy.
  politics,

  /// Law-related content, to include: law firms, legal information, primary
  /// legal materials, paralegal services, legal publications and technology,
  /// expert witnesses, litigation consultants, and other legal service
  /// providers.
  legal,

  /// Unknown category.
  unknown;

  @override
  String toString() => name;
}
