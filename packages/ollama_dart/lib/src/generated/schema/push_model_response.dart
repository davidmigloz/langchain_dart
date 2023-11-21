// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PushModelResponse
// ==========================================

/// Response class for pushing a model.
@freezed
class PushModelResponse with _$PushModelResponse {
  const PushModelResponse._();

  /// Factory constructor for PushModelResponse
  const factory PushModelResponse({
    /// Status pushing the model.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    PushModelStatus? status,

    /// the model's digest
    @JsonKey(includeIfNull: false) String? digest,

    /// total size of the model
    @JsonKey(includeIfNull: false) int? total,
  }) = _PushModelResponse;

  /// Object construction from a JSON representation
  factory PushModelResponse.fromJson(Map<String, dynamic> json) =>
      _$PushModelResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['status', 'digest', 'total'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'digest': digest,
      'total': total,
    };
  }
}
