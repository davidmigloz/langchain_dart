// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Conversation
// ==========================================

/// The conversation resource.
@freezed
class Conversation with _$Conversation {
  const Conversation._();

  /// Factory constructor for Conversation
  const factory Conversation({
    /// The unique ID of the conversation.
    required String id,

    /// The object type, must be "realtime.conversation".
    @Default(ObjectType.realtimeConversation) ObjectType object,
  }) = _Conversation;

  /// Object construction from a JSON representation
  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
    };
  }
}
