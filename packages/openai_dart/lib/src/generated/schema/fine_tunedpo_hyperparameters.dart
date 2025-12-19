// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneDPOHyperparameters
// ==========================================

/// The hyperparameters used for the DPO fine-tuning job.
@freezed
abstract class FineTuneDPOHyperparameters with _$FineTuneDPOHyperparameters {
  const FineTuneDPOHyperparameters._();

  /// Factory constructor for FineTuneDPOHyperparameters
  const factory FineTuneDPOHyperparameters({
    /// Number of examples in each batch. A larger batch size means that model parameters
    /// are updated less frequently, but with lower variance.
    @_FineTuneDPOHyperparametersBatchSizeConverter()
    @JsonKey(name: 'batch_size', includeIfNull: false)
    @Default(
      FineTuneDPOHyperparametersBatchSizeEnumeration(
        FineTuneDPOHyperparametersBatchSizeEnum.auto,
      ),
    )
    FineTuneDPOHyperparametersBatchSize? batchSize,

    /// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
    /// overfitting.
    @_FineTuneDPOHyperparametersLearningRateMultiplierConverter()
    @JsonKey(name: 'learning_rate_multiplier', includeIfNull: false)
    @Default(
      FineTuneDPOHyperparametersLearningRateMultiplierEnumeration(
        FineTuneDPOHyperparametersLearningRateMultiplierEnum.auto,
      ),
    )
    FineTuneDPOHyperparametersLearningRateMultiplier? learningRateMultiplier,

    /// The number of epochs to train the model for. An epoch refers to one full cycle
    /// through the training dataset.
    @_FineTuneDPOHyperparametersNEpochsConverter()
    @JsonKey(name: 'n_epochs', includeIfNull: false)
    @Default(
      FineTuneDPOHyperparametersNEpochsEnumeration(
        FineTuneDPOHyperparametersNEpochsEnum.auto,
      ),
    )
    FineTuneDPOHyperparametersNEpochs? nEpochs,

    /// The beta value for the DPO method. A higher beta value will increase the weight of
    /// the penalty between the policy and reference model.
    @Default(0.1) double beta,
  }) = _FineTuneDPOHyperparameters;

  /// Object construction from a JSON representation
  factory FineTuneDPOHyperparameters.fromJson(Map<String, dynamic> json) =>
      _$FineTuneDPOHyperparametersFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'batch_size',
    'learning_rate_multiplier',
    'n_epochs',
    'beta',
  ];

  /// Validation constants
  static const betaDefaultValue = 0.1;

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'batch_size': batchSize,
      'learning_rate_multiplier': learningRateMultiplier,
      'n_epochs': nEpochs,
      'beta': beta,
    };
  }
}

// ==========================================
// ENUM: FineTuneDPOHyperparametersBatchSizeEnum
// ==========================================

/// No Description
enum FineTuneDPOHyperparametersBatchSizeEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneDPOHyperparametersBatchSize
// ==========================================

/// Number of examples in each batch. A larger batch size means that model parameters
/// are updated less frequently, but with lower variance.
@freezed
sealed class FineTuneDPOHyperparametersBatchSize
    with _$FineTuneDPOHyperparametersBatchSize {
  const FineTuneDPOHyperparametersBatchSize._();

  /// No Description
  const factory FineTuneDPOHyperparametersBatchSize.enumeration(
    FineTuneDPOHyperparametersBatchSizeEnum value,
  ) = FineTuneDPOHyperparametersBatchSizeEnumeration;

  /// No Description
  const factory FineTuneDPOHyperparametersBatchSize.int(int value) =
      FineTuneDPOHyperparametersBatchSizeInt;

  /// Object construction from a JSON representation
  factory FineTuneDPOHyperparametersBatchSize.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneDPOHyperparametersBatchSizeFromJson(json);
}

