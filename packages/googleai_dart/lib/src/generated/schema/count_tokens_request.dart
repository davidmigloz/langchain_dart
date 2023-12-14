// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: CountTokensRequest
// ==========================================

/// Counts the number of tokens in the `prompt` sent to a model. Models may tokenize text differently, so each model may return a different `token_count`.
@freezed
class CountTokensRequest with _$CountTokensRequest {
  const CountTokensRequest._();

  /// Factory constructor for CountTokensRequest
  const factory CountTokensRequest({
    /// Required. The input given to the model as a prompt.
    @JsonKey(includeIfNull: false) List<Content>? contents,
  }) = _CountTokensRequest;

  /// Object construction from a JSON representation
  factory CountTokensRequest.fromJson(Map<String, dynamic> json) =>
      _$CountTokensRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['contents'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'contents': contents,
    };
  }
}
