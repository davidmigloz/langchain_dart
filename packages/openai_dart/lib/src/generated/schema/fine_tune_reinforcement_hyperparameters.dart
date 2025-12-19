// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneReinforcementHyperparameters
// ==========================================

/// The hyperparameters used for the reinforcement fine-tuning job.
@freezed
abstract class FineTuneReinforcementHyperparameters
    with _$FineTuneReinforcementHyperparameters {
  const FineTuneReinforcementHyperparameters._();

  /// Factory constructor for FineTuneReinforcementHyperparameters
  const factory FineTuneReinforcementHyperparameters({
    /// Number of examples in each batch. A larger batch size means that model parameters
    /// are updated less frequently, but with lower variance.
    @_FineTuneReinforcementHyperparametersBatchSizeConverter()
    @JsonKey(name: 'batch_size', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersBatchSizeEnumeration(
        FineTuneReinforcementHyperparametersBatchSizeEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersBatchSize? batchSize,

    /// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
    /// overfitting.
    @_FineTuneReinforcementHyperparametersLearningRateMultiplierConverter()
    @JsonKey(name: 'learning_rate_multiplier', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersLearningRateMultiplierEnumeration(
        FineTuneReinforcementHyperparametersLearningRateMultiplierEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersLearningRateMultiplier?
    learningRateMultiplier,

    /// The number of epochs to train the model for. An epoch refers to one full cycle
    /// through the training dataset.
    @_FineTuneReinforcementHyperparametersNEpochsConverter()
    @JsonKey(name: 'n_epochs', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersNEpochsEnumeration(
        FineTuneReinforcementHyperparametersNEpochsEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersNEpochs? nEpochs,

    /// Constrains effort on reasoning for
    /// [reasoning models](https://platform.openai.com/docs/guides/reasoning).
    /// Currently supported values are `minimal`, `low`, `medium`, and `high`. Reducing
    /// reasoning effort can result in faster responses and fewer tokens used
    /// on reasoning in a response.
    @JsonKey(
      name: 'reasoning_effort',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ReasoningEffort? reasoningEffort,

    /// A multiplier on amount of compute used for exploring search space during training.
    @_FineTuneReinforcementHyperparametersComputeMultiplierConverter()
    @JsonKey(name: 'compute_multiplier', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersComputeMultiplierEnumeration(
        FineTuneReinforcementHyperparametersComputeMultiplierEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersComputeMultiplier? computeMultiplier,

    /// The number of training steps between evaluation runs.
    @_FineTuneReinforcementHyperparametersEvalIntervalConverter()
    @JsonKey(name: 'eval_interval', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersEvalIntervalEnumeration(
        FineTuneReinforcementHyperparametersEvalIntervalEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersEvalInterval? evalInterval,

    /// The number of samples to use for evaluation.
    @_FineTuneReinforcementHyperparametersEvalSamplesConverter()
    @JsonKey(name: 'eval_samples', includeIfNull: false)
    @Default(
      FineTuneReinforcementHyperparametersEvalSamplesEnumeration(
        FineTuneReinforcementHyperparametersEvalSamplesEnum.auto,
      ),
    )
    FineTuneReinforcementHyperparametersEvalSamples? evalSamples,
  }) = _FineTuneReinforcementHyperparameters;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparameters.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'batch_size',
    'learning_rate_multiplier',
    'n_epochs',
    'reasoning_effort',
    'compute_multiplier',
    'eval_interval',
    'eval_samples',
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
      'reasoning_effort': reasoningEffort,
      'compute_multiplier': computeMultiplier,
      'eval_interval': evalInterval,
      'eval_samples': evalSamples,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersBatchSizeEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersBatchSizeEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersBatchSize
// ==========================================

/// Number of examples in each batch. A larger batch size means that model parameters
/// are updated less frequently, but with lower variance.
@freezed
sealed class FineTuneReinforcementHyperparametersBatchSize
    with _$FineTuneReinforcementHyperparametersBatchSize {
  const FineTuneReinforcementHyperparametersBatchSize._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersBatchSize.enumeration(
    FineTuneReinforcementHyperparametersBatchSizeEnum value,
  ) = FineTuneReinforcementHyperparametersBatchSizeEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersBatchSize.int(int value) =
      FineTuneReinforcementHyperparametersBatchSizeInt;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersBatchSize.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersBatchSizeFromJson(json);
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersBatchSize]
class _FineTuneReinforcementHyperparametersBatchSizeConverter
    implements
        JsonConverter<FineTuneReinforcementHyperparametersBatchSize?, Object?> {
  const _FineTuneReinforcementHyperparametersBatchSizeConverter();

  @override
  FineTuneReinforcementHyperparametersBatchSize? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersBatchSizeEnumEnumMap.values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersBatchSizeEnumeration(
        _$FineTuneReinforcementHyperparametersBatchSizeEnumEnumMap.keys
            .elementAt(
              _$FineTuneReinforcementHyperparametersBatchSizeEnumEnumMap.values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is int) {
      return FineTuneReinforcementHyperparametersBatchSizeInt(data);
    }
    return FineTuneReinforcementHyperparametersBatchSizeEnumeration(
      FineTuneReinforcementHyperparametersBatchSizeEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneReinforcementHyperparametersBatchSize? data) {
    return switch (data) {
      FineTuneReinforcementHyperparametersBatchSizeEnumeration(
        value: final v,
      ) =>
        _$FineTuneReinforcementHyperparametersBatchSizeEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersBatchSizeInt(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersLearningRateMultiplierEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersLearningRateMultiplierEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersLearningRateMultiplier
// ==========================================

/// Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
/// overfitting.
@freezed
sealed class FineTuneReinforcementHyperparametersLearningRateMultiplier
    with _$FineTuneReinforcementHyperparametersLearningRateMultiplier {
  const FineTuneReinforcementHyperparametersLearningRateMultiplier._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersLearningRateMultiplier.enumeration(
    FineTuneReinforcementHyperparametersLearningRateMultiplierEnum value,
  ) = FineTuneReinforcementHyperparametersLearningRateMultiplierEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersLearningRateMultiplier.double(
    double value,
  ) = FineTuneReinforcementHyperparametersLearningRateMultiplierDouble;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersLearningRateMultiplier.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersLearningRateMultiplierFromJson(
    json,
  );
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersLearningRateMultiplier]
class _FineTuneReinforcementHyperparametersLearningRateMultiplierConverter
    implements
        JsonConverter<
          FineTuneReinforcementHyperparametersLearningRateMultiplier?,
          Object?
        > {
  const _FineTuneReinforcementHyperparametersLearningRateMultiplierConverter();

  @override
  FineTuneReinforcementHyperparametersLearningRateMultiplier? fromJson(
    Object? data,
  ) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersLearningRateMultiplierEnumEnumMap
            .values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersLearningRateMultiplierEnumeration(
        _$FineTuneReinforcementHyperparametersLearningRateMultiplierEnumEnumMap
            .keys
            .elementAt(
              _$FineTuneReinforcementHyperparametersLearningRateMultiplierEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is double) {
      return FineTuneReinforcementHyperparametersLearningRateMultiplierDouble(
        data,
      );
    }
    return FineTuneReinforcementHyperparametersLearningRateMultiplierEnumeration(
      FineTuneReinforcementHyperparametersLearningRateMultiplierEnum.auto,
    );
  }

  @override
  Object? toJson(
    FineTuneReinforcementHyperparametersLearningRateMultiplier? data,
  ) {
    return switch (data) {
      FineTuneReinforcementHyperparametersLearningRateMultiplierEnumeration(
        value: final v,
      ) =>
        _$FineTuneReinforcementHyperparametersLearningRateMultiplierEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersLearningRateMultiplierDouble(
        value: final v,
      ) =>
        v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersNEpochsEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersNEpochsEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersNEpochs
// ==========================================

/// The number of epochs to train the model for. An epoch refers to one full cycle
/// through the training dataset.
@freezed
sealed class FineTuneReinforcementHyperparametersNEpochs
    with _$FineTuneReinforcementHyperparametersNEpochs {
  const FineTuneReinforcementHyperparametersNEpochs._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersNEpochs.enumeration(
    FineTuneReinforcementHyperparametersNEpochsEnum value,
  ) = FineTuneReinforcementHyperparametersNEpochsEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersNEpochs.int(int value) =
      FineTuneReinforcementHyperparametersNEpochsInt;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersNEpochs.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersNEpochsFromJson(json);
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersNEpochs]
class _FineTuneReinforcementHyperparametersNEpochsConverter
    implements
        JsonConverter<FineTuneReinforcementHyperparametersNEpochs?, Object?> {
  const _FineTuneReinforcementHyperparametersNEpochsConverter();

  @override
  FineTuneReinforcementHyperparametersNEpochs? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersNEpochsEnumEnumMap.values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersNEpochsEnumeration(
        _$FineTuneReinforcementHyperparametersNEpochsEnumEnumMap.keys.elementAt(
          _$FineTuneReinforcementHyperparametersNEpochsEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is int) {
      return FineTuneReinforcementHyperparametersNEpochsInt(data);
    }
    return FineTuneReinforcementHyperparametersNEpochsEnumeration(
      FineTuneReinforcementHyperparametersNEpochsEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneReinforcementHyperparametersNEpochs? data) {
    return switch (data) {
      FineTuneReinforcementHyperparametersNEpochsEnumeration(value: final v) =>
        _$FineTuneReinforcementHyperparametersNEpochsEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersNEpochsInt(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersComputeMultiplierEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersComputeMultiplierEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersComputeMultiplier
// ==========================================

/// A multiplier on amount of compute used for exploring search space during training.
@freezed
sealed class FineTuneReinforcementHyperparametersComputeMultiplier
    with _$FineTuneReinforcementHyperparametersComputeMultiplier {
  const FineTuneReinforcementHyperparametersComputeMultiplier._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersComputeMultiplier.enumeration(
    FineTuneReinforcementHyperparametersComputeMultiplierEnum value,
  ) = FineTuneReinforcementHyperparametersComputeMultiplierEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersComputeMultiplier.double(
    double value,
  ) = FineTuneReinforcementHyperparametersComputeMultiplierDouble;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersComputeMultiplier.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersComputeMultiplierFromJson(json);
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersComputeMultiplier]
class _FineTuneReinforcementHyperparametersComputeMultiplierConverter
    implements
        JsonConverter<
          FineTuneReinforcementHyperparametersComputeMultiplier?,
          Object?
        > {
  const _FineTuneReinforcementHyperparametersComputeMultiplierConverter();

  @override
  FineTuneReinforcementHyperparametersComputeMultiplier? fromJson(
    Object? data,
  ) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersComputeMultiplierEnumEnumMap
            .values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersComputeMultiplierEnumeration(
        _$FineTuneReinforcementHyperparametersComputeMultiplierEnumEnumMap.keys
            .elementAt(
              _$FineTuneReinforcementHyperparametersComputeMultiplierEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is double) {
      return FineTuneReinforcementHyperparametersComputeMultiplierDouble(data);
    }
    return FineTuneReinforcementHyperparametersComputeMultiplierEnumeration(
      FineTuneReinforcementHyperparametersComputeMultiplierEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneReinforcementHyperparametersComputeMultiplier? data) {
    return switch (data) {
      FineTuneReinforcementHyperparametersComputeMultiplierEnumeration(
        value: final v,
      ) =>
        _$FineTuneReinforcementHyperparametersComputeMultiplierEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersComputeMultiplierDouble(
        value: final v,
      ) =>
        v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersEvalIntervalEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersEvalIntervalEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersEvalInterval
// ==========================================

/// The number of training steps between evaluation runs.
@freezed
sealed class FineTuneReinforcementHyperparametersEvalInterval
    with _$FineTuneReinforcementHyperparametersEvalInterval {
  const FineTuneReinforcementHyperparametersEvalInterval._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersEvalInterval.enumeration(
    FineTuneReinforcementHyperparametersEvalIntervalEnum value,
  ) = FineTuneReinforcementHyperparametersEvalIntervalEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersEvalInterval.int(
    int value,
  ) = FineTuneReinforcementHyperparametersEvalIntervalInt;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersEvalInterval.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersEvalIntervalFromJson(json);
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersEvalInterval]
class _FineTuneReinforcementHyperparametersEvalIntervalConverter
    implements
        JsonConverter<
          FineTuneReinforcementHyperparametersEvalInterval?,
          Object?
        > {
  const _FineTuneReinforcementHyperparametersEvalIntervalConverter();

  @override
  FineTuneReinforcementHyperparametersEvalInterval? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersEvalIntervalEnumEnumMap.values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersEvalIntervalEnumeration(
        _$FineTuneReinforcementHyperparametersEvalIntervalEnumEnumMap.keys
            .elementAt(
              _$FineTuneReinforcementHyperparametersEvalIntervalEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is int) {
      return FineTuneReinforcementHyperparametersEvalIntervalInt(data);
    }
    return FineTuneReinforcementHyperparametersEvalIntervalEnumeration(
      FineTuneReinforcementHyperparametersEvalIntervalEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneReinforcementHyperparametersEvalInterval? data) {
    return switch (data) {
      FineTuneReinforcementHyperparametersEvalIntervalEnumeration(
        value: final v,
      ) =>
        _$FineTuneReinforcementHyperparametersEvalIntervalEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersEvalIntervalInt(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: FineTuneReinforcementHyperparametersEvalSamplesEnum
// ==========================================

/// No Description
enum FineTuneReinforcementHyperparametersEvalSamplesEnum {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: FineTuneReinforcementHyperparametersEvalSamples
// ==========================================

/// The number of samples to use for evaluation.
@freezed
sealed class FineTuneReinforcementHyperparametersEvalSamples
    with _$FineTuneReinforcementHyperparametersEvalSamples {
  const FineTuneReinforcementHyperparametersEvalSamples._();

  /// No Description
  const factory FineTuneReinforcementHyperparametersEvalSamples.enumeration(
    FineTuneReinforcementHyperparametersEvalSamplesEnum value,
  ) = FineTuneReinforcementHyperparametersEvalSamplesEnumeration;

  /// No Description
  const factory FineTuneReinforcementHyperparametersEvalSamples.int(int value) =
      FineTuneReinforcementHyperparametersEvalSamplesInt;

  /// Object construction from a JSON representation
  factory FineTuneReinforcementHyperparametersEvalSamples.fromJson(
    Map<String, dynamic> json,
  ) => _$FineTuneReinforcementHyperparametersEvalSamplesFromJson(json);
}

/// Custom JSON converter for [FineTuneReinforcementHyperparametersEvalSamples]
class _FineTuneReinforcementHyperparametersEvalSamplesConverter
    implements
        JsonConverter<
          FineTuneReinforcementHyperparametersEvalSamples?,
          Object?
        > {
  const _FineTuneReinforcementHyperparametersEvalSamplesConverter();

  @override
  FineTuneReinforcementHyperparametersEvalSamples? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$FineTuneReinforcementHyperparametersEvalSamplesEnumEnumMap.values
            .contains(data)) {
      return FineTuneReinforcementHyperparametersEvalSamplesEnumeration(
        _$FineTuneReinforcementHyperparametersEvalSamplesEnumEnumMap.keys
            .elementAt(
              _$FineTuneReinforcementHyperparametersEvalSamplesEnumEnumMap
                  .values
                  .toList()
                  .indexOf(data),
            ),
      );
    }
    if (data is int) {
      return FineTuneReinforcementHyperparametersEvalSamplesInt(data);
    }
    return FineTuneReinforcementHyperparametersEvalSamplesEnumeration(
      FineTuneReinforcementHyperparametersEvalSamplesEnum.auto,
    );
  }

  @override
  Object? toJson(FineTuneReinforcementHyperparametersEvalSamples? data) {
    return switch (data) {
      FineTuneReinforcementHyperparametersEvalSamplesEnumeration(
        value: final v,
      ) =>
        _$FineTuneReinforcementHyperparametersEvalSamplesEnumEnumMap[v]!,
      FineTuneReinforcementHyperparametersEvalSamplesInt(value: final v) => v,
      null => null,
    };
  }
}
