// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: DeleteResponseResponse
// ==========================================

/// Represents a deleted response.
@freezed
class DeleteResponseResponse with _$DeleteResponseResponse {
  const DeleteResponseResponse._();

  /// Factory constructor for DeleteResponseResponse
  const factory DeleteResponseResponse({
    /// No Description
    required String id,

    ///
    required DeleteResponseResponseObject object,

    /// No Description
    required bool deleted,
  }) = _DeleteResponseResponse;

  /// Object construction from a JSON representation
  factory DeleteResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResponseResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'object', 'deleted'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'deleted': deleted,
    };
  }
}

// ==========================================
// ENUM: DeleteResponseResponseObject
// ==========================================

/// No Description
enum DeleteResponseResponseObject {
  @JsonValue('response')
  response,
}
