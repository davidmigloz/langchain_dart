// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateFineTuningJobRequest
// ==========================================

/// Request object for the Create fine-tuning job endpoint.
@freezed
class CreateFineTuningJobRequest with _$CreateFineTuningJobRequest {
  const CreateFineTuningJobRequest._();

  /// Factory constructor for CreateFineTuningJobRequest
  const factory CreateFineTuningJobRequest({
    /// The name of the model to fine-tune. You can select one of the
    /// [supported models](https://platform.openai.com/docs/guides/fine-tuning/what-models-can-be-fine-tuned).
    @_FineTuningModelConverter() required FineTuningModel model,

    /// The ID of an uploaded file that contains training data.
    ///
    /// See [upload file](https://platform.openai.com/docs/api-reference/files/upload) for how to upload a file.
    ///
    /// Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.
    ///
    /// See the [fine-tuning guide](https://platform.openai.com/docs/guides/fine-tuning) for more details.
    @JsonKey(name: 'training_file') required String trainingFile,

    /// The hyperparameters used for the fine-tuning job. See the [fine-tuning guide](https://platform.openai.com/docs/guides/fine-tuning) for more details.
    @JsonKey(includeIfNull: false)
    FineTuningJobHyperparameters? hyperparameters,

    /// A string of up to 18 characters that will be added to your fine-tuned model name.
    ///
    /// For example, a `suffix` of "custom-model-name" would produce a model name like `ft:gpt-3.5-turbo:openai:custom-model-name:7p4lURel`.
    @JsonKey(includeIfNull: false) String? suffix,

    /// The ID of an uploaded file that contains validation data.
    ///
    /// If you provide this file, the data is used to generate validation
    /// metrics periodically during fine-tuning. These metrics can be viewed in
    /// the fine-tuning results file.
    /// The same data should not be present in both train and validation files.
    ///
    /// Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.
    ///
    /// See the [fine-tuning guide](https://platform.openai.com/docs/guides/fine-tuning) for more details.
    @JsonKey(name: 'validation_file', includeIfNull: false)
    String? validationFile,
  }) = _CreateFineTuningJobRequest;

  /// Object construction from a JSON representation
  factory CreateFineTuningJobRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFineTuningJobRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'training_file',
    'hyperparameters',
    'suffix',
    'validation_file'
  ];

  /// Validation constants
  static const suffixMinLengthValue = 1;
  static const suffixMaxLengthValue = 40;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (suffix != null && suffix!.length < suffixMinLengthValue) {
      return "The value of 'suffix' cannot be < $suffixMinLengthValue characters";
    }
    if (suffix != null && suffix!.length > suffixMaxLengthValue) {
      return "The length of 'suffix' cannot be > $suffixMaxLengthValue characters";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'training_file': trainingFile,
      'hyperparameters': hyperparameters,
      'suffix': suffix,
      'validation_file': validationFile,
    };
  }
}

// ==========================================
// ENUM: FineTuningModels
// ==========================================

/// Available fine-tuning models. Mind that the list may not be exhaustive nor up-to-date.
enum FineTuningModels {
  @JsonValue('babbage-002')
  babbage002,
  @JsonValue('davinci-002')
  davinci002,
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo,
}

// ==========================================
// CLASS: FineTuningModel
// ==========================================

/// The name of the model to fine-tune. You can select one of the
/// [supported models](https://platform.openai.com/docs/guides/fine-tuning/what-models-can-be-fine-tuned).
@freezed
sealed class FineTuningModel with _$FineTuningModel {
  const FineTuningModel._();

  /// Available fine-tuning models. Mind that the list may not be exhaustive nor up-to-date.
  const factory FineTuningModel.model(
    FineTuningModels value,
  ) = FineTuningModelEnumeration;

  /// The ID of the model to use for this request.
  const factory FineTuningModel.modelId(
    String value,
  ) = FineTuningModelString;

  /// Object construction from a JSON representation
  factory FineTuningModel.fromJson(Map<String, dynamic> json) =>
      _$FineTuningModelFromJson(json);
}

/// Custom JSON converter for [FineTuningModel]
class _FineTuningModelConverter
    implements JsonConverter<FineTuningModel, Object?> {
  const _FineTuningModelConverter();

  @override
  FineTuningModel fromJson(Object? data) {
    if (data is String && _$FineTuningModelsEnumMap.values.contains(data)) {
      return FineTuningModelEnumeration(
        _$FineTuningModelsEnumMap.keys.elementAt(
          _$FineTuningModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return FineTuningModelString(data);
    }
    throw Exception(
      'Unexpected value for FineTuningModel: $data',
    );
  }

  @override
  Object? toJson(FineTuningModel data) {
    return switch (data) {
      FineTuningModelEnumeration(value: final v) =>
        _$FineTuningModelsEnumMap[v]!,
      FineTuningModelString(value: final v) => v,
    };
  }
}
