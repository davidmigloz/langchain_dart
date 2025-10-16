// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDeltaContentTextAnnotationsFileCitation
// ==========================================

/// A citation within the message that points to a specific quote from a specific File associated with the assistant or the message.
@freezed
abstract class MessageDeltaContentTextAnnotationsFileCitation
    with _$MessageDeltaContentTextAnnotationsFileCitation {
  const MessageDeltaContentTextAnnotationsFileCitation._();

  /// Factory constructor for MessageDeltaContentTextAnnotationsFileCitation
  const factory MessageDeltaContentTextAnnotationsFileCitation({
    /// The ID of the specific File the citation is from.
    @JsonKey(name: 'file_id', includeIfNull: false) String? fileId,

    /// The specific quote in the file.
    @JsonKey(includeIfNull: false) String? quote,
  }) = _MessageDeltaContentTextAnnotationsFileCitation;

  /// Object construction from a JSON representation
  factory MessageDeltaContentTextAnnotationsFileCitation.fromJson(
    Map<String, dynamic> json,
  ) => _$MessageDeltaContentTextAnnotationsFileCitationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id', 'quote'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'file_id': fileId, 'quote': quote};
  }
}
