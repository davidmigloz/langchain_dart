// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDeltaObject
// ==========================================

/// Represents a message delta i.e. any changed fields on a message during streaming.
@freezed
class MessageDeltaObject with _$MessageDeltaObject {
  const MessageDeltaObject._();

  /// Factory constructor for MessageDeltaObject
  const factory MessageDeltaObject({
    /// The identifier of the message, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.message.delta`.
    required MessageDeltaObjectObject object,

    /// The delta containing the fields that have changed on the Message.
    required MessageDelta delta,
  }) = _MessageDeltaObject;

  /// Object construction from a JSON representation
  factory MessageDeltaObject.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'object', 'delta'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'delta': delta,
    };
  }
}

// ==========================================
// ENUM: MessageDeltaObjectObject
// ==========================================

/// The object type, which is always `thread.message.delta`.
enum MessageDeltaObjectObject {
  @JsonValue('thread.message.delta')
  threadMessageDelta,
}
