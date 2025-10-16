// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageDelta
// ==========================================

/// A delta in a streaming message.
@freezed
abstract class MessageDelta with _$MessageDelta {
  const MessageDelta._();

  /// Factory constructor for MessageDelta
  const factory MessageDelta({
    /// The reason that we stopped.
    ///
    /// This may be one the following values:
    ///
    /// - `"end_turn"`: the model reached a natural stopping point
    /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
    /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
    /// - `"tool_use"`: the model invoked one or more tools
    ///
    /// In non-streaming mode this value is always non-null. In streaming mode, it is
    /// null in the `message_start` event and non-null otherwise.
    @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    StopReason? stopReason,

    /// Which custom stop sequence was generated, if any.
    ///
    /// This value will be a non-null string if one of your custom stop sequences was
    /// generated.
    @JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence,
  }) = _MessageDelta;

  /// Object construction from a JSON representation
  factory MessageDelta.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['stop_reason', 'stop_sequence'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'stop_reason': stopReason, 'stop_sequence': stopSequence};
  }
}
