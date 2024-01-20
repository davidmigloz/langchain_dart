import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

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

  /// Factory method for creating a [VertexAIPredictionCitation] from a JSON
  /// map.
  factory VertexAIPredictionCitation.fromMap(
    final Map<String, dynamic> citationJson,
  ) {
    return VertexAIPredictionCitation(
      startIndex: citationJson['startIndex'] as int,
      endIndex: citationJson['endIndex'] as int,
      url: citationJson['url'] as String?,
      title: citationJson['title'] as String?,
      license: citationJson['license'] as String?,
      publicationDate: DateTime.tryParse(citationJson['publicationDate'] ?? ''),
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

  /// Factory method for creating a [VertexAIPredictionSafetyAttributes] from a
  /// JSON map.
  factory VertexAIPredictionSafetyAttributes.fromMap(
    final Map<String, dynamic> safetyAttributesJson,
  ) {
    return VertexAIPredictionSafetyAttributes(
      categories: (safetyAttributesJson['categories'] as List<dynamic>? ??
              const [])
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
      blocked: safetyAttributesJson['blocked'] as bool? ?? false,
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

/// {@template vertex_ai_count_tokens_response}
/// Response for a Vertex AI count tokens request.
/// {@endtemplate}
@immutable
class VertexAICountTokensResponse {
  /// {@macro vertex_ai_count_tokens_response}
  const VertexAICountTokensResponse({
    required this.totalBillableCharacters,
    required this.totalTokens,
  });

  /// The total number of billable characters counted across all instances from
  /// the request.
  final int totalBillableCharacters;

  /// The total number of tokens counted across all instances from the request.
  final int totalTokens;

  @override
  bool operator ==(covariant final VertexAICountTokensResponse other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            totalBillableCharacters == other.totalBillableCharacters &&
            totalTokens == other.totalTokens;
  }

  @override
  int get hashCode => totalBillableCharacters.hashCode ^ totalTokens.hashCode;

  @override
  String toString() {
    return 'VertexAITextModelResponse{'
        'totalBillableCharacters: $totalBillableCharacters, '
        'totalTokens: $totalTokens}';
  }
}
