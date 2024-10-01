// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContentTextAnnotationsFileCitation
// ==========================================

/// A citation within the message that points to a specific quote from a specific File associated with the assistant or the message.
@freezed
class MessageContentTextAnnotationsFileCitation
    with _$MessageContentTextAnnotationsFileCitation {
  const MessageContentTextAnnotationsFileCitation._();

  /// Factory constructor for MessageContentTextAnnotationsFileCitation
  const factory MessageContentTextAnnotationsFileCitation({
    /// The ID of the specific File the citation is from.
    @JsonKey(name: 'file_id') required String fileId,

    /// The specific quote in the file.
    required String quote,
  }) = _MessageContentTextAnnotationsFileCitation;

  /// Object construction from a JSON representation
  factory MessageContentTextAnnotationsFileCitation.fromJson(
          Map<String, dynamic> json) =>
      _$MessageContentTextAnnotationsFileCitationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id', 'quote'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
      'quote': quote,
    };
  }
}
