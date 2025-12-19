// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: FineTuneMethodType
// ==========================================

/// The type of method used for fine-tuning.
enum FineTuneMethodType {
  @JsonValue('supervised')
  supervised,
  @JsonValue('dpo')
  dpo,
  @JsonValue('reinforcement')
  reinforcement,
}
