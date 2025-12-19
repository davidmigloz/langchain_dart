// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FineTuneMethod
// ==========================================

/// The method used for fine-tuning. Defaults to supervised if not specified.
@freezed
abstract class FineTuneMethod with _$FineTuneMethod {
  const FineTuneMethod._();

  /// Factory constructor for FineTuneMethod
  const factory FineTuneMethod({
    /// The type of method used for fine-tuning.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    FineTuneMethodType? type,

    /// Configuration for the supervised fine-tuning method.
    @JsonKey(includeIfNull: false) FineTuneSupervisedMethod? supervised,

    /// Configuration for the DPO (Direct Preference Optimization) fine-tuning method.
    @JsonKey(includeIfNull: false) FineTuneDPOMethod? dpo,

    /// Configuration for the reinforcement fine-tuning method.
    @JsonKey(includeIfNull: false) FineTuneReinforcementMethod? reinforcement,
  }) = _FineTuneMethod;

  /// Object construction from a JSON representation
  factory FineTuneMethod.fromJson(Map<String, dynamic> json) =>
      _$FineTuneMethodFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'supervised',
    'dpo',
    'reinforcement',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'supervised': supervised,
      'dpo': dpo,
      'reinforcement': reinforcement,
    };
  }
}
