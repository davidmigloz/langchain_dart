// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseUsage
// ==========================================

/// Usage statistics for the response.
@freezed
class ResponseUsage with _$ResponseUsage {
  const ResponseUsage._();

  /// Factory constructor for ResponseUsage
  const factory ResponseUsage({
    /// Number of tokens in the input.
    @JsonKey(name: 'input_tokens') required int inputTokens,

    /// Number of tokens in the output.
    @JsonKey(name: 'output_tokens') required int outputTokens,

    /// Processing latency in milliseconds.
    @JsonKey(name: 'processing_latency_ms', includeIfNull: false)
    int? processingLatencyMs,

    /// Total latency in milliseconds.
    @JsonKey(name: 'total_latency_ms', includeIfNull: false)
    int? totalLatencyMs,
  }) = _ResponseUsage;

  /// Object construction from a JSON representation
  factory ResponseUsage.fromJson(Map<String, dynamic> json) =>
      _$ResponseUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'input_tokens',
    'output_tokens',
    'processing_latency_ms',
    'total_latency_ms'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'input_tokens': inputTokens,
      'output_tokens': outputTokens,
      'processing_latency_ms': processingLatencyMs,
      'total_latency_ms': totalLatencyMs,
    };
  }
}
