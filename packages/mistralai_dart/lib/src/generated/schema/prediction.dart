// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: Prediction
// ==========================================

/// A prediction object used to provide expected output for the model.
/// This can help reduce latency by allowing the model to skip generating tokens
/// that match the prediction.
@freezed
abstract class Prediction with _$Prediction {
  const Prediction._();

  /// Factory constructor for Prediction
  const factory Prediction({
    /// The type of prediction, currently only 'content' is supported.
    required PredictionType type,

    /// The predicted content that the model should generate.
    required String content,
  }) = _Prediction;

  /// Object construction from a JSON representation
  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'content': content};
  }
}

// ==========================================
// ENUM: PredictionType
// ==========================================

/// The type of prediction, currently only 'content' is supported.
enum PredictionType {
  @JsonValue('content')
  content,
}