/// Custom JSON converter for [FineTuneDPOHyperparametersBatchSize]
class _FineTuneDPOHyperparametersBatchSizeConverter
    implements JsonConverter<FineTuneDPOHyperparametersBatchSize?, Object?> {
  const _FineTuneDPOHyperparametersBatchSizeConverter();

  @override
  FineTuneDPOHyperparametersBatchSize? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneDPOHyperparametersBatchSizeEnumEnumMap.values.contains(
          data,
        )) {
      return FineTuneDPOHyperparametersBatchSizeEnumeration(
        _$FineTuneDPOHyperparametersBatchSizeEnumEnumMap.keys.elementAt(
          _$FineTuneDPOHyperparametersBatchSizeEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuneDPOHyperparametersBatchSizeInt(data);
    }
    return FineTuneDPOHyperparametersBatchSizeEnumeration(
      FineTuneDPOHyperparametersBatchSizeEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneDPOHyperparametersBatchSize? data) {
    return switch (data) {
      FineTuneDPOHyperparametersBatchSizeEnumeration(value: final v) =>
        _$FineTuneDPOHyperparametersBatchSizeEnumEnumMap[v]!,
      FineTuneDPOHyperparametersBatchSizeInt(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneDPOHyperparametersLearningRateMultiplierEnum
// ==========================================

/// No Description
enum FineTuneDPOHyperparametersLearningRateMultiplierEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneDPOHyperparametersLearningRateMultiplier
// ==========================================

/// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
/// overfitting.
@freezed
sealed class FineTuneDPOHyperparametersLearningRateMultiplier
    with _$FineTuneDPOHyperparametersLearningRateMultiplier {
  const FineTuneDPOHyperparametersLearningRateMultiplier._();

  /// No Description
  const factory FineTuneDPOHyperparametersLearningRateMultiplier.enumeration(
    FineTuneDPOHyperparametersLearningRateMultiplierEnum value,
  ) = FineTuneDPOHyperparametersLearningRateMultiplierEnumeration;

  /// No Description
  const factory FineTuneDPOHyperparametersLearningRateMultiplier.double(
    double value,
  ) = FineTuneDPOHyperparametersLearningRateMultiplierDouble;

  /// Object construction from a JSON representation
  factory FineTuneDPOHyperparametersLearningRateMultiplier.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneDPOHyperparametersLearningRateMultiplierFromJson(json);
}

/// Custom JSON converter for [FineTuneDPOHyperparametersLearningRateMultiplier]
class _FineTuneDPOHyperparametersLearningRateMultiplierConverter
    implements
        JsonConverter<
          FineTuneDPOHyperparametersLearningRateMultiplier?,
          Object?
        > {
  const _FineTuneDPOHyperparametersLearningRateMultiplierConverter();

  @override
  FineTuneDPOHyperparametersLearningRateMultiplier? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneDPOHyperparametersLearningRateMultiplierEnumEnumMap.values
            .contains(data)) {
      return FineTuneDPOHyperparametersLearningRateMultiplierEnumeration(
        _$FineTuneDPOHyperparametersLearningRateMultiplierEnumEnumMap.keys
            .elementAt(
              _$FineTuneDPOHyperparametersLearningRateMultiplierEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is double) {
      return FineTuneDPOHyperparametersLearningRateMultiplierDouble(data);
    }
    return FineTuneDPOHyperparametersLearningRateMultiplierEnumeration(
      FineTuneDPOHyperparametersLearningRateMultiplierEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneDPOHyperparametersLearningRateMultiplier? data) {
    return switch (data) {
      FineTuneDPOHyperparametersLearningRateMultiplierEnumeration(
        value: final v,
      ) =>
        _$FineTuneDPOHyperparametersLearningRateMultiplierEnumEnumMap[v]!,
      FineTuneDPOHyperparametersLearningRateMultiplierDouble(value: final v) =>
        v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneDPOHyperparametersNEpochsEnum
// ==========================================

/// No Description
enum FineTuneDPOHyperparametersNEpochsEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneDPOHyperparametersNEpochs
// ==========================================

/// The number of epochs to train the model for. An epoch refers to one full cycle
/// through the training dataset.
@freezed
sealed class FineTuneDPOHyperparametersNEpochs
    with _$FineTuneDPOHyperparametersNEpochs {
  const FineTuneDPOHyperparametersNEpochs._();

  /// No Description
  const factory FineTuneDPOHyperparametersNEpochs.enumeration(
    FineTuneDPOHyperparametersNEpochsEnum value,
  ) = FineTuneDPOHyperparametersNEpochsEnumeration;

  /// No Description
  const factory FineTuneDPOHyperparametersNEpochs.int(int value) =
      FineTuneDPOHyperparametersNEpochsInt;

  /// Object construction from a JSON representation
  factory FineTuneDPOHyperparametersNEpochs.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneDPOHyperparametersNEpochsFromJson(json);
}

/// Custom JSON converter for [FineTuneDPOHyperparametersNEpochs]
class _FineTuneDPOHyperparametersNEpochsConverter
    implements JsonConverter<FineTuneDPOHyperparametersNEpochs?, Object?> {
  const _FineTuneDPOHyperparametersNEpochsConverter();

  @override
  FineTuneDPOHyperparametersNEpochs? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneDPOHyperparametersNEpochsEnumEnumMap.values.contains(data)) {
      return FineTuneDPOHyperparametersNEpochsEnumeration(
        _$FineTuneDPOHyperparametersNEpochsEnumEnumMap.keys.elementAt(
          _$FineTuneDPOHyperparametersNEpochsEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuneDPOHyperparametersNEpochsInt(data);
    }
    return FineTuneDPOHyperparametersNEpochsEnumeration(
      FineTuneDPOHyperparametersNEpochsEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneDPOHyperparametersNEpochs? data) {
    return switch (data) {
      FineTuneDPOHyperparametersNEpochsEnumeration(value: final v) =>
        _$FineTuneDPOHyperparametersNEpochsEnumEnumMap[v]!,
      FineTuneDPOHyperparametersNEpochsInt(value: final v) => v,
      null => null,
    };
  }
}
