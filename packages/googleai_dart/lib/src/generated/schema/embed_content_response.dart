// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: EmbedContentResponse
// ==========================================

/// The response to an `EmbedContentRequest`.
@freezed
class EmbedContentResponse with _$EmbedContentResponse {
  const EmbedContentResponse._();

  /// Factory constructor for EmbedContentResponse
  const factory EmbedContentResponse({
    /// Output only. The embedding generated from the input content.
    @JsonKey(includeIfNull: false) ContentEmbedding? embedding,
  }) = _EmbedContentResponse;

  /// Object construction from a JSON representation
  factory EmbedContentResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbedContentResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['embedding'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'embedding': embedding,
    };
  }
}
