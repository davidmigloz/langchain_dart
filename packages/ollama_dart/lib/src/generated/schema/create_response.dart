// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CreateResponse
// ==========================================

/// A stream of JSON objects. When finished, status is success.
@freezed
class CreateResponse with _$CreateResponse {
  const CreateResponse._();

  /// Factory constructor for CreateResponse
  const factory CreateResponse({
    /// Status creating the model
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    CreateResponseStatus? status,
  }) = _CreateResponse;

  /// Object construction from a JSON representation
  factory CreateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseFromJson(json);

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

// ==========================================
// ENUM: CreateResponseStatus
// ==========================================

/// Status creating the model
enum CreateResponseStatus {
  @JsonValue('creating system layer')
  creatingSystemLayer,
  @JsonValue('parsing modelfile')
  parsingModelfile,
  @JsonValue('success')
  success,
}
