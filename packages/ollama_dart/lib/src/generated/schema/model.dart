// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Model
// ==========================================

/// A model available locally.
@freezed
abstract class Model with _$Model {
  const Model._();

  /// Factory constructor for Model
  const factory Model({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    @JsonKey(includeIfNull: false) String? model,

    /// Model modification date.
    @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,

    /// Size of the model on disk.
    @JsonKey(includeIfNull: false) int? size,

    /// The model's digest.
    @JsonKey(includeIfNull: false) String? digest,

    /// Details about a model.
    @JsonKey(includeIfNull: false) ModelDetails? details,
  }) = _Model;

  /// Object construction from a JSON representation
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'modified_at',
    'size',
    'digest',
    'details',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'modified_at': modifiedAt,
      'size': size,
      'digest': digest,
      'details': details,
    };
  }
}
