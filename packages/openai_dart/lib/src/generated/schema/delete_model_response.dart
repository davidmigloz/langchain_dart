// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteModelResponse
// ==========================================

/// Represents a deleted response returned by the Delete model endpoint.
@freezed
class DeleteModelResponse with _$DeleteModelResponse {
  const DeleteModelResponse._();

  /// Factory constructor for DeleteModelResponse
  const factory DeleteModelResponse({
    /// The model identifier.
    required String id,

    /// Whether the model was deleted.
    required bool deleted,

    /// The object type, which is always "model".
    required String object,
  }) = _DeleteModelResponse;

  /// Object construction from a JSON representation
  factory DeleteModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteModelResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'deleted', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'deleted': deleted,
      'object': object,
    };
  }
}
