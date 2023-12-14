// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: CountTokensResponse
// ==========================================

/// A response from `CountTokens`. It returns the model's `token_count` for the `prompt`.
@freezed
class CountTokensResponse with _$CountTokensResponse {
  const CountTokensResponse._();

  /// Factory constructor for CountTokensResponse
  const factory CountTokensResponse({
    /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
    @JsonKey(includeIfNull: false) int? totalTokens,
  }) = _CountTokensResponse;

  /// Object construction from a JSON representation
  factory CountTokensResponse.fromJson(Map<String, dynamic> json) =>
      _$CountTokensResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['totalTokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'totalTokens': totalTokens,
    };
  }
}
