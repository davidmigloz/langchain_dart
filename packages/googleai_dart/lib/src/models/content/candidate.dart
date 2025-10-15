import '../copy_with_sentinel.dart';
import '../metadata/finish_reason.dart';
import '../safety/safety_rating.dart';
import 'citation_metadata.dart';
import 'content.dart';
import 'logprobs_result.dart';

/// A generated response from the model.
class Candidate {
  /// Generated content.
  final Content? content;

  /// Why generation stopped.
  final FinishReason? finishReason;

  /// Safety assessment.
  final List<SafetyRating>? safetyRatings;

  /// Source citations.
  final CitationMetadata? citationMetadata;

  /// Tokens in this candidate.
  final int? tokenCount;

  /// Candidate index (0-based).
  final int? index;

  /// Average log probability.
  final double? avgLogprobs;

  /// Token-level logprobs.
  final LogprobsResult? logprobsResult;

  /// Creates a [Candidate].
  const Candidate({
    this.content,
    this.finishReason,
    this.safetyRatings,
    this.citationMetadata,
    this.tokenCount,
    this.index,
    this.avgLogprobs,
    this.logprobsResult,
  });

  /// Creates a [Candidate] from JSON.
  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
    content: json['content'] != null
        ? Content.fromJson(json['content'] as Map<String, dynamic>)
        : null,
    finishReason: json['finishReason'] != null
        ? finishReasonFromString(json['finishReason'] as String?)
        : null,
    safetyRatings: json['safetyRatings'] != null
        ? (json['safetyRatings'] as List)
              .map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
    citationMetadata: json['citationMetadata'] != null
        ? CitationMetadata.fromJson(
            json['citationMetadata'] as Map<String, dynamic>,
          )
        : null,
    tokenCount: json['tokenCount'] as int?,
    index: json['index'] as int?,
    avgLogprobs: (json['avgLogprobs'] as num?)?.toDouble(),
    logprobsResult: json['logprobsResult'] != null
        ? LogprobsResult.fromJson(
            json['logprobsResult'] as Map<String, dynamic>,
          )
        : null,
  );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
    if (content != null) 'content': content!.toJson(),
    if (finishReason != null)
      'finishReason': finishReasonToString(finishReason!),
    if (safetyRatings != null)
      'safetyRatings': safetyRatings!.map((e) => e.toJson()).toList(),
    if (citationMetadata != null)
      'citationMetadata': citationMetadata!.toJson(),
    if (tokenCount != null) 'tokenCount': tokenCount,
    if (index != null) 'index': index,
    if (avgLogprobs != null) 'avgLogprobs': avgLogprobs,
    if (logprobsResult != null) 'logprobsResult': logprobsResult!.toJson(),
  };

  /// Creates a copy with replaced values.
  Candidate copyWith({
    Object? content = unsetCopyWithValue,
    Object? finishReason = unsetCopyWithValue,
    Object? safetyRatings = unsetCopyWithValue,
    Object? citationMetadata = unsetCopyWithValue,
    Object? tokenCount = unsetCopyWithValue,
    Object? index = unsetCopyWithValue,
    Object? avgLogprobs = unsetCopyWithValue,
    Object? logprobsResult = unsetCopyWithValue,
  }) {
    return Candidate(
      content: content == unsetCopyWithValue
          ? this.content
          : content as Content?,
      finishReason: finishReason == unsetCopyWithValue
          ? this.finishReason
          : finishReason as FinishReason?,
      safetyRatings: safetyRatings == unsetCopyWithValue
          ? this.safetyRatings
          : safetyRatings as List<SafetyRating>?,
      citationMetadata: citationMetadata == unsetCopyWithValue
          ? this.citationMetadata
          : citationMetadata as CitationMetadata?,
      tokenCount: tokenCount == unsetCopyWithValue
          ? this.tokenCount
          : tokenCount as int?,
      index: index == unsetCopyWithValue ? this.index : index as int?,
      avgLogprobs: avgLogprobs == unsetCopyWithValue
          ? this.avgLogprobs
          : avgLogprobs as double?,
      logprobsResult: logprobsResult == unsetCopyWithValue
          ? this.logprobsResult
          : logprobsResult as LogprobsResult?,
    );
  }
}
