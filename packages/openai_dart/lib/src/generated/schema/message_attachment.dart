// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageAttachment
// ==========================================

/// An attachment to a message.
@freezed
abstract class MessageAttachment with _$MessageAttachment {
  const MessageAttachment._();

  /// Factory constructor for MessageAttachment
  const factory MessageAttachment({
    /// The ID of the file to attach to the message.
    @JsonKey(name: 'file_id', includeIfNull: false) String? fileId,

    /// The tools to add this file to.
    @JsonKey(includeIfNull: false) List<AssistantTools>? tools,
  }) = _MessageAttachment;

  /// Object construction from a JSON representation
  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id', 'tools'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'file_id': fileId, 'tools': tools};
  }
}
