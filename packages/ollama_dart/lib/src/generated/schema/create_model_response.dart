// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CreateModelResponse
// ==========================================

/// Response object for creating a model. When finished, `status` is `success`.
@freezed
class CreateModelResponse with _$CreateModelResponse {
  const CreateModelResponse._();

  /// Factory constructor for CreateModelResponse
  const factory CreateModelResponse({
    /// Status creating the model
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    CreateModelStatus? status,
  }) = _CreateModelResponse;

  /// Object construction from a JSON representation
  factory CreateModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateModelResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['status'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'status': status,
    };
  }
}
