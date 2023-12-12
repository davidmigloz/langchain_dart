// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ModelList
// ==========================================

/// Response class for the list models endpoint.
@freezed
class ModelList with _$ModelList {
  const ModelList._();

  /// Factory constructor for ModelList
  const factory ModelList({
    /// The object type, which is always `list`.
    required String object,

    /// The list of models.
    required List<Model> data,
  }) = _ModelList;

  /// Object construction from a JSON representation
  factory ModelList.fromJson(Map<String, dynamic> json) =>
      _$ModelListFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['object', 'data'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data,
    };
  }
}
