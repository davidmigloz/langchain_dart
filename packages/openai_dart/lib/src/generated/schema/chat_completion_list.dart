// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionList
// ==========================================

/// An object representing a list of chat completions.
@freezed
class ChatCompletionList with _$ChatCompletionList {
  const ChatCompletionList._();

  /// Factory constructor for ChatCompletionList
  const factory ChatCompletionList({
    /// The object type, which is always `list`.
    required ChatCompletionListObject object,

    /// The list of chat completions.
    required List<CreateChatCompletionResponse> data,

    /// The identifier of the first chat completion in the list.
    @JsonKey(name: 'first_id', includeIfNull: false) String? firstId,

    /// The identifier of the last chat completion in the list.
    @JsonKey(name: 'last_id', includeIfNull: false) String? lastId,

    /// Whether there are more chat completions available.
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ChatCompletionList;

  /// Object construction from a JSON representation
  factory ChatCompletionList.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionListFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'object',
    'data',
    'first_id',
    'last_id',
    'has_more'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data,
      'first_id': firstId,
      'last_id': lastId,
      'has_more': hasMore,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionListObject
// ==========================================

/// The object type, which is always `list`.
enum ChatCompletionListObject {
  @JsonValue('list')
  list,
}
