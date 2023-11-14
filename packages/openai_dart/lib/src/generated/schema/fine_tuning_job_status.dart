// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: FineTuningJobStatus
// ==========================================

/// The current status of the fine-tuning job, which can be either `validating_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
enum FineTuningJobStatus {
  @JsonValue('validating_files')
  validatingFiles,
  @JsonValue('queued')
  queued,
  @JsonValue('running')
  running,
  @JsonValue('succeeded')
  succeeded,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}
