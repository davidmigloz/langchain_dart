// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: Usage
// ==========================================

/// No Description
@freezed
class Usage with _$Usage {
  const Usage._();

  /// Factory constructor for Usage
  const factory Usage({
    /// The number of input tokens which were used.
    @JsonKey(name: 'input_tokens') required int inputTokens,

    /// The number of output tokens which were used.
    @JsonKey(name: 'output_tokens') required int outputTokens,
  }) = _Usage;

  /// Object construction from a JSON representation
  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['input_tokens', 'output_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'input_tokens': inputTokens,
      'output_tokens': outputTokens,
    };
  }
}
