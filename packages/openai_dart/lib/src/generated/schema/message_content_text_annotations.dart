// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContentTextAnnotations
// ==========================================

/// An annotation within the message that points to a specific quote from a specific File associated with the assistant or the message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageContentTextAnnotations
    with _$MessageContentTextAnnotations {
  const MessageContentTextAnnotations._();

  // ------------------------------------------
  // UNION: MessageContentTextAnnotationsFileCitationObject
  // ------------------------------------------

  /// A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "retrieval" tool to search files.
  const factory MessageContentTextAnnotations.fileCitation({
    /// Always `file_citation`.
    required MessageContentTextAnnotationsFileCitationObjectType type,

    /// The text in the message content that needs to be replaced.
    required String text,

    /// A citation within the message that points to a specific quote from a specific File associated with the assistant or the message.
    @JsonKey(name: 'file_citation')
    required MessageContentTextAnnotationsFileCitation fileCitation,

    /// The start index of the text in the message content that needs to be replaced.
    @JsonKey(name: 'start_index') required int startIndex,

    /// The end index of the text in the message content that needs to be replaced.
    @JsonKey(name: 'end_index') required int endIndex,
  }) = MessageContentTextAnnotationsFileCitationObject;

  // ------------------------------------------
  // UNION: MessageContentTextAnnotationsFilePathObject
  // ------------------------------------------

  /// A URL for the file that's generated when the assistant used the `code_interpreter` tool to generate a file.
  const factory MessageContentTextAnnotations.filePath({
    /// Always `file_path`.
    required MessageContentTextAnnotationsFilePathObjectType type,

    /// The text in the message content that needs to be replaced.
    required String text,

    /// No Description
    @JsonKey(name: 'file_path')
    required MessageContentTextAnnotationsFilePath filePath,

    /// No Description
    @JsonKey(name: 'start_index') required int startIndex,

    /// No Description
    @JsonKey(name: 'end_index') required int endIndex,
  }) = MessageContentTextAnnotationsFilePathObject;

  /// Object construction from a JSON representation
  factory MessageContentTextAnnotations.fromJson(Map<String, dynamic> json) =>
      _$MessageContentTextAnnotationsFromJson(json);
}

// ==========================================
// ENUM: MessageContentTextAnnotationsFileCitationObjectType
// ==========================================

/// Always `file_citation`.
enum MessageContentTextAnnotationsFileCitationObjectType {
  @JsonValue('file_citation')
  fileCitation,
}

// ==========================================
// ENUM: MessageContentTextAnnotationsFilePathObjectType
// ==========================================

/// Always `file_path`.
enum MessageContentTextAnnotationsFilePathObjectType {
  @JsonValue('file_path')
  filePath,
}

// ==========================================
// CLASS: MessageContentTextAnnotationsFilePath
// ==========================================

/// No Description
@freezed
class MessageContentTextAnnotationsFilePath
    with _$MessageContentTextAnnotationsFilePath {
  const MessageContentTextAnnotationsFilePath._();

  /// Factory constructor for MessageContentTextAnnotationsFilePath
  const factory MessageContentTextAnnotationsFilePath({
    /// The ID of the file that was generated.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _MessageContentTextAnnotationsFilePath;

  /// Object construction from a JSON representation
  factory MessageContentTextAnnotationsFilePath.fromJson(
          Map<String, dynamic> json) =>
      _$MessageContentTextAnnotationsFilePathFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
    };
  }
}
