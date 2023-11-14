// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJob
// ==========================================

/// The `fine_tuning.job` object represents a fine-tuning job that has been created through the API.
@freezed
class FineTuningJob with _$FineTuningJob {
  const FineTuningJob._();

  /// Factory constructor for FineTuningJob
  const factory FineTuningJob({
    /// The object identifier, which can be referenced in the API endpoints.
    required String id,

    /// The Unix timestamp (in seconds) for when the fine-tuning job was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
    required FineTuningJobError? error,

    /// The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
    @JsonKey(name: 'fine_tuned_model') required String? fineTunedModel,

    /// The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
    @JsonKey(name: 'finished_at') required int? finishedAt,

    /// The hyperparameters used for the fine-tuning job. See the [fine-tuning guide](https://platform.openai.com/docs/guides/fine-tuning) for more details.
    required FineTuningJobHyperparameters hyperparameters,

    /// The base model that is being fine-tuned.
    required String model,

    /// The object type, which is always "fine_tuning.job".
    required FineTuningJobObject object,

    /// The organization that owns the fine-tuning job.
    @JsonKey(name: 'organization_id') required String organizationId,

    /// The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
    @JsonKey(name: 'result_files') required List<String> resultFiles,

    /// The current status of the fine-tuning job, which can be either `validating_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
    required FineTuningJobStatus status,

    /// The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
    @JsonKey(name: 'trained_tokens') required int? trainedTokens,

    /// The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
    @JsonKey(name: 'training_file') required String trainingFile,

    /// The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
    @JsonKey(name: 'validation_file') required String? validationFile,
  }) = _FineTuningJob;

  /// Object construction from a JSON representation
  factory FineTuningJob.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'created_at',
    'error',
    'fine_tuned_model',
    'finished_at',
    'hyperparameters',
    'model',
    'object',
    'organization_id',
    'result_files',
    'status',
    'trained_tokens',
    'training_file',
    'validation_file'
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
      'error': error,
      'fine_tuned_model': fineTunedModel,
      'finished_at': finishedAt,
      'hyperparameters': hyperparameters,
      'model': model,
      'object': object,
      'organization_id': organizationId,
      'result_files': resultFiles,
      'status': status,
      'trained_tokens': trainedTokens,
      'training_file': trainingFile,
      'validation_file': validationFile,
    };
  }
}

// ==========================================
// ENUM: FineTuningJobObject
// ==========================================

/// The object type, which is always "fine_tuning.job".
enum FineTuningJobObject {
  @JsonValue('fine_tuning.job')
  fineTuningJob,
}
