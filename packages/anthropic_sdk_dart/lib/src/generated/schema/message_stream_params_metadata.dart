// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: MessageStreamParamsMetadata
// ==========================================

/// No Description
@freezed
class MessageStreamParamsMetadata with _$MessageStreamParamsMetadata {
  const MessageStreamParamsMetadata._();

  /// Factory constructor for MessageStreamParamsMetadata
  const factory MessageStreamParamsMetadata({
    /// An external identifier for the user who is associated with the request.
    ///
    /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
    /// this id to help detect abuse. Do not include any identifying information such as
    /// name, email address, or phone number.
    @JsonKey(name: 'user_id', includeIfNull: false) String? userId,
  }) = _MessageStreamParamsMetadata;

  /// Object construction from a JSON representation
  factory MessageStreamParamsMetadata.fromJson(Map<String, dynamic> json) =>
      _$MessageStreamParamsMetadataFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['user_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
    };
  }
}
