// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: MessageDeltaUsage
// ==========================================

/// No Description
@freezed
class MessageDeltaUsage with _$MessageDeltaUsage {
  const MessageDeltaUsage._();

  /// Factory constructor for MessageDeltaUsage
  const factory MessageDeltaUsage({
    /// The cumulative number of output tokens which were used.
    @JsonKey(name: 'output_tokens') required int outputTokens,
  }) = _MessageDeltaUsage;

  /// Object construction from a JSON representation
  factory MessageDeltaUsage.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['output_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'output_tokens': outputTokens,
    };
  }
}
