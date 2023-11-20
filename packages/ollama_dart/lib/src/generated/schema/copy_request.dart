// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CopyRequest
// ==========================================

/// Creates a model with another name from an existing model.
@freezed
class CopyRequest with _$CopyRequest {
  const CopyRequest._();

  /// Factory constructor for CopyRequest
  const factory CopyRequest({
    /// No Description
    required String source,

    /// No Description
    required String destination,
  }) = _CopyRequest;

  /// Object construction from a JSON representation
  factory CopyRequest.fromJson(Map<String, dynamic> json) =>
      _$CopyRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['source', 'destination'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'destination': destination,
    };
  }
}
