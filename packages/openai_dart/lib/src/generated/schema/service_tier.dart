// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ServiceTier
// ==========================================

/// The service tier used for processing the request. This field is only included if the `service_tier` parameter
/// is specified in the request.
enum ServiceTier {
  @JsonValue('auto')
  auto,
  @JsonValue('default')
  vDefault,
  @JsonValue('flex')
  flex,
}
