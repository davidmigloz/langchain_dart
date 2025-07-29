// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: RateLimit
// ==========================================

/// Rate limit information.
@freezed
abstract class RateLimit with _$RateLimit {
  const RateLimit._();

  /// Factory constructor for RateLimit
  const factory RateLimit({
    /// The name of the rate limit (`requests`, `tokens`).
    required RateLimitName name,

    /// The maximum allowed value for the rate limit.
    required int limit,

    /// The remaining value before the limit is reached.
    required int remaining,

    /// Seconds until the rate limit resets.
    @JsonKey(name: 'reset_seconds') required double resetSeconds,
  }) = _RateLimit;

  /// Object construction from a JSON representation
  factory RateLimit.fromJson(Map<String, dynamic> json) =>
      _$RateLimitFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'limit',
    'remaining',
    'reset_seconds'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'limit': limit,
      'remaining': remaining,
      'reset_seconds': resetSeconds,
    };
  }
}
