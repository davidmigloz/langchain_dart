// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: OpenRouterUsageConfig
// ==========================================

/// Usage accounting configuration for detailed token usage information.
///
/// **NOT part of the official OpenAI API.**
///
/// **Provider:** OpenRouter
@freezed
abstract class OpenRouterUsageConfig with _$OpenRouterUsageConfig {
  const OpenRouterUsageConfig._();

  /// Factory constructor for OpenRouterUsageConfig
  const factory OpenRouterUsageConfig({
    /// Whether to include detailed token usage information in the response.
    /// When enabled, response includes prompt tokens, completion tokens, cached tokens,
    /// and reasoning tokens (using model's native tokenizer).
    ///
    /// **Provider:** OpenRouter
    ///
    /// Location: `usage` field in non-streaming responses, last SSE message in streaming.
    @JsonKey(includeIfNull: false) bool? include,
  }) = _OpenRouterUsageConfig;

  /// Object construction from a JSON representation
  factory OpenRouterUsageConfig.fromJson(Map<String, dynamic> json) =>
      _$OpenRouterUsageConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['include'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'include': include,
    };
  }
}
