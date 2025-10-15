// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ProcessModel
// ==========================================

/// A model that is currently loaded.
@freezed
abstract class ProcessModel with _$ProcessModel {
  const ProcessModel._();

  /// Factory constructor for ProcessModel
  const factory ProcessModel({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    @JsonKey(includeIfNull: false) String? model,

    /// Size of the model on disk.
    @JsonKey(includeIfNull: false) int? size,

    /// The model's digest.
    @JsonKey(includeIfNull: false) String? digest,

    /// Details about a model.
    @JsonKey(includeIfNull: false) ModelDetails? details,

    /// No Description
    @JsonKey(name: 'expires_at', includeIfNull: false) String? expiresAt,

    /// Size of the model on disk.
    @JsonKey(name: 'size_vram', includeIfNull: false) int? sizeVram,
  }) = _ProcessModel;

  /// Object construction from a JSON representation
  factory ProcessModel.fromJson(Map<String, dynamic> json) =>
      _$ProcessModelFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'size',
    'digest',
    'details',
    'expires_at',
    'size_vram',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'size': size,
      'digest': digest,
      'details': details,
      'expires_at': expiresAt,
      'size_vram': sizeVram,
    };
  }
}
