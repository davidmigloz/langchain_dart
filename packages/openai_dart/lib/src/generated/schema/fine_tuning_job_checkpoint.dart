// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJobCheckpoint
// ==========================================

/// The `fine_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
@freezed
abstract class FineTuningJobCheckpoint with _$FineTuningJobCheckpoint {
  const FineTuningJobCheckpoint._();

  /// Factory constructor for FineTuningJobCheckpoint
  const factory FineTuningJobCheckpoint({
    /// The checkpoint identifier, which can be referenced in the API endpoints.
    required String id,

    /// The Unix timestamp (in seconds) for when the checkpoint was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The name of the fine-tuned checkpoint model that is created.
    @JsonKey(name: 'fine_tuned_model_checkpoint')
    required String fineTunedModelCheckpoint,

    /// The step number that the checkpoint was created at.
    @JsonKey(name: 'step_number') required int stepNumber,

    /// Metrics at the step number during the fine-tuning job.
    required FineTuningJobCheckpointMetrics metrics,

    /// The name of the fine-tuning job that this checkpoint was created from.
    @JsonKey(name: 'fine_tuning_job_id') required String fineTuningJobId,

    /// The object type, which is always "fine_tuning.job.checkpoint".
    required FineTuningJobCheckpointObject object,
  }) = _FineTuningJobCheckpoint;

  /// Object construction from a JSON representation
  factory FineTuningJobCheckpoint.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobCheckpointFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'created_at',
    'fine_tuned_model_checkpoint',
    'step_number',
    'metrics',
    'fine_tuning_job_id',
    'object'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt,
      'fine_tuned_model_checkpoint': fineTunedModelCheckpoint,
      'step_number': stepNumber,
      'metrics': metrics,
      'fine_tuning_job_id': fineTuningJobId,
      'object': object,
    };
  }
}

// ==========================================
// CLASS: FineTuningJobCheckpointMetrics
// ==========================================

/// Metrics at the step number during the fine-tuning job.
@freezed
abstract class FineTuningJobCheckpointMetrics
    with _$FineTuningJobCheckpointMetrics {
  const FineTuningJobCheckpointMetrics._();

  /// Factory constructor for FineTuningJobCheckpointMetrics
  const factory FineTuningJobCheckpointMetrics({
    /// The step number that the metrics were recorded at.
    @JsonKey(includeIfNull: false) double? step,

    /// The training loss at the step number.
    @JsonKey(name: 'train_loss', includeIfNull: false) double? trainLoss,

    /// The training mean token accuracy at the step number.
    @JsonKey(name: 'train_mean_token_accuracy', includeIfNull: false)
    double? trainMeanTokenAccuracy,

    /// The validation loss at the step number.
    @JsonKey(name: 'valid_loss', includeIfNull: false) double? validLoss,

    /// The validation mean token accuracy at the step number.
    @JsonKey(name: 'valid_mean_token_accuracy', includeIfNull: false)
    double? validMeanTokenAccuracy,

    /// The full validation loss at the step number.
    @JsonKey(name: 'full_valid_loss', includeIfNull: false)
    double? fullValidLoss,

    /// The full validation mean token accuracy at the step number.
    @JsonKey(name: 'full_valid_mean_token_accuracy', includeIfNull: false)
    double? fullValidMeanTokenAccuracy,
  }) = _FineTuningJobCheckpointMetrics;

  /// Object construction from a JSON representation
  factory FineTuningJobCheckpointMetrics.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobCheckpointMetricsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'step',
    'train_loss',
    'train_mean_token_accuracy',
    'valid_loss',
    'valid_mean_token_accuracy',
    'full_valid_loss',
    'full_valid_mean_token_accuracy'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'step': step,
      'train_loss': trainLoss,
      'train_mean_token_accuracy': trainMeanTokenAccuracy,
      'valid_loss': validLoss,
      'valid_mean_token_accuracy': validMeanTokenAccuracy,
      'full_valid_loss': fullValidLoss,
      'full_valid_mean_token_accuracy': fullValidMeanTokenAccuracy,
    };
  }
}

// ==========================================
// ENUM: FineTuningJobCheckpointObject
// ==========================================

/// The object type, which is always "fine_tuning.job.checkpoint".
enum FineTuningJobCheckpointObject {
  @JsonValue('fine_tuning.job.checkpoint')
  fineTuningJobCheckpoint,
}
