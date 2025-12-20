// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CountMessageTokensResponse
// ==========================================

/// The response containing the token count.
@freezed
abstract class CountMessageTokensResponse with _$CountMessageTokensResponse {
  const CountMessageTokensResponse._();

  /// Factory constructor for CountMessageTokensResponse
  const factory CountMessageTokensResponse({
    /// The total number of tokens across the provided list of messages, system prompt,
    /// and tools.
    @JsonKey(name: 'input_tokens') required int inputTokens,
  }) = _CountMessageTokensResponse;

  /// Object construction from a JSON representation
  factory CountMessageTokensResponse.fromJson(Map<String, dynamic> json) =>
      _$CountMessageTokensResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['input_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'input_tokens': inputTokens};
  }
}
