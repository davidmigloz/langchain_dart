// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ModelsResponse
// ==========================================

/// Response class for the list models endpoint.
@freezed
class ModelsResponse with _$ModelsResponse {
  const ModelsResponse._();

  /// Factory constructor for ModelsResponse
  const factory ModelsResponse({
    /// List of models available locally.
    @JsonKey(includeIfNull: false) List<Model>? models,
  }) = _ModelsResponse;

  /// Object construction from a JSON representation
  factory ModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ModelsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['models'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'models': models,
    };
  }
}
