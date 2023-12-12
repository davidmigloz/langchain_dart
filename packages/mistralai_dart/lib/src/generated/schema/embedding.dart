// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: Embedding
// ==========================================

/// A generated embedding.
@freezed
class Embedding with _$Embedding {
  const Embedding._();

  /// Factory constructor for Embedding
  const factory Embedding({
    /// The object type, which is always `embedding`.
    required String object,

    /// The embedding vector.
    required List<double> embedding,

    /// The index of this embedding.
    required int index,
  }) = _Embedding;

  /// Object construction from a JSON representation
  factory Embedding.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['object', 'embedding', 'index'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'embedding': embedding,
      'index': index,
    };
  }
}
