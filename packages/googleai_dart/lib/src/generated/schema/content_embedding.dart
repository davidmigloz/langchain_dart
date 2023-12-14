// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: ContentEmbedding
// ==========================================

/// A list of floats representing an embedding.
@freezed
class ContentEmbedding with _$ContentEmbedding {
  const ContentEmbedding._();

  /// Factory constructor for ContentEmbedding
  const factory ContentEmbedding({
    /// The embedding values.
    @JsonKey(includeIfNull: false) List<double>? values,
  }) = _ContentEmbedding;

  /// Object construction from a JSON representation
  factory ContentEmbedding.fromJson(Map<String, dynamic> json) =>
      _$ContentEmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['values'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'values': values,
    };
  }
}
