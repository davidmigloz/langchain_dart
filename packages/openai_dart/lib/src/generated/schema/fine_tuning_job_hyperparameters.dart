// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJobHyperparameters
// ==========================================

/// The hyperparameters used for the fine-tuning job. See the [fine-tuning guide](https://platform.openai.com/docs/guides/fine-tuning) for more details.
@freezed
class FineTuningJobHyperparameters with _$FineTuningJobHyperparameters {
  const FineTuningJobHyperparameters._();

  /// Factory constructor for FineTuningJobHyperparameters
  const factory FineTuningJobHyperparameters({
    /// The number of epochs to train the model for. An epoch refers to one
    /// full cycle through the training dataset.
    @_FineTuningNEpochsConverter()
    @JsonKey(name: 'n_epochs')
    required FineTuningNEpochs nEpochs,
  }) = _FineTuningJobHyperparameters;

  /// Object construction from a JSON representation
  factory FineTuningJobHyperparameters.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobHyperparametersFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['n_epochs'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'n_epochs': nEpochs,
    };
  }
}

// ==========================================
// ENUM: FineTuningNEpochsOptions
// ==========================================

/// No Description
enum FineTuningNEpochsOptions {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuningNEpochs
// ==========================================

/// The number of epochs to train the model for. An epoch refers to one
/// full cycle through the training dataset.
@freezed
sealed class FineTuningNEpochs with _$FineTuningNEpochs {
  const FineTuningNEpochs._();

  const factory FineTuningNEpochs.enumeration(
    FineTuningNEpochsOptions value,
  ) = _UnionFineTuningNEpochsEnum;

  const factory FineTuningNEpochs.integer(
    int value,
  ) = _UnionFineTuningNEpochsInteger;

  /// Object construction from a JSON representation
  factory FineTuningNEpochs.fromJson(Map<String, dynamic> json) =>
      _$FineTuningNEpochsFromJson(json);
}

/// Custom JSON converter for [FineTuningNEpochs]
class _FineTuningNEpochsConverter
    implements JsonConverter<FineTuningNEpochs, Object?> {
  const _FineTuningNEpochsConverter();

  @override
  FineTuningNEpochs fromJson(Object? data) {
    if (data is String &&
        _$FineTuningNEpochsOptionsEnumMap.values.contains(data)) {
      return FineTuningNEpochs.enumeration(
        _$FineTuningNEpochsOptionsEnumMap.keys.elementAt(
          _$FineTuningNEpochsOptionsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuningNEpochs.integer(data);
    }
    return FineTuningNEpochs.enumeration(
      FineTuningNEpochsOptions.auto,
    );
  }

  @override
  Object? toJson(FineTuningNEpochs data) {
    return switch (data) {
      _UnionFineTuningNEpochsEnum(value: final v) =>
        _$FineTuningNEpochsOptionsEnumMap[v]!,
      _UnionFineTuningNEpochsInteger(value: final v) => v,
    };
  }
}
