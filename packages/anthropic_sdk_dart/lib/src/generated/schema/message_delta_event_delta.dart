// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: MessageDeltaEventDelta
// ==========================================

/// No Description
@freezed
class MessageDeltaEventDelta with _$MessageDeltaEventDelta {
  const MessageDeltaEventDelta._();

  /// Factory constructor for MessageDeltaEventDelta
  const factory MessageDeltaEventDelta({
    ///
    @JsonKey(
      name: 'stop_reason',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    required MessageDeltaEventDeltaStopReason? stopReason,

    /// No Description
    @JsonKey(name: 'stop_sequence') required String? stopSequence,
  }) = _MessageDeltaEventDelta;

  /// Object construction from a JSON representation
  factory MessageDeltaEventDelta.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaEventDeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['stop_reason', 'stop_sequence'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'stop_reason': stopReason,
      'stop_sequence': stopSequence,
    };
  }
}

// ==========================================
// ENUM: MessageDeltaEventDeltaStopReason
// ==========================================

/// No Description
enum MessageDeltaEventDeltaStopReason {
  @JsonValue('end_turn')
  endTurn,
  @JsonValue('max_tokens')
  maxTokens,
  @JsonValue('stop_sequence')
  stopSequence,
}
