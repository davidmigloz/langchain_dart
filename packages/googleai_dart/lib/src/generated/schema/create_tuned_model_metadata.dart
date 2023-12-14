// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: CreateTunedModelMetadata
// ==========================================

/// Metadata about the state and progress of creating a tuned model returned from the long-running operation
@freezed
class CreateTunedModelMetadata with _$CreateTunedModelMetadata {
  const CreateTunedModelMetadata._();

  /// Factory constructor for CreateTunedModelMetadata
  const factory CreateTunedModelMetadata({
    /// The total number of tuning steps.
    @JsonKey(includeIfNull: false) int? totalSteps,

    /// Name of the tuned model associated with the tuning operation.
    @JsonKey(includeIfNull: false) String? tunedModel,

    /// The number of steps completed.
    @JsonKey(includeIfNull: false) int? completedSteps,

    /// Metrics collected during tuning.
    @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,

    /// The completed percentage for the tuning operation.
    @JsonKey(includeIfNull: false) double? completedPercent,
  }) = _CreateTunedModelMetadata;

  /// Object construction from a JSON representation
  factory CreateTunedModelMetadata.fromJson(Map<String, dynamic> json) =>
      _$CreateTunedModelMetadataFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'totalSteps',
    'tunedModel',
    'completedSteps',
    'snapshots',
    'completedPercent'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'totalSteps': totalSteps,
      'tunedModel': tunedModel,
      'completedSteps': completedSteps,
      'snapshots': snapshots,
      'completedPercent': completedPercent,
    };
  }
}
