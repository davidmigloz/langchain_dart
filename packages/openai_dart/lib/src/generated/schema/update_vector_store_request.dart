// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: UpdateVectorStoreRequest
// ==========================================

/// Request object for the Update vector store endpoint.
@freezed
class UpdateVectorStoreRequest with _$UpdateVectorStoreRequest {
  const UpdateVectorStoreRequest._();

  /// Factory constructor for UpdateVectorStoreRequest
  const factory UpdateVectorStoreRequest({
    /// The name of the vector store.
    @JsonKey(includeIfNull: false) String? name,

    /// The expiration policy for a vector store.
    @JsonKey(name: 'expires_after', includeIfNull: false)
    VectorStoreExpirationAfter? expiresAfter,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) dynamic metadata,
  }) = _UpdateVectorStoreRequest;

  /// Object construction from a JSON representation
  factory UpdateVectorStoreRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateVectorStoreRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'expires_after',
    'metadata'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'expires_after': expiresAfter,
      'metadata': metadata,
    };
  }
}
