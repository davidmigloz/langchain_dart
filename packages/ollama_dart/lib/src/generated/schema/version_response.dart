// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: VersionResponse
// ==========================================

/// The response class for the version endpoint.
@freezed
abstract class VersionResponse with _$VersionResponse {
  const VersionResponse._();

  /// Factory constructor for VersionResponse
  const factory VersionResponse({
    /// The version of the Ollama server.
    @JsonKey(includeIfNull: false) String? version,
  }) = _VersionResponse;

  /// Object construction from a JSON representation
  factory VersionResponse.fromJson(Map<String, dynamic> json) =>
      _$VersionResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['version'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'version': version,
    };
  }
}
