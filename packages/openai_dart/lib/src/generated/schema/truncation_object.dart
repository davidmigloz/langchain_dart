// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: TruncationObject
// ==========================================

/// Controls for how a thread will be truncated prior to the run. Use this to control the intial context window of the run.
@freezed
class TruncationObject with _$TruncationObject {
  const TruncationObject._();

  /// Factory constructor for TruncationObject
  const factory TruncationObject({
    /// The truncation strategy to use for the thread. The default is `auto`. If set to `last_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max_prompt_tokens`.
    required TruncationObjectType type,

    /// The number of most recent messages from the thread when constructing the context for the run.
    @JsonKey(name: 'last_messages', includeIfNull: false) int? lastMessages,
  }) = _TruncationObject;

  /// Object construction from a JSON representation
  factory TruncationObject.fromJson(Map<String, dynamic> json) =>
      _$TruncationObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'last_messages'];

  /// Validation constants
  static const lastMessagesMinValue = 1;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (lastMessages != null && lastMessages! < lastMessagesMinValue) {
      return "The value of 'lastMessages' cannot be < $lastMessagesMinValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'last_messages': lastMessages,
    };
  }
}

// ==========================================
// ENUM: TruncationObjectType
// ==========================================

/// The truncation strategy to use for the thread. The default is `auto`. If set to `last_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max_prompt_tokens`.
enum TruncationObjectType {
  @JsonValue('auto')
  auto,
  @JsonValue('last_messages')
  lastMessages,
}
