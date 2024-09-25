// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CompletionTokensDetails
// ==========================================

/// Breakdown of tokens used in a completion.
@freezed
class CompletionTokensDetails with _$CompletionTokensDetails {
  const CompletionTokensDetails._();

  /// Factory constructor for CompletionTokensDetails
  const factory CompletionTokensDetails({
    /// Tokens generated by the model for reasoning.
    @JsonKey(name: 'reasoning_tokens', includeIfNull: false)
    int? reasoningTokens,
  }) = _CompletionTokensDetails;

  /// Object construction from a JSON representation
  factory CompletionTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$CompletionTokensDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['reasoning_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'reasoning_tokens': reasoningTokens,
    };
  }
}
