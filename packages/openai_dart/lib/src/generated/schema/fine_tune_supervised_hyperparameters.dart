// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneSupervisedHyperparameters
// ==========================================

/// The hyperparameters used for the supervised fine-tuning job.
@freezed
abstract class FineTuneSupervisedHyperparameters
    with _$FineTuneSupervisedHyperparameters {
  const FineTuneSupervisedHyperparameters._();

  /// Factory constructor for FineTuneSupervisedHyperparameters
  const factory FineTuneSupervisedHyperparameters({
    /// Number of examples in each batch. A larger batch size means that model parameters
    /// are updated less frequently, but with lower variance.
    @_FineTuneSupervisedHyperparametersBatchSizeConverter()
    @JsonKey(name: 'batch_size', includeIfNull: false)
    @Default(
      FineTuneSupervisedHyperparametersBatchSizeEnumeration(
        FineTuneSupervisedHyperparametersBatchSizeEnum.auto,
      ),
    )
    FineTuneSupervisedHyperparametersBatchSize? batchSize,

    /// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
    /// overfitting.
    @_FineTuneSupervisedHyperparametersLearningRateMultiplierConverter()
    @JsonKey(name: 'learning_rate_multiplier', includeIfNull: false)
    @Default(
      FineTuneSupervisedHyperparametersLearningRateMultiplierEnumeration(
        FineTuneSupervisedHyperparametersLearningRateMultiplierEnum.auto,
      ),
    )
    FineTuneSupervisedHyperparametersLearningRateMultiplier?
    learningRateMultiplier,

    /// The number of epochs to train the model for. An epoch refers to one full cycle
    /// through the training dataset.
    @_FineTuneSupervisedHyperparametersNEpochsConverter()
    @JsonKey(name: 'n_epochs', includeIfNull: false)
    @Default(
      FineTuneSupervisedHyperparametersNEpochsEnumeration(
        FineTuneSupervisedHyperparametersNEpochsEnum.auto,
      ),
    )
    FineTuneSupervisedHyperparametersNEpochs? nEpochs,
  }) = _FineTuneSupervisedHyperparameters;

  /// Object construction from a JSON representation
  factory FineTuneSupervisedHyperparameters.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneSupervisedHyperparametersFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'batch_size',
    'learning_rate_multiplier',
    'n_epochs',
  ];

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
    };
  }
}

// ==========================================
// ENUM: FineTuneSupervisedHyperparametersBatchSizeEnum
// ==========================================

/// No Description
enum FineTuneSupervisedHyperparametersBatchSizeEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneSupervisedHyperparametersBatchSize
// ==========================================

/// Number of examples in each batch. A larger batch size means that model parameters
/// are updated less frequently, but with lower variance.
@freezed
sealed class FineTuneSupervisedHyperparametersBatchSize
    with _$FineTuneSupervisedHyperparametersBatchSize {
  const FineTuneSupervisedHyperparametersBatchSize._();

  /// No Description
  const factory FineTuneSupervisedHyperparametersBatchSize.enumeration(
    FineTuneSupervisedHyperparametersBatchSizeEnum value,
  ) = FineTuneSupervisedHyperparametersBatchSizeEnumeration;

  /// No Description
  const factory FineTuneSupervisedHyperparametersBatchSize.int(int value) =
      FineTuneSupervisedHyperparametersBatchSizeInt;

  /// Object construction from a JSON representation
  factory FineTuneSupervisedHyperparametersBatchSize.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneSupervisedHyperparametersBatchSizeFromJson(json);
}

