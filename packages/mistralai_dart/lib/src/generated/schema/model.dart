// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: Model
// ==========================================

/// A model.
@freezed
class Model with _$Model {
  const Model._();

  /// Factory constructor for Model
  const factory Model({
    /// The unique identifier for this model.
    required String id,

    /// The object type, which is always `model`.
    required String object,

    /// The timestamp of when this model was created.
    required int created,

    /// The organization who owns this model.
    @JsonKey(name: 'owned_by') required String ownedBy,
  }) = _Model;

  /// Object construction from a JSON representation
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created',
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
      'object': object,
      'created': created,
      'owned_by': ownedBy,
    };
  }
}
