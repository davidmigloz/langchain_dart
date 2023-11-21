// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CopyModelRequest
// ==========================================

/// Request class for copying a model.
@freezed
class CopyModelRequest with _$CopyModelRequest {
  const CopyModelRequest._();

  /// Factory constructor for CopyModelRequest
  const factory CopyModelRequest({
    /// Name of the model to copy.
    required String source,

    /// Name of the new model.
    required String destination,
  }) = _CopyModelRequest;

  /// Object construction from a JSON representation
  factory CopyModelRequest.fromJson(Map<String, dynamic> json) =>
      _$CopyModelRequestFromJson(json);

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