/// Custom JSON converter for [FineTuneSupervisedHyperparametersBatchSize]
class _FineTuneSupervisedHyperparametersBatchSizeConverter
    implements
        JsonConverter<FineTuneSupervisedHyperparametersBatchSize?, Object?> {
  const _FineTuneSupervisedHyperparametersBatchSizeConverter();

  @override
  FineTuneSupervisedHyperparametersBatchSize? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneSupervisedHyperparametersBatchSizeEnumEnumMap.values.contains(
          data,
        )) {
      return FineTuneSupervisedHyperparametersBatchSizeEnumeration(
        _$FineTuneSupervisedHyperparametersBatchSizeEnumEnumMap.keys.elementAt(
          _$FineTuneSupervisedHyperparametersBatchSizeEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuneSupervisedHyperparametersBatchSizeInt(data);
    }
    return FineTuneSupervisedHyperparametersBatchSizeEnumeration(
      FineTuneSupervisedHyperparametersBatchSizeEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneSupervisedHyperparametersBatchSize? data) {
    return switch (data) {
      FineTuneSupervisedHyperparametersBatchSizeEnumeration(value: final v) =>
        _$FineTuneSupervisedHyperparametersBatchSizeEnumEnumMap[v]!,
      FineTuneSupervisedHyperparametersBatchSizeInt(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneSupervisedHyperparametersLearningRateMultiplierEnum
// ==========================================

/// No Description
enum FineTuneSupervisedHyperparametersLearningRateMultiplierEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneSupervisedHyperparametersLearningRateMultiplier
// ==========================================

/// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
/// overfitting.
@freezed
sealed class FineTuneSupervisedHyperparametersLearningRateMultiplier
    with _$FineTuneSupervisedHyperparametersLearningRateMultiplier {
  const FineTuneSupervisedHyperparametersLearningRateMultiplier._();

  /// No Description
  const factory FineTuneSupervisedHyperparametersLearningRateMultiplier.enumeration(
    FineTuneSupervisedHyperparametersLearningRateMultiplierEnum value,
  ) = FineTuneSupervisedHyperparametersLearningRateMultiplierEnumeration;

  /// No Description
  const factory FineTuneSupervisedHyperparametersLearningRateMultiplier.double(
    double value,
  ) = FineTuneSupervisedHyperparametersLearningRateMultiplierDouble;

  /// Object construction from a JSON representation
  factory FineTuneSupervisedHyperparametersLearningRateMultiplier.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneSupervisedHyperparametersLearningRateMultiplierFromJson(json);
}

/// Custom JSON converter for [FineTuneSupervisedHyperparametersLearningRateMultiplier]
class _FineTuneSupervisedHyperparametersLearningRateMultiplierConverter
    implements
        JsonConverter<
          FineTuneSupervisedHyperparametersLearningRateMultiplier?,
          Object?
        > {
  const _FineTuneSupervisedHyperparametersLearningRateMultiplierConverter();

  @override
  FineTuneSupervisedHyperparametersLearningRateMultiplier? fromJson(
    Object? data,
  ) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneSupervisedHyperparametersLearningRateMultiplierEnumEnumMap
            .values
            .contains(data)) {
      return FineTuneSupervisedHyperparametersLearningRateMultiplierEnumeration(
        _$FineTuneSupervisedHyperparametersLearningRateMultiplierEnumEnumMap
            .keys
            .elementAt(
              _$FineTuneSupervisedHyperparametersLearningRateMultiplierEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is double) {
      return FineTuneSupervisedHyperparametersLearningRateMultiplierDouble(
        data,
      );
    }
    return FineTuneSupervisedHyperparametersLearningRateMultiplierEnumeration(
      FineTuneSupervisedHyperparametersLearningRateMultiplierEnum.auto,
    );
  }

  @override
  Object? toJson(
    FineTuneSupervisedHyperparametersLearningRateMultiplier? data,
  ) {
    return switch (data) {
      FineTuneSupervisedHyperparametersLearningRateMultiplierEnumeration(
        value: final v,
      ) =>
        _$FineTuneSupervisedHyperparametersLearningRateMultiplierEnumEnumMap[v]!,
      FineTuneSupervisedHyperparametersLearningRateMultiplierDouble(
        value: final v,
      ) =>
        v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneSupervisedHyperparametersNEpochsEnum
// ==========================================

/// No Description
enum FineTuneSupervisedHyperparametersNEpochsEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneSupervisedHyperparametersNEpochs
// ==========================================

/// The number of epochs to train the model for. An epoch refers to one full cycle
/// through the training dataset.
@freezed
sealed class FineTuneSupervisedHyperparametersNEpochs
    with _$FineTuneSupervisedHyperparametersNEpochs {
  const FineTuneSupervisedHyperparametersNEpochs._();

  /// No Description
  const factory FineTuneSupervisedHyperparametersNEpochs.enumeration(
    FineTuneSupervisedHyperparametersNEpochsEnum value,
  ) = FineTuneSupervisedHyperparametersNEpochsEnumeration;

  /// No Description
  const factory FineTuneSupervisedHyperparametersNEpochs.int(int value) =
      FineTuneSupervisedHyperparametersNEpochsInt;

  /// Object construction from a JSON representation
  factory FineTuneSupervisedHyperparametersNEpochs.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneSupervisedHyperparametersNEpochsFromJson(json);
}

/// Custom JSON converter for [FineTuneSupervisedHyperparametersNEpochs]
class _FineTuneSupervisedHyperparametersNEpochsConverter
    implements
        JsonConverter<FineTuneSupervisedHyperparametersNEpochs?, Object?> {
  const _FineTuneSupervisedHyperparametersNEpochsConverter();

  @override
  FineTuneSupervisedHyperparametersNEpochs? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneSupervisedHyperparametersNEpochsEnumEnumMap.values.contains(
          data,
        )) {
      return FineTuneSupervisedHyperparametersNEpochsEnumeration(
        _$FineTuneSupervisedHyperparametersNEpochsEnumEnumMap.keys.elementAt(
          _$FineTuneSupervisedHyperparametersNEpochsEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuneSupervisedHyperparametersNEpochsInt(data);
    }
    return FineTuneSupervisedHyperparametersNEpochsEnumeration(
      FineTuneSupervisedHyperparametersNEpochsEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneSupervisedHyperparametersNEpochs? data) {
    return switch (data) {
      FineTuneSupervisedHyperparametersNEpochsEnumeration(value: final v) =>
        _$FineTuneSupervisedHyperparametersNEpochsEnumEnumMap[v]!,
      FineTuneSupervisedHyperparametersNEpochsInt(value: final v) => v,
      null => null,
    };
  }
}
