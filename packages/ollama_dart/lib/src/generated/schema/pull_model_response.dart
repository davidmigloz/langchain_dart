// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PullModelResponse
// ==========================================

/// Response class for pulling a model.
///
/// The first object is the manifest. Then there is a series of downloading responses. Until any of the download is completed, the `completed` key may not be included.
///
/// The number of files to be downloaded depends on the number of layers specified in the manifest.
@freezed
class PullModelResponse with _$PullModelResponse {
  const PullModelResponse._();

  /// Factory constructor for PullModelResponse
  const factory PullModelResponse({
    /// Status pulling the model.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    PullModelStatus? status,

    /// The model's digest.
    @JsonKey(includeIfNull: false) String? digest,

    /// Total size of the model.
    @JsonKey(includeIfNull: false) int? total,

    /// Total bytes transferred.
    @JsonKey(includeIfNull: false) int? completed,
  }) = _PullModelResponse;

  /// Object construction from a JSON representation
  factory PullModelResponse.fromJson(Map<String, dynamic> json) =>
      _$PullModelResponseFromJson(json);

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
