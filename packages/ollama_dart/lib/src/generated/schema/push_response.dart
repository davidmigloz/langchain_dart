// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PushResponse
// ==========================================

/// Schema for pushing a model
@freezed
class PushResponse with _$PushResponse {
  const PushResponse._();

  /// Factory constructor for PushResponse
  const factory PushResponse({
    ///
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    PushResponseStatus? status,

    /// the model's digest
    @JsonKey(includeIfNull: false) String? digest,

    /// total size of the model
    @JsonKey(includeIfNull: false) int? total,
  }) = _PushResponse;

  /// Object construction from a JSON representation
  factory PushResponse.fromJson(Map<String, dynamic> json) =>
      _$PushResponseFromJson(json);

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

// ==========================================
// ENUM: PushResponseStatus
// ==========================================

/// No Description
enum PushResponseStatus {
  @JsonValue('retrieving manifest')
  retrievingManifest,
  @JsonValue('starting upload')
  startingUpload,
  @JsonValue('pushing manifest')
  pushingManifest,
  @JsonValue('success')
  success,
}
