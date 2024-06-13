// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ProcessResponse
// ==========================================

/// Response class for the list running models endpoint.
@freezed
class ProcessResponse with _$ProcessResponse {
  const ProcessResponse._();

  /// Factory constructor for ProcessResponse
  const factory ProcessResponse({
    /// List of running models.
    @JsonKey(includeIfNull: false) List<ProcessModel>? models,
  }) = _ProcessResponse;

  /// Object construction from a JSON representation
  factory ProcessResponse.fromJson(Map<String, dynamic> json) =>
      _$ProcessResponseFromJson(json);

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
