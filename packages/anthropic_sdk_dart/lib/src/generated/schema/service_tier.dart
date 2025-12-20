// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: ServiceTier
// ==========================================

/// The service tier used to process the request. Can be used for billing and
/// rate limiting purposes.
enum ServiceTier {
  @JsonValue('standard')
  standard,
  @JsonValue('priority')
  priority,
}
