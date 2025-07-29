// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Model
// ==========================================

/// Describes an OpenAI model offering that can be used with the API.
@freezed
abstract class Model with _$Model {
  const Model._();

  /// Factory constructor for Model
  const factory Model({
    /// The model identifier, which can be referenced in the API endpoints.
    required String id,

    /// The Unix timestamp (in seconds) when the model was created.
    @JsonKey(includeIfNull: false) int? created,

    /// The object type, which is always "model".
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ModelObject? object,

    /// The organization that owns the model.
    @JsonKey(name: 'owned_by', includeIfNull: false) String? ownedBy,
  }) = _Model;

  /// Object construction from a JSON representation
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'created',
    'object',
    'owned_by'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created': created,
      'object': object,
      'owned_by': ownedBy,
    };
  }
}

// ==========================================
// ENUM: ModelObject
// ==========================================

/// The object type, which is always "model".
enum ModelObject {
  @JsonValue('model')
  model,
}
