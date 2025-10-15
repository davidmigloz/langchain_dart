// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: OpenRouterProviderPreferences
// ==========================================

/// Provider routing preferences for controlling how requests are routed to different model providers.
///
/// **NOT part of the official OpenAI API.**
///
/// **Provider:** OpenRouter
///
/// All fields are optional. When not specified, OpenRouter uses default load balancing
/// across available providers (~40ms latency).
@freezed
abstract class OpenRouterProviderPreferences
    with _$OpenRouterProviderPreferences {
  const OpenRouterProviderPreferences._();

  /// Factory constructor for OpenRouterProviderPreferences
  const factory OpenRouterProviderPreferences({
    /// Provider routing order. Determines which providers are tried first.
    /// When specified, disables load balancing and tries providers in order.
    ///
    /// **Provider:** OpenRouter
    ///
    /// Example: `["Anthropic", "OpenAI", "Together"]`
    @JsonKey(includeIfNull: false) List<String>? order,

    /// Controls whether alternative providers can be used if the primary fails.
    /// Set to `false` with `order` to guarantee requests are only served by the top provider.
    ///
    /// **Provider:** OpenRouter
    @JsonKey(name: 'allow_fallbacks') @Default(true) bool allowFallbacks,

    /// Ensures only providers supporting all request parameters are used.
    /// When `true`, won't route to providers that don't support all parameters.
    ///
    /// **Provider:** OpenRouter
    @JsonKey(name: 'require_parameters') @Default(false) bool requireParameters,

    /// Controls usage of providers that may store user data for training.
    /// Set to `"deny"` to exclude providers that don't comply with data policies.
    ///
    /// **Provider:** OpenRouter
    @JsonKey(name: 'data_collection')
    @Default(OpenRouterProviderPreferencesDataCollection.allow)
    OpenRouterProviderPreferencesDataCollection dataCollection,

    /// Enforces Zero Data Retention endpoints. Ensures providers do not retain prompt data.
    /// When `true`, only routes to endpoints with Zero Data Retention policy.
    /// Works as OR with account-wide ZDR settings (can only enable, not disable).
    ///
    /// **Provider:** OpenRouter
    @Default(false) bool zdr,

    /// Exclude specific providers from routing. Merged with account-wide ignored providers.
    ///
    /// **Provider:** OpenRouter
    ///
    /// **Warning:** Ignoring multiple providers may reduce fallback options significantly.
    ///
    /// Example: `["deepinfra"]`
    @JsonKey(includeIfNull: false) List<String>? ignore,

    /// Filter providers by quantization levels for performance/quality tradeoffs.
    ///
    /// **Provider:** OpenRouter
    ///
    /// Valid values: `"int4"`, `"int8"`, `"fp8"`, `"fp16"`, `"bf16"`, `"unknown"`
    @JsonKey(includeIfNull: false) List<String>? quantizations,

    /// Prioritize providers by specific attribute:
    /// - `"price"`: Always prioritize lowest prices
    /// - `"throughput"`: Prioritize high-speed responses
    /// - `"latency"`: Prioritize low time to first token
    ///
    /// **Provider:** OpenRouter
    ///
    /// Can combine with other fields like filtering for complex requirements.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    OpenRouterProviderPreferencesSort? sort,
  }) = _OpenRouterProviderPreferences;

  /// Object construction from a JSON representation
  factory OpenRouterProviderPreferences.fromJson(Map<String, dynamic> json) =>
      _$OpenRouterProviderPreferencesFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'order',
    'allow_fallbacks',
    'require_parameters',
    'data_collection',
    'zdr',
    'ignore',
    'quantizations',
    'sort',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'order': order,
      'allow_fallbacks': allowFallbacks,
      'require_parameters': requireParameters,
      'data_collection': dataCollection,
      'zdr': zdr,
      'ignore': ignore,
      'quantizations': quantizations,
      'sort': sort,
    };
  }
}

// ==========================================
// ENUM: OpenRouterProviderPreferencesDataCollection
// ==========================================

/// Controls usage of providers that may store user data for training.
/// Set to `"deny"` to exclude providers that don't comply with data policies.
///
/// **Provider:** OpenRouter
enum OpenRouterProviderPreferencesDataCollection {
  @JsonValue('allow')
  allow,
  @JsonValue('deny')
  deny,
}

// ==========================================
// ENUM: OpenRouterProviderPreferencesSort
// ==========================================

/// Prioritize providers by specific attribute:
/// - `"price"`: Always prioritize lowest prices
/// - `"throughput"`: Prioritize high-speed responses
/// - `"latency"`: Prioritize low time to first token
///
/// **Provider:** OpenRouter
///
/// Can combine with other fields like filtering for complex requirements.
enum OpenRouterProviderPreferencesSort {
  @JsonValue('price')
  price,
  @JsonValue('throughput')
  throughput,
  @JsonValue('latency')
  latency,
}
