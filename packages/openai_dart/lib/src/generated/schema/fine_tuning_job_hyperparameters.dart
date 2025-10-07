// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuningJobHyperparameters
// ==========================================

/// The hyperparameters used for the fine-tuning job. This value will only be returned when running
/// `supervised` jobs.
///
/// This value is now deprecated in favor of `method`, and should be passed in under the `method`
/// parameter.
@freezed
abstract class FineTuningJobHyperparameters
    with _$FineTuningJobHyperparameters {
  const FineTuningJobHyperparameters._();

  /// Factory constructor for FineTuningJobHyperparameters
  const factory FineTuningJobHyperparameters({
    /// The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
    ///
    /// "auto" decides the optimal number of epochs based on the size of the dataset. If setting the number
    /// manually, we support any number between 1 and 50 epochs.
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

/// The mode for the number of epochs.
enum FineTuningNEpochsOptions {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuningNEpochs
// ==========================================

/// The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
///
/// "auto" decides the optimal number of epochs based on the size of the dataset. If setting the number
/// manually, we support any number between 1 and 50 epochs.
@freezed
sealed class FineTuningNEpochs with _$FineTuningNEpochs {
  const FineTuningNEpochs._();

  /// The mode for the number of epochs.
  const factory FineTuningNEpochs.mode(
    FineTuningNEpochsOptions value,
  ) = FineTuningNEpochsEnumeration;

  /// The number of epochs to train the model for.
  const factory FineTuningNEpochs.number(
    int value,
  ) = FineTuningNEpochsInt;

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
      return FineTuningNEpochsEnumeration(
        _$FineTuningNEpochsOptionsEnumMap.keys.elementAt(
          _$FineTuningNEpochsOptionsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuningNEpochsInt(data);
    }
    return FineTuningNEpochsEnumeration(
      FineTuningNEpochsOptions.auto,
    );
  }

  @override
  Object? toJson(FineTuningNEpochs data) {
    return switch (data) {
      FineTuningNEpochsEnumeration(value: final v) =>
        _$FineTuningNEpochsOptionsEnumMap[v]!,
      FineTuningNEpochsInt(value: final v) => v,
    };
  }
}
