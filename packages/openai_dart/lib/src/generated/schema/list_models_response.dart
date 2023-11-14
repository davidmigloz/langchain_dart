// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ListModelsResponse
// ==========================================

/// Represents a list of models returned by the List models endpoint.
@freezed
class ListModelsResponse with _$ListModelsResponse {
  const ListModelsResponse._();

  /// Factory constructor for ListModelsResponse
  const factory ListModelsResponse({
    /// The object type, which is always "list".
    required ListModelsResponseObject object,

    /// The list of models.
    required List<Model> data,
  }) = _ListModelsResponse;

  /// Object construction from a JSON representation
  factory ListModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelsResponseFromJson(json);

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

// ==========================================
// ENUM: ListModelsResponseObject
// ==========================================

/// The object type, which is always "list".
enum ListModelsResponseObject {
  @JsonValue('list')
  list,
}
