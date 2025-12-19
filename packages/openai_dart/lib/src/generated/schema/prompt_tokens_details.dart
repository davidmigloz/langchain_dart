// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: PromptTokensDetails
// ==========================================

/// Breakdown of tokens used in the prompt.
@freezed
abstract class PromptTokensDetails with _$PromptTokensDetails {
  const PromptTokensDetails._();

  /// Factory constructor for PromptTokensDetails
  const factory PromptTokensDetails({
    /// Cached tokens present in the prompt.
    @JsonKey(name: 'cached_tokens', includeIfNull: false) int? cachedTokens,

    /// Audio input tokens present in the prompt.
    @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens,
  }) = _PromptTokensDetails;

  /// Object construction from a JSON representation
  factory PromptTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$PromptTokensDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['cached_tokens', 'audio_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'cached_tokens': cachedTokens, 'audio_tokens': audioTokens};
  }
}
