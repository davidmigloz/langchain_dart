// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateModerationResponse
// ==========================================

/// Represents policy compliance report by OpenAI's content moderation model against a given input.
@freezed
class CreateModerationResponse with _$CreateModerationResponse {
  const CreateModerationResponse._();

  /// Factory constructor for CreateModerationResponse
  const factory CreateModerationResponse({
    /// The unique identifier for the moderation request.
    required String id,

    /// The model used to generate the moderation results.
    required String model,

    /// A list of moderation objects.
    required List<Moderation> results,
  }) = _CreateModerationResponse;

  /// Object construction from a JSON representation
  factory CreateModerationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateModerationResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'model', 'results'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'results': results,
    };
  }
}
