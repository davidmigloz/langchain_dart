// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ThinkingConfig
// ==========================================

/// Configuration for enabling Claude's extended thinking. When enabled, responses
/// include `thinking` content blocks showing Claude's thinking process before the
/// final answer. Requires a minimum budget of 1,024 tokens and counts towards your
/// `max_tokens` limit.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ThinkingConfig with _$ThinkingConfig {
  const ThinkingConfig._();

  // ------------------------------------------
  // UNION: ThinkingConfigEnabled
  // ------------------------------------------

  /// Configuration for enabling Claude's extended thinking.

  @FreezedUnionValue('enabled')
  const factory ThinkingConfig.enabled({
    /// The type of thinking configuration.
    required ThinkingConfigEnabledType type,

    /// The maximum number of tokens Claude can use for internal reasoning.
    /// Must be at least 1,024 and less than `max_tokens`. Larger budgets
    /// enable more comprehensive reasoning.
    @JsonKey(name: 'budget_tokens') required int budgetTokens,
  }) = ThinkingConfigEnabled;

  // ------------------------------------------
  // UNION: ThinkingConfigDisabled
  // ------------------------------------------

  /// Configuration for disabling Claude's extended thinking.

  @FreezedUnionValue('disabled')
  const factory ThinkingConfig.disabled({
    /// The type of thinking configuration.
    required ThinkingConfigDisabledType type,
  }) = ThinkingConfigDisabled;

  /// Object construction from a JSON representation
  factory ThinkingConfig.fromJson(Map<String, dynamic> json) =>
      _$ThinkingConfigFromJson(json);
}

// ==========================================
// ENUM: ThinkingConfigEnumType
// ==========================================

enum ThinkingConfigEnumType {
  @JsonValue('enabled')
  enabled,
  @JsonValue('disabled')
  disabled,
}

// ==========================================
// ENUM: ThinkingConfigEnabledType
// ==========================================

/// The type of thinking configuration.
enum ThinkingConfigEnabledType {
  @JsonValue('enabled')
  enabled,
}

// ==========================================
// ENUM: ThinkingConfigDisabledType
// ==========================================

/// The type of thinking configuration.
enum ThinkingConfigDisabledType {
  @JsonValue('disabled')
  disabled,
}
