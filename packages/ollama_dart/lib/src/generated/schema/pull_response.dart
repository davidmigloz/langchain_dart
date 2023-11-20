// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PullResponse
// ==========================================

/// If stream is not specified, or set to true, a stream of JSON objects is returned
@freezed
class PullResponse with _$PullResponse {
  const PullResponse._();

  /// Factory constructor for PullResponse
  const factory PullResponse({
    ///
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    PullResponseStatus? status,

    /// the model's digest
    @JsonKey(includeIfNull: false) String? digest,

    /// total size of the model
    @JsonKey(includeIfNull: false) int? total,

    /// total bytes transferred
    @JsonKey(includeIfNull: false) int? completed,
  }) = _PullResponse;

  /// Object construction from a JSON representation
  factory PullResponse.fromJson(Map<String, dynamic> json) =>
      _$PullResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'status',
    'digest',
    'total',
    'completed'
  ];

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
      'completed': completed,
    };
  }
}

// ==========================================
// ENUM: PullResponseStatus
// ==========================================

/// No Description
enum PullResponseStatus {
  @JsonValue('pulling manifest')
  pullingManifest,
  @JsonValue('downloading digestname')
  downloadingDigestname,
  @JsonValue('verifying sha256 digest')
  verifyingSha256Digest,
  @JsonValue('writing manifest')
  writingManifest,
  @JsonValue('removing any unused layers')
  removingAnyUnusedLayers,
  @JsonValue('success')
  success,
}
