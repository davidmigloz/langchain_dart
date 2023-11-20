// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: DeleteRequest
// ==========================================

/// Deletes a model and its data
@freezed
class DeleteRequest with _$DeleteRequest {
  const DeleteRequest._();

  /// Factory constructor for DeleteRequest
  const factory DeleteRequest({
    /// (required) name of the model to delete
    required String name,
  }) = _DeleteRequest;

  /// Object construction from a JSON representation
  factory DeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
