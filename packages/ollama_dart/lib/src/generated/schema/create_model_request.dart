// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CreateModelRequest
// ==========================================

/// Create model request object.
@freezed
class CreateModelRequest with _$CreateModelRequest {
  const CreateModelRequest._();

  /// Factory constructor for CreateModelRequest
  const factory CreateModelRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The contents of the Modelfile.
    required String modelfile,

    /// Path to the Modelfile (optional)
    @JsonKey(includeIfNull: false) String? path,

    /// The quantization level of the model.
    @JsonKey(includeIfNull: false) String? quantize,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,
  }) = _CreateModelRequest;

  /// Object construction from a JSON representation
  factory CreateModelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateModelRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'modelfile',
    'path',
    'quantize',
    'stream'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'modelfile': modelfile,
      'path': path,
      'quantize': quantize,
      'stream': stream,
    };
  }
}
