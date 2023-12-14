// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: TuningSnapshot
// ==========================================

/// Record for a single tuning step.
@freezed
class TuningSnapshot with _$TuningSnapshot {
  const TuningSnapshot._();

  /// Factory constructor for TuningSnapshot
  const factory TuningSnapshot({
    /// Output only. The tuning step.
    @JsonKey(includeIfNull: false) int? step,

    /// Output only. The timestamp when this metric was computed.
    @JsonKey(includeIfNull: false) String? computeTime,

    /// Output only. The epoch this step was part of.
    @JsonKey(includeIfNull: false) int? epoch,

    /// Output only. The mean loss of the training examples for this step.
    @JsonKey(includeIfNull: false) double? meanLoss,
  }) = _TuningSnapshot;

  /// Object construction from a JSON representation
  factory TuningSnapshot.fromJson(Map<String, dynamic> json) =>
      _$TuningSnapshotFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'step',
    'computeTime',
    'epoch',
    'meanLoss'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'step': step,
      'computeTime': computeTime,
      'epoch': epoch,
      'meanLoss': meanLoss,
    };
  }
}
