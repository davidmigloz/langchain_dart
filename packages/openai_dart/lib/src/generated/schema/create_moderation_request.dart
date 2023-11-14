// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateModerationRequest
// ==========================================

/// Request object for the Create moderation endpoint.
@freezed
class CreateModerationRequest with _$CreateModerationRequest {
  const CreateModerationRequest._();

  /// Factory constructor for CreateModerationRequest
  const factory CreateModerationRequest({
    /// Two content moderations models are available: `text-moderation-stable` and `text-moderation-latest`.
    ///
    /// The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.
    @_ModerationModelConverter()
    @JsonKey(includeIfNull: false)
    @Default(
      ModerationModel.string('text-moderation-latest'),
    )
    ModerationModel? model,

    /// The input text to classify
    @_ModerationInputConverter() required ModerationInput input,
  }) = _CreateModerationRequest;

  /// Object construction from a JSON representation
  factory CreateModerationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateModerationRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['model', 'input'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'input': input,
    };
  }
}

// ==========================================
// ENUM: ModerationModels
// ==========================================

/// No Description
enum ModerationModels {
  @JsonValue('text-moderation-latest')
  textModerationLatest,
  @JsonValue('text-moderation-stable')
  textModerationStable,
}

// ==========================================
// CLASS: ModerationModel
// ==========================================

/// Two content moderations models are available: `text-moderation-stable` and `text-moderation-latest`.
///
/// The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.
@freezed
sealed class ModerationModel with _$ModerationModel {
  const ModerationModel._();

  const factory ModerationModel.enumeration(
    ModerationModels value,
  ) = _UnionModerationModelEnum;

  const factory ModerationModel.string(
    String value,
  ) = _UnionModerationModelString;

  /// Object construction from a JSON representation
  factory ModerationModel.fromJson(Map<String, dynamic> json) =>
      _$ModerationModelFromJson(json);
}

/// Custom JSON converter for [ModerationModel]
class _ModerationModelConverter
    implements JsonConverter<ModerationModel?, Object?> {
  const _ModerationModelConverter();

  @override
  ModerationModel? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String && _$ModerationModelsEnumMap.values.contains(data)) {
      return ModerationModel.enumeration(
        _$ModerationModelsEnumMap.keys.elementAt(
          _$ModerationModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ModerationModel.string(data);
    }
    return ModerationModel.string('text-moderation-latest');
  }

  @override
  Object? toJson(ModerationModel? data) {
    return switch (data) {
      _UnionModerationModelEnum(value: final v) =>
        _$ModerationModelsEnumMap[v]!,
      _UnionModerationModelString(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// CLASS: ModerationInput
// ==========================================

/// The input text to classify
@freezed
sealed class ModerationInput with _$ModerationInput {
  const ModerationInput._();

  const factory ModerationInput.arrayString(
    List<String> value,
  ) = _UnionModerationInputArrayString;

  const factory ModerationInput.string(
    String value,
  ) = _UnionModerationInputString;

  /// Object construction from a JSON representation
  factory ModerationInput.fromJson(Map<String, dynamic> json) =>
      _$ModerationInputFromJson(json);
}

/// Custom JSON converter for [ModerationInput]
class _ModerationInputConverter
    implements JsonConverter<ModerationInput, Object?> {
  const _ModerationInputConverter();

  @override
  ModerationInput fromJson(Object? data) {
    if (data is List && data.every((item) => item is String)) {
      return ModerationInput.arrayString(data.cast());
    }
    if (data is String) {
      return ModerationInput.string(data);
    }
    throw Exception(
      'Unexpected value for ModerationInput: $data',
    );
  }

  @override
  Object? toJson(ModerationInput data) {
    return switch (data) {
      _UnionModerationInputArrayString(value: final v) => v,
      _UnionModerationInputString(value: final v) => v,
    };
  }
}
