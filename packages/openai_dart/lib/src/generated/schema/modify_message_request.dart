// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModifyMessageRequest
// ==========================================

/// Request object for the Modify message endpoint.
@freezed
class ModifyMessageRequest with _$ModifyMessageRequest {
  const ModifyMessageRequest._();

  /// Factory constructor for ModifyMessageRequest
  const factory ModifyMessageRequest({
    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _ModifyMessageRequest;

  /// Object construction from a JSON representation
  factory ModifyMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyMessageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['metadata'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'metadata': metadata,
    };
  }
}
